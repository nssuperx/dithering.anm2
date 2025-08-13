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

	ditheringCameraHlslBytes, err := os.ReadFile("dithering_camera.hlsl")
	if err != nil {
		panic(err)
	}

	tmpl, err := template.ParseFiles("dithering_tmpl.lua")
	if err != nil {
		panic(err)
	}

	outFile, err := os.Create("@dithering.anm2")
	if err != nil {
		panic(err)
	}
	defer outFile.Close()

	err = tmpl.Execute(outFile, map[string]string{
		"Dithering":       string(ditheringHlslBytes),
		"DitheringZ":      string(ditheringZHlslBytes),
		"DitheringCamera": string(ditheringCameraHlslBytes),
	})
	if err != nil {
		panic(err)
	}
}
