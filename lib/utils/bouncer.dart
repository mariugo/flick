import 'dart:async';

class Bouncer {
  Duration delay;
  Timer? _timer;

  Bouncer(this.delay);

  call(void Function() callback) {
    _timer?.cancel();
    _timer = Timer(delay, callback);
  }

  dispose() {
    _timer?.cancel();
  }
}
