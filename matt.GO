package main

import (
    "fmt"
    "os"
    "os/signal"
    "strings"
    "syscall"

    mqtt "github.com/eclipse/paho.mqtt.golang"
)

func onMessageReceived(client mqtt.Client, message mqtt.Message) {
    topic := message.Topic()
    payload := string(message.Payload())

    if strings.Contains(payload, "keyword") {
        fmt.Printf("Received message on topic %s: %s\n", topic, payload)
    }
}

func main() {
    // create a new MQTT client
    brokerURI := "tcp://localhost:1883"
    clientID := "iot-test-tool"
    mqttClient := mqtt.NewClient(mqtt.NewClientOptions().AddBroker(brokerURI).SetClientID(clientID))

    // connect to the MQTT broker
    if token := mqttClient.Connect(); token.Wait() && token.Error() != nil {
        panic(token.Error())
    }

    // subscribe to a topic
    topic := "my/iot/topic"
    if token := mqttClient.Subscribe(topic, 0, onMessageReceived); token.Wait() && token.Error() != nil {
        panic(token.Error())
    }

    // wait for a signal to exit
    signals := make(chan os.Signal, 1)
    signal.Notify(signals, syscall.SIGINT, syscall.SIGTERM)
    <-signals

    // disconnect from the MQTT broker
    mqttClient.Disconnect(250)
}
