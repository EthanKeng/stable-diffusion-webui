@echo off

:: Set Python if it's not found automatically (usually not needed)
:: Example: set PYTHON=C:\path\to\your\python.exe
:: set PYTHON=

:: Set the exact PyTorch version with CUDA support.
:: We are targeting CUDA 11.8, which often works with NVIDIA drivers for CUDA 11.4.
:: Using Torch/Torchvision versions that were mentioned in your initial logs (v2.1.2/v0.16.2)
:: This command will be executed by the main webui.bat/launch.py script.
set TORCH_COMMAND=pip install torch==2.1.2+cu118 torchvision==0.16.2+cu118 torchaudio==2.1.2+cu118 --index-url https://download.pytorch.org/whl/cu118

:: Add any command line arguments you want to pass to Stable Diffusion WebUI.
:: --lowvram enables optimizations for low VRAM GPUs (like 4GB).
:: --opt-sdp-attention uses a more memory-efficient attention mechanism available in PyTorch 2.x.
:: REMOVED --xformers as it was causing errors during generation.
set COMMANDLINE_ARGS=--lowvram --opt-sdp-attention

:: Set the path to git executable if needed (usually not necessary if git is in your system PATH)
:: Example: set GIT=C:\Program Files\Git\bin\git.exe
:: set GIT=

:: Increase Gradio server timeout if needed (default is 30 seconds)
:: set GRADIO_SERVER_TIMEOUT=60

:: Echo the variables being used (for confirmation during execution)
echo Launching Web UI with settings:
echo TORCH_COMMAND=%TORCH_COMMAND%
echo COMMANDLINE_ARGS=%COMMANDLINE_ARGS%
echo.

:: Call the main webui batch file which handles venv creation and launching.
call webui.bat

:: Pause at the end to see any final messages before the window closes automatically.
echo.
echo Script finished. Press any key to exit.
pause
