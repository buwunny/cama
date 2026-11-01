(lang dune 3.17)

(name cama)

(generate_opam_files true)

(package
 (name cama)
 (synopsis "A high-performance LLM inference engine in OxCaml")
 (depends
  (ocaml
   (>= 5.2.0))
  dune
  base
  core
  core_unix
  ocaml_simd
  unboxed
  parallel
  cmdliner
  (ppx_jane
   (and
    (>= v0.18)
    (< v0.19)))))
