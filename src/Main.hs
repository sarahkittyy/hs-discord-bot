module Main where

import Discord
import Discord.Types
import EventHandler
import System.IO (readFile)
import Data.Text (Text, pack, unpack)

getToken :: IO Text
getToken = (pure . pack . head . lines) =<< readFile "private/key"

respondBot :: IO ()
respondBot = do 
                token <- getToken
                resultingError <- runDiscord $ def
                                            { discordToken = token
                                            , discordOnEvent = handleEvents }
                putStrLn $ unpack resultingError
     
main :: IO ()
main = respondBot