IMAGE = fs-s3fs-fork

.PHONY: build
build:
	docker build --pull -t $(IMAGE) .

.PHONY: test
test: build
	docker run $(IMAGE) nosetests


.PHONY: publish
publish:
	@docker run $(IMAGE) python3 manage.py upload --username $(DEVPI_USERNAME) --password $(DEVPI_PASSWORD) --index https://pypi.lundalogik.com:3443/lime/develop/+simple/
