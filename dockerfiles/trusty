FROM ryotarai/omnibus:trusty
RUN git config --global user.email "ryota.arai+itamae@gmail.com" && git config --global user.name "Itamae Builder"
ADD . /work
WORKDIR /work
RUN bundle install -j4
RUN bundle exec omnibus build itamae
