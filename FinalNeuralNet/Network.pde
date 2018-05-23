public class Network {
  Neuron[] input;
  Neuron[] hidden;
  Neuron[] output;

  public Network(int input_size, int hidden_size, int output_size) {
    input = new Neuron[input_size];
    hidden = new Neuron[hidden_size];
    output = new Neuron[output_size];

    for (int i = 0; i < input.length; i++) {
      input[i] = new Neuron(input_size);
    }

    for (int i = 0; i < hidden.length; i++) {
      hidden[i] = new Neuron(input);
    }

    for (int i = 0; i < output.length; i++) {
      output[i] = new Neuron(hidden);
    }
  }

  public void feedForward() {
  }
}