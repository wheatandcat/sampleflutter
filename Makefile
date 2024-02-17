.PHONY: Flutter

download_schema.graphql:
	cd lib/graphql && curl -L -O https://raw.githubusercontent.com/wheatandcat/stock-keeper-backend/main/src/schema.graphql
codegen:
	dart run build_runner build
xcode:
	open ios/Runner.xcworkspace