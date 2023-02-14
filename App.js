import React, { useState, useEffect } from 'react';
import mqtt from 'mqtt';
import { Container, Row, Col, Table } from 'react-bootstrap';

function App() {
  const [messages, setMessages] = useState([]);

  useEffect(() => {
    // create a new MQTT client
    const mqttClient = mqtt.connect('ws://localhost:8083/mqtt');

    // subscribe to a topic
    mqttClient.subscribe('my/iot/topic', (err) => {
      if (err) {
        console.log('Failed to subscribe:', err);
      } else {
        console.log('Subscribed to my/iot/topic');
      }
    });

    // handle incoming messages
    mqttClient.on('message', (topic, message) => {
      const payload = message.toString();
      console.log(`Received message on topic ${topic}: ${payload}`);
      setMessages((prevMessages) => [...prevMessages, { topic, payload }]);
    });

    // clean up on unmount
    return () => {
      mqttClient.end();
    };
  }, []);

  return (
    <Container className="mt-3">
      <Row>
        <Col>
          <h1>IoT Test Tool</h1>
          <Table striped bordered hover>
            <thead>
              <tr>
                <th>Topic</th>
                <th>Message</th>
              </tr>
            </thead>
            <tbody>
              {messages.map((message, index) => (
                <tr key={index}>
                  <td>{message.topic}</td>
                  <td>{message.payload}</td>
                </tr>
              ))}
            </tbody>
          </Table>
        </Col>
      </Row>
    </Container>
  );
}

export default App;
