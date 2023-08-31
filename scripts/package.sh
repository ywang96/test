git clone https://github.com/huggingface/diffusers
cd diffusers
pip install -e .

cd examples/controlnet
pip install -r requirements.txt

accelerate config default
