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
    for (int i = 0; i < input.length; i++) {
      input[i].activation = data[i];
    }
  }

  public int getIndex(int x, int y) {
    return (x*28)+y;
  }

  public void show(int xpos, int ypos) {
    for (int x = 0; x < 28; x++) {
      for (int y= 0; y < 28; y++) {
        pushMatrix();
        translate(y * 10 + xpos, x * 10 + ypos);
        input[getIndex(x, y)].show();
        popMatrix();
      }
    }

    for (int i = 0; i < hidden.length; i++) {
      pushMatrix();
      translate(xpos + 350, i * 10 + ypos);
      hidden[i].show();
      popMatrix();
    }

    for (int i = 0; i < output.length; i++) {
      pushMatrix();
      translate(xpos + 425, i * 10 + ypos);
      output[i].show();
      popMatrix();
    }
  }
}
