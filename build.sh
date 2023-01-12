#!/bin/sh
cc='gcc'
debug='-ggdb -g -O0'
cflags='-static -nostdlib'
$cc $cflags $debug *.s main.c
