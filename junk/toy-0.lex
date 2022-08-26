structure T = Tokens

type pos = int
type lexresult = T.token

val lineNum = ErrorMsg.lineNum
val linePos = ErrorMsg.linePos
fun err (p1, p2) = ErrorMsg.error p1

fun eof () = let val pos = hd (!linePos) in T.Teof (pos, pos) end

fun parse_int str = case Int.fromString str of SOME i => i

%% 
%header (functor ToyLexFun(structure Tokens: Toy_TOKENS));

comment="(*"[^()*]*"*)";
identifier=[A-Za-z_][A-Za-z_0-9']*;

%%
\n	=> (lineNum := !lineNum+1; linePos := yypos :: !linePos; continue());
[\ \t]+		=> (continue ());
{comment}	=> (continue ());

","		=> (T.Tcomma  (yypos, yypos + 1));
"("		=> (T.Tlparen (yypos, yypos + 1));
")"		=> (T.Trparen (yypos, yypos + 1));

fun		=> (T.Tfun    (yypos, yypos + 3));
and		=> (T.Tand    (yypos, yypos + 3));
if		=> (T.Tif     (yypos, yypos + 2));
then		=> (T.Tthen   (yypos, yypos + 4));
else		=> (T.Telse   (yypos, yypos + 4));
let		=> (T.Tlet    (yypos, yypos + 3));
val		=> (T.Tval    (yypos, yypos + 3));
in		=> (T.Tin     (yypos, yypos + 2));
end		=> (T.Tend    (yypos, yypos + 3));
loop		=> (T.Tloop   (yypos, yypos + 4));

"="		=> (T.Teq     (yypos, yypos + 1));
"~="		=> (T.Tne     (yypos, yypos + 2));
"<"		=> (T.Tlt     (yypos, yypos + 1));
"<="		=> (T.Tle     (yypos, yypos + 2));
">"		=> (T.Tgt     (yypos, yypos + 1));
">="		=> (T.Tge     (yypos, yypos + 2));
"+"		=> (T.Tadd    (yypos, yypos + 1));
"-"		=> (T.Tsub    (yypos, yypos + 1));
"*"		=> (T.Tmul    (yypos, yypos + 1));
div		=> (T.Tdiv    (yypos, yypos + 3));
mod		=> (T.Tmod    (yypos, yypos + 3));

{identifier}	=> (T.Tid ((yypos, yypos + String.size yytext), yytext));
[0-9]+		=> (T.Tinteger ((yypos, yypos + String.size yytext),
				parse_int yytext));

.       => (ErrorMsg.error yypos ("illegal character " ^ yytext); continue());
