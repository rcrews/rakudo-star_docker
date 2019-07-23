# Perl 6 Docker

This project is based on the
[`rakudo-star:2019.03`](https://hub.docker.com/_/rakudo-star)
Docker image.

The point here is to create a rakudo-star Perl 6 image that contains a
solid and properly configured Perl 5 (v5.24.1, in this case) to explore
parsing XML, among the other things Perl 5 excels at, with Perl 6:

    use XML::LibXML:from<Perl5>;

See [`parse_xml.p6`](parse_xml.p6).

The image uses Perl 5.24 because that's the default Perl 5 in the
[`buildpack-deps:stretch-scm`](https://hub.docker.com/_/buildpack-deps)
image on which `rakudo-star:2019.03` is based. The image will
correspondingly update to Perl 5.28 when/if the official rakudo-star
image changes to `buildpack-deps:buster-scm`.

# Pull

To pull and use this docker container:

    $ docker pull rcrews/rakudo-star:latest

# Build

To build an image from this Dockerfile:

    $ docker build -t rcrews/rakudo-star:latest .

# Usage

To run the Perl 6 REPL:

    $ docker run --rm -it rcrews/rakudo-star
    > say 'Hello, Perl!'
    Hello, Perl!

To run a Perl 6 one-liner:

    $ docker run --rm rcrews/rakudo-star perl6 -e 'say "Hello!"'

To run a script in the current directory:

    $ docker run --rm --mount type=bind,source=$(pwd),target=/project rcrews/rakudo-star /project/parse_xml.p6

# To Do

Pull requests welcome:

* Change so scripts don't run as root within the container. (Actually,
  is this still a thing or has modern Docker resolved the security
  problems with running processes as root within images?)

* Add more/other Debian, Perl 5, or Perl 6 modules? Here is a list of
  Perl 5 modules precompiled for Debian 9:
  [Software Packages in "stretch", Subsection perl](https://packages.debian.org/stretch/perl/)

<!--
* Clear zef cache. Is there a zef option to default to Yes for
  interactive questions, something like a -y flag? I think the commands
  to clear the caches are the following, but these require manually
  entering Y, so they don't work in the Dockerfile:

      $ zef nuke RootDir && zef nuke TempDir && zef nuke StoreDir
-->

* Is there a better way to clear the Perl 5 cpan cache than just
  removing the `~/.cpan` directory?

* Are there more modules I should add to either Perl 5 or Perl 6? In
  particular, are there more precompiled Perl 5 modules I should add with
  apt-get? Any missing
  "[modern](http://modernperlbooks.com/books/modern_perl_2016/index.html)"
  Perl 5 modules? In fact, aside from the `XML::LibXML` and `XML::LibXSLT`,
  added with apt-get, are *any* additional Perl 5 modules needed, even
  `Readonly` and `Try::Tiny` that are currently being added?

* When building Perl 5 modules, several warn about characters not mapping
  to ASCII. Would like to change the configuration so the warnings don't
  appear. The characters in question are clearly not ASCII characters so
  the messages are accurate; however, why are the module builds telling
  me about it? Would it help if I configured the container to use a
  UTF-8 terminal or a different locale? (See
  [Configure System Locale on Debian 9](https://www.rosehosting.com/blog/configure-system-locale-on-debian-9/).)

* Seems that for the purpose of this image, basing the image off a
  `rakudo-star` image that inherits `FROM`
  [`perl:latest`](https://hub.docker.com/_/perl) might be better,
  but I don't see how that's possible without creating an unnecessary
  clone of the `rakudo-star` Dockerfile.

# References

Docker Hub:
[https://hub.docker.com/r/rcrews/rakudo-star/](https://hub.docker.com/r/rcrews/rakudo-star/)

Rakudo Star Docker:
[https://github.com/perl6/docker/](https://github.com/perl6/docker/)

Perl 6: [http://perl6.org/](http://perl6.org/)

# License

Copyright 2019 by Robert Crews

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

[http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
