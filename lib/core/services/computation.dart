abstract class Computation {
  static double getMaximum(List<double> numbers) {
    if(numbers.isEmpty) return 0;
    return numbers.reduce((current, next) => current > next ? current : next);
  }

  static double getMinimum(List<double> numbers) {
    if(numbers.isEmpty) return 0;

    return numbers.reduce((current, next) => current < next ? current : next);
  }

  static getAverage(List<double> numbers) {
    double avg = 0;

    if(numbers.isEmpty) return 0;

    for(double i in numbers) {
      avg += i;
    }

    return avg / numbers.length;
  }
}