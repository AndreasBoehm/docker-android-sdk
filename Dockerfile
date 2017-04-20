FROM openjdk:8-jdk

ENV ANDROID_TOOLS_ZIP https://dl.google.com/android/repository/tools_r25.2.3-linux.zip
ENV ANDROID_HOME /opt/android-sdk-linux

ENV PATH $PATH:$ANDROID_HOME/tools
ENV PATH $PATH:$ANDROID_HOME/tools/bin
ENV PATH $PATH:$ANDROID_HOME/platform-tools

# install base tools
RUN dpkg --add-architecture i386 && \
    apt-get update -y && \
    apt-get install -y bsdtar libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 && \
    apt-get autoremove -y && \
    apt-get clean

# download and install android SDK
RUN mkdir -p $ANDROID_HOME && curl -sL $ANDROID_TOOLS_ZIP | bsdtar -xvf- -C $ANDROID_HOME 

# make sdkmanager executable
RUN chmod +x /opt/android-sdk-linux/tools/bin/sdkmanager

# install required android tools
RUN echo y | sdkmanager --verbose "tools" "platform-tools" "build-tools;25.0.2"

# install required android repositories
RUN sdkmanager --verbose "extras;android;m2repository" "extras;google;google_play_services" "extras;google;m2repository"

# install required android platforms
RUN sdkmanager --verbose "platforms;android-23" "platforms;android-25"
