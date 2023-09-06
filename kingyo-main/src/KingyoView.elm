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
                , fill "orange"
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
            , fill "orange"
            ][]
        ,Svg.path [d "m 0 -20 l -10 -10 l -10 5 z"
            , fill "orange"
            ][]
        ]
namazuView: Kingyo -> Svg Msg
namazuView kingyo =
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
                , fill "blue"
              ]
            []
        ,circle [cx "-10"
                ,cy "0"
                ,r "20"
                ,fill "blue"
                ][]
        ,circle [cx "21"
                ,cy "0"
                ,r "10"
                ,fill "pink"
                ][]
        ,circle [cx "20"
                ,cy "0"
                ,r "7"
                ,fill "pink"
                ,stroke "black"
                ][]
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
            , fill "blue"
            ][]
        ,Svg.path [d "m 0 -20 l -10 -10 l -10 5 z"
            , fill "blue"
            ][]
        ]
kaniView: Kingyo -> Svg Msg
kaniView kingyo =
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
        [ ellipse [ cx "-20"
                   ,cy "0"
                   ,rx "30"
                   ,ry "60"
                   ,fill "red"
                  ] []
        
        ,ellipse [ cx "45"
                   ,cy "55"
                   ,rx "20"
                   ,ry "10"
                   ,fill "red"
                  ] []
        ,ellipse [ cx "45"
                   ,cy "-55"
                   ,rx "20"
                   ,ry "10"
                   ,fill "red"
                  ] []
        ,line   [x1 "0"
                ,y1 "40"
                ,x2 "40"
                ,y2 "60"
                ,stroke "red"
                ,strokeWidth "10" 
                ] []
        ,line   [x1 "0"
                ,y1 "-40"
                ,x2 "40"
                ,y2 "-60"
                ,stroke "red"
                ,strokeWidth "10" 
                ] []
        ,line   [x1 "40"
                ,y1 "-55"
                ,x2 "60"
                ,y2 "-55"
                ,stroke "black"
                ,strokeWidth "1" 
                ] []
        ,line   [x1 "40"
                ,y1 "55"
                ,x2 "60"
                ,y2 "55"
                ,stroke "black"
                ,strokeWidth "1" 
                ] []
        ,line   [x1 "-40"
                ,y1 "40"
                ,x2 "-70"
                ,y2 "60"
                ,stroke "red"
                ,strokeWidth "5" 
                ] []
        ,line   [x1 "-80"
                ,y1 "40"
                ,x2 "-68"
                ,y2 "60"
                ,stroke "red"
                ,strokeWidth "5" 
                ] []
        ,line   [x1 "-40"
                ,y1 "-40"
                ,x2 "-70"
                ,y2 "-60"
                ,stroke "red"
                ,strokeWidth "5" 
                ] []
        ,line   [x1 "-80"
                ,y1 "-40"
                ,x2 "-68"
                ,y2 "-60"
                ,stroke "red"
                ,strokeWidth "5" 
                ] []
        ,line   [x1 "-40"
                ,y1 "-30"
                ,x2 "-70"
                ,y2 "-50"
                ,stroke "red"
                ,strokeWidth "5" 
                ] []
        ,line   [x1 "-80"
                ,y1 "-30"
                ,x2 "-68"
                ,y2 "-50"
                ,stroke "red"
                ,strokeWidth "5" 
                ] []
        ,line   [x1 "-30"
                ,y1 "50"
                ,x2 "-70"
                ,y2 "70"
                ,stroke "red"
                ,strokeWidth "5" 
                ] []
        ,line   [x1 "-80"
                ,y1 "50"
                ,x2 "-68"
                ,y2 "70"
                ,stroke "red"
                ,strokeWidth "5" 
                ] []
        ,line   [x1 "-30"
                ,y1 "-50"
                ,x2 "-70"
                ,y2 "-70"
                ,stroke "red"
                ,strokeWidth "5" 
                ] []
        ,line   [x1 "-80"
                ,y1 "-50"
                ,x2 "-68"
                ,y2 "-70"
                ,stroke "red"
                ,strokeWidth "5" 
                ] []
        ,line   [x1 "-30"
                ,y1 "30"
                ,x2 "-70"
                ,y2 "50"
                ,stroke "red"
                ,strokeWidth "5" 
                ] []
        ,line   [x1 "-80"
                ,y1 "30"
                ,x2 "-68"
                ,y2 "50"
                ,stroke "red"
                ,strokeWidth "5" 
                ] []
        ,line   [x1 "-30"
                ,y1 "20"
                ,x2 "-70"
                ,y2 "40"
                ,stroke "red"
                ,strokeWidth "5" 
                ] []
        ,line   [x1 "-80"
                ,y1 "20"
                ,x2 "-68"
                ,y2 "40"
                ,stroke "red"
                ,strokeWidth "5" 
                ] []
        ,line   [x1 "-30"
                ,y1 "-20"
                ,x2 "-70"
                ,y2 "-40"
                ,stroke "red"
                ,strokeWidth "5" 
                ] []
        ,line   [x1 "-80"
                ,y1 "-20"
                ,x2 "-68"
                ,y2 "-40"
                ,stroke "red"
                ,strokeWidth "5" 
                ] []
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
        ]
