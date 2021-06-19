// Description: https://www.codewars.com/kata/526571aae218b8ee490006f4/

function get_bin_rep($int) {
    if ($int < 2) {
        return $int;
    } else {
        $int_division = intdiv($int, 2);
        $rest = $int % 2;
        $int_division_rest = get_bin_rep($int_division);
        return "$int_division_rest" . "$rest";
    }
}

function countBits($n) {
    $binary_rep = get_bin_rep($n);
    $binary_rep_without_zeros = str_replace("0", "", $binary_rep);
    return strlen($binary_rep_without_zeros);
}
                 
