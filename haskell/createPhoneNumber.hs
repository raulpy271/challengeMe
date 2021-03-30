module CreatePhoneNumber where


type CodeWith3Digits =  (Char, Char, Char)
type CodeWith4Digits =  (Char, Char, Char, Char)


data Phone = Phone 
  { countryCode            :: CodeWith3Digits 
  , prefixSubscriberNumber :: CodeWith3Digits 
  , subscriberNumber       :: CodeWith4Digits
  }
  

createPhoneNumber :: [Int] -> String
createPhoneNumber = show . createPhoneNumberData 


instance Show Phone where
  show phone  =  "(" ++ countryCode ++ ") " 
    ++ prefixSubscriber ++ "-" ++ subscriberNumber
    where
      show3Code (c1, c2, c3) = [c1, c2, c3]  
      show4Code (c1, c2, c3, c4) = [c1, c2, c3, c4]
      countryCode      = show3Code $ getCountryCode      phone
      prefixSubscriber = show3Code $ getSubscriberPrefix phone
      subscriberNumber = show4Code $ getSubscriber       phone
    

createPhoneNumberData :: [Int] -> Phone
createPhoneNumberData 
  [ digit1, digit2, digit3, digit4, digit5
  , digit6, digit7, digit8, digit9, digit10
  ]  = Phone 
    { countryCode = countryCode
    , prefixSubscriberNumber = prefixSubscriberNumber 
    , subscriberNumber = subscriberNumber
    }
  where
    countryCode = read3digits [digit1, digit2, digit3]
    prefixSubscriberNumber = read3digits [digit4 , digit5 , digit6]
    subscriberNumber = read4digits [digit7, digit8, digit9, digit10]
    
    
read3digits :: [Int] ->  CodeWith3Digits 
read3digits list = (c1, c2, c3)
  where c1:c2:c3:[] = map intToChar list 


read4digits :: [Int] ->  CodeWith4Digits 
read4digits list = (c1, c2, c3, c4)
  where c1:c2:c3:c4:[] = map intToChar list 


intToChar :: Int -> Char
intToChar int = (show int) !! 0 


getCountryCode :: Phone -> CodeWith3Digits 
getCountryCode (Phone countryCode _ _) = countryCode 


getSubscriberPrefix :: Phone -> CodeWith3Digits 
getSubscriberPrefix (Phone _ prefix _ ) = prefix


getSubscriber :: Phone -> CodeWith4Digits 
getSubscriber (Phone _ _ subscriber) = subscriber
  
  
