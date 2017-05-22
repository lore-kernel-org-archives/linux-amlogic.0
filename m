From: balbes-150@yandex.ru (Oleg)
Date: Mon, 22 May 2017 15:12:33 +0300
Subject: S805/S812 Device Tree upstreaming
In-Reply-To: <CAFBinCBhVGabCo-2j-sd=5JSPa2xsQ4a1Tn=iMC6QuzxrnSfQQ@mail.gmail.com>
References: <CAFBinCA__tiW03VrMzbfAFUOkKY1VoZG=OK7BNfZyfm05HOLng@mail.gmail.com>
 <939ef72d-a4e5-7535-2252-d607158bd0fe@yandex.ru>
 <a9179db4-1db6-3c8d-de34-cee4454f07de@yandex.ru>
 <CAFBinCCAxjtreC0EtpWKxrx9=zqJmv6w4fEhg_aZZNT_G3qARg@mail.gmail.com>
 <9b803bac-4ce8-689c-44a8-40532e294dae@yandex.ru>
 <CAFBinCDXx5j_W5WtLSd8q0RDp7TXezCdDNHtXp5mYNnY=jR5wA@mail.gmail.com>
 <fdc29cda-b67d-add9-9c8a-f0a61db537da@yandex.ru>
 <CAFBinCBhVGabCo-2j-sd=5JSPa2xsQ4a1Tn=iMC6QuzxrnSfQQ@mail.gmail.com>
Message-ID: <60f432cf-ea24-9158-a5ab-f967f19393ed@yandex.ru>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Martin
1. Updated the source code to the latest version of meson-mx 
integration-4.12-20170520
2. Collected test image with the new kernel. 2. Checked both settings in 
dtb (HIGH and LOW).
While the result is the same.
3. The output from the console log and with the command "md".
4 Contents of directories emmc sd sdio (from the working image Armbian 
with kernel 3.14 ,
which features Wi-Fi and wired network with USB and HDMI)

https://yadi.sk/d/KvSjVEK-3JQF7c .


Is it possible to transfer the wired network settings of dtb data from 
s905 (p200)
  in the dtb settings for MXIII-Plus or are they not compatible ?
