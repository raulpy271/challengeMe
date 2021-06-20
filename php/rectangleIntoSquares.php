// Description: https://www.codewars.com/kata/55466989aeecab5aac00003e/php

class Rect {
    public $length;
    public $width;

    function __construct($length, $width) {
        $this->length = $length;
        $this->width = $width;
    }

   function area() {
       return $this->length * $this->width;
    }

    function max_square() {
        $len_of_max_square_inside_this = 
            min($this->length, $this->width);
        $max_square = new Rect(
            $len_of_max_square_inside_this,
            $len_of_max_square_inside_this
        );
        return $max_square;
    }

    function remove_max_square() {
        if ($this->length > $this->width) {
            $rec_without_square = new Rect(
                $this->length - $this->width,
                $this->width
            );
        }
        else {
            $rec_without_square = new Rect(
                $this->length,
                $this->width - $this->length
            );
        }
        return $rec_without_square;
    }
  
    function all_squares() {
        $square = $this->max_square();
        $rec_without_square = $this->remove_max_square();
        if ($rec_without_square->area() == 0) {
            return [$this->length];
        } else {
            $rest_squares = $rec_without_square->all_squares();
            return array_merge([$square->length], $rest_squares);
        }
    }
}

function sqInRect($lng, $wdth) {
    if ($lng == $wdth) {
        return null;
    }
    $rec = new Rect($lng, $wdth);
    return $rec->all_squares();
}
