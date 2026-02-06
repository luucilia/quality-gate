#!/bin/bash

CSV="$1"

awk -F',' '
NR>1 && NF>0 {
  status=$7
  if (status != "OK" &&
      status != "ABAIXO" &&
      status != "ABAIXO_MINIMO" &&
      status != "ABAIXO_TARGET" &&
      status != "N/A") {
    print "❌ Status inválido na linha", NR, "→", status
    exit 1
  }
}
END {
  print "✅ Status válidos"
}' "$CSV"

