module Web.Controller.Static where
import Web.Controller.Prelude
import Web.View.Static.Welcome
import Web.Controller.Users

instance Controller StaticController where
    action WelcomeAction = do
        redirectTo NewUserAction
