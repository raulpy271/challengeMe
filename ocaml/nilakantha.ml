
type float_operation = float -> float -> float;;

let shift (operation: float_operation) = 
  let is_sum = operation 1.0 1.0 = 2.0 in
  if is_sum then (-.) else (+.)
;;

let calculate_pi ?(limit=20) (): float =
  let rec calculate_a_pi_term 
      (term: int) (acc: float) (operation: float_operation): float =
    if term >= limit then acc
    else
      let dividend = float_of_int (term * (term + 1) * (term + 2)) in
      let step_value = 4.0 /. dividend in
      let new_acc = operation acc step_value in
      calculate_a_pi_term (term + 2) new_acc (shift operation)
  in calculate_a_pi_term 2 3.0 (+.)
;;
