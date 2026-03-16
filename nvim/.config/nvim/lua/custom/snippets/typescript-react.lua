local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local fmt = require('luasnip.extras.fmt').fmt

-- Helper function to get component name from filename
local function get_component_name()
  local filename = vim.fn.expand '%:t:r'
  -- Capitalize first letter
  return filename:sub(1, 1):upper() .. filename:sub(2)
end

return {
  -- TypeScript React Functional Component
  s(
    'tsrfc',
    fmt(
      [[
import React from 'react'

interface {}Props {{
  {}
}}

const {}: React.FC<{}Props> = ({{{}}}) => {{
  return (
    <div>
      {}
    </div>
  )
}}

export default {}
]],
      {
        f(get_component_name),
        i(1, '// props'),
        f(get_component_name),
        f(get_component_name),
        i(2, ''),
        i(3, 'content'),
        f(get_component_name),
      }
    )
  ),

  -- TypeScript React Functional Component with Export
  s(
    'tsrfce',
    fmt(
      [[
import React from 'react'

interface {}Props {{
  {}
}}

export const {}: React.FC<{}Props> = ({{{}}}) => {{
  return (
    <div>
      {}
    </div>
  )
}}
]],
      {
        f(get_component_name),
        i(1, '// props'),
        f(get_component_name),
        f(get_component_name),
        i(2, ''),
        i(3, 'content'),
      }
    )
  ),

  -- TypeScript React Arrow Function Component
  s(
    'tsrafc',
    fmt(
      [[
import React from 'react'

type {}Props = {{
  {}
}}

const {} = ({{{}}}: {}Props) => {{
  return (
    <div>
      {}
    </div>
  )
}}

export default {}
]],
      {
        f(get_component_name),
        i(1, '// props'),
        f(get_component_name),
        i(2, ''),
        f(get_component_name),
        i(3, 'content'),
        f(get_component_name),
      }
    )
  ),

  -- TypeScript React Arrow Function Component Export
  s(
    'tsrafce',
    fmt(
      [[
import React from 'react'

type {}Props = {{
  {}
}}

export const {} = ({{{}}}: {}Props) => {{
  return (
    <div>
      {}
    </div>
  )
}}
]],
      {
        f(get_component_name),
        i(1, '// props'),
        f(get_component_name),
        i(2, ''),
        f(get_component_name),
        i(3, 'content'),
      }
    )
  ),

  -- TypeScript useState with type
  s(
    'useStateT',
    fmt('const [{}, set{}] = useState<{}>({})', {
      i(1, 'state'),
      f(function(args)
        local state_name = args[1][1]
        return state_name:sub(1, 1):upper() .. state_name:sub(2)
      end, { 1 }),
      i(2, 'type'),
      i(3, 'initialValue'),
    })
  ),

  -- TypeScript useRef with type
  s('useRefT', fmt('const {} = useRef<{}>({})', { i(1, 'ref'), i(2, 'type'), i(3, 'null') })),

  -- TypeScript useContext with type
  s('useContextT', fmt('const {} = useContext<{}>({})', { i(1, 'context'), i(2, 'type'), i(3, 'Context') })),

  -- TypeScript useReducer with types
  s(
    'useReducerT',
    fmt('const [{}, dispatch] = useReducer<React.Reducer<{}, {}>({}, {})', {
      i(1, 'state'),
      i(2, 'StateType'),
      i(3, 'ActionType'),
      i(4, 'reducer'),
      i(5, 'initialState'),
    })
  ),

  -- TypeScript React.FC
  s('fc', fmt('const {}: React.FC<{}> = ({{{}}}) => {{}}', { i(1, 'Component'), i(2, 'Props'), i(3, '') })),

  -- TypeScript Interface for Props
  s(
    'interface',
    fmt(
      [[
interface {}Props {{
  {}
}}
]],
      {
        i(1, 'Component'),
        i(2, '// props'),
      }
    )
  ),

  -- TypeScript Type for Props
  s(
    'type',
    fmt(
      [[
type {}Props = {{
  {}
}}
]],
      {
        i(1, 'Component'),
        i(2, '// props'),
      }
    )
  ),

  -- TypeScript React Event Handler
  s('handleEvent', fmt('const handle{} = (event: React.{}Event<{}>) => {{}}', { i(1, 'Click'), i(2, 'Mouse'), i(3, 'HTMLButtonElement') })),

  -- TypeScript onChange Handler
  s('handleChange', fmt('const handleChange = (event: React.ChangeEvent<HTMLInputElement>) => {{}}', {})),

  -- TypeScript onClick Handler
  s('handleClick', fmt('const handleClick = (event: React.MouseEvent<HTMLButtonElement>) => {{}}', {})),

  -- TypeScript onSubmit Handler
  s('handleSubmit', fmt('const handleSubmit = (event: React.FormEvent<HTMLFormElement>) => {{}}', {})),

  -- TypeScript React Children Type
  s('children', t 'children: React.ReactNode'),

  -- TypeScript forwardRef
  s(
    'tsForwardRef',
    fmt(
      [[
import React, {{ forwardRef }} from 'react'

interface {}Props {{
  {}
}}

const {} = forwardRef<{}, {}Props>((props, ref) => {{
  return (
    <div ref={{ref}}>
      {}
    </div>
  )
}})

export default {}
]],
      {
        f(get_component_name),
        i(1, '// props'),
        f(get_component_name),
        i(2, 'HTMLDivElement'),
        f(get_component_name),
        i(3, 'content'),
        f(get_component_name),
      }
    )
  ),

  -- TypeScript Custom Hook
  s(
    'customHook',
    fmt(
      [[
import {{ {} }} from 'react'

export const use{} = ({}): {} => {{
  {}

  return {}
}}
]],
      {
        i(1, 'useState'),
        i(2, 'CustomHook'),
        i(3, 'initialValue: any'),
        i(4, 'ReturnType'),
        i(5, '// hook logic'),
        i(6, 'value'),
      }
    )
  ),

  -- Import React with FC
  s('imrfc', t "import React, { FC } from 'react'"),

  -- Import React Types
  s('imrtypes', t "import type { FC, ReactNode } from 'react'"),

  -- Typed Props Destructuring
  s('tprops', fmt('const {{{}}}: {}Props = props', { i(1, ''), i(2, 'Component') })),

  -- Async Component (for Server Components in Next.js)
  s(
    'asyncComponent',
    fmt(
      [[
interface {}Props {{
  {}
}}

export default async function {}({{{}}}: {}Props) {{
  {}

  return (
    <div>
      {}
    </div>
  )
}}
]],
      {
        f(get_component_name),
        i(1, '// props'),
        f(get_component_name),
        i(2, ''),
        f(get_component_name),
        i(3, '// async logic'),
        i(4, 'content'),
      }
    )
  ),

  -- TypeScript Generic Component
  s(
    'genericComponent',
    fmt(
      [[
interface {}Props<T> {{
  data: T
  {}
}}

const {}<T> = <{{ data, {}}}: {}Props<T>) => {{
  return (
    <div>
      {}
    </div>
  )
}}

export default {}
]],
      {
        f(get_component_name),
        i(1, '// other props'),
        f(get_component_name),
        i(2, ''),
        f(get_component_name),
        i(3, 'content'),
        f(get_component_name),
      }
    )
  ),
}
