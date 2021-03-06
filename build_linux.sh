#!/bin/sh
cd src

gcc -fPIC -O3 -Wall -Wno-format-security -c umka_api.c umka_common.c umka_compiler.c umka_const.c umka_decl.c umka_expr.c umka_gen.c umka_ident.c umka_lexer.c umka_runtime.c umka_stmt.c umka_types.c umka_vm.c 
gcc -shared -fPIC -static-libgcc *.o -o libumka.so -lm 

gcc -O3 -Wall -Wno-format-security -c umka.c 
gcc umka.o -o umka -static-libgcc -L$PWD -lm -lumka -Wl,-rpath,'$ORIGIN'

rm -f *.o
cd ..

mkdir umka_linux

mv src/libumka.* umka_linux
mv src/umka umka_linux
cp src/umka_api.h umka_linux
cp LICENSE umka_linux

mkdir umka_linux/examples
mkdir umka_linux/import
 
cp examples/*.* umka_linux/examples
cp import/*.* umka_linux/import





