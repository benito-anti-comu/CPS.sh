import socket

# Crea un socket
client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Si connette al server
client_socket.connect(('localhost', 12345))

# Invia un messaggio
client_socket.send("Ciao server!".encode())

# Riceve la risposta
risposta = client_socket.recv(1024).decode()
print("Risposta dal server:", risposta)

# Chiude la connessione
client_socket.close()
