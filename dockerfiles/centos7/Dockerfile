FROM ryotarai/omnibus:centos7
RUN yum makecache fast && yum install -y epel-release && yum install -y patch fakeroot rpm-build
RUN git config --global user.email "ryota.arai+itamae@gmail.com" && git config --global user.name "Itamae Builder"
ADD . /work
WORKDIR /work
RUN bundle install -j4
RUN bundle exec omnibus build itamae
