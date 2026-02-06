#!/bin/bash

CSV="$1"

awk -F',' '
NR>1 && NF>0 {
  linguagem=$3
  baseline_min=$5
  baseline_target=$6

  if (linguagem == "DESCONHECIDO" &&
      (baseline_min != "" || baseline_target != "")) {
    print "❌ Baseline não deveria existir para DESCONHECIDO (linha", NR ")"
    exit 1
  }

  if (linguagem != "DESCONHECIDO" &&
      (baseline_min == "" || baseline_target == "")) {
    print "❌ Baseline ausente para linguagem", linguagem, "(linha", NR ")"
    exit 1
  }
}
END {
  print "✅ Coerência linguagem/baseline OK"
}' "$CSV"

