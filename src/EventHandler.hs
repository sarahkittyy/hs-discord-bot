module EventHandler where
    
import Discord
import Discord.Types
import qualified Discord.Requests as R
import Data.Text (unpack, pack, Text)
import Control.Monad (when)

isBot :: Message -> Bool
isBot = userIsBot . messageAuthor

handleEvents :: DiscordHandle -> Event -> IO ()
handleEvents dis event = do
                            case event of
                                MessageCreate msg -> when (not $ isBot msg) $ do
                                    restCall dis $ R.CreateMessage (messageChannel msg) $ pack "hewwo!"
                                    return ()
                            return ()