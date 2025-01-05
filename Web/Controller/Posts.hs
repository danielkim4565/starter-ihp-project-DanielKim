module Web.Controller.Posts where
import Web.Controller.Prelude
import Web.View.Posts.Index
import Web.View.Posts.New
import Web.View.Posts.Edit
import Web.View.Posts.Show
import Web.View.Static.Welcome
import qualified Data.UUID as UUID
import Data.Vector.Generic.New (New)

instance Controller PostsController where
    action PostsAction = do
        posts <- query @Post
            |> orderByDesc #upVote 
            |> fetch
        render IndexView { .. }

    action NewPostAction = do
        userId :: Maybe (Id User) <- getSession @(Id User) "userId"
        case userId of
            Just uid -> do
                let post = newRecord @Post
                let postWithBody = post |> set #userId uid
                render NewView { post = postWithBody, .. }
            Nothing -> redirectTo NewUserAction

    action ShowPostAction { postId } = do
        post <- fetch postId
            >>= fetchRelated #comments
        render ShowView { .. }

    action EditPostAction { postId } = do
        post <- fetch postId
        render EditView { .. }

    action UpdatePostAction { postId } = do
        post <- fetch postId
        post
            |> buildPost
            |> ifValid \case
                Left post -> render EditView { .. }
                Right post -> do
                    post <- post |> updateRecord
                    setSuccessMessage "Post updated"
                    redirectTo EditPostAction { .. }

    action CreatePostAction = do
        let post = newRecord @Post
                -- |> set #userId userId
        post
            |> buildPost
            |> ifValid \case
                Left post -> render NewView { .. }
                Right post -> do
                    post <- post |> createRecord
                    setSuccessMessage "Post created"
                    redirectTo ShowPostAction { postId = get #id post }

    action DeletePostAction { postId } = do
        post <- fetch postId
        deleteRecord post
        setSuccessMessage "Post deleted"
        redirectTo PostsAction

    action UpVoteAction { postId } = do
        post <- fetch postId
        post 
            |> set #upVote (get #upVote post + 1) 
            |> updateRecord 
        redirectTo PostsAction

    action DownVoteAction { postId } = do
        post <- fetch postId
        post 
            |> set #downVote (get #downVote post + 1) 
            |> updateRecord 
        redirectTo PostsAction

buildPost post = post
    |> fill @'["userId", "title", "body", "createdAt", "updatedAt", "upVote", "downVote"]
    |> validateField #title nonEmpty
