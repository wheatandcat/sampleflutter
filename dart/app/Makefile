.PHONY: Flutter

graphdownload_schemaql:
	cd lib/graphql && cp ../../../../typescript/backend/src/schema.graphql schema.graphql
codegen: graphdownload_schemaql
	dart run build_runner build
xcode:
	open ios/Runner.xcworkspace