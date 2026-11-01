type header = { version : int; tensor_count : int; kv_count : int }

let read_header path =
  In_channel.with_open_bin path (fun ic ->
      match In_channel.really_input_string ic 24 with
      | None -> Error "file too short"
      | Some s ->
          let b = Bytes.of_string s in
          if Bytes.sub_string b 0 4 <> "GGUF" then Error "not a GGUF file"
          else
            let version = Bytes.get_int32_le b 4 |> Int32.to_int in
            if version <> 3 then
              Error (Printf.sprintf "unsupported version %d" version)
            else
              Ok
                {
                  version;
                  tensor_count = Bytes.get_int64_le b 8 |> Int64.to_int;
                  kv_count = Bytes.get_int64_le b 16 |> Int64.to_int;
                })
