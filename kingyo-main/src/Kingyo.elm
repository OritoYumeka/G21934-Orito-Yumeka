module Kingyo exposing(..)

import Browser
import Svg exposing(..)
import Svg.Events exposing(..)
import Svg.Attributes exposing (..)
import Random
import KingyoView exposing (..)
import Types exposing (..)
import Time

main = Browser.element {init = init
                        ,update = update
                        ,view = view
                        ,subscriptions = subscriptions
                        }


pondWidth = 800
pondHeight = 800

init: () -> (Model, Cmd Msg)
init _ =
    (Model [] 0(Ami(Vec2D 500 500))
    , Random.generate KingyoGenerated (Random.list 10 randomKingyo) )


randomKingyo: Random.Generator Kingyo
randomKingyo =
    Random.map5 
        (\x y vx vy level-> Kingyo (Vec2D x y) (Vec2D vx vy)level)
        (Random.int 0 799)
        (Random.int 0 799)
        (Random.int 6 15)
        (Random.int 6 15)
        (Random.int 1 5)
kingyoStep : Kingyo -> Kingyo
kingyoStep kingyo =
    let
        newVx = if (kingyo.pos.x+kingyo.v.x > pondWidth) ||
                    (kingyo.pos.x+kingyo.v.x < 0) then
                    -kingyo.v.x
                else
                    kingyo.v.x
        newVy = if kingyo.pos.y+kingyo.v.y > pondHeight ||
                    kingyo.pos.y+kingyo.v.y < 0 then
                    -kingyo.v.y
                else
                    kingyo.v.y

        newPos = Vec2D (kingyo.pos.x + kingyo.v.x)
                        (kingyo.pos.y + kingyo.v.y)
    in
        {kingyo| pos = newPos, v = Vec2D newVx newVy}

update: Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of 
        Tick t -> --(model, Cmd.none)
            ({model | kingyos = List.map kingyoStep model.kingyos}
            , Cmd.none
            )
        KingyoGenerated newKingyos -> 
            ({model| kingyos = newKingyos++model.kingyos}
            , Cmd.none)
        StartAt(x,y)  ->  
             let
                  ami=Debug.log"" <| Ami(Vec2D (round x)(round y))
             in
             ({model |ami=ami}
             ,Cmd.none)
        MoveAt (x,y)->
              let
                  ami=Debug.log"" <| Ami(Vec2D (round x)(round y))
              in
              ({model |ami=ami}
              ,Cmd.none)
        EndAt(x,y)->
             let
                  ami=Debug.log"" <| Ami(Vec2D (round x)(round y))
             in
             ({model |ami=ami}
             ,Cmd.none)      

view: Model -> Svg Msg
view model =
    svg [width "800"
        ,height "800"]
        ([rect [width "800"
                ,height "800"
                ,fill "skyblue"
                ,stroke "black"
                ,fillOpacity "0.5"]
                []
         ,amiView model.ami
         ]++ (List.indexedMap (\i k -> if (modBy 4 i)==0 then
                                            kingyoView k
                                        else if(modBy 4 i)==1 then
                                           namazuView k
                                        else if(modBy 4 i)==2 then 
                                           kaniView k
                                           else kameView k)  model.kingyos)
        )

subscriptions: Model -> Sub Msg
subscriptions model =
    Sub.batch
        [Time.every 100 Tick]



