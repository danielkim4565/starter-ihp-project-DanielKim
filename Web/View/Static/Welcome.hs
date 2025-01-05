module Web.View.Static.Welcome where
import Web.View.Prelude
import Data.Primitive.Contiguous (Contiguous(clone))
import Web.Controller.Users

data WelcomeView = WelcomeView{ posts :: [Post] }

instance View WelcomeView where
    html WelcomeView { .. } = [hsx|
        <form method="POST" action={CreateUserAction}>
            <label for="username">Enter your username:</label>
            <input type="text" id="username" name="username" placeholder="Username" required>
            <button type="submit">Submit</button>
        </form>
    |]
    
-- renderPost :: Post -> Html
-- renderPost post = [hsx|
--     <tr>
--         <td>
--             <h3>
--                 <a href={ShowPostAction post.id}>{post.title}</a>
--             </h3>
--             <p>
--                 {post.body}
--             </p>
--             <footer>
--                 <form method="POST" action={UpVoteAction post.id} style="display: inline;">
--                     <button class="btn" type="submit">↑ </button> 
--                     <span>{post.upVote}</span>
--                 </form>
--                 <button class="btn" onclick={downVoteAction post.id}>↓</button>
--                 <span>{post.downVote}</span>
--             </footer>
--         </td>
--     </tr>
-- |]

-- upVoteAction postID = UpVoteAction postID
-- downVoteAction id = id