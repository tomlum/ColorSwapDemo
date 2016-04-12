--Adapted from cs.rit.edud
function HSB2RGB(h, s, v, a)

  local r,g,b
  local i
  local f, p, q, t
  if( s == 0 ) then
    r = v
    g = v
    b = v
    return {r,g,b,a}
  end
  h = h*6      
  i = math.floor( h )
  f = h - i      
  p = v * ( 1 - s )
  q = v * ( 1 - s * f )
  t = v * ( 1 - s * ( 1 - f ) )
  if i == 0 then
    r = v
    g = t
    b = p
  elseif i == 1 then
    r = q
    g = v
    b = p
  elseif i == 2 then
    r = p
    g = v
    b = t
  elseif i == 3 then
    r = p
    g = q
    b = v
  elseif i == 4 then
    r = t
    g = p
    b = v
  elseif i == 5 then
    r = v
    g = p
    b = q
  end
  return {r,g,b,a}
end