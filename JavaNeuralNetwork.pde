Network n;

Image[] training;
Image[] testing;

int epocs = 0;
int correct = 0;
int incorrect = 0;
int numOfTestings;

void setup() {

  size(1000, 700);
  training = new Image[42001];
  testing = new Image[28001];

  //loadTesting("test.csv");
  loadTraining("train.csv");

  n = new Network(784, 28, 10);
}

void keyPressed() {
  if (key == 't') {
    int randomtestIndex = int(random(0, training.length));
    n.feedForward(training[randomtestIndex]);
    numOfTestings++;
    if (training[randomtestIndex].label == n.getGuess()) {
      correct++;
    } else {
      incorrect++;
    }
  } else {
    int randomIndex = int(random(0, training.length));
    n.feedForward(training[randomIndex]);
    n.learn(training[randomIndex].outputs);
    epocs++;
  }

  if (key == 'o') {
    for (Neuron n : n.input) {
      println(n.weights);
    }
  }
}

void mousePressed() {
  for (int i = 0; i < 1000000; i++) {
    int randomIndex = int(random(0, training.length));
    n.feedForward(training[randomIndex]);
    n.learn(training[randomIndex].outputs);
    epocs++;
  }
}

void draw() {
  background(0);
  n.show(20, 20);
  text(epocs, 20, height-20);
  text(n.getGuess(), 20, height-40);
  if (numOfTestings > 0) {
    text((float)correct/numOfTestings, width-40, height-40);
  }
}