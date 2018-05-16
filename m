From: xoduddk123@naver.com (=?utf-8?B?6raM7YOc7JiB?=)
Date: Wed, 16 May 2018 11:50:24 +0900
Subject: =?utf-8?B?J3VuZGVmaW5lZCBzeW1ib2w6IHVybF9idWZmZWRfcG9zJyBlcnJvciBpbiBsaWJhbXBsYQ==?=
 =?utf-8?B?eWVyLnNvLg==?=
Message-ID: <19f41c23829b3c16e1967c883a02412@cweb06.nm.nhnsystem.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi. all

I am building in yocto using gst-aml-plugins-1.0 and libamcodec.
        gst-aml-plugins : https://github.com/gcsuri/gst-aml-plugins
        libamcodec : http://sources.libreelec.tv/mirror/libamcodec/

I have successfully built gst-aml-plugins-1.0 and libamadec.
However, the following "undefined symbol: url_buffed_pos" error occurs in the plugins of gst-aml-plugins-1.0 installed. 


root at test:~# cat /etc/os-release
ID="poky"
NAME="Poky (Yocto Project Reference Distro)"
VERSION="2.4.1 (rocko)"
VERSION_ID="2.4.1"
PRETTY_NAME="Poky (Yocto Project Reference Distro) 2.4.1 (rocko)"
root at test:~#
root at test:~# ls -al /usr/lib/gstreamer-1.0/libgstaml*
-rwxr-xr-x 1 root root 34796 May 14 22:46 /usr/lib/gstreamer-1.0/libgstamladec.so
-rwxr-xr-x 1 root root 13888 May 14 22:46 /usr/lib/gstreamer-1.0/libgstamlasink.so
-rwxr-xr-x 1 root root 34744 May 14 22:46 /usr/lib/gstreamer-1.0/libgstamlvdec.so
-rwxr-xr-x 1 root root 18060 May 14 22:46 /usr/lib/gstreamer-1.0/libgstamlvsink.so
root at test:~#
root at test:~# gst-inspect-1.0 /usr/lib/gstreamer-1.0/libgstamladec.so
(gst-inspect-1.0:304): GStreamer-WARNING **: Failed to load plugin '/usr/lib/gstreamer-1.0/libgstamladec.so': /usr/lib/libamplayer.so: undefined symbol: url_buffed_pos
Could not load plugin file: Opening module failed: /usr/lib/libamplayer.so: undefined symbol: url_buffed_pos
root at test:~#
root at test:~# gst-inspect-1.0 /usr/lib/gstreamer-1.0/libgstamlasink.so
(gst-inspect-1.0:305): GStreamer-WARNING **: Failed to load plugin '/usr/lib/gstreamer-1.0/libgstamlasink.so': /usr/lib/libamplayer.so: undefined symbol: url_buffed_pos
Could not load plugin file: Opening module failed: /usr/lib/libamplayer.so: undefined symbol: url_buffed_pos
root at test:~#
root at test:~# gst-inspect-1.0 /usr/lib/gstreamer-1.0/libgstamlvdec.so
(gst-inspect-1.0:306): GStreamer-WARNING **: Failed to load plugin '/usr/lib/gstreamer-1.0/libgstamlvdec.so': /usr/lib/libamplayer.so: undefined symbol: url_buffed_pos
Could not load plugin file: Opening module failed: /usr/lib/libamplayer.so: undefined symbol: url_buffed_pos
root at test:~#
root at test:~# gst-inspect-1.0 /usr/lib/gstreamer-1.0/libgstamlvsink.so
(gst-inspect-1.0:307): GStreamer-WARNING **: Failed to load plugin '/usr/lib/gstreamer-1.0/libgstamlvsink.so': /usr/lib/libamplayer.so: undefined symbol: url_buffed_pos
Could not load plugin file: Opening module failed: /usr/lib/libamplayer.so: undefined symbol: url_buffed_pos
root at test:~#
root at test:~# gst-inspect-1.0 | grep aml
root at test:~#
root at test:~# ldd /usr/lib/libamplayer.so
        libamadec.so => /usr/lib/libamadec.so (0xb6e04000)
        libm.so.6 => /lib/libm.so.6 (0xb6d81000)
        libc.so.6 => /lib/libc.so.6 (0xb6c45000)
        libamavutils.so => /usr/lib/libamavutils.so (0xb6c2e000)
        libpthread.so.0 => /lib/libpthread.so.0 (0xb6c05000)
        libasound.so.2 => /usr/lib/libasound.so.2 (0xb6b21000)
        librt.so.1 => /lib/librt.so.1 (0xb6b0a000)
        libdl.so.2 => /lib/libdl.so.2 (0xb6af7000)
        /lib/ld-linux-armhf.so.3 (0xb6fa2000)
root at test:~#

I also found the same error in the ODROID forum.
https://forum.odroid.com/viewtopic.php?t=22451#p163852

The url_buffed_pos function is defined in amffmpeg.
Do I have to link amffmpeg when using libamplayer?

Regards 
Kwon
