FROM ilsf1004/edge-image:2.1

COPY ./face_recogniser.pkl /facenet/face-recognition/model

WORKDIR /facenet/face-recognition

ENTRYPOINT ["python3"]

CMD ["-m","inference.video_classifier"]
