structure Tokens =
struct

type linenum = int

type pos = int
type region = pos * pos

datatype token =
    Teof     of region
  | Tcomma   of region 
  | Tlparen  of region 
  | Trparen  of region 
  | Tfun     of region
  | Tand     of region
  | Tif      of region
  | Tthen    of region
  | Telse    of region
  | Tlet     of region
  | Tval     of region
  | Tin      of region
  | Tend     of region
  | Tloop    of region
  | Teq      of region
  | Tne      of region
  | Tlt      of region
  | Tle      of region
  | Tgt      of region
  | Tge      of region
  | Tadd     of region
  | Tsub     of region
  | Tmul     of region
  | Tdiv     of region
  | Tmod     of region
  | Tid      of region * string
  | Tinteger of region * int

fun toString (Teof    (r1, r2)) = "eof    " ^ Int.toString r1
  | toString (Tcomma  (r1, r2)) = "comma  " ^ Int.toString r1
  | toString (Tlparen (r1, r2)) = "lparen " ^ Int.toString r1
  | toString (Trparen (r1, r2)) = "rparen " ^ Int.toString r1
  | toString (Tfun    (r1, r2)) = "fun    " ^ Int.toString r1
  | toString (Tand    (r1, r2)) = "and    " ^ Int.toString r1
  | toString (Tif     (r1, r2)) = "if     " ^ Int.toString r1
  | toString (Tthen   (r1, r2)) = "then   " ^ Int.toString r1
  | toString (Telse   (r1, r2)) = "else   " ^ Int.toString r1
  | toString (Tlet    (r1, r2)) = "let    " ^ Int.toString r1
  | toString (Tval    (r1, r2)) = "val    " ^ Int.toString r1
  | toString (Tin     (r1, r2)) = "in     " ^ Int.toString r1
  | toString (Tend    (r1, r2)) = "end    " ^ Int.toString r1
  | toString (Tloop   (r1, r2)) = "loop   " ^ Int.toString r1
  | toString (Teq     (r1, r2)) = "eq     " ^ Int.toString r1
  | toString (Tne     (r1, r2)) = "ne     " ^ Int.toString r1
  | toString (Tlt     (r1, r2)) = "lt     " ^ Int.toString r1
  | toString (Tle     (r1, r2)) = "le     " ^ Int.toString r1
  | toString (Tgt     (r1, r2)) = "gt     " ^ Int.toString r1
  | toString (Tge     (r1, r2)) = "ge     " ^ Int.toString r1
  | toString (Tadd    (r1, r2)) = "add    " ^ Int.toString r1
  | toString (Tsub    (r1, r2)) = "sub    " ^ Int.toString r1
  | toString (Tmul    (r1, r2)) = "mul    " ^ Int.toString r1
  | toString (Tdiv    (r1, r2)) = "div    " ^ Int.toString r1
  | toString (Tmod    (r1, r2)) = "mod    " ^ Int.toString r1
  | toString (Tid    ((r1, r2), v))
                                = "id     " ^ Int.toString r1 ^ " " ^ v
  | toString (Tinteger ((r1, r2), i)) 
                                = "integer" ^ Int.toString r1 
                                ^ " " ^ Int.toString i

end (* Tokens *)
