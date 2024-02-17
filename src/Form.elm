module Form exposing (..)
import Browser
import Html exposing (div)
import Html.Attributes exposing (placeholder)
import Html.Events exposing (onInput)
import Html exposing (input)
import Html.Attributes exposing (type_)
import Html.Attributes exposing (value)
import Html exposing (Html)
import Html.Attributes exposing (style)
import Html exposing (text)

-- Main

main =
    Browser.sandbox { init = init, update = update, view = view }



type alias Model =
    { name : String
    , password : String
    , passwordAgain : String
    }

init : Model

init =
    Model "" "" ""


-- Update

type Msg
    = Name String
    | Password String
    | PasswordAgain String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Name name ->
            { model | name = name }

        Password password ->
            { model | password = password }

        PasswordAgain passwordAgain ->
            { model | passwordAgain = passwordAgain }


-- view

view : Model -> Html Msg

view model =
    div []
    [ viewInput "text" "Name" model.name Name
    , viewInput "password" "Password" model.password Password
    , viewInput "Password" "Re-enter Password" model.passwordAgain PasswordAgain
    , viewValidation model
    ]

viewInput : String -> String -> String -> (String -> msg) -> Html msg
viewInput t p v toMsg =
    input [ type_ t, placeholder p, value v, onInput toMsg] []


viewValidation : Model -> Html Msg
viewValidation model =
    if model.password == model.passwordAgain then
        div [ style "color" "green" ] [ text "OK" ]
    else
        div [ style "color" "red" ] [ text "passwords do not match !"]

