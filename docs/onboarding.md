# Guia de Onboarding e Fluxo de Trabalho (GCS)

Este documento descreve o padrão de Gerenciamento de Configuração de Software (GCS) adotado no projeto **GQR - Gerador de QR Code**.

## 1. Fluxo de Desenvolvimento (GitHub Flow)
1. Abrir uma **Issue** descrevendo a funcionalidade ou correção.
2. Criar uma branch a partir da `main` seguindo o padrão `feature/<id-issue>-<descricao-curta>` (ou `hotfix/<descricao>` para correções urgentes).
3. Realizar commits seguindo o padrão **Conventional Commits** (`feat:`, `fix:`, `docs:`, `ci:`, `chore:`).
4. Abrir um **Pull Request (PR)** vinculado à Issue (`Closes #<id>`).
5. Aguardar a execução verde do pipeline **Flutter CI** (`flutter analyze` e `flutter test`).
6. Realizar o merge na `main` (protegida contra push direto).

## 2. Comunicação e Revisão
- **Canal de comunicação:** GitHub Issues e Pull Requests do repositório oficial.
- **Janela de resposta a PRs:** Até 2 dias úteis para revisão e validação do quality gate antes do merge.

## 3. Releases e Baselines
- Versões estáveis seguem o **Versionamento Semântico (`MAJOR.MINOR.PATCH`)** e são publicadas via tags e **GitHub Releases**.
