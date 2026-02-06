#!/bin/bash

CSV="$1"

if [ ! -f "$CSV" ]; then
  echo "❌ CSV não existe: $CSV"
  exit 1
fi

echo "✅ CSV existe"

