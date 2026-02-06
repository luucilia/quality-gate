#!/usr/bin/env bash

echo "🔎 Teste 1 — Java 8 vs mínimo 11 (esperado: ABAIXO_MINIMO)"
baseline=11
version=8
result=$(printf '%s\n%s' "$baseline" "$version" | sort -V | head -n1)
[ "$result" != "$baseline" ] && echo "PASSOU" || echo "FALHOU"

echo "�� Teste 2 — Java 17 vs mínimo 11 (esperado: OK)"
baseline=11
version=17
result=$(printf '%s\n%s' "$baseline" "$version" | sort -V | head -n1)
[ "$result" = "$baseline" ] && echo "PASSOU" || echo "FALHOU"

echo "🔎 Teste 3 — Java 17 vs target 25 (esperado: ABAIXO_TARGET)"
baseline=25
version=17
result=$(printf '%s\n%s' "$baseline" "$version" | sort -V | head -n1)
[ "$result" != "$baseline" ] && echo "PASSOU" || echo "FALHOU"

echo "🔎 Teste 4 — Java 25 vs target 25 (esperado: OK)"
baseline=25
version=25
result=$(printf '%s\n%s' "$baseline" "$version" | sort -V | head -n1)
[ "$result" = "$baseline" ] && echo "PASSOU" || echo "FALHOU"

