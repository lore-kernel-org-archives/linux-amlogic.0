From: moore@free.fr (Chris Moore)
Date: Tue, 16 May 2017 12:51:38 +0200
Subject: DT: newbie questions
In-Reply-To: <33e616ca-fb13-343b-f464-4a934c5ed4fe@baylibre.com>
References: <cda48375-3c3e-8871-2598-8405b387aaa4@free.fr>
 <00d73329-ff75-5041-7400-1f52f18ca46e@free.fr>
 <33e616ca-fb13-343b-f464-4a934c5ed4fe@baylibre.com>
Message-ID: <4d4ccb81-b6cd-9cd9-c525-033ffe75d79b@free.fr>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi,

Thank you, Neil, for your informative reply.

Le 16/05/2017 ? 10:08, Neil Armstrong a ?crit :
> Hi Chris,
>
> On 05/16/2017 06:18 AM, Chris Moore wrote:
>> Le 15/05/2017 ? 11:28, Chris Moore a ?crit :
>>> Hi,
>>>
>>> Sorry for these newbie questions :(
>>>
>>> I would like to add support for the cheap Chinese KI PLUS S905 boxes which seem very popular.
>>> They are re-branded (or cloned) by several different vendors.
>>> In particular the most serious seem to be:-
>>> VideoStrong (http://www.videostrong.com/product.asp?sid=257)
>>> Acemax (http://www.acemax.net.cn/droid-world/droid-box/hybrid-android-dvb-t2-dvb-s2/kii-pro-ki-plus-s2-t2-combo-149.html#.WRls_GjyiUk)
>>>
>>> I actually have an Xtreamer mxV (http://www.xtreamer.net/mxv) which seems to be an exact clone.
>>>
>>> My first question is what to put in the compatible line.
>>> I could put:
>>> a) compatible = "videostrong,kiplus", "acemax,kiplus", "xtreamer,mxv", "amlogic,meson-gxbb";
>>> but there are many other KI PLUS vendors so I could maybe omit the vendor:
>>> b) compatible = "kiplus", "xtreamer,mxv", "amlogic,meson-gxbb";
>>> but this poses the problem of what to put in amlogic.txt which seems to require a vendor.
>> Another solution to the multi-vendor problem could be to create a pseudo-vendor "generic" (or similar) and then have:
>> c) compatible = "generic,kiplus", "xtreamer,mxv", "amlogic,meson-gxbb";
>> Would this be acceptable?
> Sorry, the generic is not really acceptable here since there is always a vendor, and adding a new
> vendor is easy and well accepted.
>
> The point with Amlogic based Set-Top-Boxes is that they are 99% based on a reference design given
> from Amlogic, and only the SBCs (Odroid-C*, Khadas, NanoPi K2) differs.
>
> Here is the list of Amlogic Reference Designs I am aware of :
> - S905 : P200 and P201
> - S905X : P212
> - S905D : P230 and P231
> - S912 : Q200 and Q201
>
> When pushing S905 based boxes, we were not really aware of that, but starting with S905X we started
> to base the board DTS on the Reference Design DTSI like the Khadas Vim and the Wetek Hub/Play2.
>
> I'm aware there is a lot of work to clean up all the other S905/S905X and S912 based boxes... but
> the majority of boxes should run unchanged with the reference design DTS.

The KI PLUS has GXBB (S905), Fast (100Mbs) Ethernet, 1 GiB RAM, four USB 
ports and often Realtek RTL8189ETV WiFi.

The P20x boards are probably the closest but they have Gigabit Ethernet 
and the KI PLUS only has Fast Ethernet.
(Indeed the stock uBoot prompt and some Linux boot messages contain the 
string "p20x".)
So, although obviously derived from these reference designs as you say, 
Ethernet doesn't work with the P200 and P201 DTS.
Obviously working Ethernet is essential.

The only existing GXBB DTS with 1GiB RAM and Fast Ethernet is the GXBB 
version of the Nexbox A95x.
But USB on the KI PLUS doesn't work with this DTS.

So I really do need a new DTS.

Cheers,
Chris
