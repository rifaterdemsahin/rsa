from rsa import newkeys, sign, verify

# Generate keys
(publicKey, privateKey) = newkeys(1024)

# Sign a message
message = b"Hello, world!"
signature = sign(message, privateKey, 'SHA-1')

# Create a token
token = message + signature

# Verify the token
try:
    verify(message, token[len(message):], publicKey)
    print("Token verified!")
except:
    print("Token verification failed!")
