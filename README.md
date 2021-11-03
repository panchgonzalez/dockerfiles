# Dockerfiles

## `cudavision`

Useful docker images with CUDA enabled OpenCV and FFmpeg.

**Base Image**

`docker pull panchgonzalez/cudavision-base:latest`

- OpenCV (compiled from source with CUDA support)
- FFmpeg (with CUDA acceleration)
- Python3

**Dev Image**

`docker pull panchgonzalez/cudavision-dev:latest`

- Builds on `cudavision-base`
- Contains useful vison-related python packages