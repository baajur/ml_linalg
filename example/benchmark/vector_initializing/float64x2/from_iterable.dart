// Performance test of vector (10 000 000 elements in vector) initializing via `from`-constructor
// It takes approximately 5.3 second (MacBook Air mid 2017)

import 'package:linalg/src/simd/float64x2_vector.dart';
import 'package:benchmark_harness/benchmark_harness.dart';
import 'package:linalg/vector.dart';

const amountOfElements = 10000000;

SIMDVector vector;

class VectorInitializationBenchmark extends BenchmarkBase {
  const VectorInitializationBenchmark() : super('Vector initialization (from simple iterable), $amountOfElements elements');

  static void main() {
    const VectorInitializationBenchmark().report();
  }

  @override
  void run() {
    vector = Float64x2VectorFactory.from(List<double>.filled(amountOfElements, 1.0));
  }

  void tearDown() {
    vector = null;
  }
}

void main() {
  VectorInitializationBenchmark.main();
}
