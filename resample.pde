ArrayList<double[]> Resample(ArrayList<double[]> pts, int n) { //<>//
  
  double I = pathLength(pts)/(n-1);
  double D = 0;
  ArrayList<double[]> newPoints = new ArrayList<double[]>();
  newPoints.add(pts.get(0));
  
  for (int i = 1; i < pts.size(); i++) {
    if (pts.get(i)[2] == pts.get(i-1)[2]) {
      double d = euclideanDistance(pts.get(i-1),pts.get(i));
      if ((D + d) >= I) {
        double[] q = new double[3];
        q[0] = pts.get(i-1)[0] + ((I-D)/d) * (pts.get(i)[0] - pts.get(i-1)[0]);
        q[1] = pts.get(i-1)[1] + ((I-D)/d) * (pts.get(i)[1] - pts.get(i-1)[1]);
        q[2] = pts.get(i-1)[2];
        newPoints.add(q);
        pts.add(i,q);
        D = 0;
      }
      else D = (D + d);
    }
  }
  if (newPoints.size() == n - 1) newPoints.add(new double[] {pts.get(pts.size()-1)[0], pts.get(pts.size()-1)[1], pts.get(pts.size()-1)[2]});
  return newPoints;
}
        
