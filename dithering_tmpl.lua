@dithering
--label:加工
--track@fade_percentage:透明度,0,100,0,0.1
--track@fineness:細かさ,0,100,100,1
--[[pixelshader@dithering:
{{.Dithering}}
]]

obj.pixelshader("dithering", "object", {"object"}, {fade_percentage, fineness}, "copy")

@dithering_z
--label:加工
--check@is_offscrean:オフスクリーン描画,1
--track@start_z:開始Z座標,-1024,100000,-512,1
--track@end_z:終了Z座標,-1024,100000,-1024,1
--track@fineness:細かさ,0,100,100,1
--[[pixelshader@dithering_z:
{{.DitheringZ}}
]]

if is_offscrean == 1 then
    obj.effect("オフスクリーン描画")
end
obj.pixelshader("dithering_z", "object", {"object"}, {start_z, end_z, obj.z, fineness}, "copy")

@dithering_camera
--label:加工
--value@cam_layer:カメラ制御レイヤー,1
--track@start_z:開始距離,0,100000,100,1
--track@end_z:終了距離,0,100000,0,1
--track@fineness:細かさ,0,100,100,1
--[[pixelshader@dithering_camera:
{{.DitheringCamera}}
]]

-- 自身の値が取れてしまう？
local cam_x = obj.getvalue(string.format("layer%d.x", cam_layer))
local cam_y = obj.getvalue(string.format("layer%d.y", cam_layer))
local cam_z = obj.getvalue(string.format("layer%d.z", cam_layer))

obj.pixelshader("dithering_camera", "object", {"object"}, {start_z, end_z, obj.x, obj.y, obj.z, cam_x, cam_y, cam_z, fineness}, "copy")
