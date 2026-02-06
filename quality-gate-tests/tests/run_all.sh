#!/bin/bash
set -e  # ⬅️ PARA na primeira falha

CSV="$1"

./test_csv_exists.sh "$CSV"
./test_csv_header.sh "$CSV"
./test_csv_columns.sh "$CSV"
./test_csv_status.sh "$CSV"
./test_csv_coherence.sh "$CSV"

echo "🎉 CSV íntegro"
