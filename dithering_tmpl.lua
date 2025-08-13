@dithering
--label:自作
--track@fade_percentage:透明度,0,100,0,0.1
--track@fineness:細かさ,0,100,100,1
--[[pixelshader@dithering:
{{.Dithering}}
]]

obj.pixelshader("dithering", "object", {"object"}, {fade_percentage, fineness}, "copy")

@dithering_z
--label:自作
--track@fade_percentage:透明度,0,100,0,0.1
--track@fineness:細かさ,0,100,100,1
--[[pixelshader@dithering_z:
{{.DitheringZ}}
]]

obj.pixelshader("dithering_z", "object", {"object"}, {fade_percentage, fineness}, "copy")

@dithering_camera
--label:自作
--track@fade_percentage:透明度,0,100,0,0.1
--track@fineness:細かさ,0,100,100,1
--[[pixelshader@dithering_camera:
{{.DitheringCamera}}
]]

obj.pixelshader("dithering_camera", "object", {"object"}, {fade_percentage, fineness}, "copy")
