signature Toy_TOKENS =
sig
type ('a,'b) token
type svalue
val Tinteger: (int) *  'a * 'a -> (svalue,'a) token
val Tid: (string) *  'a * 'a -> (svalue,'a) token
val Torelse:  'a * 'a -> (svalue,'a) token
val Tandalso:  'a * 'a -> (svalue,'a) token
val Tnot:  'a * 'a -> (svalue,'a) token
val Tmod:  'a * 'a -> (svalue,'a) token
val Tdiv:  'a * 'a -> (svalue,'a) token
val Tmul:  'a * 'a -> (svalue,'a) token
val Tsub:  'a * 'a -> (svalue,'a) token
val Tadd:  'a * 'a -> (svalue,'a) token
val Tge:  'a * 'a -> (svalue,'a) token
val Tgt:  'a * 'a -> (svalue,'a) token
val Tle:  'a * 'a -> (svalue,'a) token
val Tlt:  'a * 'a -> (svalue,'a) token
val Tne:  'a * 'a -> (svalue,'a) token
val Teq:  'a * 'a -> (svalue,'a) token
val Tloop:  'a * 'a -> (svalue,'a) token
val Tend:  'a * 'a -> (svalue,'a) token
val Tin:  'a * 'a -> (svalue,'a) token
val Tval:  'a * 'a -> (svalue,'a) token
val Tlet:  'a * 'a -> (svalue,'a) token
val Telse:  'a * 'a -> (svalue,'a) token
val Tthen:  'a * 'a -> (svalue,'a) token
val Tif:  'a * 'a -> (svalue,'a) token
val Tand:  'a * 'a -> (svalue,'a) token
val Tfun:  'a * 'a -> (svalue,'a) token
val Trparen:  'a * 'a -> (svalue,'a) token
val Tlparen:  'a * 'a -> (svalue,'a) token
val Tcomma:  'a * 'a -> (svalue,'a) token
val Teof:  'a * 'a -> (svalue,'a) token
end
signature Toy_LRVALS=
sig
structure Tokens : Toy_TOKENS
structure ParserData:PARSER_DATA
sharing type ParserData.Token.token = Tokens.token
sharing type ParserData.svalue = Tokens.svalue
end
