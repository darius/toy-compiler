structure Maps = 
struct

local open List
in


datatype ('a, 'b) map = Map of ('a -> 'b) * ('a * 'b) list

exception Missing

fun pairs_map pairs = Map (fn _ => raise Missing, pairs)

fun with_default (b, Map (_, p)) = Map (b, p)

fun empty_map ()      = pairs_map []
fun make_map (ys, zs) = pairs_map (Stuff.zip ys zs)

fun lookup (Map (d, p)) a = 
      case find (fn (a', _) => a = a') p of
          NONE => d a
        | SOME (_, b) => b

fun extend1 (a, b, Map (d, p)) = Map (d, (a, b) :: p)

fun extend (Map (_, p1), Map (d, p2)) = Map (d, p1 @ p2)

fun map_to_set (Map (_, p)) = p

fun domain m = map #1 (map_to_set m)
fun range m  = map #2 (map_to_set m)


fun print (stream, Map (default, pairs), domain_printer, range_printer) = 
      (TextIO.output (stream, "(map: \n");    (* annoyingly hard to print the default.. *)
       app (fn (domain, range) => 
             (domain_printer (stream, domain);
              TextIO.output (stream, "\t");
              range_printer (stream, range);
              TextIO.output (stream, "\n")))
           pairs;
       TextIO.output (stream, ")\n"))


end

end
