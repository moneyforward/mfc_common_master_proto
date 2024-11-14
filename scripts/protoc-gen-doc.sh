#!/bin/bash
set -u

TARGET_PROTO_DIR=/proto

proto_files=($(find $(pwd)${TARGET_PROTO_DIR} -name "*.proto"))
for proto_file in ${proto_files[@]}; do
	proto_dir=$(dirname ${proto_file})
	doc_dir=$(pwd)/doc/proto/$(echo ${proto_dir##$(pwd)${TARGET_PROTO_DIR}})
    basefile=$(basename $proto_file) #get proto file to configure (e.g. firmware_upgrade.proto)

	# Workaround.
	# Get it yourself since docgen by default refers to the protocolbuffers repository but not the googleapis repository
	# https://github.com/pseudomuto/protoc-gen-doc/issues/407
	# https://github.com/pseudomuto/protoc-gen-doc/blob/master/Makefile#L114
 	# docker run --rm -v ${doc_dir}:/out \
 	# 	-v ${proto_dir}:/protos \
 	# 	pseudomuto/protoc-gen-doc \
		# --doc_opt=markdown,docs.md
	docker run --rm -v ${doc_dir}:/out \
		-v ${proto_dir}:/protos \
		-v $(pwd)/tmp/googleapis:/imports \
		pseudomuto/protoc-gen-doc \
		--doc_opt=markdown,docs.md -I/imports/ $basefile
  # print script done
  echo "protoc-gen-doc.sh done"
done
