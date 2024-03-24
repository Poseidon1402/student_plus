abstract class Computation {
  static double getMaximum(List<double> numbers) {
    return numbers.reduce((current, next) => current > next ? current : next);
  }

  static double getMinimum(List<double> numbers) {
    return numbers.reduce((current, next) => current < next ? current : next);
  }

  static getAverage(List<double> numbers) {
    double avg = 0;
    for(double i in numbers) {
      avg += i;
    }

    return avg / numbers.length;
  }
}