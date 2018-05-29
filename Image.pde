public class Image {//store all the values for a row and the label of it
  float[] inputs;//size 784
  float[] outputs;//size 10
  int label;
  int index;

  public Image() {
    inputs = new float[784];//size 784
    outputs = new float[10];//size 10
    index = 0;
  }

  public void addValue(int value) {
    inputs[index] = (map(value, 0, 255, 0, 1));
    index++;
  }

  public void printValues() {
    printArray(inputs);
  }

  public void setLabel(int label) {
    this.label = label;
    for (int i = 0; i < 10; i++) {
      if (label == i) {
        outputs[i] = 1;
      } else {
        outputs[i] = 0;
      }
    }
  }

  public int getLabel() {
    return label;
  }

  public String toString() {
    return "label: " + label + "\t values: " + inputs.toString();
  }
}