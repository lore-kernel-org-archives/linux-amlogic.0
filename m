From: narmstrong@baylibre.com (Neil Armstrong)
Date: Mon, 23 Apr 2018 16:29:07 +0200
Subject: Fwd: [U-Boot] [PATCH 1/1] mmc: avoid division by zero in
 meson_mmc_config_clock - Please, consider for v2018.05-rc2
In-Reply-To: <e3f276ba-586f-5435-0447-3e00efba5411@baylibre.com>
References: <e3f276ba-586f-5435-0447-3e00efba5411@baylibre.com>
Message-ID: <a1a6cf2d-93d9-4b0c-23c1-a0177d3b81ed@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org


Hi All,

Sorry to top-post, but could this patch go into master for next release ?

Currently all the Amlogic boards are broken on master becaus eof this issue.

Thanks,
Neil

-------- Forwarded Message --------
Subject: Re: [U-Boot] [PATCH 1/1] mmc: avoid division by zero in meson_mmc_config_clock - Please, consider for v2018.05-rc2
Date: Wed, 11 Apr 2018 16:39:08 +0200
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
To: Heinrich Schuchardt <xypron.glpk@gmx.de>, Jaehoon Chung <jh80.chung@samsung.com>
CC: Vagrant Cascadian <vagrant@debian.org>, u-boot at lists.denx.de, Tom Rini <trini@konsulko.com>, open list:ARM/Amlogic Meson... <linux-amlogic@lists.infradead.org>

Hi Jaehoon,

On 10/04/2018 18:01, Heinrich Schuchardt wrote:
> On 03/24/2018 03:57 PM, Heinrich Schuchardt wrote:
>> On 03/18/2018 01:03 AM, Vagrant Cascadian wrote:
>>> On 2018-03-17, Heinrich Schuchardt wrote:
>>>> The Odroid C2 fails to read from mmc with U-Boot v2018.03.
>>>> The change avoids a division by zero.
>>>>
>>>> The fix was suggested by Jaehoon in
>>>> https://lists.denx.de/pipermail/u-boot/2018-January/318577.html
>>>
>>> Thanks!
>>>
>>> Works for me with odroid-c2 on u-boot 2018.03.
>>>
>>> Without the patch, mmc access immediately hangs the board.
>>>
>>> Tested-by: Vagrant Cascadian <vagrant@debian.org>
>>>
>>>
>>> live well,
>>>   vagrant
>>>
>>>> Reported-by: Vagrant Cascadian <vagrant@debian.org>
>>>> Suggested-by: Jaehoon Chung <jh80.chung@samsung.com>
>>>> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
>>>> ---
[...]
>>>> -- 
>>>> 2.14.2
>>
>> Hello Jaehoon,
>>
>> will you pick the patch?
>>
>> Best regards
>>
>> Heinrich
>>
> 
> Hello Jaehoon,
> 
> since v2018.03 the Odroid C2 cannot be booted with U-Boot. This patch
> fixes it and has been adopted by Debian:
> https://packages.debian.org/de/buster/u-boot
> 
> Could you, please, consider it for v2018.05-rc2.
> 
> Best regards
> 
> Heinrich
> 
It also affects the other Amlogic platforms : P212, LibreTech-CC and Khadas-Vim, thus 2018.03 is broken for these platforms.

Thanks,
Neil

-- 
Neil Armstrong
Embedded Linux Software Engineer
BayLibre - At the Heart of Embedded Linux
www.baylibre.com
