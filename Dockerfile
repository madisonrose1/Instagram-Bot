# Madisonrose1 - Insta
# Copyright (C) 2021-2022 madisonrose1
# This file is a part of < https://github.com/madisonrose1/Instagram-Bot/ >
# PLease read the GNU Affero General Public License in <https://github.com/madisonrose1/Instagram-Bot/blob/main/LICENSE/>.

FROM madisonrose1/Instagram-Bot:main

# set timezone
ENV TZ=Asia/Kolkata

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    # cloning the repo and installing requirements.
    && git clone https://github.com/madisonrose1/Instagram-Bot.git /root/madisonrose1/ \
    && pip3 install --no-cache-dir -r root/madisonrose1/requirements.txt \
    && pip3 install av --no-binary av

# Railway's banned dependency
RUN if [ ! $RAILWAY_STATIC_URL ]; then pip3 install --no-cache-dir yt-dlp; fi

# changing workdir
WORKDIR /root/madisonrose1/

# start the bot
CMD ["bash", "startup"]
