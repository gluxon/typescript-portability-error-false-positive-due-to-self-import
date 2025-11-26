#!/bin/sh

rm -rf packages/*/dist
rm -f packages/*/tsconfig.tsbuildinfo

tsc --build --verbose packages/a/tsconfig.json
