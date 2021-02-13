work/3DBenchy_dated.stl: work/3DBenchy.stl work/date.stl
	xvfb-run -a -s "-screen 0 800x600x24" meshlabserver -i work/3DBenchy.stl work/date.stl -o work/3DBenchy_dated.stl -s src/flatten.mlx
work/date.stl: src/date.scad
	openscad -o work/date.stl src/date.scad
