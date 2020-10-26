 FROM jupyter/datascience-notebook

# Build tools and project directory and install pip requirements
WORKDIR /home/project
COPY project/requirements.txt .
RUN pip install -q --upgrade pip
RUN pip install -q -r requirements.txt

# Setup jupyter extensions
RUN jupyter contrib nbextension install --InstallContribNbextensionsApp.log_level=30 --user
ENV EXT="code_prettify/code_prettify toc2/main splitcell/splitcell spellchecker/main addbefore/main runtools/main livemdpreview/livemdpreview"
RUN for each in $EXT; do jupyter nbextension enable $each --InstallContribNbextensionsApp.log_level=30; done

# Setup jupyter theme
RUN jt -cellw 1400 -fs 10 -nfs 11 -tfs 11 -T -N -t oceans16
EXPOSE 8888

# Copy files
COPY project /home/project