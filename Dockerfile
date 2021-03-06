# Use an custom pdflatex as parent
FROM pdflatex

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
ADD . /app

#ENV TZ=Europe/Berlin
#RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

#install nginx and wand
RUN apt-get update && apt-get install -y \
libmagickwand-dev \
#nginx \
python3 \
python3-pip 

#latex
#texlive \
#texlive-lang-english \
#texlive-lang-german \
#texlive-latex-base \
#texlive-latex-recommended \
#texlive-latex-extra 




# Install any needed packages specified in requirements.txt
RUN pip3 install --trusted-host pypi.python.org -r requirements.txt

# Make port 5432 available to the world outside this container
EXPOSE 5432

#COPY nginx.conf /etc/nginx
#RUN chmod +x ./start.sh
#RUN chmod -R a+rw ./data

# Run app.py when the container launches
CMD ["python3","schilder.py"]
