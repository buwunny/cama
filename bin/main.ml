let () =
  match Sys.argv with
  | [| _; path |] -> (
      match Cama.Gguf.read_header path with
      | Ok h ->
          Printf.printf "version=%d tensors=%d kvs=%d\n" h.version
            h.tensor_count h.kv_count
      | Error e ->
          prerr_endline e;
          exit 1)
  | _ ->
      prerr_endline "usage: main <file.gguf>";
      exit 2
