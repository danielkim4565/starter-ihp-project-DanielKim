module Web.View.Posts.Index where
import Web.View.Prelude

data IndexView = IndexView { posts :: [Post] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        {breadcrumb}

        <h1>Poster.com<a href={pathTo NewPostAction} class="btn btn-primary ms-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach posts renderPost}</tbody>
            </table>
            
        </div>
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "Posts" PostsAction
                ]

renderPost :: Post -> Html
renderPost post = [hsx|
    <tr>
        <td>
            <h3>
                <a href={ShowPostAction post.id}>{post.title}</a>
            </h3>
            <p>
                {post.body}
            </p>
            <footer>
                <form method="POST" action={UpVoteAction post.id} style="display: inline;">
                    <button class="btn" type="submit">↑ </button> 
                    <span>{post.upVote}</span>
                </form>
                <form method="POST" action={DownVoteAction post.id} style="display: inline;">
                    <button class="btn" type="submit">↓ </button> 
                    <span>{post.downVote}</span>
                </form>
            </footer>
        </td>
    </tr>
|]