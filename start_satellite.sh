#! /bin/bash

/home/satellite/wyoming-satellite/script/run \
    --name 'Satellite' \
    --uri 'tcp://0.0.0.0:10700' \
    --mic-command 'arecord -D plughw:CARD=seeed2micvoicec,DEV=0 -r 16000 -c 1 -f S16_LE -t raw' \
    --snd-command 'aplay -D plughw:CARD=seeed2micvoicec,DEV=0 -r 22050 -c 1 -f S16_LE -t raw' \
    --wake-uri 'tcp://127.0.0.1:10400' \
    --wake-word-name 'hey_jarvis' \
    --mic-auto-gain 10 \
    --mic-noise-suppression 2 \
    --debug

: '
usage: __main__.py [-h] [--mic-uri MIC_URI] [--mic-command MIC_COMMAND] [--mic-command-rate MIC_COMMAND_RATE] [--mic-command-width MIC_COMMAND_WIDTH] [--mic-command-channels MIC_COMMAND_CHANNELS]
                   [--mic-command-samples-per-chunk MIC_COMMAND_SAMPLES_PER_CHUNK] [--mic-volume-multiplier MIC_VOLUME_MULTIPLIER] [--mic-noise-suppression {0,1,2,3,4}]
                   [--mic-auto-gain {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31}] [--mic-seconds-to-mute-after-awake-wav MIC_SECONDS_TO_MUTE_AFTER_AWAKE_WAV] [--mic-no-mute-during-awake-wav]
                   [--snd-uri SND_URI] [--snd-command SND_COMMAND] [--snd-command-rate SND_COMMAND_RATE] [--snd-command-width SND_COMMAND_WIDTH] [--snd-command-channels SND_COMMAND_CHANNELS]
                   [--snd-volume-multiplier SND_VOLUME_MULTIPLIER] [--wake-uri WAKE_URI] [--wake-word-name WAKE_WORD_NAME] [--wake-command WAKE_COMMAND] [--wake-command-rate WAKE_COMMAND_RATE] [--wake-command-width WAKE_COMMAND_WIDTH]
                   [--wake-command-channels WAKE_COMMAND_CHANNELS] [--wake-refractory-seconds WAKE_REFRACTORY_SECONDS] [--vad] [--vad-threshold VAD_THRESHOLD] [--vad-trigger-level VAD_TRIGGER_LEVEL]
                   [--vad-buffer-seconds VAD_BUFFER_SECONDS] [--vad-wake-word-timeout VAD_WAKE_WORD_TIMEOUT] [--event-uri EVENT_URI] [--startup-command STARTUP_COMMAND] [--detect-command DETECT_COMMAND]
                   [--detection-command DETECTION_COMMAND] [--transcript-command TRANSCRIPT_COMMAND] [--stt-start-command STT_START_COMMAND] [--stt-stop-command STT_STOP_COMMAND] [--synthesize-command SYNTHESIZE_COMMAND]
                   [--tts-start-command TTS_START_COMMAND] [--tts-stop-command TTS_STOP_COMMAND] [--tts-played-command TTS_PLAYED_COMMAND] [--streaming-start-command STREAMING_START_COMMAND]
                   [--streaming-stop-command STREAMING_STOP_COMMAND] [--error-command ERROR_COMMAND] [--connected-command CONNECTED_COMMAND] [--disconnected-command DISCONNECTED_COMMAND] [--awake-wav AWAKE_WAV] [--done-wav DONE_WAV]
                   --uri URI [--name NAME] [--area AREA] [--no-zeroconf] [--zeroconf-name ZEROCONF_NAME] [--zeroconf-host ZEROCONF_HOST] [--debug-recording-dir DEBUG_RECORDING_DIR] [--debug] [--log-format LOG_FORMAT]

