# IoT Blockchain Platform

The Go code is a simple IoT test tool that connects to an MQTT broker and subscribes to a topic using a keyword. When a message is received on the subscribed topic that contains the keyword, the message is printed to the console.

The React frontend is a dashboard that displays the messages received by the Go code in a table. The frontend uses the mqtt library to connect to the MQTT broker and subscribe to the same topic as in the Go code. When a message is received, it is added to the table in real-time using the react-bootstrap library.


# IoT Test Tool

This is a simple IoT test tool that connects to an MQTT broker and subscribes to a topic using a keyword. When a message is received on the subscribed topic that contains the keyword, the message is printed to the console. The tool is written in Go.

## Requirements

- Go (version 1.16 or higher)
- An MQTT broker (e.g., Mosquitto)

## Usage

1. Clone the repository:

```
git clone https://github.com/your-username/iot-test-tool.git
```
2. Install the dependencies:

```
go mod download
```

3. Update the `MQTTBrokerURL` constant in `main.go` to point to your MQTT broker.

4. Run the code:

```
go run main.go
```

The code will connect to the MQTT broker and subscribe to the topic `my/iot/topic`. When a message is received on the subscribed topic that contains the keyword "test", the message will be printed to the console.

## Frontend

To view the messages received by the Go code in real-time, you can use the included React frontend. The frontend connects to the MQTT broker using the `mqtt` library and subscribes to the same topic as the Go code. When a message is received, it is added to a table in the frontend using the `react-bootstrap` library.

### Requirements

- Node.js (version 14 or higher)

### Usage

1. Navigate to the `frontend` directory:

```
cd frontend
```

2. Install the dependencies:

```
npm install
```

3. Start the frontend:

```
npm start
```

The frontend should be accessible at `http://localhost:3000`. The table on the page will display the messages received by the Go code in real-time.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request.

