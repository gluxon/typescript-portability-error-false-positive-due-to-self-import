This is a repro for a TypeScript bug. When compiling the packages in this repo topologically, TypeScript passes successfully.

```console
tsc -p packages/c/tsconfig.json
tsc -p packages/b/tsconfig.json
tsc -p packages/a/tsconfig.json
```

However, when running with `--build` mode, error TS2742 appears.

```console
❯ tsc --build --verbose packages/a/tsconfig.json

[11:12:53 PM] Projects in this build: 
    * packages/c/tsconfig.json
    * packages/b/tsconfig.json
    * packages/a/tsconfig.json

[11:12:53 PM] Project 'packages/c/tsconfig.json' is out of date because output file 'packages/c/tsconfig.tsbuildinfo' does not exist

[11:12:53 PM] Building project '/Volumes/git/typescript-false-positive-non-portable-watcher-error/packages/c/tsconfig.json'...

[11:12:53 PM] Project 'packages/b/tsconfig.json' is out of date because output file 'packages/b/tsconfig.tsbuildinfo' does not exist

[11:12:53 PM] Building project '/Volumes/git/typescript-false-positive-non-portable-watcher-error/packages/b/tsconfig.json'...

[11:12:53 PM] Project 'packages/a/tsconfig.json' is out of date because output file 'packages/a/tsconfig.tsbuildinfo' does not exist

[11:12:53 PM] Building project '/Volumes/git/typescript-false-positive-non-portable-watcher-error/packages/a/tsconfig.json'...

packages/a/src/index.ts:7:14 - error TS2742: The inferred type of 'c' cannot be named without a reference to '../node_modules/c/src'. This is likely not portable. A type annotation is necessary.

7 export const c = b.c;
               ~


Found 1 error.
```

TypeScript shouldn't produce different errors when running with the `--build` flag.
