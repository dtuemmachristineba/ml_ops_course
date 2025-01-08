FROM python:3.11-slim

# Install system dependencies, including Git
RUN apt update && \
    apt install --no-install-recommends -y build-essential gcc git && \
    apt clean && rm -rf /var/lib/apt/lists/*

### More application specifics:
COPY requirements.txt requirements.txt
COPY pyproject.toml pyproject.toml
COPY src/code_structure_template/ src/code_structure_template/
COPY data/ data/

# Set working directory and install dependencies
WORKDIR /
RUN pip install -r requirements.txt --no-cache-dir
# RUN pip install torch==2.2.2 torchvision==0.17.2 --index-url https://download.pytorch.org/whl/cpu
RUN pip install . --no-deps --no-cache-dir

# Entrypoint is set to the training script
ENTRYPOINT ["python", "-u", "src/code_structure_template/train.py"]
