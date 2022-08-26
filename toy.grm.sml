functor ToyLrValsFun(structure Token : TOKEN)
 : sig structure ParserData : PARSER_DATA
       structure Tokens : Toy_TOKENS
   end
 = 
struct
structure ParserData=
struct
structure Header = 
struct
structure A = Ast


end
structure LrTable = Token.LrTable
structure Token = Token
local open LrTable in 
val table=let val actionRows =
"\
\\001\000\001\000\000\000\000\000\
\\001\000\001\000\108\000\002\000\108\000\004\000\108\000\006\000\108\000\
\\008\000\108\000\009\000\108\000\011\000\108\000\012\000\108\000\
\\013\000\108\000\021\000\030\000\022\000\029\000\023\000\028\000\
\\024\000\027\000\025\000\026\000\027\000\108\000\028\000\108\000\000\000\
\\001\000\001\000\109\000\002\000\109\000\004\000\109\000\006\000\109\000\
\\008\000\109\000\009\000\109\000\011\000\109\000\012\000\109\000\
\\013\000\109\000\021\000\030\000\022\000\029\000\023\000\028\000\
\\024\000\027\000\025\000\026\000\027\000\109\000\028\000\109\000\000\000\
\\001\000\001\000\110\000\002\000\110\000\004\000\110\000\006\000\110\000\
\\008\000\110\000\009\000\110\000\011\000\110\000\012\000\110\000\
\\013\000\110\000\021\000\030\000\022\000\029\000\023\000\028\000\
\\024\000\027\000\025\000\026\000\027\000\110\000\028\000\110\000\000\000\
\\001\000\001\000\111\000\002\000\111\000\004\000\111\000\006\000\111\000\
\\008\000\111\000\009\000\111\000\011\000\111\000\012\000\111\000\
\\013\000\111\000\021\000\030\000\022\000\029\000\023\000\028\000\
\\024\000\027\000\025\000\026\000\027\000\111\000\028\000\111\000\000\000\
\\001\000\001\000\112\000\002\000\112\000\004\000\112\000\006\000\112\000\
\\008\000\112\000\009\000\112\000\011\000\112\000\012\000\112\000\
\\013\000\112\000\021\000\030\000\022\000\029\000\023\000\028\000\
\\024\000\027\000\025\000\026\000\027\000\112\000\028\000\112\000\000\000\
\\001\000\001\000\113\000\002\000\113\000\004\000\113\000\006\000\113\000\
\\008\000\113\000\009\000\113\000\011\000\113\000\012\000\113\000\
\\013\000\113\000\021\000\030\000\022\000\029\000\023\000\028\000\
\\024\000\027\000\025\000\026\000\027\000\113\000\028\000\113\000\000\000\
\\001\000\002\000\073\000\004\000\070\000\015\000\036\000\016\000\035\000\
\\017\000\034\000\018\000\033\000\019\000\032\000\020\000\031\000\
\\021\000\030\000\022\000\029\000\023\000\028\000\024\000\027\000\
\\025\000\026\000\027\000\025\000\028\000\024\000\000\000\
\\001\000\003\000\009\000\029\000\008\000\000\000\
\\001\000\003\000\020\000\007\000\019\000\010\000\018\000\014\000\017\000\
\\026\000\016\000\029\000\015\000\030\000\014\000\000\000\
\\001\000\004\000\048\000\000\000\
\\001\000\004\000\070\000\015\000\036\000\016\000\035\000\017\000\034\000\
\\018\000\033\000\019\000\032\000\020\000\031\000\021\000\030\000\
\\022\000\029\000\023\000\028\000\024\000\027\000\025\000\026\000\
\\027\000\025\000\028\000\024\000\000\000\
\\001\000\004\000\078\000\000\000\
\\001\000\005\000\003\000\000\000\
\\001\000\008\000\069\000\015\000\036\000\016\000\035\000\017\000\034\000\
\\018\000\033\000\019\000\032\000\020\000\031\000\021\000\030\000\
\\022\000\029\000\023\000\028\000\024\000\027\000\025\000\026\000\
\\027\000\025\000\028\000\024\000\000\000\
\\001\000\009\000\083\000\015\000\036\000\016\000\035\000\017\000\034\000\
\\018\000\033\000\019\000\032\000\020\000\031\000\021\000\030\000\
\\022\000\029\000\023\000\028\000\024\000\027\000\025\000\026\000\
\\027\000\025\000\028\000\024\000\000\000\
\\001\000\012\000\067\000\000\000\
\\001\000\012\000\074\000\000\000\
\\001\000\013\000\081\000\015\000\036\000\016\000\035\000\017\000\034\000\
\\018\000\033\000\019\000\032\000\020\000\031\000\021\000\030\000\
\\022\000\029\000\023\000\028\000\024\000\027\000\025\000\026\000\
\\027\000\025\000\028\000\024\000\000\000\
\\001\000\013\000\085\000\015\000\036\000\016\000\035\000\017\000\034\000\
\\018\000\033\000\019\000\032\000\020\000\031\000\021\000\030\000\
\\022\000\029\000\023\000\028\000\024\000\027\000\025\000\026\000\
\\027\000\025\000\028\000\024\000\000\000\
\\001\000\015\000\010\000\000\000\
\\001\000\015\000\076\000\000\000\
\\001\000\029\000\005\000\000\000\
\\001\000\029\000\008\000\000\000\
\\001\000\029\000\042\000\000\000\
\\001\000\029\000\068\000\000\000\
\\088\000\000\000\
\\089\000\000\000\
\\090\000\000\000\
\\091\000\006\000\037\000\015\000\036\000\016\000\035\000\017\000\034\000\
\\018\000\033\000\019\000\032\000\020\000\031\000\021\000\030\000\
\\022\000\029\000\023\000\028\000\024\000\027\000\025\000\026\000\
\\027\000\025\000\028\000\024\000\000\000\
\\092\000\000\000\
\\093\000\000\000\
\\094\000\000\000\
\\095\000\002\000\022\000\000\000\
\\096\000\000\000\
\\097\000\000\000\
\\098\000\003\000\040\000\007\000\019\000\010\000\018\000\014\000\017\000\
\\029\000\015\000\030\000\014\000\000\000\
\\099\000\000\000\
\\100\000\000\000\
\\101\000\015\000\036\000\016\000\035\000\017\000\034\000\018\000\033\000\
\\019\000\032\000\020\000\031\000\021\000\030\000\022\000\029\000\
\\023\000\028\000\024\000\027\000\025\000\026\000\027\000\025\000\
\\028\000\024\000\000\000\
\\102\000\000\000\
\\103\000\000\000\
\\104\000\000\000\
\\105\000\015\000\036\000\016\000\035\000\017\000\034\000\018\000\033\000\
\\019\000\032\000\020\000\031\000\021\000\030\000\022\000\029\000\
\\023\000\028\000\024\000\027\000\025\000\026\000\027\000\025\000\000\000\
\\106\000\015\000\036\000\016\000\035\000\017\000\034\000\018\000\033\000\
\\019\000\032\000\020\000\031\000\021\000\030\000\022\000\029\000\
\\023\000\028\000\024\000\027\000\025\000\026\000\000\000\
\\107\000\015\000\036\000\016\000\035\000\017\000\034\000\018\000\033\000\
\\019\000\032\000\020\000\031\000\021\000\030\000\022\000\029\000\
\\023\000\028\000\024\000\027\000\025\000\026\000\000\000\
\\114\000\023\000\028\000\024\000\027\000\025\000\026\000\000\000\
\\115\000\023\000\028\000\024\000\027\000\025\000\026\000\000\000\
\\116\000\000\000\
\\117\000\000\000\
\\118\000\000\000\
\\119\000\000\000\
\\120\000\000\000\
\\121\000\000\000\
\\122\000\002\000\073\000\015\000\036\000\016\000\035\000\017\000\034\000\
\\018\000\033\000\019\000\032\000\020\000\031\000\021\000\030\000\
\\022\000\029\000\023\000\028\000\024\000\027\000\025\000\026\000\
\\027\000\025\000\028\000\024\000\000\000\
\\123\000\000\000\
\\124\000\011\000\045\000\000\000\
\\125\000\015\000\036\000\016\000\035\000\017\000\034\000\018\000\033\000\
\\019\000\032\000\020\000\031\000\021\000\030\000\022\000\029\000\
\\023\000\028\000\024\000\027\000\025\000\026\000\027\000\025\000\
\\028\000\024\000\000\000\
\"
val actionRowNumbers =
"\013\000\022\000\026\000\008\000\
\\030\000\020\000\034\000\023\000\
\\009\000\033\000\029\000\042\000\
\\035\000\036\000\009\000\024\000\
\\056\000\009\000\009\000\010\000\
\\023\000\027\000\009\000\009\000\
\\009\000\009\000\009\000\009\000\
\\009\000\009\000\009\000\009\000\
\\009\000\009\000\009\000\022\000\
\\037\000\051\000\009\000\045\000\
\\056\000\056\000\016\000\025\000\
\\014\000\011\000\031\000\033\000\
\\043\000\044\000\050\000\049\000\
\\048\000\047\000\046\000\006\000\
\\005\000\004\000\003\000\002\000\
\\001\000\028\000\007\000\017\000\
\\055\000\009\000\021\000\009\000\
\\038\000\032\000\012\000\009\000\
\\009\000\018\000\009\000\015\000\
\\052\000\054\000\019\000\040\000\
\\057\000\009\000\053\000\041\000\
\\039\000\000\000"
val gotoT =
"\
\\001\000\085\000\000\000\
\\002\000\002\000\000\000\
\\000\000\
\\004\000\005\000\006\000\004\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\006\000\009\000\000\000\
\\007\000\011\000\008\000\010\000\000\000\
\\005\000\019\000\000\000\
\\003\000\021\000\000\000\
\\000\000\
\\000\000\
\\007\000\037\000\009\000\036\000\000\000\
\\007\000\011\000\008\000\039\000\000\000\
\\000\000\
\\011\000\042\000\012\000\041\000\000\000\
\\007\000\011\000\008\000\044\000\000\000\
\\007\000\011\000\008\000\045\000\000\000\
\\000\000\
\\006\000\047\000\000\000\
\\000\000\
\\007\000\011\000\008\000\048\000\000\000\
\\007\000\011\000\008\000\049\000\000\000\
\\007\000\011\000\008\000\050\000\000\000\
\\007\000\011\000\008\000\051\000\000\000\
\\007\000\011\000\008\000\052\000\000\000\
\\007\000\011\000\008\000\053\000\000\000\
\\007\000\011\000\008\000\054\000\000\000\
\\007\000\011\000\008\000\055\000\000\000\
\\007\000\011\000\008\000\056\000\000\000\
\\007\000\011\000\008\000\057\000\000\000\
\\007\000\011\000\008\000\058\000\000\000\
\\007\000\011\000\008\000\059\000\000\000\
\\007\000\011\000\008\000\060\000\000\000\
\\002\000\061\000\000\000\
\\000\000\
\\000\000\
\\007\000\011\000\008\000\062\000\000\000\
\\000\000\
\\011\000\063\000\012\000\041\000\000\000\
\\011\000\064\000\012\000\041\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\005\000\069\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\010\000\070\000\000\000\
\\000\000\
\\000\000\
\\007\000\011\000\008\000\073\000\000\000\
\\000\000\
\\007\000\011\000\008\000\075\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\007\000\011\000\008\000\077\000\000\000\
\\007\000\011\000\008\000\078\000\000\000\
\\000\000\
\\007\000\011\000\008\000\080\000\000\000\
\\000\000\
\\000\000\
\\010\000\082\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\007\000\011\000\008\000\084\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\"
val numstates = 86
val numrules = 38
val s = ref "" and index = ref 0
val string_to_int = fn () => 
let val i = !index
in index := i+2; Char.ord(String.sub(!s,i)) + Char.ord(String.sub(!s,i+1)) * 256
end
val string_to_list = fn s' =>
    let val len = String.size s'
        fun f () =
           if !index < len then string_to_int() :: f()
           else nil
   in index := 0; s := s'; f ()
   end
