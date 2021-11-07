import org.junit.Test;
import static org.junit.Assert.assertEquals;

public class FindSquareTest{
  @Test
  public void rectangleWithOnly1x1Squares() {
    assertEquals(1, SquaresInRectangle.findSquares(1, 1));
    assertEquals(2, SquaresInRectangle.findSquares(2, 1));
  }
  
  @Test 
  public void rectangeWith2x2Squares() {
    assertEquals(8, SquaresInRectangle.findSquares(2, 3));
    assertEquals(11, SquaresInRectangle.findSquares(2, 4));
  }
  
  @Test
  public void rectangeWithNxMSquares() {
    assertEquals(20, SquaresInRectangle.findSquares(3, 4));
    assertEquals(100, SquaresInRectangle.findSquares(11,4));
  }
}

