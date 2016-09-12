우분투 하드디스크 자동 마운트하기
우분투(리눅스) 환경에서 여러 하드 혹은 파티션을 사용할 경우
특히 해당 파티션이 NTFS 타입인 경우 부팅 후 매번 마운트 해주어야 사용 가능하다.
부팅 시 자동으로 마운트 시키는 방법은 아래와 같다.

마운트될 폴더를 생성한다. 리눅스에서 모든 하드디스크는 /media 경로에 하나의 디렉토리(파일) 형태로 마운트된다.
sudo mkdir /media/원하는이름

이제 마운트하고자 하는 하드(파티션)의 UUID를 알아내야 한다.
sudo fdisk -l      # 파티션 정보 보기
ls -l /dev/disk/by-uuid      # 전체 하드디스크 파티션의 UUID 확인

위에서 알아낸 UUID를 /etc/fstab에 추가한다.
sudo vi /etc/fstab

UUID=알아낸UUID /media/만든폴더 ntfs-3g rw,nosuid,nodev,noatime,allow_other 0 1

재부팅하면 자동으로 마운트된 하드를 확인할 수 있을 것이다.
