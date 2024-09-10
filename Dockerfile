# Use the official Ubuntu image as the base image
FROM ubuntu:latest

# Set environment variables to avoid prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary dependencies (curl)
RUN apt-get update && \
    apt-get install -y curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Ollama using the provided script
RUN curl -fsSL https://ollama.com/install.sh | sh

# Expose necessary ports (if needed by Ollama)
EXPOSE 11434

# Set the command to run Ollama Mistral when the container starts
CMD ["ollama", "run", "mistral"]
ENTRYPOINT ["ollama", "serve"]
