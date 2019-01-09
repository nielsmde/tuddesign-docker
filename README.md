# tuddesign-docker

Dockerfile to compile latex documents, including the tud-design classes.

# Setup

1. Install and setup docker on the host machine for the current user
2. Clone the repository and navigate to its root directory
3. Run `docker build -t tuddesign .`
4. Use the scripts `bin/pdflatex` and `bin/latexmk` to compile latex documents
5. Optional: Do `source bin/activate` to add the `bin` directory to your `PATH`

When you use the proveded scripts, the docker container can only access the current working directory. 
Hence, all tex files must be located in the working directory or subdirectories thereof. 
Filenames should be given as relative paths, for example:

    $ source bin/activate
    $ cd /path/to/tex/files
    $ pdflatex ./main.tex
