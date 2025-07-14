import socket
import os
import random

rand = random.randint(1, 1000)

# IP del server (sostituisci con IP reale)
SERVER_IP = '192.168.1.24'
PORT = 4444

client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client_socket.connect((SERVER_IP, PORT))

response = client_socket.recv(1024)
print(f"[Server]: {response.decode()}")

client_socket.close()
