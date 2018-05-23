public class Neuron {
  float activation;//0-1
  Neuron[] previous_neurons;
  float[] weights;

  public Neuron(int input_size) {
    weights = new float[input_size];
    for (int i = 0; i < input_size; i++) {
      weights[i] = random(-1, 1);
    }
  }

  public Neuron(Neuron[] previous) {
    previous_neurons = new Neuron[previous.length];
    weights = new float[previous.length];
    for (int i = 0; i < previous.length; i++) {
      weights[i] = random(-1, 1);
      previous_neurons[i] = previous[i];
    }
  }

  public float weightedSum() {
    float sum = 0;
    for (int i = 0; i < weights.length; i++) {
      sum+= weights[i] * previous_neurons[i].activation;
    }
    return sum;
  }

  public float sigmoid(float num) {
    return 1 / (1 + exp(-num));
  }

  public void fire() {
    activation = sigmoid(weightedSum());
  }

  public void show() {
    stroke(255);
    fill(map(activation, 0, 1, 0, 255));
    ellipse(0, 0, 10, 10);
  }
}
