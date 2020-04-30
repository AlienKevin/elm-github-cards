port module Main exposing (main)

import Browser
import Html exposing (Html, div, text, h1, h2)
import Html.Attributes


port renderGithubCards : () -> Cmd msg


type alias Model =
    {}


init : () -> ( Model, Cmd Msg )
init _ =
    ( {}
    , renderGithubCards ()
    )


type Msg
    = DoNothing


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model
    , Cmd.none
    )


view : Model -> Html Msg
view model =
    div
        [ Html.Attributes.style "font-family" "sans-serif"
        , Html.Attributes.style "margin" "20px"
        ]
        [ h1 [] [ text "Github Cards in Elm"]
        , h2 [] [ text "Github Repo" ]
        , viewRepoGithubCard "AlienKevin" "elm-github-cards"
        , h2 [] [ text "Github User" ]
        , viewUserGithubCard "AlienKevin"
        ]


viewRepoGithubCard : String -> String -> Html Msg
viewRepoGithubCard userName repoName =
    viewGithubCard
      [ Html.Attributes.attribute "data-user" userName
      , Html.Attributes.attribute "data-repo" repoName
      ]


viewUserGithubCard : String -> Html Msg
viewUserGithubCard userName =
    viewGithubCard
      [ Html.Attributes.attribute "data-user" userName
      ]


viewGithubCard : List (Html.Attribute Msg) -> Html Msg
viewGithubCard attributes =
    Html.div
        ([ Html.Attributes.class "github-card"
        , Html.Attributes.attribute "data-width" "400"
        , Html.Attributes.attribute "data-height" ""
        , Html.Attributes.attribute "data-theme" "default"
        , Html.Attributes.attribute "data-target" "blank"
        ] ++ attributes)
        []


subscriptions : Model -> Sub msg
subscriptions _ =
    Sub.none


main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
