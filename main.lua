function love.load()
	love.graphics.setBackgroundColor(255,255,255)
	require "colorSwap"
	require "hsb"
	love.window.setMode(300,350)
	love.graphics.setDefaultFilter("nearest")
	example = love.graphics.newImage("example.png")
	font = love.graphics.newFont(40)
	love.graphics.setFont(font)
	colors = {
		{0,255,255,255},
		{(1/6)*255,255,255,255},
		{(2/6)*255,255,255,255},
		{(3/6)*255,255,255,255},
		{(4/6)*255,255,255,255},
		{(5/6)*255,255,255,255}
	}
end

function love.update()
	for i,colors in ipairs(colors) do
		colors[1] = colors[1] + 1
		if colors[1]+.002 >= 255 then
			colors[1] = 0
		end
	end
	colorSwap.send({
		HSB2RGB(colors[1][1],colors[1][2],colors[1][3],colors[1][4]),
		HSB2RGB(colors[2][1],colors[2][2],colors[2][3],colors[2][4]),
		HSB2RGB(colors[3][1],colors[3][2],colors[3][3],colors[3][4]),
		HSB2RGB(colors[4][1],colors[4][2],colors[4][3],colors[4][4]),
		HSB2RGB(colors[5][1],colors[5][2],colors[5][3],colors[5][4]),
		HSB2RGB(colors[6][1],colors[6][2],colors[6][3],colors[6][4]),
		})
end


function love.draw()
	colorSwap.set()
	love.graphics.draw(example,0,0,0)
	love.graphics.print("Press Space",500,10)
	colorSwap.unset()
end