#! /bin/bash

/home/satellite/wyoming-openwakeword/script/run \
    --uri 'tcp://127.0.0.1:10400'

: '
usage: __main__.py [-h] [--uri URI] [--models-dir MODELS_DIR] [--custom-model-dir CUSTOM_MODEL_DIR] [--preload-model PRELOAD_MODEL] [--threshold THRESHOLD] [--trigger-level TRIGGER_LEVEL] [--output-dir OUTPUT_DIR] [--debug]
                   [--log-format LOG_FORMAT] [--debug-probability] [--version] [--model MODEL]

optional arguments:
  -h, --help            show this help message and exit
  --uri URI             unix:// or tcp://
  --models-dir MODELS_DIR
                        Path to directory with built-in models
  --custom-model-dir CUSTOM_MODEL_DIR
                        Path to directory with custom wake word models
  --preload-model PRELOAD_MODEL
                        Name or path of wake word model(s) to pre-load
  --threshold THRESHOLD
                        Wake word model threshold (0.0-1.0, default: 0.5)
  --trigger-level TRIGGER_LEVEL
                        Number of activations before detection (default: 1)
  --output-dir OUTPUT_DIR
                        Path to save audio and detections
  --debug               Log DEBUG messages
  --log-format LOG_FORMAT
                        Format for log messages
  --debug-probability   Log all wake word probabilities (VERY noisy)
  --version             Print version and exit
  --model MODEL         Deprecated
'
    