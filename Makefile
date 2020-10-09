all: build


build:
	@mkdir -p build/
	@go build -mod=mod -o build/voterd ./cmd/voterd
	@go build -mod=mod -o build/votercli ./cmd/votercli
