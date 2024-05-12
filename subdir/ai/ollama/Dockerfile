FROM ollama/ollama:latest
RUN apt update && apt install -y python3 python3-pip git
RUN python3 -m pip install -U "huggingface_hub[cli]"
COPY Modelfile /root/
COPY Fugaku-LLM-13B-instruct-0325b-q5_k_m.gguf /root/
WORKDIR /root
