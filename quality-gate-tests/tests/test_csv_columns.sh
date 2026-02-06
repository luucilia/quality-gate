#!/bin/bash

CSV="$1"
EXPECTED_COLS=8

awk -F',' '
NR>1 && NF>0 {
  if (NF != '"$EXPECTED_COLS"') {
    print "❌ Linha inválida:", NR, "→", NF, "colunas"
    exit 1
  }
}
END {
  print "✅ Todas as linhas têm", '"$EXPECTED_COLS"', "colunas"
}' "$CSV"

