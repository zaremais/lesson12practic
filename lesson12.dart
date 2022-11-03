import 'dart:io';
import 'dart:math';

void main() {
//  randomSearch(1, 100);
  print('binary steps: ${compBinarySearch}');
  print('random steps: ${compRandomSearch}');
  game();
}

// 1) Написать функцию рандомного поиска. (Пользователь загадывает число,
// программа выдает ему число от 0 до 100 рандомным образом и так до тех,
// пор пока пользователь не скажет, что число верно. Алгоритм работы схож с бинарным поиском).

void randomSearch(int min, max) {
  print('Загадайте число от 1 до 100');
  int min = 0;
  int max = 100;
  int mid = min + Random().nextInt(max - min);
  int count = 0;
  String answer = '';

  while (answer != 'yes') {
    print('Ваше число $mid?');
    answer = stdin.readLineSync()!;

    if (answer == 'less') {
      max = mid;
      mid = min + Random().nextInt(max - min);
      count++;
    } else if (answer == 'greater') {
      min = mid;
      mid = min + Random().nextInt(max - min);
      count++;
    } else if (answer == 'yes') {
      print('Конец игры!');
      print('Вы угадали с $count попытки');
    }
  }
}

// 2) Написать две дополнительные функции для проверки количества шагов, за которое компьютер
// угадал число. Компьютер играет сам с собой и возвращает количество шагов.

int compRandomSearch(array) {
  print('Загадайте число от 1 до 100');
  int min = 0;
  int max = 100;
  int step = 1;
  int mid = min + Random().nextInt(max - min);
  int randomNumber = min + Random().nextInt(max - min);

  print('randomNumber: $randomNumber');

  while (randomNumber != mid) {
    if (randomNumber < mid) {
      max = mid;
      mid = min + Random().nextInt(max - min);
      step++;
    } else if (randomNumber > mid) {
      min = mid;
      mid = min + Random().nextInt(max - min);
      step++;
    }
  }

  return step;
}

int compBinarySearch(array) {
  print('Загадайте число от 1 до 100');
  int min = 0;
  int max = 100;
  int step = 1;
  int mid = (min + max) ~/ 2;
  int randomNumber = min + Random().nextInt(max - min);

  print('randomNumber: $randomNumber');

  while (randomNumber != mid) {
    if (randomNumber < mid) {
      max = mid;
      mid = (min + max) ~/ 2;
      step++;
    } else if (randomNumber > mid) {
      min = mid;
      mid = ((min + max) / 2).round();
      step++;
    }
  }

  return step;
}

//   3) Сгенерируйте массив из 100 или более случайных чисел и по oчереди прогоните
// его через каждый алгоритм угадывания. Определите среднее количество шагов,
//которое потребовалось каждому алгоритму на одно число. Протестируйте, какой из
//способов угадывания эффективнее. Лучший алгоритм тот, который угадал быстрее.

void game() {
  List array = [];

  int randomSum = 0;
  int binarySum = 0;

  double randomAverage = 0;
  double binaryAverage = 0;

  for (int i = 0; i < 100; i++) {
    array.add(Random().nextInt(100));
  }

  for (int i = 0; i < array.length; i++) {
    randomSum += compRandomSearch(array[i]);
    binarySum += compBinarySearch(array[i]);
  }

  binaryAverage = binarySum / array.length;
  randomAverage = randomSum / array.length;

  print('randomSum = $randomSum');
  print('binarySum = $binarySum');

  print('binaryAverage = $binaryAverage');
  print('randomAverage = $randomAverage');

  if (randomAverage > binaryAverage) {
    print('binary is faster');
  } else if (randomAverage < binaryAverage) {
    print('random is faster');
  } else {
    print('same');
  }
}
