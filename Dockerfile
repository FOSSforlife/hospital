# GCC support can be specified at major, minor, or micro version
# (e.g. 8, 8.2 or 8.2.0).
# See https://hub.docker.com/r/library/gcc/ for all supported GCC
# tags from Docker Hub.
# See https://docs.docker.com/samples/library/gcc/ for more on how to use this image
FROM gcc:latest

WORKDIR /usr/src

COPY . .
RUN cd SourceCode && ../Build.sh && cd ..

# For whatever reason, exec format doesn't work here, so I used shell format
# ENTRYPOINT ["sh", "/usr/src/SourceCode/project_\(g++\).exe"]
ENTRYPOINT /usr/src/Hospital.exe 

LABEL Name=cpsc462Project Version=0.0.1