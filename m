From: afaerber@suse.de (=?UTF-8?Q?Andreas_F=c3=a4rber?=)
Date: Sun, 14 May 2017 13:37:28 +0200
Subject: [ANN] meson-tools v0.1 released
In-Reply-To: <06c1fd56-9bfa-ea93-6c64-94a374567b93@yandex.ru>
References: <e520f7e9-5d8a-3c50-5430-45a38f98ea5e@suse.de>
 <06c1fd56-9bfa-ea93-6c64-94a374567b93@yandex.ru>
Message-ID: <e407fbad-19b0-3691-2c76-e39abe0581f5@suse.de>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hello Oleg,

Am 08.05.2017 um 15:15 schrieb Oleg:
>> I have just made an initial v0.1 release of my meson-tools project:
>>
>> https://github.com/afaerber/meson-tools
>>
>> In particular the amlbootsig tool has successfully been used in the
>> openSUSE Open Build Service instance to create bootable images for the
>> Amlogic S905 based Hardkernel Odroid-C2, using mainline U-Boot as bl33.
>>
>> Usage and known limitations are described in its README.md.
>>
> Your tool is only to create a version of u-boot for Odroid C2
> or can try to use for all devices of the platform s905 ?

Please see the README.md at the above link. :)

amlbootsig has been tested with Odroid-C2 and by now NanoPi-K2, so it's
not limited to the Odroid-C2. However it won't work with "all" devices,
as my tool has less features (no encryption support) and may have bugs
for lack of a public description of the format.

As recently explained to someone with an S912 TV Box, feedback on
whether it produces the expected results for other devices as well is
appreciated. Some safety precautions were described in that mail:

http://lists.infradead.org/pipermail/linux-amlogic/2017-May/003433.html

Regards,
Andreas

P.S. If you have comments or questions, please keep me CC'ed so that I
notice. Thanks.

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N?rnberg, Germany
GF: Felix Imend?rffer, Jane Smithard, Graham Norton
HRB 21284 (AG N?rnberg)