optional arguments:
  -h, --help            show this help message and exit
  --mic-uri MIC_URI     URI of Wyoming microphone service
  --mic-command MIC_COMMAND
                        Program to run for microphone input
  --mic-command-rate MIC_COMMAND_RATE
                        Sample rate of mic-command (hertz, default: 16000)
  --mic-command-width MIC_COMMAND_WIDTH
                        Sample width of mic-command (bytes, default: 2)
  --mic-command-channels MIC_COMMAND_CHANNELS
                        Sample channels of mic-command (default: 1)
  --mic-command-samples-per-chunk MIC_COMMAND_SAMPLES_PER_CHUNK
                        Sample per chunk for mic-command (default: 1024)
  --mic-volume-multiplier MIC_VOLUME_MULTIPLIER
  --mic-noise-suppression {0,1,2,3,4}
  --mic-auto-gain {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31}
  --mic-seconds-to-mute-after-awake-wav MIC_SECONDS_TO_MUTE_AFTER_AWAKE_WAV
                        Seconds to mute microphone after awake wav is finished playing (default: 0.5)
  --mic-no-mute-during-awake-wav
                        Don't mute the microphone while awake wav is being played
  --snd-uri SND_URI     URI of Wyoming sound service
  --snd-command SND_COMMAND
                        Program to run for sound output
  --snd-command-rate SND_COMMAND_RATE
                        Sample rate of snd-command (hertz, default: 22050)
  --snd-command-width SND_COMMAND_WIDTH
                        Sample width of snd-command (bytes, default: 2)
  --snd-command-channels SND_COMMAND_CHANNELS
                        Sample channels of snd-command (default: 1)
  --snd-volume-multiplier SND_VOLUME_MULTIPLIER
  --wake-uri WAKE_URI   URI of Wyoming wake word detection service
  --wake-word-name WAKE_WORD_NAME
                        Name of wake word to listen for (requires --wake-uri)
  --wake-command WAKE_COMMAND
                        Program to run for wake word detection
  --wake-command-rate WAKE_COMMAND_RATE
                        Sample rate of wake-command (hertz, default: 16000)
  --wake-command-width WAKE_COMMAND_WIDTH
                        Sample width of wake-command (bytes, default: 2)
  --wake-command-channels WAKE_COMMAND_CHANNELS
                        Sample channels of wake-command (default: 1)
  --wake-refractory-seconds WAKE_REFRACTORY_SECONDS
                        Seconds after a wake word detection before another detection is handled (default: 5)
  --vad                 Wait for speech before streaming audio
  --vad-threshold VAD_THRESHOLD
  --vad-trigger-level VAD_TRIGGER_LEVEL
  --vad-buffer-seconds VAD_BUFFER_SECONDS
  --vad-wake-word-timeout VAD_WAKE_WORD_TIMEOUT
                        Seconds before going back to waiting for speech when wake word isn't detected
  --event-uri EVENT_URI
                        URI of Wyoming service to forward events to
  --startup-command STARTUP_COMMAND
                        Command run when the satellite starts
  --detect-command DETECT_COMMAND
                        Command to run when wake word detection starts
  --detection-command DETECTION_COMMAND
                        Command to run when wake word is detected
  --transcript-command TRANSCRIPT_COMMAND
                        Command to run when speech to text transcript is returned
  --stt-start-command STT_START_COMMAND
                        Command to run when the user starts speaking
  --stt-stop-command STT_STOP_COMMAND
                        Command to run when the user stops speaking
  --synthesize-command SYNTHESIZE_COMMAND
                        Command to run when text to speech text is returned
  --tts-start-command TTS_START_COMMAND
                        Command to run when text to speech response starts
  --tts-stop-command TTS_STOP_COMMAND
                        Command to run when text to speech response stops
  --tts-played-command TTS_PLAYED_COMMAND
                        Command to run when text-to-speech audio stopped playing
  --streaming-start-command STREAMING_START_COMMAND
                        Command to run when audio streaming starts
  --streaming-stop-command STREAMING_STOP_COMMAND
                        Command to run when audio streaming stops
  --error-command ERROR_COMMAND
                        Command to run when an error occurs
  --connected-command CONNECTED_COMMAND
                        Command to run when connected to the server
  --disconnected-command DISCONNECTED_COMMAND
                        Command to run when disconnected from the server
  --awake-wav AWAKE_WAV
                        WAV file to play when wake word is detected
  --done-wav DONE_WAV   WAV file to play when voice command is done
  --uri URI             unix:// or tcp://
  --name NAME           Name of the satellite
  --area AREA           Area name of the satellite
  --no-zeroconf         Disable discovery over zeroconf
  --zeroconf-name ZEROCONF_NAME
                        Name used for zeroconf discovery (default: MAC from uuid.getnode)
  --zeroconf-host ZEROCONF_HOST
                        Host address for zeroconf discovery (default: detect)
  --debug-recording-dir DEBUG_RECORDING_DIR
                        Directory to store audio for debugging
  --debug               Log DEBUG messages
  --log-format LOG_FORMAT
                        Format for log messages
'