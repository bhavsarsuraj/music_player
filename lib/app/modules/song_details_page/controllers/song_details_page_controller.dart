import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class SongDetailsPageController extends GetxController {
  final player = AudioPlayer();

  final _songProgress = 0.0.obs;
  double get songProgress => this._songProgress.value;
  set songProgress(double value) => this._songProgress.value = value;

  final _currentDuration = 0.obs;
  int get currentDuration => this._currentDuration.value;
  set currentDuration(int value) => this._currentDuration.value = value;

  final _totalDuration = 0.obs;
  int get totalDuration => this._totalDuration.value;
  set totalDuration(int value) => this._totalDuration.value = value;

  final _audioProcessingState = ProcessingState.idle.obs;
  ProcessingState get audioProcessingState => this._audioProcessingState.value;
  set audioProcessingState(ProcessingState value) =>
      this._audioProcessingState.value = value;

  final _isPlaying = false.obs;
  bool get isPlaying => this._isPlaying.value;
  set isPlaying(bool value) => this._isPlaying.value = value;

  @override
  void onInit() {
    _configure();
    super.onInit();
  }

  void _configure() {
    _configureAudio();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() async {
    await pause();
    super.onClose();
  }

  void _configureAudio() async {
    player.setUrl(
      'https://archive.org/download/IGM-V7/IGM%20-%20Vol.%207/25%20Diablo%20-%20Tristram%20%28Blizzard%29.mp3',
      // 'https://file-examples.com/storage/fe0e2ce82f660c1579f31b4/2017/11/file_example_MP3_700KB.mp3',
    );
    try {
      player.playingStream.listen((playing) {
        isPlaying = playing;
      });
      player.durationStream.listen((_totalDuration) {
        totalDuration = _totalDuration?.inSeconds ?? 0;
        _configureSongProgress();
      });
      player.positionStream.listen((_currentDuration) {
        currentDuration = _currentDuration.inSeconds ?? 0;
        _configureSongProgress();
      });
      player.playerStateStream.listen((playerState) {
        audioProcessingState = playerState.processingState;
      });
    } catch (_) {
      print('Error configuring Audio $_');
    }
  }

  void _configureSongProgress() {
    if (totalDuration > 0) {
      songProgress = currentDuration / totalDuration;
    }
  }

  Future<void> play() async {
    if (isPlaying) return;
    await player.play();
  }

  Future<void> pause() async {
    if (!isPlaying) return;
    await player.pause();
  }

  void onChangeProgress(double value) {
    songProgress = value;
  }

  Future<void> playSongFromSpecifiDuration() async {
    final songDuration = player.duration?.inSeconds ?? 0;
    final seek = (songProgress * songDuration).toInt();
    await player.seek(Duration(seconds: seek));
  }

  Future<void> replay() async {
    await player.seek(Duration.zero);
  }
}
