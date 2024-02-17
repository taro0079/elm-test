module TextField exposing (..)
import Html exposing (Html)
import Html exposing (input)
import Html.Attributes exposing (placeholder)
import Html.Events exposing (onInput)
import Html exposing (text)
import Html exposing (div)
import Html.Attributes exposing (value)
import Browser

main =
    Browser.sandbox { init = init, update = update, view = view }


-- MODEL
type alias Model =
    { content : String }

init : Model
init =
    { content = "" }


-- UPDATE

type Msg
    = Change String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Change newContent ->
            { model | content = newContent }


-- VIEW

view : Model -> Html Msg
view model =
    div []
    [ input [ placeholder "Text to reverse", value model.content, onInput Change] []
    , div [] [text ( model.content)]
    , div [] [text (String.fromInt (String.length model.content))]

    ]
