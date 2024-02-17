.PHONY: Flutter

download_schema.graphql:
	cd lib/graphql && curl -L -O https://raw.githubusercontent.com/wheatandcat/stock-keeper-backend/main/src/schema.graphql