date = "210213";

translate([-21, 0, 8.4])
rotate(-90, [0, 0, 1])
linear_extrude(0.8)
text(
    date,
    font="DejaVu Sans Mono:style=Bold",
    size=3.5,
    halign="center",
    valign="center",
    $fn=120
);
