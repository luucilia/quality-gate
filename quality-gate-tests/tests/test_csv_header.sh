#!/bin/bash

CSV="$1"

EXPECTED="org,repo,linguagem,versao_atual,baseline_min,baseline_target,status,data_execucao"
HEADER=$(head -n1 "$CSV")

if [ "$HEADER" != "$EXPECTED" ]; then
  echo "❌ Header inválido"
  echo "Esperado: $EXPECTED"
  echo "Obtido:   $HEADER"
  exit 1
fi

echo "✅ Header correto"

