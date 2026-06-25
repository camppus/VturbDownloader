# VTurb Video Downloader

Ferramenta desenvolvida em Shell Script para automatizar o download e a reconstrução de vídeos distribuídos em segmentos.

## Funcionalidades

* Download automático de segmentos de vídeo.
* Processamento de listas de segmentos.
* União automática dos arquivos baixados.
* Geração de arquivo MP4 final.
* Execução simples através de linha de comando.
* Baixo consumo de recursos.

## Como funciona

O script recebe:

* URL base dos segmentos.
* Quantidade de segmentos.

A partir dessas informações ele:

1. Baixa todos os segmentos.
2. Organiza os arquivos temporários.
3. Junta os segmentos na ordem correta.
4. Gera um único arquivo MP4 pronto para uso.

## Requisitos

* Linux
* Bash
* curl ou wget
* ffmpeg

## Exemplo

```bash
./download.sh "https://example.com/video/" 250
```

## Saída

```bash
output.mp4
```

## Aviso

Esta ferramenta deve ser utilizada apenas para conteúdos que você possui autorização para acessar, baixar ou processar.

## Licença

MIT
