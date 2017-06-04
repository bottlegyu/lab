핵심은 php를 호출하는 요청은 php:9000으로 연결하라는것

여기서 주소대신 php라는 별칭을 사용하는 이유는 Docker Container는 생성할때에 ip주소를 자동으로 설정한다.
따라서 어떤 ip를 갖게될지 미리 알지 못하기때문에 Nginx Container 에서 php Container를 찾지못해 연결해 줄 수가 없는것이다.

docker-compose 에서는 links section을 이용하여 host name을 넘겨 이문제를 해결한다.
docker-compose 에서는 links에 정의된 Container의 이름과 IP 주소를 hosts파일에 기록한다.

그렇게 php:9000의 주소는 php container의 주소가 맵핑된다.
