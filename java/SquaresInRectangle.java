
public class SquaresInRectangle {
  public static int findSquares(int x, int y){
    int result = 0;
    while (Math.min(x, y) > 0) {
      result += x * y;
      x--;
      y--;
    }
    return result;
  }
}

