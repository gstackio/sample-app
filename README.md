# Sample App - a simple Go webapp

### Pushing the app to Gstack

```
gk push sample-app
```

### Endpoints

- `/`: a simple landing page displaying the index and uptime
- `/env`: displays environment variables
- `/exit`: instructs the app to exit with status code 1
- `/index`: returns the application index
- `/port`: returns the local port the request was received on

### Configure the app to listen on multiple ports

By providing a customer start command, you can configure the app to listen on multiple ports. The app responds the same way to each port.
```
cf push sample-app -c "sample-app --ports=7777,8888"
```

### Pushing the app to Gstack as a Docker image

Sample App is also packaged as a docker image at gstackio/sample-app

```bash
cf push wow-cool -o gstackio/sample-app -d <my-family-name>.gstack.me
```

→ Where `<my-family-name>` is to be replaced by your own family name.

### To rebuild the dockerimage:

```bash
./build.sh
```

Assumes you have the go toolchain (with the ability to cross-compile to different platforms) and docker installed and pointing at your docker daemon.
