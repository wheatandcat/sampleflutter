.PHONY: Flutter

graphdownload_schemaql:
	cd lib/graphql && curl -L -O https://raw.githubusercontent.com/wheatandcat/stock-keeper-backend/main/src/schema.graphql
codegen: graphdownload_schemaql
	dart run build_runner build
xcode:
	open ios/Runner.xcworkspace