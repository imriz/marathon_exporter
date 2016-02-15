VERSION  := 0.1.0
TARGET   := marathon_exporter
TEST     ?= ./...

default: test build

test:
	go test -v -run=$(RUN) $(TEST)

build: clean
	go build -o bin/$(TARGET)

release: clean
	GOARCH=amd64 GOOS=linux go build -ldflags "-X main.Version=$(VERSION)" -o bin/$(TARGET) .

clean:
	rm -rf bin/
