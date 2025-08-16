package main

import (
	"os"
	"text/template"
)

func main() {
	ditheringHlslBytes, err := os.ReadFile("dithering.hlsl")
	if err != nil {
		panic(err)
	}

	ditheringZHlslBytes, err := os.ReadFile("dithering_z.hlsl")
	if err != nil {
		panic(err)
	}

	tmpl, err := template.ParseFiles("dithering_tmpl.lua")
	if err != nil {
		panic(err)
	}

	anm2, err := os.Create("@dithering.anm2")
	if err != nil {
		panic(err)
	}
	defer anm2.Close()

	err = tmpl.Execute(anm2, map[string]string{
		"Dithering":  string(ditheringHlslBytes),
		"DitheringZ": string(ditheringZHlslBytes),
	})
	if err != nil {
		panic(err)
	}

	ditheringCameraHlslBytes, err := os.ReadFile("dithering_camera.hlsl")
	if err != nil {
		panic(err)
	}

	cameraTmpl, err := template.ParseFiles("dithering_camera_tmpl.lua")
	if err != nil {
		panic(err)
	}

	cameraAnm2, err := os.Create("@dithering_camera.anm2")
	if err != nil {
		panic(err)
	}
	defer cameraAnm2.Close()

	err = cameraTmpl.Execute(cameraAnm2, map[string]string{
		"DitheringCamera": string(ditheringCameraHlslBytes),
	})
	if err != nil {
		panic(err)
	}
}
