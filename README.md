# Breakdown
A tool to download music and break it down into separate audio tracks. This is just a nice docker wrapper around youtube-dl and spleeter.

## Requires

- docker
- powershell

Why powershell to invoke the docker image? So you can run it from Linux or Windoze.

## Output

The song and all tracks broken down into bass, drums, piano, vocals and other.

## Example

```
breakdown.ps1 -url https://www.youtube.com/watch?v=8SPtkjMUkGk -title test -stems 2
```

`-stems` can be 2, 4 or 5
the default is 5

### Output

2 Stems:
```
{title}-vocals.mp3
{title}-accompaniment.mp3
```

4 Stems:
```
{title}-bass.mp3
{title}-drums.mp3
{title}-other.mp3
{title}-vocals.mp3
```

5 Stems:
```
{title}-bass.mp3
{title}-drums.mp3
{title}-other.mp3
{title}-vocals.mp3
{title}-piano.mp3
```

The following files will created
```
{title}.mp3
{title}.json
```

## Build locally

```
./build.sh
```
