#!/bin/bash

# Pedir dados ao utilizador
read -p "Digite a BASE_URL: " BASE_URL
read -p "Digite o número máximo de segmentos: " MAX

# validação
if ! [[ "$MAX" =~ ^[0-9]+$ ]]; then
  echo "❌ MAX precisa ser um número"
  exit 1
fi

mkdir -p segments
rm -f video.ts output.mp4

echo "📥 Iniciando download..."

for ((i=0; i<=MAX; i++)); do
  url="${BASE_URL}/segment_${i}.ts"
  
  echo ">> Segmento $i"

  if ! curl -f "$url" -o "segments/segment_${i}.ts"; then
    echo "❌ Erro no segmento $i, parando download"
    exit 1
  fi
done

echo "🧩 Juntando segmentos..."

for ((i=0; i<=MAX; i++)); do
  cat "segments/segment_${i}.ts" >> video.ts
done

# valida se o ficheiro existe e não está vazio
if [ ! -s video.ts ]; then
  echo "❌ video.ts inválido"
  exit 1
fi

echo "🎬 Convertendo para MP4..."

ffmpeg -loglevel error -i video.ts -c copy output.mp4

if [ $? -eq 0 ]; then
  echo "✅ Conversão concluída: output.mp4"
else
  echo "❌ Erro na conversão (arquivo pode estar corrompido)"
fi
