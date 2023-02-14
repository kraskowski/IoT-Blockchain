# IoT Blockchain Platform

The Go code is a simple IoT test tool that connects to an MQTT broker and subscribes to a topic using a keyword. When a message is received on the subscribed topic that contains the keyword, the message is printed to the console.

The React frontend is a dashboard that displays the messages received by the Go code in a table. The frontend uses the mqtt library to connect to the MQTT broker and subscribe to the same topic as in the Go code. When a message is received, it is added to the table in real-time using the react-bootstrap library.
