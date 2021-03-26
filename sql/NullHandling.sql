-- Description: https://www.codewars.com/kata/5811315e04adbbdb5000050e/sql

SELECT id, 
  coalesce(nullif(name, ''), '[product name not found]') as name, 
  price, 
  coalesce(nullif(card_name, ''), '[card name not found]') as card_name, 
  card_number, 
  transaction_date
FROM eusales
WHERE price > 50;
