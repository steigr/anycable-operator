test:
	helm install anycable --values=test/defaults.yaml --debug --dry-run 2> test/defaults.error.yaml | tee test/defaults.result.yaml
	test -s test/defaults.error.yaml && exit 1 || rm test/defaults.error.yaml
	helm install anycable --values=test/with-redis.yaml --debug --dry-run 2> test/with-redis.error.yaml | tee test/with-redis.result.yaml
	test -s test/with-redis.error.yaml && exit 1 || rm test/with-redis.error.yaml
	helm install anycable --values=test/without-redis.yaml --debug --dry-run 2> test/without-redis.error.yaml | tee test/without-redis.result.yaml
	test -s test/without-redis.error.yaml && exit 1 || rm test/without-redis.error.yaml
	helm install anycable --values=test/realworld.yaml --debug --dry-run 2> test/realworld.error.yaml | tee test/realworld.result.yaml
	test -s test/realworld.error.yaml && exit 1 || rm test/realworld.error.yaml

.PHONY: test