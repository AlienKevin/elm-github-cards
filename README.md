# elm-github-cards

Show cards of Github repos and users

![github cards demo](/media/github-cards-demo.png)

Also supports Medium theme:

![github cards in Medium theme](/media/medium-theme.png)

This project is based on lepture's [github-cards](https://github.com/lepture/github-cards)

# Usage
Adapt `public/index.html` and `src/Main.elm` to your Elm project.

If you encounter CORS policy restriction or GitHub API rate limits, try registering your app on GitHub following instructions [here](https://developer.github.com/v3/guides/basics-of-authentication/#implementing-persistent-authentication)
The followings are sample `client-id` and `client-secret`, you should generate your own.
```html
<meta name="gc:client-id" content="e1278ru7243sa42s">
<meta name="gc:client-secret" content="iese2834024jks82248jkwe">
```

# Customization

Data parameters:

* user: GitHub username
* repo: GitHub repository name
* width: Embed width you want, default is 400
* height: Embed height you want, default is 200
* theme: GitHub card theme, default is default
* target: If you want to open links in new tab, set it to blank
* client_id: Your app client_id, optional
* client_secret: Your app client_secret, optional

Add or modify data attributes using `Html.Attributes.attribute` in the `viewGithubCard` function:

```elm
viewGithubCard : List (Html.Attribute Msg) -> Html Msg
viewGithubCard attributes =
    Html.div
        ([ Html.Attributes.class "github-card"
        , Html.Attributes.attribute "data-width" "300"
        , Html.Attributes.attribute "data-height" ""
        , Html.Attributes.attribute "data-theme" "default"
        , Html.Attributes.attribute "data-target" "blank"
        ] ++ attributes)
        []
```

# Development
Run the example with [`elm-live`](https://github.com/wking-io/elm-live)
```
elm-live src/Main.elm --start-page public/index.html -- --output=public/elm.js
```