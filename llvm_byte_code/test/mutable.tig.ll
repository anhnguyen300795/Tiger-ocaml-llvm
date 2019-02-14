; ModuleID = 'Tiger jit'
source_filename = "Tiger jit"

declare void @tig_print_int(i32) gc "ocaml"

declare void @tig_print(i8*) gc "ocaml"

declare void @print_arr_int_ele(i32) gc "ocaml"

declare i32* @tig_init_array(i32, i32) gc "ocaml"

declare i32* @tig_init_record(i32) gc "ocaml"

declare i32 @tig_array_length(i8*) gc "ocaml"

declare i32 @tig_nillable(i8*) gc "ocaml"

declare void @tig_check_array_bound(i8*, i32, i8*) gc "ocaml"

declare void @tig_check_null_pointer(i8*, i8*) gc "ocaml"

declare i32 @tig_random(i32) gc "ocaml"

declare void @tig_exit(i32) gc "ocaml"

declare void @tig_flush() gc "ocaml"

declare i8* @tig_getchar() gc "ocaml"

declare i32 @tig_ord(i8*) gc "ocaml"

declare i8* @tig_chr(i32) gc "ocaml"

declare i32 @tig_string_cmp(i8*, i8*) gc "ocaml"

declare i32 @tig_size(i8*) gc "ocaml"

declare i8* @tig_substring(i8*, i32, i32) gc "ocaml"

declare i8* @tig_concat(i8*, i8*) gc "ocaml"

declare i32 @tig_not(i32) gc "ocaml"

declare void @assert_equal_int(i32, i32) gc "ocaml"

declare void @assert_equal_string(i8*, i8*) gc "ocaml"

define i32 @main() gc "ocaml" {
entry:
  %frame_pointer = alloca { i32 }
  %0 = call i32 @f({ i32 }* %frame_pointer, i32 10)
  call void @tig_print_int(i32 %0)
  %1 = call i32 @f({ i32 }* %frame_pointer, i32 10)
  call void @assert_equal_int(i32 %1, i32 20)
  ret i32 0

break_loop:                                       ; No predecessors!
  ret i32 0
}

define i32 @f({ i32 }*, i32) gc "ocaml" {
entry:
  %b = alloca i32
  %a = alloca i32
  %frame_pointer = alloca { { i32 }* }
  %arg_address = getelementptr { { i32 }* }, { { i32 }* }* %frame_pointer, i32 0, i32 0
  store { i32 }* %0, { i32 }** %arg_address
  store i32 %1, i32* %a
  %a1 = load i32, i32* %a
  %add_tmp = add i32 %a1, 5
  store i32 %add_tmp, i32* %b
  %b2 = load i32, i32* %b
  %add_tmp3 = add i32 %b2, 5
  store i32 %add_tmp3, i32* %b
  %b4 = load i32, i32* %b
  ret i32 %b4
}
