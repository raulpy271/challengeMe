(*Description: https://www.codewars.com/kata/541c8630095125aba6000c00 *)

let sum_list (list: int list): int = List.fold_left (+) 0 list;;

let list_of_int_from_list_of_char (list_of_digits : char list): int list =
  List.map (fun char -> int_of_string (String.make 1 char)) list_of_digits
;;

let rec get_digits_in_char (num_in_str: string): char list = 
  let length = String.length num_in_str in
  if length = 0 then []
  else 
    let first = String.get num_in_str 0 in
    let tail = String.sub num_in_str 1 (length - 1) in 
    first :: (get_digits_in_char tail)
  ;;
    
let get_digits_in_int (num: int): int list =
  let num_in_str = string_of_int num in
    list_of_int_from_list_of_char (get_digits_in_char num_in_str)
;;

let get_sum_of_digits (num: int): int = sum_list (get_digits_in_int num);;
  
let rec digital_root (n : int) : int = 
  let sum_of_digits = get_sum_of_digits n in
  if sum_of_digits < 10
  then sum_of_digits
  else digital_root sum_of_digits
;;
  
  
