#!/bin/bash

pass=true

test_case() {
  name="$1"
  path="$2"
  expected="$3"

  result=$(../scripts/detect_tech.sh "$path")

  if [ "$result" != "$expected" ]; then
    echo "❌ FAIL: $name → esperado=$expected obtido=$result"
    pass=false
  else
    echo "✅ OK: $name"
  fi
}

test_case "Java Maven" ../fixtures/java-maven "Java"
test_case "Java Legacy" ../fixtures/java-legacy "Java-LEGACY"
test_case ".NET" ../fixtures/dotnet ".NET"
test_case "Vazio" ../fixtures/empty "DESCONHECIDO"

if [ "$pass" = false ]; then
  exit 1
fi

