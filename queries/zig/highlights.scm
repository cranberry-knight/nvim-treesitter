
; Zig

; Variables
; --------------
(identifier) @variable

(parameter (identifier) @variable)

; ((identifier) @constant
;  (#vim-match? @constant "^[A-Z][A-Z\\d_]+$'"))

; function definition
(function_signature
  name: (identifier) @function)

(function_declaration
  name: (identifier) @function
  return: (identifier) @type)

; Function calls
(call_expression
  function: (identifier) @function)

(build_in_call_expr
  function: (identifier) @function.builtin
)

(build_in_call_expr
  function: ((identifier) @include
             (#any-of? @include "@import" "@cImport"))
)

(struct_construction
  (type_identifier) @constructor
)

;; other identifiers
(type_identifier) @type
(custom_number_type) @type.builtin
(primitive_type) @type.builtin
(field_identifier) @field
(enum_identifier) @constant
(union_identifier) @field
(error_identifier) @field

(assignment_statement
  name: (identifier) @type
  expression: [
    (enum_expression)
    (union_expression)
    (error_expression)
    (struct_expression)
  ]
)

(line_comment) @comment
(doc_comment) @comment

(char_literal) @character
(integer_literal) @number
(float_literal) @number

(boolean_literal) @boolean
(undefined_literal) @constant.builtin
(unreachable_expression) @constant.builtin
(null_literal) @constant.builtin

; (ERROR) @error

(string_literal) @string
(multiline_string_literal) @string 

(escape_sequence) @string.escape
(char_literal (escape_sequence) @character)

(label_identifier) @label

(call_modifier) @keyword ; async

(binary_operator) @keyword.operator

[
  "align"
  "allowzero"
  ; "and"
  ; "anyframe"
  ; "anytype"
  ;"asm"
  "await"
  "break"
  ; "callconv"
  ; "catch"
  "comptime"
  "const"
  "continue"
  "defer"
  "else"
  "enum"
  "errdefer"
  "error"
  "export"
  "extern"
  "for"
  "if"
  "inline"
  ; "noalias"
  ; "nosuspend"
  ; "noinline"
  "null"
  ; "opaque"
  ; "or"
  ; "orelse"
  ; "packed"
  "pub"
  "resume"
  ; "linksection"
  "struct"
  "suspend"
  "switch"
  "test"
  ; "threadlocal"
  "try"
  ; "undefined"
  "union"
  ;"unreachable"
  "usingnamespace"
  "var"
  "volatile"
  "while"
] @keyword

[
  "true"
  "false"
] @boolean

"return" @keyword.return

"fn" @keyword.function

[
  (else_switch)
  "continue"
  "else"
  "if"
  "switch"
] @conditional

[
  "for"
  "while"
] @repeat

(assignment_modifier) @attribute

[
  ".{"
  "("
  ")"
  "["
  "]"
  "{"
  "}"
] @punctuation.bracket

[
  "&"
  "&="
  "*"
  "*="
  ;"*%"
  "*%="
  ;"^"
  "^="
  ":"
  ","
  "."
  ".."
  "..."
  ".*"
  ".?"
  "="
  ;"=="
  "=>"
  "!"
  ;"!="
  ;"<"
  ;"<<"
  "<<="
  ; "<="
  "-"
  "-="
  "-%"
  "-%="
  ;"->"
  ;"%"
  "%="
  "|"
  ;"||"
  "|="
  ;"+"
  ;"++"
  "+="
  ;"+%"
  "+%="
  "?"
  ;">"
  ;">>"
  ">>="
  ;">="
  ;"/"
  "/="
  "~"
] @operator

[
  ";"
  "."
  ","
] @punctuation.delimiter

