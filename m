From: moore@free.fr (Chris Moore)
Date: Mon, 15 May 2017 11:28:35 +0200
Subject: DT: newbie questions
Message-ID: <cda48375-3c3e-8871-2598-8405b387aaa4@free.fr>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi,

Sorry for these newbie questions :(

I would like to add support for the cheap Chinese KI PLUS S905 boxes 
which seem very popular.
They are re-branded (or cloned) by several different vendors.
In particular the most serious seem to be:-
VideoStrong (http://www.videostrong.com/product.asp?sid=257)
Acemax 
(http://www.acemax.net.cn/droid-world/droid-box/hybrid-android-dvb-t2-dvb-s2/kii-pro-ki-plus-s2-t2-combo-149.html#.WRls_GjyiUk)

I actually have an Xtreamer mxV (http://www.xtreamer.net/mxv) which 
seems to be an exact clone.

My first question is what to put in the compatible line.
I could put:
a) compatible = "videostrong,kiplus", "acemax,kiplus", "xtreamer,mxv", 
"amlogic,meson-gxbb";
but there are many other KI PLUS vendors so I could maybe omit the vendor:
b) compatible = "kiplus", "xtreamer,mxv", "amlogic,meson-gxbb";
but this poses the problem of what to put in amlogic.txt which seems to 
require a vendor.

My second question is what to base my patch on:
Should it be v4.12/dt64 in Kevin's linux-amlogic.git?

My third question concerns the SDIO WiFi.
The WiFi chip seems to vary between boards.
My board has a Realtek RTL8189ETV.
I note that its (unfortunately out of tree) driver is loaded even if the 
DT specifies a Broadcom chip.
Is it really necessary to specify the chip in the DT?
(It seems that the SDIO, like the PCI and USB buses, recognizes 
connected devices by their IDs.)

My final question is how to submit my patch.
Should I send an RFC to this list for approval before possibly spamming 
others?

I thank you in advance for your replies and your tolerance.

Cheers,
Chris Moore
