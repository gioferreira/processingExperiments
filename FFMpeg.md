# FFMPEG Tools

## Making a Boomerang Like Video using ffmpeg

### Accelerate a video with ffmpeg

```
ffmpeg -i input.mp4 -filter:v "setpts=0.25*PTS" output.mp4
```

Where `setpts=0.5*PTS` is doubling and `setpts=0.25*PTS` is multiplying by 4 (1/n)

### Reverse back and forth with ffmpeg

```
ffmpeg -i output.mp4 -filter_complex "[0:v]reverse,fifo[r];[0:v][r] concat=n=2:v=1 [v]" -map "[v]" output2.mp4
```


### @TODO

Make this bash script

```
boomerang -args inputFile.mp4 outputFile.mp4
-m--mirror
-s--speedup:X # onde X = velocidade tipo x = 2 speed * 2

boomerang -mms:2

[SPEED] = 1/X

mirror =  ffmpeg -i [INPUT] -filter_complex "[0:v]reverse,fifo[r];[0:v][r] concat=n=2:v=1 [v]" -map "[v]" [OUTPUT]

speedup = ffmpeg -i [INPUT] -filter:v "setpts=[SPEED]*PTS" [OUTPUT]

mirror | mirror | speedup
```
