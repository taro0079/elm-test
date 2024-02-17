module Main exposing (..)

import Browser
import Html exposing (Html)
import Html exposing (button)
import Html.Events exposing (onClick)
import Html exposing (text)
import Html exposing (div)

main = Browser.sandbox { init = init, update = update, view = view }


-- Model
type alias Model = Int
init : Model
init =
    0

-- Update

type Msg
    = Increment
    | Decrement

update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            model + 1
        Decrement ->
            model - 1


-- VIEW

view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Decrement] [ text "-"]
        , div [] [ text (String.fromInt model)]
        , button [ onClick Increment] [ text "+"]
        ]


