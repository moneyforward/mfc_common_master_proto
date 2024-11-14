include .env

default: codegen-proto

codegen-proto: docgen-proto
	mkdir -p "$(APP_DIR)"/gen/
	docker compose -f docker-compose-tools.yml run --rm -v "$$(pwd)/$(APP_DIR)":"$(APP_GOPATH)" -w "$(APP_GOPATH)" buf-generate

docgen-proto: tmp/googleapis
	./scripts/protoc-gen-doc.sh
# Workaround.
# Get it yourself since docgen by default refers to the protocolbuffers repository but not the googleapis repository
# https://github.com/pseudomuto/protoc-gen-doc/issues/407
# https://github.com/pseudomuto/protoc-gen-doc/blob/master/Makefile#L114
tmp/googleapis:
	@rm -rf tmp/googleapis tmp/protocolbuffers
	@git clone --depth 1 https://github.com/googleapis/googleapis tmp/googleapis
	@rm -rf tmp/googleapis/.git
	@git clone --depth 1 https://github.com/protocolbuffers/protobuf tmp/protocolbuffers
	@cp -r tmp/protocolbuffers/src/* tmp/googleapis/
	@rm -rf tmp/protocolbuffers
	# print work done
	echo "tmp/googleapis done"

lint-proto:
	docker compose -f docker-compose-tools.yml run --rm -v "$$(pwd)/$(APP_DIR)":"$(APP_GOPATH)" -w "$(APP_GOPATH)" buf-lint

.PHONY: lint-proto codegen-proto docgen-proto tmp/googleapis