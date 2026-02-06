#!/bin/bash

repo_path="$1"

# Java com build
if find "$repo_path" -name "pom.xml" -o -name "build.gradle" | grep -q .; then
  echo "Java"
  exit 0
fi

# Java sem build (LEGACY)
if find "$repo_path" -name "*.java" | grep -q .; then
  echo "Java-LEGACY"
  exit 0
fi

# .NET
if find "$repo_path" -name "*.csproj" | grep -q .; then
  echo ".NET"
  exit 0
fi

echo "DESCONHECIDO"

