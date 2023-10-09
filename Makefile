.DEFAULT_GOAL := all

.PHONY: all fmt lint

all: fmt lint

fmt:
	(fd -e nix -x alejandra -q)
	(fd -e yaml -x yamlfmt && fd -e yml -x yamlfmt)
	(fd -e proto -x clang-format -i)
	(fd -e c -x clang-format -i && fd -e cpp -x clang-format -i && fd -e h -x clang-format -i && fd -e hpp -x clang-format -i)
	(deno fmt -q)
	(dart format -o none .)
	(taplo format)

lint:
	(cd proto/ && buf lint)
	(taplo lint)
