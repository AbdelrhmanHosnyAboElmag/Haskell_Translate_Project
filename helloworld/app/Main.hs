{-#LANGUAGE DeriveGeneric #-}

module Main (main) where

import Network.Wreq
import Data.Aeson
import GHC.Generics
import Control.Lens
import System.IO




data TranslateRequest = TranslateRequest {
    q :: String,
    source :: String,
    target :: String,
    format :: String
} deriving (Generic, Show)

instance ToJSON TranslateRequest

data TranslateResponse = TranslateResponse {
    translatedText :: String
} deriving (Generic, Show)

instance FromJSON TranslateResponse



main :: IO ()
main = do 
    print ("press 1 to search new word or press 2 to see history")
    choose_value <- getLine
    if choose_value == "1"
     then do 
     print ("enter word")
     input_value <- getLine
     print ("loading....")
     rsp<- asJSON =<< post "http://translate.argosopentech.com/translate" (toJSON(TranslateRequest{
     q = input_value,
     source = "en",
     target = "tr",
     format = "text"
     }))
     appendFile "database.txt" (mconcat [input_value++">>>"++translatedText (rsp ^. responseBody)])
     appendFile "database.txt" ("  ")
     putStrLn (input_value++">>>"++translatedText (rsp ^. responseBody ))
    else do  
        s<-readFile "database.txt"
        putStrLn s 


   

 
    
