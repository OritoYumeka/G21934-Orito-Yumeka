module KingyoView exposing (..)

import Svg exposing(..)
import Svg.Events exposing(..)
import Svg.Attributes exposing (..)
import Types exposing (..)
import Html.Events.Extra.Touch as Touch
import Html.Events.Extra.Pointer as Pointer


kingyoView: Kingyo -> Svg Msg
kingyoView kingyo =
    let
        vx = kingyo.v.x
        vy = kingyo.v.y    
        px = kingyo.pos.x
        py = kingyo.pos.y
        transtr = "(" ++ (String.fromInt kingyo.pos.x) ++ 
                    "," ++ (String.fromInt kingyo.pos.y) ++ ")"
        theta = String.fromFloat <| 
                if kingyo.v.x > 0 then
                    180/pi*(atan ((toFloat vy)/(toFloat vx)))
                else
                    180+180/pi*(atan ((toFloat vy)/(toFloat vx)))
    in
    g [transform (
                "rotate(" ++ theta ++  
                "," ++ (String.fromInt px) ++ 
                "," ++ (String.fromInt py) ++
                ")" ++
                "translate" ++ transtr
                )
                ]
        [Svg.path [d "m 0 20 l 30 -20 l -30 -20 l -60 26 l 0 -12 z"
                , fill "red"
                , stroke "red"
              ]
            []
        ,circle [cx "15"
                ,cy "10"
                ,r "10"
                ,fill "white"
                ][]
        ,circle [cx "15"
                ,cy "10"
                ,r "8"
                ,fill "black"
                ][]
        ,circle [cx "15"
                ,cy "-10"
                ,r "10"
                ,fill "white"
                ][]        
        ,circle [cx "15"
                ,cy "-10"
                ,r "8"
                ,fill "black"
                ][]
        ,circle [cx "18"
                ,cy "10"
                ,r "2"
                ,fill "white"
                ][]
        ,circle [cx "18"
                ,cy "-10"
                ,r "2"
                ,fill "white"
                ][]
        ,Svg.path [d "m 0 20 l -10 10 l -10 -5 z"
            , fill "red"
            ][]
        ,Svg.path [d "m 0 -20 l -10 -10 l -10 5 z"
            , fill "red"
            ][]
        ]
amiView :  Ami ->Svg Msg
amiView ami=
    let
         xstr=(String.fromInt ami.pos.x)
         ystr=(String.fromInt ami.pos.y)
    in
    g[transform ("translate("++xstr++","++ystr++")")
         ,Touch.onStart (StartAt << touchCoordinates)
         ,Touch.onMove (MoveAt << touchCoordinates)
         ,Touch.onEnd (EndAt << touchCoordinates)
         ]
    [circle [cx "0"
            ,cy "0"
            ,r "50"
            ,fill "#afa"
            ][]
    ]

touchCoordinates : Touch.Event -> ( Float, Float )
touchCoordinates touchEvent =
    List.head touchEvent.changedTouches
        |> Maybe.map .clientPos
        |> Maybe.withDefault ( 0, 0 )