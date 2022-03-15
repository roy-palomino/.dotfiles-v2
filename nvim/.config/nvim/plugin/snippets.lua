local ls = require "luasnip"

ls.snippets = {
  all = {
   ls.parser.parse_snippet("expand", "-- this is what was expanded"),
   ls.parser.parse_snippet("ga", "------ GAAAAAAAAAAAAAAAAAAAA!!!!!! ---")
  },

  vue = {
    ls.parser.parse_snippet("scaffold", "<script lang=\"ts\">\nimport { defineComponent } from \"vue\"\n\nexport default defineComponent({\n  name: \"$1\",\n  setup() {\n    $0\n  },\n})\n</script>\n\n<template>\n</template>\n\n<style lang=\"scss\" scoped>\n</style>"),
    ls.parser.parse_snippet("func", "const $1 = ($2) => {\n  $0\n}"),
  }
}
