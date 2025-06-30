import 'dart:async';

class StepCounter {
  static int _steps = 0;
  static Timer? _timer;
  static Function(int steps)? _onStepChanged;

  static void startAutoSteps(Function(int) onStepChanged) {
    _steps = 0;
    _onStepChanged = onStepChanged;

    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (timer.tick >= 10) {
        timer.cancel(); // 5초 후 정지
      } else {
        _steps++;
        _onStepChanged?.call(_steps);
      }
    });
  }

  static void reset() {
    _steps = 0;
    _onStepChanged?.call(_steps);
  }

  static void dispose() {
    _timer?.cancel();
  }
}