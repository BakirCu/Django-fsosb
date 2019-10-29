def embed_video(video_path):
    index = 0
    video_ch = []
    while index < len(video_path) and video_path[index] != "=":
        index += 1
    index += 1
    while index < len(video_path):
        video_ch.append(video_path[index])
        index += 1
    return ''.join(video_ch)
