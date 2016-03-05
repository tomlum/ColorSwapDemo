function love.load()
	require "colorSwap"
	love.graphics.setDefaultFilter("nearest")
	example = love.graphics.newImage("example.png")
	font = love.graphics.newFont(40)
	love.graphics.setFont(font)
	color = 0
	setColorSwap({{1,0,0,1}, {0,1,0,1}, {0,0,1,1}, {0,1,1,1}})
end

function love.keypressed(key)
	if key == "space" then
		color = (color+1)%4
		if color == 0 then 
			setColorSwap({{1,0,0,1}, {0,1,0,1}, {0,0,1,1}, {0,1,1,1}})
		elseif color == 1 then
			setColorSwap({{.1,.3,.7,1}, {.5,.5,1,1}, {1,.9,.7,1},{1,.9,.5,1}})
		elseif color == 2 then
			setColorSwap({{1,1,.7,1}, {.7,.1,.7,1}, {.1,.7,.7,1},{1,.5,.5,1}})
		elseif color == 3 then
			setColorSwap({{1,.2,.4,1}, {.8,.8,.8,1}, {.2,.9,.5,1},{.2,.5,.1,1}})
		end
	end
end

function love.draw()
	swapColors()
	love.graphics.draw(example,0,0,0,40,40)
	love.graphics.print("Press Space",500,10)
end