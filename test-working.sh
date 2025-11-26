#!/bin/sh

rm -rf packages/*/dist
rm -f packages/*/tsconfig.tsbuildinfo

# Compile manually in topological order.
tsc -p packages/c/tsconfig.json
tsc -p packages/b/tsconfig.json
tsc -p packages/a/tsconfig.json
