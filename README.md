# ColorSwap Demo
A simple color/palette swapping library for the LÖVE game engine using shaders.

Any image that contains certain reserved color values can have those colors colorSwapped.  If the image contains a shade of a reserved color, then colorSwap will also maintain the shading while swappping.  In other words, the lightness and saturation will carry over from the original image, so long as the reserved hue is maintained.

To use, first include colorSwap.

Then call colorSwap.send(swapMap) to set which colors to swap.
swapMap is a table of rgba color values (e.g. {{200,102,233,255}, {0,255,0,100}})

swapMap's first value will replace all absolute red in the image <br />
  i.e. a hue value of 0 or RGB values {0,0,0} -> {255,0,0} -> {255,255,255} <br />
swapMap's second value will replace all absolute green in the image <br />
  i.e. a hue value of 60 or RGB values {0,0,0} -> {0,255,0} -> {255,255,255} <br />
swapMap's third value will replace all absolute blue in the image <br />
  i.e. a hue value of 120 or RGB values {0,0,0} -> {0,0,255} -> {255,255,255} <br />
swapMap's fourth value will replace all absolute cyan in the image <br />
  i.e. a hue value of 180 or RGB values {0,0,0} -> {0,255,255}  -> {255,255,255} <br />
swapMap's fifth value will replace all absolute magenta in the image <br />
  i.e. a hue value of 240 or RGB values {0,0,0} -> {255,0,255}  -> {255,255,255} <br />
swapMap's sixth value will replace all absolute yellow in the image <br />
  i.e. a hue value of 300 or RGB values {0,0,0} -> {255,255,0}  -> {255,255,255} <br />

If any value in the table is nil, colorSwap will fill not swap its color, so you can make calls like <br />
colorSwap.send({255,0,255,255}) to only swap red <br />
or <br />
colorSwap.send(nil, nil, nil, {255,0,255,255}) to only swap cyan. <br />

Finally call colorSwap.set() before drawing any images you want to swap, and then colorSwap.unset() to undo the shader for further draws.
