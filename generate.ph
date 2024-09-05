from rsa import newkeys, sign, verify

# Generate keys
(publicKey, privateKey) = newkeys(1024)
print(f"Public key: {publicKey}")
print(f"Private key: {privateKey}")

# Sign a message
message = b"Hello, world!"
print(f"Message: {message}")
signature = sign(message, privateKey, 'SHA-1')
print(f"Signature: {signature}")

# Create a token
token = message + signature
print(f"Token: {token}")

# Verify the token
try:
    verify(message, token[len(message):], publicKey)
    print("Token verified!")
except:
    print("Token verification failed!")