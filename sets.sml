structure Sets = struct 

local open List
in


(* A set is represented as an unordered list without duplicates. *)

val empty_set = []
fun singleton x = [x]

fun member (x, set) = exists (fn y => x = y) set
fun adjoin (x, set) = if member (x, set) then set else x :: set
fun remove (x, set) = filter (fn x' => x' <> x) set

fun union (s, t)      = foldl adjoin t s
fun intersect (s, t)  = filter (fn x => member (x, t)) s
fun difference (s, t) = filter (fn x => not (member (x, t))) s

fun is_subset (s, t)  = all (fn x => member (x, t)) s
fun equals (s, t)     = is_subset (s, t) andalso is_subset (t, s)

(* Return the union of the sets produced by applying f to each element. *)

fun flatmap f set = foldl union [] (map f set)


end

end
