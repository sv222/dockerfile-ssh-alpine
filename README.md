# Dockerfile for creating test environment for SSH/Python/Alpine

This is a Dockerfile that creates an Alpine-based image with OpenSSH and Python3 installed. It also configures the SSH server to allow root login with an SSH key, and disables password authentication.

## Prerequisites

You should have Docker installed on your machine before building and running this image.

## Usage

1. To create an SSH key pair with a specific name for the public and private key files, you can use the ssh-keygen command with the -f option to specify the file name. Here's an example:

```shell
ssh-keygen -t rsa -b 4096 -f my_key -C "My Key"
```

2. Copy the `my_key.pub` file containing your public key to the same directory as the Dockerfile.

3. Build the Docker image using the following command:

```shell
docker build -t ssh-alpine .
```
4. Run a container using the following command:

```shell
docker run -d -p 2222:22 --name ssh-container ssh-alpine
```

This will start a container named `ssh-container` and bind port `2222` on the host to port `22` on the container.

4. You can now SSH into the container as root using your private key:

```shell
ssh -i /path/to/your/private/key -p 2222 root@localhost
```

## Contributing

If you find any issues with this image or have suggestions for improvements, please feel free to open an issue or pull request on the GitHub repository.

## License

This project is licensed under the MIT License.