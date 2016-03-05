# ColorSwapDemo
A simple color/palette swapping library for the LÖVE game engine using shaders.
In the demo press space to switch between different colorSwaps of the same image file.

Any image that is drawn that has certain sentinal colors will be swapped with new colors.

First include colorSwap

Then call colorSwap.set(swapMap) to set which colors to swap.
swapMap is a table of rgba color values (e.g. {1,0,0,1} for red)

swapMap's first value will replace all red in the image or {255,0,0}
swapMap's second value will replace all green in the image or {0,255,0}
swapMap's third value will replace all blue in the image or {0,0,255}
swapMap's fourth value will replace all cyan in the image or {0,255,255}
swapMap's fifth value will replace all magenta in the image or {255,0,255}
swapMap's sixth value will replace all yellow in the image or {255,255,0}

If the image contains a shade of a color (e.g. dark red {100,0,0} dark cyan {0,120,120}) it will be shaded accordingly to the new color

Finally call colorSwap.swap() before drawing any images you want to swap.

Calling colorSwap.finish() will stop swapping colors for any images draw below the call.
