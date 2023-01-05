# Haskell_Translate_Project

Description:
This project is a multi-language translation application based on Haskell, Using HTTP protocol to get JSON response from http://translate.argosopentech.com/translate
API. Every translation is then saved to a text file.
Code Snippets: 
 ![1](https://user-images.githubusercontent.com/102666930/210883263-900ff0c0-3fd5-425a-ace3-25fe587c20c6.png)

Above are the used libraries.
•	Network.Wreq is used to handle HTTP protocol
•	Data.Aeson is used to handle JSON body
•	GHC.Generics is used to make data model generic
•	Control.Lens is used to access the element of class


 ![2](https://user-images.githubusercontent.com/102666930/210883297-ed4dee4f-61a5-4c5a-b9bc-349a414dbfa2.png)
Above are the data models used to handle JSON request and response body by creating an instance FromJSON and ToJSON.
 
![3](https://user-images.githubusercontent.com/102666930/210883522-32d636b9-1ea2-4722-b4c1-8116425c0cb0.png)
1.	The user is asked to enter either 1 or 2 to translate a new word or view past translations. 
2.	A post request is made using Network.Wreq, toJSON function takes Haskell string and converts it to JSON.
3.	Q is the word which is going to be translated.
Source is the word’s language.
Target is the language we want to translate to it.
Format is an optional key which takes the type of wanted element.
4.	appendFile is used to save translations to a text file.
5.	putStrLn is used to print the input word and its translation in cmd.
Application Run:
![4](https://user-images.githubusercontent.com/102666930/210883588-4b12ce98-6349-4ecc-844a-c83905640623.png)
