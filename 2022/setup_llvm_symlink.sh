#!/bin/bash

LLVM_PATH="/usr/lib/llvm-14"
SYMLINK_PATH="external_llvm"

if [ ! -e "$SYMLINK_PATH" ]; then
    if [ -d "$LLVM_PATH" ]; then
        ln -sf "$LLVM_PATH" "$SYMLINK_PATH"
        echo "Симлинк $SYMLINK_PATH -> $LLVM_PATH создан"
    else
        echo "Ошибка: LLVM не найден по пути $LLVM_PATH" >&2
        exit 1
    fi
fi

