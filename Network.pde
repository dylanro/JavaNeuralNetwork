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

  public void feedForward(Image img) {
    //data gets fed into the input layer
    for (int i = 0; i < input.length; i++) {
      input[i].activation = img.inputs[i];
    }

    //all hidden layer neurons fire off the activation of input
    for (Neuron n : hidden) {
      n.fire();
    }

    //all output neurons fire and take the activation from hidden
    for (Neuron n : output) {
      n.fire();
    }
  }

  public int getGuess() {
    float max_val = 0;
    int index = 0;
    for (int i = 0; i < output.length; i++) {
      if (output[i].activation > max_val) {
        max_val = output[i].activation;
        index = i;
      }
    }
    return index;
  }

  public void learn(float[] outputs) {//outputs is just the array containing what it should output (from image class)
    for (int i = 0; i < output.length; i++) {
      output[i].setError(outputs[i]);
      output[i].adjustWeights();
    }
    for (Neuron hn : hidden) {
      hn.adjustWeights();
    }
  }

  public int getIndex(int x, int y) {
    return (x*28)+y;
  }

  public void show(int xpos, int ypos) {
    for (int x = 0; x < 28; x++) {
      for (int y= 0; y < 28; y++) {
        pushMatrix();
        translate(y * 16 + xpos, x * 16 + ypos);
        input[getIndex(x, y)].show(false, false, 0);
        popMatrix();
      }
    }

    for (int i = 0; i < hidden.length; i++) {
      pushMatrix();
      translate(xpos + 550, i * 16 + ypos);
      hidden[i].show(true, false, 0);
      popMatrix();
    }

    for (int i = 0; i < output.length; i++) {
      pushMatrix();
      translate(xpos + 750, i * 16 + ypos);
      output[i].show(true, true, i);
      popMatrix();
    }
  }
}