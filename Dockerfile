FROM rakudo-star:2019.03
LABEL "maintainer"="Robert Crews <rcrews@mac.com>"

RUN true \
  && export TERM=dumb \
  && export DEBIAN_FRONTEND=noninteractive \
  && apt-get update \
  && apt-get upgrade -y -q perl \
  && apt-get install -y -q \
    apt-utils \
    dpkg-dev \
    libperl-dev \
    liblocale-codes-perl \
    libterm-readline-gnu-perl \
    liburi-escape-xs-perl \
    libxml-libxml-perl \
    libxml-libxslt-perl \
    libhtml-html5-builder-perl \
    libhtml-html5-parser-perl \
    libhtml-html5-writer-perl \
  && apt-get clean

RUN true \
  && export PERL_MM_USE_DEFAULT=1 \
  && cpan install \
    Pod::Coverage \
    YAML \
    inc::latest \
    CPAN::Meta::Check \
    CPAN::Perl::Releases \
    Capture::Tiny \
    Sub::Name \
    CPAN \
  && cpan install \
    Readonly \
    Try::Tiny \
    Object::AUTHORITY \
    HTML::HTML5::DOM \
  && rm -rf /root/.cpan

RUN true \
  && zef install \
    Inline::Perl5 \
  && rm -rf /root/.zef

WORKDIR /project
CMD ["perl6"]
