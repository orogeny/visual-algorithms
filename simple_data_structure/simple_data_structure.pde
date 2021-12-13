int sampleSize = 300;
int[] sample = new int[sampleSize];

void setup() {
  size(2010, 500);
  colorMode(HSB, 360, 100, 100);
  
  // Populate our sample data set
  for (int i = 0; i < sample.length; i++) {
    sample[i] = int(random(201)); 
  }
}

void draw() {
  // Calculate frequency for each number
  IntDict summary = new IntDict(201);
  
  for (int i = 0; i < sample.length; i++) {
    String distinctNumber = str(sample[i]);  // Grab the random number
    
    if (!summary.hasKey(distinctNumber)) summary.set(distinctNumber, 0);
    
    summary.increment(distinctNumber);
  }
  
  float barWidth = width / 201.0;
  
  float maxFreq = max(summary.valueArray());
  
  // draw a rectangle for each distinct number
  for (String k : summary.keys()) {
    float number = float(k);
    float freq = summary.get(k);
    
    float x = number * barWidth;
    float barHeight = freq * height / maxFreq;
    float y = height - barHeight;  
    
    // Higher frequencies increase intensity 
    float saturation = 100 * freq / maxFreq;
    fill(0, saturation, 75);
    
    rect(x, y, barWidth, barHeight); 
  }
}