val string_to_pairlist = fn (conv_key,conv_entry) =>
     let fun f () =
         case string_to_int()
         of 0 => EMPTY
          | n => PAIR(conv_key (n-1),conv_entry (string_to_int()),f())
     in f
     end
val string_to_pairlist_default = fn (conv_key,conv_entry) =>
    let val conv_row = string_to_pairlist(conv_key,conv_entry)
    in fn () =>
       let val default = conv_entry(string_to_int())
           val row = conv_row()
       in (row,default)
       end
   end
val string_to_table = fn (convert_row,s') =>
    let val len = String.size s'
        fun f ()=
           if !index < len then convert_row() :: f()
           else nil
     in (s := s'; index := 0; f ())
     end
local
  val memo = Array.array(numstates+numrules,ERROR)
  val _ =let fun g i=(Array.update(memo,i,REDUCE(i-numstates)); g(i+1))
       fun f i =
            if i=numstates then g i
            else (Array.update(memo,i,SHIFT (STATE i)); f (i+1))
          in f 0 handle Subscript => ()
          end
in
val entry_to_action = fn 0 => ACCEPT | 1 => ERROR | j => Array.sub(memo,(j-2))
end
val gotoT=Array.fromList(string_to_table(string_to_pairlist(NT,STATE),gotoT))
val actionRows=string_to_table(string_to_pairlist_default(T,entry_to_action),actionRows)
val actionRowNumbers = string_to_list actionRowNumbers
val actionT = let val actionRowLookUp=
let val a=Array.fromList(actionRows) in fn i=>Array.sub(a,i) end
in Array.fromList(map actionRowLookUp actionRowNumbers)
end
in LrTable.mkLrTable {actions=actionT,gotos=gotoT,numRules=numrules,
numStates=numstates,initialState=STATE 0}
end
end
local open Header in
type pos = int
type arg = unit
structure MlyValue = 
struct
datatype svalue = VOID | ntVOID of unit ->  unit
 | Tinteger of unit ->  (int) | Tid of unit ->  (string)
 | decl of unit ->  (Stuff.x*A.e)
 | decls of unit ->  ( ( Stuff.x * A.e )  list)
 | rest_args of unit ->  (A.e list) | args of unit ->  (A.e list)
 | exp of unit ->  (A.e) | primary of unit ->  (A.e)
 | param of unit ->  (Stuff.x)
 | rest_params of unit ->  (Stuff.x list)
 | params of unit ->  (Stuff.x list)
 | mutuals of unit ->  ( ( Stuff.l * A.p )  list)
 | procdecl of unit ->  ( ( Stuff.l * A.p )  list)
 | program of unit ->  ( ( Stuff.l * A.p )  list)
end
type svalue = MlyValue.svalue
type result =  ( Stuff.l * A.p )  list
end
structure EC=
struct
open LrTable
val is_keyword =
fn (T 4) => true | (T 5) => true | (T 6) => true | (T 7) => true | (T 
8) => true | (T 9) => true | (T 10) => true | (T 11) => true | (T 12)
 => true | (T 13) => true | (T 25) => true | (T 26) => true | (T 27)
 => true | _ => false
val preferred_change = 
(nil
,(T 7) :: nil
)::
(nil
,(T 8) :: nil
)::
(nil
,(T 2) :: nil
)::
nil
val noShift = 
fn (T 0) => true | _ => false
val showTerminal =
fn (T 0) => "Teof"
  | (T 1) => "Tcomma"
  | (T 2) => "Tlparen"
  | (T 3) => "Trparen"
  | (T 4) => "Tfun"
  | (T 5) => "Tand"
  | (T 6) => "Tif"
  | (T 7) => "Tthen"
  | (T 8) => "Telse"
  | (T 9) => "Tlet"
  | (T 10) => "Tval"
  | (T 11) => "Tin"
  | (T 12) => "Tend"
  | (T 13) => "Tloop"
  | (T 14) => "Teq"
  | (T 15) => "Tne"
  | (T 16) => "Tlt"
  | (T 17) => "Tle"
  | (T 18) => "Tgt"
  | (T 19) => "Tge"
  | (T 20) => "Tadd"
  | (T 21) => "Tsub"
  | (T 22) => "Tmul"
  | (T 23) => "Tdiv"
  | (T 24) => "Tmod"
  | (T 25) => "Tnot"
  | (T 26) => "Tandalso"
  | (T 27) => "Torelse"
  | (T 28) => "Tid"
  | (T 29) => "Tinteger"
  | _ => "bogus-term"
local open Header in
val errtermvalue=
fn (T 28) => MlyValue.Tid(fn () => ("bogus")) | 
(T 29) => MlyValue.Tinteger(fn () => (666)) | 
_ => MlyValue.VOID
end
val terms = (T 0) :: (T 1) :: (T 2) :: (T 3) :: (T 4) :: (T 5) :: (T 6
) :: (T 7) :: (T 8) :: (T 9) :: (T 10) :: (T 11) :: (T 12) :: (T 13)
 :: (T 14) :: (T 15) :: (T 16) :: (T 17) :: (T 18) :: (T 19) :: (T 20)
 :: (T 21) :: (T 22) :: (T 23) :: (T 24) :: (T 25) :: (T 26) :: (T 27)
 :: nil
end
structure Actions =
struct 
exception mlyAction of int
local open Header in
val actions = 
fn (i392,defaultPos,stack,
    (()):arg) =>
case (i392,stack)
of (0,(_,(MlyValue.procdecl procdecl1,_,procdecl1right))::(_,(_,
Tfun1left,_))::rest671) => let val result=MlyValue.program(fn _ => 
let val procdecl as procdecl1=procdecl1 ()
 in (procdecl) end
)
 in (LrTable.NT 0,(result,Tfun1left,procdecl1right),rest671) end
| (1,(_,(MlyValue.mutuals mutuals1,_,mutuals1right))::(_,(MlyValue.exp
 exp1,_,_))::_::(_,(MlyValue.params params1,_,_))::(_,(MlyValue.Tid 
Tid1,Tid1left,_))::rest671) => let val result=MlyValue.procdecl(fn _
 => let val Tid as Tid1=Tid1 ()
val params as params1=params1 ()
val exp as exp1=exp1 ()
val mutuals as mutuals1=mutuals1 ()
 in ((Stuff.L Tid, A.Lambda (params, exp)) :: mutuals) end
)
 in (LrTable.NT 1,(result,Tid1left,mutuals1right),rest671) end
| (2,(_,(MlyValue.procdecl procdecl1,_,procdecl1right))::(_,(_,
Tand1left,_))::rest671) => let val result=MlyValue.mutuals(fn _ => 
let val procdecl as procdecl1=procdecl1 ()
 in (procdecl) end
)
 in (LrTable.NT 2,(result,Tand1left,procdecl1right),rest671) end
| (3,rest671) => let val result=MlyValue.mutuals(fn _ => ([]))
 in (LrTable.NT 2,(result,defaultPos,defaultPos),rest671) end
| (4,(_,(MlyValue.param param1,param1left,param1right))::rest671) => 
let val result=MlyValue.params(fn _ => let val param as param1=param1 
()
 in ([param]) end
)
 in (LrTable.NT 3,(result,param1left,param1right),rest671) end
| (5,(_,(_,_,Trparen1right))::(_,(MlyValue.rest_params rest_params1,_,
_))::(_,(MlyValue.param param1,_,_))::(_,(_,Tlparen1left,_))::rest671)
 => let val result=MlyValue.params(fn _ => let val param as param1=
param1 ()
val rest_params as rest_params1=rest_params1 ()
 in (param :: rest_params) end
)
 in (LrTable.NT 3,(result,Tlparen1left,Trparen1right),rest671) end
| (6,(_,(MlyValue.rest_params rest_params1,_,rest_params1right))::(_,(
MlyValue.param param1,_,_))::(_,(_,Tcomma1left,_))::rest671) => let 
val result=MlyValue.rest_params(fn _ => let val param as param1=param1
 ()
val rest_params as rest_params1=rest_params1 ()
 in (param :: rest_params) end
)
 in (LrTable.NT 4,(result,Tcomma1left,rest_params1right),rest671) end
| (7,rest671) => let val result=MlyValue.rest_params(fn _ => ([]))
 in (LrTable.NT 4,(result,defaultPos,defaultPos),rest671) end
| (8,(_,(MlyValue.Tid Tid1,Tid1left,Tid1right))::rest671) => let val 
result=MlyValue.param(fn _ => let val Tid as Tid1=Tid1 ()
 in (Stuff.V Tid) end
)
 in (LrTable.NT 5,(result,Tid1left,Tid1right),rest671) end
| (9,(_,(MlyValue.Tinteger Tinteger1,Tinteger1left,Tinteger1right))::
rest671) => let val result=MlyValue.primary(fn _ => let val Tinteger
 as Tinteger1=Tinteger1 ()
 in (A.Int Tinteger) end
)
 in (LrTable.NT 6,(result,Tinteger1left,Tinteger1right),rest671) end
| (10,(_,(MlyValue.Tid Tid1,Tid1left,Tid1right))::rest671) => let val 
result=MlyValue.primary(fn _ => let val Tid as Tid1=Tid1 ()
 in (A.Var (Stuff.V Tid)) end
)
 in (LrTable.NT 6,(result,Tid1left,Tid1right),rest671) end
| (11,(_,(MlyValue.args args1,_,args1right))::(_,(MlyValue.Tid Tid1,
Tid1left,_))::rest671) => let val result=MlyValue.primary(fn _ => let 
val Tid as Tid1=Tid1 ()
val args as args1=args1 ()
 in (A.App (Stuff.L Tid, args)) end
)
 in (LrTable.NT 6,(result,Tid1left,args1right),rest671) end
| (12,(_,(_,_,Trparen1right))::(_,(MlyValue.exp exp1,_,_))::(_,(_,
Tlparen1left,_))::rest671) => let val result=MlyValue.primary(fn _ => 
let val exp as exp1=exp1 ()
 in (exp) end
)
 in (LrTable.NT 6,(result,Tlparen1left,Trparen1right),rest671) end
| (13,(_,(MlyValue.exp exp3,_,exp3right))::_::(_,(MlyValue.exp exp2,_,
_))::_::(_,(MlyValue.exp exp1,_,_))::(_,(_,Tif1left,_))::rest671) => 
let val result=MlyValue.primary(fn _ => let val exp1=exp1 ()
val exp2=exp2 ()
val exp3=exp3 ()
 in (A.If (exp1, exp2, exp3)) end
)
 in (LrTable.NT 6,(result,Tif1left,exp3right),rest671) end
| (14,(_,(_,_,Tend1right))::(_,(MlyValue.exp exp1,_,_))::_::(_,(
MlyValue.decls decls1,_,_))::(_,(_,Tlet1left,_))::rest671) => let val 
result=MlyValue.primary(fn _ => let val decls as decls1=decls1 ()
val exp as exp1=exp1 ()
 in (A.Let (decls, exp)) end
)
 in (LrTable.NT 6,(result,Tlet1left,Tend1right),rest671) end
| (15,(_,(_,_,Tend1right))::(_,(MlyValue.exp exp1,_,_))::_::(_,(
MlyValue.decls decls1,_,_))::(_,(MlyValue.Tid Tid1,_,_))::(_,(_,
Tloop1left,_))::rest671) => let val result=MlyValue.primary(fn _ => 
let val Tid as Tid1=Tid1 ()
val decls as decls1=decls1 ()
val exp as exp1=exp1 ()
 in (A.Loop (Stuff.L Tid, decls, exp)) end
)
 in (LrTable.NT 6,(result,Tloop1left,Tend1right),rest671) end
| (16,(_,(MlyValue.primary primary1,primary1left,primary1right))::
rest671) => let val result=MlyValue.exp(fn _ => let val primary as 
primary1=primary1 ()
 in (primary) end
)
 in (LrTable.NT 7,(result,primary1left,primary1right),rest671) end
| (17,(_,(MlyValue.exp exp2,_,exp2right))::_::(_,(MlyValue.exp exp1,
exp1left,_))::rest671) => let val result=MlyValue.exp(fn _ => let val 
exp1=exp1 ()
val exp2=exp2 ()
 in (
A.If (exp1, 
                                               A.Int 1,
                                               A.If (exp2, A.Int 1, A.Int 0))
) end
)
 in (LrTable.NT 7,(result,exp1left,exp2right),rest671) end
| (18,(_,(MlyValue.exp exp2,_,exp2right))::_::(_,(MlyValue.exp exp1,
exp1left,_))::rest671) => let val result=MlyValue.exp(fn _ => let val 
exp1=exp1 ()
val exp2=exp2 ()
 in (
A.If (exp1, 
                                               A.If (exp2, A.Int 1, A.Int 0),
                                               A.Int 0)
) end
)
 in (LrTable.NT 7,(result,exp1left,exp2right),rest671) end
| (19,(_,(MlyValue.exp exp1,_,exp1right))::(_,(_,Tnot1left,_))::
rest671) => let val result=MlyValue.exp(fn _ => let val exp as exp1=
exp1 ()
 in (A.If (exp, A.Int 0, A.Int 1)) end
)
 in (LrTable.NT 7,(result,Tnot1left,exp1right),rest671) end
| (20,(_,(MlyValue.exp exp2,_,exp2right))::_::(_,(MlyValue.exp exp1,
exp1left,_))::rest671) => let val result=MlyValue.exp(fn _ => let val 
exp1=exp1 ()
val exp2=exp2 ()
 in (A.Prim (A.Eq,  [exp1, exp2])) end
)
 in (LrTable.NT 7,(result,exp1left,exp2right),rest671) end
| (21,(_,(MlyValue.exp exp2,_,exp2right))::_::(_,(MlyValue.exp exp1,
exp1left,_))::rest671) => let val result=MlyValue.exp(fn _ => let val 
exp1=exp1 ()
val exp2=exp2 ()
 in (A.Prim (A.Ne,  [exp1, exp2])) end
)
 in (LrTable.NT 7,(result,exp1left,exp2right),rest671) end
| (22,(_,(MlyValue.exp exp2,_,exp2right))::_::(_,(MlyValue.exp exp1,
exp1left,_))::rest671) => let val result=MlyValue.exp(fn _ => let val 
exp1=exp1 ()
val exp2=exp2 ()
 in (A.Prim (A.Lt,  [exp1, exp2])) end
)
 in (LrTable.NT 7,(result,exp1left,exp2right),rest671) end
| (23,(_,(MlyValue.exp exp2,_,exp2right))::_::(_,(MlyValue.exp exp1,
exp1left,_))::rest671) => let val result=MlyValue.exp(fn _ => let val 
exp1=exp1 ()
val exp2=exp2 ()
 in (A.Prim (A.Le,  [exp1, exp2])) end
)
 in (LrTable.NT 7,(result,exp1left,exp2right),rest671) end
| (24,(_,(MlyValue.exp exp2,_,exp2right))::_::(_,(MlyValue.exp exp1,
exp1left,_))::rest671) => let val result=MlyValue.exp(fn _ => let val 
exp1=exp1 ()
val exp2=exp2 ()
 in (A.Prim (A.Gt,  [exp1, exp2])) end
)
 in (LrTable.NT 7,(result,exp1left,exp2right),rest671) end
| (25,(_,(MlyValue.exp exp2,_,exp2right))::_::(_,(MlyValue.exp exp1,
exp1left,_))::rest671) => let val result=MlyValue.exp(fn _ => let val 
exp1=exp1 ()
val exp2=exp2 ()
 in (A.Prim (A.Ge,  [exp1, exp2])) end
)
 in (LrTable.NT 7,(result,exp1left,exp2right),rest671) end
| (26,(_,(MlyValue.exp exp2,_,exp2right))::_::(_,(MlyValue.exp exp1,
exp1left,_))::rest671) => let val result=MlyValue.exp(fn _ => let val 
exp1=exp1 ()
val exp2=exp2 ()
 in (A.Prim (A.Add, [exp1, exp2])) end
)
 in (LrTable.NT 7,(result,exp1left,exp2right),rest671) end
| (27,(_,(MlyValue.exp exp2,_,exp2right))::_::(_,(MlyValue.exp exp1,
exp1left,_))::rest671) => let val result=MlyValue.exp(fn _ => let val 
exp1=exp1 ()
val exp2=exp2 ()
 in (A.Prim (A.Sub, [exp1, exp2])) end
)
 in (LrTable.NT 7,(result,exp1left,exp2right),rest671) end
| (28,(_,(MlyValue.exp exp2,_,exp2right))::_::(_,(MlyValue.exp exp1,
exp1left,_))::rest671) => let val result=MlyValue.exp(fn _ => let val 
exp1=exp1 ()
val exp2=exp2 ()
 in (A.Prim (A.Mul, [exp1, exp2])) end
)
 in (LrTable.NT 7,(result,exp1left,exp2right),rest671) end
| (29,(_,(MlyValue.exp exp2,_,exp2right))::_::(_,(MlyValue.exp exp1,
exp1left,_))::rest671) => let val result=MlyValue.exp(fn _ => let val 
exp1=exp1 ()
val exp2=exp2 ()
 in (A.Prim (A.Div, [exp1, exp2])) end
)
 in (LrTable.NT 7,(result,exp1left,exp2right),rest671) end
| (30,(_,(MlyValue.exp exp2,_,exp2right))::_::(_,(MlyValue.exp exp1,
exp1left,_))::rest671) => let val result=MlyValue.exp(fn _ => let val 
exp1=exp1 ()
val exp2=exp2 ()
 in (A.Prim (A.Mod, [exp1, exp2])) end
)
 in (LrTable.NT 7,(result,exp1left,exp2right),rest671) end
| (31,(_,(MlyValue.primary primary1,primary1left,primary1right))::
rest671) => let val result=MlyValue.args(fn _ => let val primary as 
primary1=primary1 ()
 in ([primary]) end
)
 in (LrTable.NT 8,(result,primary1left,primary1right),rest671) end
| (32,(_,(_,_,Trparen1right))::(_,(MlyValue.rest_args rest_args1,_,_))
::(_,(MlyValue.exp exp1,_,_))::(_,(_,Tlparen1left,_))::rest671) => 
let val result=MlyValue.args(fn _ => let val exp as exp1=exp1 ()
val rest_args as rest_args1=rest_args1 ()
 in (exp :: rest_args) end
)
 in (LrTable.NT 8,(result,Tlparen1left,Trparen1right),rest671) end
| (33,(_,(MlyValue.rest_args rest_args1,_,rest_args1right))::(_,(
MlyValue.exp exp1,_,_))::(_,(_,Tcomma1left,_))::rest671) => let val 
result=MlyValue.rest_args(fn _ => let val exp as exp1=exp1 ()
val rest_args as rest_args1=rest_args1 ()
 in (exp :: rest_args) end
)
 in (LrTable.NT 9,(result,Tcomma1left,rest_args1right),rest671) end
| (34,rest671) => let val result=MlyValue.rest_args(fn _ => ([]))
 in (LrTable.NT 9,(result,defaultPos,defaultPos),rest671) end
| (35,(_,(MlyValue.decls decls1,_,decls1right))::(_,(MlyValue.decl 
decl1,decl1left,_))::rest671) => let val result=MlyValue.decls(fn _
 => let val decl as decl1=decl1 ()
val decls as decls1=decls1 ()
 in (decl :: decls) end
)
 in (LrTable.NT 10,(result,decl1left,decls1right),rest671) end
| (36,rest671) => let val result=MlyValue.decls(fn _ => ([]))
 in (LrTable.NT 10,(result,defaultPos,defaultPos),rest671) end
| (37,(_,(MlyValue.exp exp1,_,exp1right))::_::(_,(MlyValue.Tid Tid1,_,
_))::(_,(_,Tval1left,_))::rest671) => let val result=MlyValue.decl(fn 
_ => let val Tid as Tid1=Tid1 ()
val exp as exp1=exp1 ()
 in ((Stuff.V Tid, exp)) end
)
 in (LrTable.NT 11,(result,Tval1left,exp1right),rest671) end
| _ => raise (mlyAction i392)
end
val void = MlyValue.VOID
val extract = fn a => (fn MlyValue.program x => x
| _ => let exception ParseInternal
	in raise ParseInternal end) a ()
end
end
structure Tokens : Toy_TOKENS =
struct
type svalue = ParserData.svalue
type ('a,'b) token = ('a,'b) Token.token
fun Teof (p1,p2) = Token.TOKEN (ParserData.LrTable.T 0,(
ParserData.MlyValue.VOID,p1,p2))
fun Tcomma (p1,p2) = Token.TOKEN (ParserData.LrTable.T 1,(
ParserData.MlyValue.VOID,p1,p2))
fun Tlparen (p1,p2) = Token.TOKEN (ParserData.LrTable.T 2,(
ParserData.MlyValue.VOID,p1,p2))
fun Trparen (p1,p2) = Token.TOKEN (ParserData.LrTable.T 3,(
ParserData.MlyValue.VOID,p1,p2))
fun Tfun (p1,p2) = Token.TOKEN (ParserData.LrTable.T 4,(
ParserData.MlyValue.VOID,p1,p2))
fun Tand (p1,p2) = Token.TOKEN (ParserData.LrTable.T 5,(
ParserData.MlyValue.VOID,p1,p2))
fun Tif (p1,p2) = Token.TOKEN (ParserData.LrTable.T 6,(
ParserData.MlyValue.VOID,p1,p2))
fun Tthen (p1,p2) = Token.TOKEN (ParserData.LrTable.T 7,(
ParserData.MlyValue.VOID,p1,p2))
fun Telse (p1,p2) = Token.TOKEN (ParserData.LrTable.T 8,(
ParserData.MlyValue.VOID,p1,p2))
fun Tlet (p1,p2) = Token.TOKEN (ParserData.LrTable.T 9,(
ParserData.MlyValue.VOID,p1,p2))
fun Tval (p1,p2) = Token.TOKEN (ParserData.LrTable.T 10,(
ParserData.MlyValue.VOID,p1,p2))
fun Tin (p1,p2) = Token.TOKEN (ParserData.LrTable.T 11,(
ParserData.MlyValue.VOID,p1,p2))
fun Tend (p1,p2) = Token.TOKEN (ParserData.LrTable.T 12,(
ParserData.MlyValue.VOID,p1,p2))
fun Tloop (p1,p2) = Token.TOKEN (ParserData.LrTable.T 13,(
ParserData.MlyValue.VOID,p1,p2))
fun Teq (p1,p2) = Token.TOKEN (ParserData.LrTable.T 14,(
ParserData.MlyValue.VOID,p1,p2))
fun Tne (p1,p2) = Token.TOKEN (ParserData.LrTable.T 15,(
ParserData.MlyValue.VOID,p1,p2))
fun Tlt (p1,p2) = Token.TOKEN (ParserData.LrTable.T 16,(
ParserData.MlyValue.VOID,p1,p2))
fun Tle (p1,p2) = Token.TOKEN (ParserData.LrTable.T 17,(
ParserData.MlyValue.VOID,p1,p2))
fun Tgt (p1,p2) = Token.TOKEN (ParserData.LrTable.T 18,(
ParserData.MlyValue.VOID,p1,p2))
fun Tge (p1,p2) = Token.TOKEN (ParserData.LrTable.T 19,(
ParserData.MlyValue.VOID,p1,p2))
fun Tadd (p1,p2) = Token.TOKEN (ParserData.LrTable.T 20,(
ParserData.MlyValue.VOID,p1,p2))
fun Tsub (p1,p2) = Token.TOKEN (ParserData.LrTable.T 21,(
ParserData.MlyValue.VOID,p1,p2))
fun Tmul (p1,p2) = Token.TOKEN (ParserData.LrTable.T 22,(
ParserData.MlyValue.VOID,p1,p2))
fun Tdiv (p1,p2) = Token.TOKEN (ParserData.LrTable.T 23,(
ParserData.MlyValue.VOID,p1,p2))
fun Tmod (p1,p2) = Token.TOKEN (ParserData.LrTable.T 24,(
ParserData.MlyValue.VOID,p1,p2))
fun Tnot (p1,p2) = Token.TOKEN (ParserData.LrTable.T 25,(
ParserData.MlyValue.VOID,p1,p2))
fun Tandalso (p1,p2) = Token.TOKEN (ParserData.LrTable.T 26,(
ParserData.MlyValue.VOID,p1,p2))
fun Torelse (p1,p2) = Token.TOKEN (ParserData.LrTable.T 27,(
ParserData.MlyValue.VOID,p1,p2))
fun Tid (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 28,(
ParserData.MlyValue.Tid (fn () => i),p1,p2))
fun Tinteger (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 29,(
ParserData.MlyValue.Tinteger (fn () => i),p1,p2))
end
end
