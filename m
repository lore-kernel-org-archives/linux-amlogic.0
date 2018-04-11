From: narmstrong@baylibre.com (Neil Armstrong)
Date: Wed, 11 Apr 2018 16:39:08 +0200
Subject: [U-Boot] [PATCH 1/1] mmc: avoid division by zero in
 meson_mmc_config_clock - Please, consider for v2018.05-rc2
In-Reply-To: <09934d93-81d3-077e-6b1d-95ecd30e90e1@gmx.de>
References: <20180317224936.2040-1-xypron.glpk@gmx.de>
 <87muz6i716.fsf@aikidev.net> <c2793855-dd0e-343f-7a81-a318a6cee97c@gmx.de>
 <09934d93-81d3-077e-6b1d-95ecd30e90e1@gmx.de>
Message-ID: <e3f276ba-586f-5435-0447-3e00efba5411@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

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
