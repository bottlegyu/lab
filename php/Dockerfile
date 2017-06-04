# php 실행환경 os 지정
FROM ubuntu:16.04

# 쉘명령
RUN apt-get update && apt-get -y install apt-utils && \
    locale-gen en_US.UTF-8 && update-locale

# 변수 설정
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV DEBIAN_FRONTEND noninteractive


RUN apt-get -y upgrade && apt-get update --fix-missing

# 자주쓰는 모듈 및 컴포저 설치
RUN apt-get -y install php7.0-fpm php7.0-dev mcrypt php7.0-mcrypt php7.0-mbstring php-pear apt-transport-https composer unzip

# php 설정 변경
RUN sed -i "s/display_errors = Off/display_errors = On/" /etc/php/7.0/fpm/php.ini && \
    sed -i "s/upload_max_filesize = .*/upload_max_filesize = 10M/" /etc/php/7.0/fpm/php.ini && \
    sed -i "s/post_max_size = .*/post_max_size = 12M/" /etc/php/7.0/fpm/php.ini && \
    sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php/7.0/fpm/php.ini && \
    sed -i -e "s/pid =.*/pid = \/var\/run\/php7.0-fpm.pid/" /etc/php/7.0/fpm/php-fpm.conf && \
    sed -i -e "s/error_log =.*/error_log = \/proc\/self\/fd\/2/" /etc/php/7.0/fpm/php-fpm.conf && \
    sed -i -e "s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php/7.0/fpm/php-fpm.conf && \
    sed -i "s/listen = .*/listen = 9000/" /etc/php/7.0/fpm/pool.d/www.conf && \
    sed -i "s/;catch_workers_output = .*/catch_workers_output = yes/" /etc/php/7.0/fpm/pool.d/www.conf

WORKDIR /var/www

# 9000 포트로 외부와 연결
EXPOSE 9000

#php fpm 7.0 실행
CMD ["php-fpm7.0"]
