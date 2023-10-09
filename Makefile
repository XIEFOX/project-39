.DEFAULT_GOAL := all

DART_PROJECT_ROOT := project_39_fe
RUST_PROJECT_ROOT := project-39-be

.PHONY: all fmt lint build proto-fe

all: fmt proto-fe build lint

fmt:
	(fd -e nix -x alejandra -q)
	(fd -e yaml -x yamlfmt && fd -e yml -x yamlfmt)
	(fd -e proto -x clang-format -i)
	(fd -e c -x clang-format -i && fd -e cpp -x clang-format -i && fd -e h -x clang-format -i && fd -e hpp -x clang-format -i)
	(deno fmt -q --ignore=./${DART_PROJECT_ROOT}/build,./${DART_PROJECT_ROOT}/.dart_tool,./${RUST_PROJECT_ROOT}/target)
	(dart format -o none .)
	(taplo format)

lint:
	(cd proto/ && buf lint)
	(taplo lint)
	(cd ${DART_PROJECT_ROOT}/ && dart analyze --fatal-infos)

build:
	(cd ${DART_PROJECT_ROOT}/ && flutter build web)

proto-fe:
	(cd ${DART_PROJECT_ROOT}/ && mkdir -p lib/src/generated/ && \
		protoc --dart_out=grpc:lib/src/generated -I../proto \
			../proto/project_39/v1/project_39.proto)
	(cd ${DART_PROJECT_ROOT}/lib/src/generated && fd -e dart | xargs sed -i '1s;^;// ignore_for_file: type=lint\n;')
