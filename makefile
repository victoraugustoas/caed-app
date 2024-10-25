build-watch:
	fvm dart run build_runner watch --delete-conflicting-outputs

build-runner:
	fvm dart run build_runner build

run-app:
	fvm flutter run "--dart-define=APP_CONFIG=$(APP_CONFIG)"