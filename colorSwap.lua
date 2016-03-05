--tomlum w/ indiebrew.me

--Swappable Colors (in order)
--{1,0,0}
--{0,1,0}
--{0,0,1}
--{0,1,1}
--{1,0,1}
--{1,1,0}
--Shades of these colors work also.
--Any image file that has for an rgb value of {0,126,126}
--will get shaded a darker shade of the according swapped color

colorSwap = {}
colorSwap.shader = love.graphics.newShader(
	[[
	extern vec4 swapMap[6];
	vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords){

		vec4 tc = Texel(texture, texture_coords);
		if (tc[1] == 0 && tc[2] == 0){
			return swapMap[0]*tc[0];
		}
		else if (tc[0] == 0 && tc[2] == 0){
			return swapMap[1]*tc[1];
		}
		else if (tc[0] == 0 && tc[1] == 0){
			return swapMap[2]*tc[2];
		}
		else if (tc[0] == 0 && tc[1] == tc[2]){
			return swapMap[3]*tc[1];
		}
		else if (tc[1] == 0 && tc[0] == tc[2]){
			return swapMap[4]*tc[0];
		}
		else if (tc[2] == 0 && tc[0] == tc[1]){
			return swapMap[5]*tc[0];
		}
		return tc;
	}
	]] 
	)

--An Example swapMap
--{{1,.2,.5,1}, {1,0,0,1}}
--Swaps Red with {1,.2,.5,1}
--Swaps Green with {1,0,0,1}
function colorSwap.set(swapMap)
	colorSwap.shader:send("swapMap", 
		swapMap[1] or {255,255,255,255}, 
		swapMap[2] or {255,255,255,255}, 
		swapMap[3] or {255,255,255,255}, 
		swapMap[4] or {255,255,255,255}, 
		swapMap[5] or {255,255,255,255}, 
		swapMap[6] or {255,255,255,255}
		)
end

--Place before drawing something you want to swap colors for
function colorSwap.swap()
	love.graphics.setShader(colorSwap.shader)
end


function colorSwap.finish()
	love.graphics.setShader()
end