kameView: Kingyo -> Svg Msg
kameView kingyo =
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
        [ellipse[cx "-10"
                ,cy "0"
                ,rx "50"
                ,ry "40"
                ,fill "green"
                ][]
        ,ellipse[cx "45"
                ,cy "0"
                ,rx "20"
                ,ry "10"
                ,fill "green"
                ][]
        ,circle [cx "50"
                ,cy "8"
                ,r "7"
                ,fill "white"
                ][]
        ,circle [cx "50"
                ,cy "8"
                ,r "5"
                ,fill "black"
                ][]
        ,circle [cx "50"
                ,cy "8"
                ,r "1"
                ,fill "white"
                ][]
        ,circle [cx "50"
                ,cy "-8"
                ,r "7"
                ,fill "white"
                ][]
        ,circle [cx "50"
                ,cy "-8"
                ,r "5"
                ,fill "black"
                ][]
        ,circle [cx "50"
                ,cy "-8"
                ,r "1"
                ,fill "white"
                ][]
        ,ellipse[cx "20"
                ,cy "30"
                ,rx "10"
                ,ry "20"
                ,fill "green"
                ][]
        ,ellipse[cx "20"
                ,cy "-30"
                ,rx "10"
                ,ry "20"
                ,fill "green"
                ][]
        ,ellipse[cx "-30"
                ,cy "30"
                ,rx "10"
                ,ry "20"
                ,fill "green"
                ][]
        ,ellipse[cx "-30"
                ,cy "-30"
                ,rx "10"
                ,ry "20"
                ,fill "green"
                ][]
        ,ellipse[cx "-60"
                ,cy "0"
                ,rx "20"
                ,ry "5"
                ,fill "green"
                ][]
        ,line   [x1 "30"
                ,y1 "-20"
                ,x2 "-45"
                ,y2 "-20"
                ,stroke "black"
                ,strokeWidth "1" 
                ] []
        ,line   [x1 "30"
                ,y1 "0"
                ,x2 "-45"
                ,y2 "0"
                ,stroke "black"
                ,strokeWidth "1" 
                ] []
        ,line   [x1 "30"
                ,y1 "20"
                ,x2 "-45"
                ,y2 "20"
                ,stroke "black"
                ,strokeWidth "1" 
                ] []
        ,line   [x1 "20"
                ,y1 "-30"
                ,x2 "20"
                ,y2 "30"
                ,stroke "black"
                ,strokeWidth "1" 
                ] []
        ,line   [x1 "-10"
                ,y1 "-30"
                ,x2 "-10"
                ,y2 "30"
                ,stroke "black"
                ,strokeWidth "1" 
                ] []
        ,line   [x1 "-40"
                ,y1 "-30"
                ,x2 "-40"
                ,y2 "30"
                ,stroke "black"
                ,strokeWidth "1" 
                ] []
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