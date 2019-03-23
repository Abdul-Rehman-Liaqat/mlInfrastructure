import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)

import Browser
import Html exposing (Html, text, pre)
import Http


-- MAIN


main =
  Browser.element
    { init = init
    , update = update
    , subscriptions = subscriptions
    , view = view
    }



-- MODEL


type alias Model =
  { name : String,
    result: String
  }


init : () -> (Model, Cmd Msg)
init a =
  (Model "" "",Cmd.none)



-- UPDATE


type Msg
  = Name String |  Submit

update : Msg -> Model -> (Model,Cmd Msg)
update msg model =
  case msg of
    Name name ->
      ({ model | name = name },Cmd.none)
    Submit ->
      ({model | result = model.name},Cmd.none)



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none




-- VIEW


view : Model -> Html Msg
view model =
  div []
    [ viewInput "text" "Name" model.name Name
    , button [ onClick Submit ] [ text "print" ]
    , text (model.result)
    ]


viewInput : String -> String -> String -> (String -> msg) -> Html msg
viewInput t p v toMsg =
  input [ type_ t, placeholder p, value v, onInput toMsg ] []
