
let get_inhabitants_in_next_year (p0: int) (percent: float) (aug: int): int =
  let percent_ratio = percent /. 100. in
  let born = float_of_int p0 *. percent_ratio in
  p0 + aug + (int_of_float born)
;;

let nb_year (p0: int) (percent: float) (aug: int) (p: int): int =
  let rec nb_year_tail (p0: int) (year: int): int = 
    let next_population = get_inhabitants_in_next_year p0 percent aug in
    if next_population >= p
    then year + 1
    else nb_year_tail next_population (year + 1) in
  nb_year_tail p0 0
;;
