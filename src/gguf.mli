type header = { version : int; tensor_count : int; kv_count : int }

val read_header : string -> (header, string) result
(** [read_header path] reads the first few bytes of a GGUF file. *)
