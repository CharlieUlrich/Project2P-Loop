Result pRecognizer(ArrayList<double[]> pts, ArrayList<cloud> templs){
  int n = 32;
  pts = normalizer(pts,n);
  double score = Double.MAX_VALUE;
  cloud result = null;
  for(cloud template: templs){
    println("yo");
    template.cloud = normalizer(template.cloud,n);
    println(pts.size(), template.cloud.size(), template.name);
    double d = greedyCloudMatch(pts,template.cloud,n);
    System.out.println(template.name + " " + d);
    if (d < score){
      score = d;
      result = template;
    }
  }
  Result a = new Result(result,score);
  return a;
}

ArrayList<double[]> normalizer(ArrayList<double[]> pts,int n){
  pts = Resample(pts,n);
  scale(pts);
  transToOrigin(pts, new double[] {0,0,0});
  return pts;
}

class Result{
 cloud res;
  double score;
  public Result(cloud n, double s){
    res = n;
     score = s;
  }
}
