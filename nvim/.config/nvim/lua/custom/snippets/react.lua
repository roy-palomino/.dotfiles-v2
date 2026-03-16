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
  -- React Functional Component
  s(
    'rfc',
    fmt(
      [[
import React from 'react'

function {}() {{
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
        i(1, 'content'),
        f(get_component_name),
      }
    )
  ),

  -- React Functional Component with Export
  s(
    'rfce',
    fmt(
      [[
import React from 'react'

function {}() {{
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
        i(1, 'content'),
        f(get_component_name),
      }
    )
  ),

  -- React Arrow Function Component
  s(
    'rafc',
    fmt(
      [[
import React from 'react'

const {} = () => {{
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
        i(1, 'content'),
        f(get_component_name),
      }
    )
  ),

  -- React Arrow Function Component with Export
  s(
    'rafce',
    fmt(
      [[
import React from 'react'

export const {} = () => {{
  return (
    <div>
      {}
    </div>
  )
}}
]],
      {
        f(get_component_name),
        i(1, 'content'),
      }
    )
  ),

  -- React Functional Component with Props
  s(
    'rfcp',
    fmt(
      [[
import React from 'react'

function {}({{{}}}) {{
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
        i(1, 'props'),
        i(2, 'content'),
        f(get_component_name),
      }
    )
  ),

  -- React Arrow Function Component with Props
  s(
    'rafcp',
    fmt(
      [[
import React from 'react'

const {} = ({{{}}}) => {{
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
        i(1, 'props'),
        i(2, 'content'),
        f(get_component_name),
      }
    )
  ),

  -- useState Hook
  s(
    'useState',
    fmt('const [{}, set{}] = useState({})', {
      i(1, 'state'),
      f(function(args)
        local state_name = args[1][1]
        return state_name:sub(1, 1):upper() .. state_name:sub(2)
      end, { 1 }),
      i(2, 'initialValue'),
    })
  ),

  -- useEffect Hook
  s(
    'useEffect',
    fmt(
      [[
useEffect(() => {{
  {}
}}, [{}])
]],
      {
        i(1, '// effect'),
        i(2, ''),
      }
    )
  ),

  -- useContext Hook
  s('useContext', fmt('const {} = useContext({})', { i(1, 'context'), i(2, 'Context') })),

  -- useReducer Hook
  s(
    'useReducer',
    fmt('const [{}, dispatch] = useReducer({}, {})', {
      i(1, 'state'),
      i(2, 'reducer'),
      i(3, 'initialState'),
    })
  ),

  -- useCallback Hook
  s(
    'useCallback',
    fmt(
      [[
const {} = useCallback(() => {{
  {}
}}, [{}])
]],
      {
        i(1, 'memoizedCallback'),
        i(2, '// callback logic'),
        i(3, ''),
      }
    )
  ),

  -- useMemo Hook
  s(
    'useMemo',
    fmt('const {} = useMemo(() => {}, [{}])', {
      i(1, 'memoizedValue'),
      i(2, 'computeExpensiveValue()'),
      i(3, ''),
    })
  ),

  -- useRef Hook
  s('useRef', fmt('const {} = useRef({})', { i(1, 'ref'), i(2, 'null') })),

  -- useImperativeHandle Hook
  s(
    'useImperativeHandle',
    fmt(
      [[
useImperativeHandle(ref, () => ({{
  {}
}}), [{}])
]],
      {
        i(1, '// methods'),
        i(2, ''),
      }
    )
  ),

  -- useLayoutEffect Hook
  s(
    'useLayoutEffect',
    fmt(
      [[
useLayoutEffect(() => {{
  {}
}}, [{}])
]],
      {
        i(1, '// effect'),
        i(2, ''),
      }
    )
  ),

  -- useDebugValue Hook
  s('useDebugValue', fmt('useDebugValue({})', { i(1, 'value') })),

  -- Import React
  s('imr', t "import React from 'react'"),

  -- Import React, { Component }
  s('imrc', t "import React, { Component } from 'react'"),

  -- Import React with useState
  s('imrs', t "import React, { useState } from 'react'"),

  -- Import React with useEffect
  s('imrse', t "import React, { useState, useEffect } from 'react'"),

  -- Import React with memo
  s('imrm', t "import React, { memo } from 'react'"),

  -- Import Component
  s('imc', fmt("import {{{}}} from '{}'", { i(1, 'Component'), i(2, './Component') })),

  -- Export Default
  s('exp', fmt('export default {}', { i(1, 'Component') })),

  -- Export Named
  s('exd', fmt('export {{ {} }}', { i(1, 'Component') })),

  -- className
  s('cn', fmt('className="{}"', { i(1, '') })),

  -- React Fragment
  s(
    'frag',
    fmt(
      [[
<>
  {}
</>
]],
      { i(1, 'content') }
    )
  ),

  -- React Fragment with key
  s(
    'fragk',
    fmt(
      [[
<React.Fragment key={{{}}}>
  {}
</React.Fragment>
]],
      {
        i(1, 'key'),
        i(2, 'content'),
      }
    )
  ),

  -- console.log
  s('clg', fmt('console.log({})', { i(1, '') })),

  -- console.log with label
  s('clo', fmt("console.log('{}:', {})", { i(1, 'label'), i(2, 'value') })),

  -- PropTypes
  s(
    'rpt',
    fmt(
      [[
{}.propTypes = {{
  {}: PropTypes.{},
}}
]],
      {
        i(1, 'Component'),
        i(2, 'prop'),
        i(3, 'string'),
      }
    )
  ),

  -- DefaultProps
  s(
    'rdp',
    fmt(
      [[
{}.defaultProps = {{
  {}: {},
}}
]],
      {
        i(1, 'Component'),
        i(2, 'prop'),
        i(3, 'value'),
      }
    )
  ),

  -- React.memo
  s('rmemo', fmt('export default memo({})', { i(1, 'Component') })),

  -- forwardRef
  s(
    'fref',
    fmt(
      [[
const {} = forwardRef((props, ref) => {{
  return (
    <div ref={{ref}}>
      {}
    </div>
  )
}})
]],
      {
        i(1, 'Component'),
        i(2, 'content'),
      }
    )
  ),

  -- useId Hook (React 18+)
  s('useId', fmt('const {} = useId()', { i(1, 'id') })),

  -- useDeferredValue Hook (React 18+)
  s('useDeferredValue', fmt('const {} = useDeferredValue({})', { i(1, 'deferredValue'), i(2, 'value') })),

  -- useTransition Hook (React 18+)
  s('useTransition', fmt('const [isPending, startTransition] = useTransition()', {})),

  -- Lazy Import
  s('lazy', fmt("const {} = lazy(() => import('{}'))", { i(1, 'Component'), i(2, './Component') })),

  -- Suspense
  s(
    'suspense',
    fmt(
      [[
<Suspense fallback={{{}}}>
  {}
</Suspense>
]],
      {
        i(1, '<div>Loading...</div>'),
        i(2, '<Component />'),
      }
    )
  ),
}
