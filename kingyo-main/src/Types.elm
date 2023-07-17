module Types exposing (..)

import Time

type Msg = Tick Time.Posix
        |  KingyoGenerated (List Kingyo)
        | StartAt ( Float, Float )
        | MoveAt ( Float, Float )
        | EndAt ( Float, Float )
        
type alias Model = {kingyos: List Kingyo
                   ,coins: Int
                   ,ami:Ami
                   }
type alias Vec2D = {x: Int
                    ,y: Int
                    }
type alias Kingyo = {pos: Vec2D
                    ,v: Vec2D
                    ,level:Int
                    }

type alias Ami={pos : Vec2D}                    