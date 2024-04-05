import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

final s = AudioPlayerService.songProgress = 10;

abstract class AudioPlayerService {
  AudioPlayerService._();
  static late AudioPlayer _audioPlayer;

  static final _songProgress = 0.0.obs;
  static double get songProgress => _songProgress.value;
  static set songProgress(double value) => _songProgress.value = value;

  static final _currentDuration = 0.obs;
  static int get currentDuration => _currentDuration.value;
  static set currentDuration(int value) => _currentDuration.value = value;

  static final _totalDuration = 0.obs;
  static int get totalDuration => _totalDuration.value;
  static set totalDuration(int value) => _totalDuration.value = value;

  static final _audioProcessingState = ProcessingState.idle.obs;
  static ProcessingState get audioProcessingState =>
      _audioProcessingState.value;
  static set audioProcessingState(ProcessingState value) =>
      _audioProcessingState.value = value;

  static final _isPlaying = false.obs;
  static bool get isPlaying => _isPlaying.value;
  static set isPlaying(bool value) => _isPlaying.value = value;

  static void init() {
    _audioPlayer = AudioPlayer();
  }

  static void setUrl(String url) async {
    await _reset();
    _audioPlayer.setUrl(url);
    listenStreams();
  }

  static void setAsset(String assetPath) async {
    await _reset();
    _audioPlayer.setAsset(assetPath);
    listenStreams();
  }

  static void setAudioSource(AudioSource audioSource) async {
    await _reset();
    _audioPlayer.setAudioSource(audioSource);
    listenStreams();
  }

  static Future<void> _reset() async {
    await stop();
    songProgress = 0;
    currentDuration = 0;
    totalDuration = 0;
    audioProcessingState = ProcessingState.idle;
    isPlaying = false;
  }

  static void listenStreams() {
    _listenPlayingStream();
    _listenDurationStream();
    _listenPositionStream();
    _listenPlayerStateStream();
  }

  static void _listenPlayingStream() {
    _audioPlayer.playingStream.listen((playing) {
      isPlaying = playing;
    });
  }

  static void _listenDurationStream() {
    _audioPlayer.durationStream.listen((_totalDuration) {
      totalDuration = _totalDuration?.inSeconds ?? 0;
      _configureSongProgress();
    });
  }

  static void _listenPositionStream() {
    _audioPlayer.positionStream.listen((_currentDuration) {
      currentDuration = _currentDuration.inSeconds;
      _configureSongProgress();
    });
  }

  static void _listenPlayerStateStream() {
    _audioPlayer.playerStateStream.listen((playerState) {
      audioProcessingState = playerState.processingState;
    });
  }

  static void _configureSongProgress() {
    if (totalDuration > 0) {
      songProgress = currentDuration / totalDuration;
    }
  }

  static void onChangeProgress(double value) {
    songProgress = value;
  }

  static Future<void> play() async {
    if (isPlaying) return;
    await _audioPlayer.play();
  }

  static Future<void> pause() async {
    if (!isPlaying) return;
    await _audioPlayer.pause();
  }

  static Future<void> stop() async {
    await _audioPlayer.stop();
  }

  static Future<void> replay() async {
    await _audioPlayer.seek(Duration.zero);
  }

  static Future<void> seek() async {
    final seek = (songProgress * totalDuration).toInt();
    await _audioPlayer.seek(Duration(seconds: seek));
  }
}