# IoT Test Tool with Blockchain

## Abstract

In this paper, we present an IoT test tool that allows users to connect to devices through MQTT and perform various tests on them. The tool includes a web-based user interface that displays real-time messages from the devices and provides functions to send test messages and analyze the response. The test tool is built on top of a blockchain network with a proof of authority consensus algorithm, which ensures the integrity and security of the data transmitted between the devices and the server.

## Introduction

The Internet of Things (IoT) is a rapidly growing field with enormous potential for applications in various industries, including healthcare, agriculture, transportation, and manufacturing. IoT devices are typically equipped with sensors and actuators that allow them to collect and transmit data to other devices or servers over the internet. However, ensuring the security and reliability of the data transmitted by these devices remains a significant challenge.

One promising solution to this challenge is the use of blockchain technology. Blockchain is a distributed ledger that allows multiple parties to share and update data in a secure and transparent way. The use of blockchain technology in IoT has the potential to improve data privacy, security, and reliability by enabling secure and decentralized communication between devices.

In this paper, we propose an IoT test tool that leverages the benefits of both IoT and blockchain technology to enable secure and reliable communication between devices. The test tool uses the MQTT protocol to connect to devices and subscribe to topics with a specified keyword. The received messages are then analyzed and displayed in real-time on a web-based user interface. The tool also provides various test functions to send messages to the devices and check their response.

The test tool is built on top of a blockchain network with a proof of authority consensus algorithm. The use of a proof of authority consensus algorithm ensures that the network is secure and reliable, as only authorized parties can participate in the consensus process. The blockchain also provides a tamper-proof and transparent ledger of all the transactions and messages exchanged between the devices and the server.

## Purpose

The purpose of this paper is to describe the design and implementation of an IoT test tool that uses blockchain technology to ensure the security and reliability of the data transmitted between devices and the server. The paper presents a detailed explanation of the test tool's architecture, including the use of MQTT protocol, blockchain technology, and proof of authority consensus algorithm. The paper also provides a comprehensive description of the tool's features, including the web-based user interface, test functions, and data analysis capabilities.

## Code Explanation

The IoT test tool is implemented in two parts: a backend written in Go, and a frontend written in JavaScript using React. The backend connects to an MQTT broker and subscribes to a topic with a specified keyword. The received messages are then analyzed and stored in a blockchain network with a proof of authority consensus algorithm. The frontend provides a user-friendly interface for interacting with the devices and analyzing the received messages.

The code for the backend is organized into several Go packages, including `mqtt` for MQTT client library, `blockchain` for blockchain network implementation, and `api` for server-side API endpoints. The `main` package contains the entry point for the application and initializes the MQTT client, blockchain network, and web server. The `mqtt` package provides an interface for connecting to an MQTT broker and subscribing to a topic with a specified keyword. The `blockchain` package provides an implementation of a blockchain network with a proof of authority consensus algorithm. The `api` package provides server-side API endpoints for the web-based user interface to interact with the backend.

The code for the frontend is organized using the React application template. The frontend provides a user-friendly interface for connecting to the MQTT broker, subscribing to topics, sending test messages,
 
# References

1. Atzori, L., Iera, A., & Morabito, G. (2010). The internet of things: A survey. Computer networks, 54(15), 2787-2805.

2. Christidis, K., & Devetsikiotis, M. (2016). Blockchains and smart contracts for the internet of things. IEEE Access, 4, 2292-2303.

3. Li, S., Xu, L. D., & Zhao, S. (2015). The internet of things: a survey. Information systems frontiers, 17(2), 243-259.

4. Tosh, D., Davey, J., & Sikora, A. (2017). Securing the internet of things. IEEE Security & Privacy, 15(6), 56-66.

5. Zheng, Z., Xie, S., Dai, H. N., Chen, W., & Wang, H. (2018). An overview of blockchain technology: architecture, consensus, and future trends. In 2018 IEEE international congress on big data (BigData congress) (pp. 557-564). IEEE.

6. Ethereum. (2023). Solidity documentation. Retrieved February 14, 2023, from https://solidity.readthedocs.io/en/latest/

7. Hyperledger. (2023). Hyperledger Fabric documentation. Retrieved February 14, 2023, from https://hyperledger-fabric.readthedocs.io/en/latest/

8. GitHub. (2023). GitHub documentation. Retrieved February 14, 2023, from https://docs.github.com/
