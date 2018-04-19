From: srinivas.kandagatla@linaro.org (Srinivas Kandagatla)
Date: Thu, 19 Apr 2018 15:29:24 +0100
Subject: [PATCH 0/2] nvmem: meson-efuse: add write support
In-Reply-To: <1524147206.2601.104.camel@baylibre.com>
References: <20180316150113.9779-1-jbrunet@baylibre.com>
 <1524147206.2601.104.camel@baylibre.com>
Message-ID: <75866a94-c6e4-6537-b7d1-b5cae0519e61@linaro.org>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org



On 19/04/18 15:13, Jerome Brunet wrote:
> On Fri, 2018-03-16 at 16:01 +0100, Jerome Brunet wrote:
>> This changeset adds write support to meson efuse driver.
>> The first patch just changes the way the nvmem data are allocated w/o
>> any functional changes. The second patches actually adds write support.
>>
>> The memory being an OTP, it is safer if it remains read-only by default,
>> which is why I also submitted this DT patch [0].
>>
>> If a user knows what he is doing, it should be easy to remove the
>> read-only property from the board DT. This can be done in u-boot, before
>> starting linux:
>>
>>   > fdt rm /efuse read-only
>>
>> Tested on the gxl libretech-cc
> 
> Hi Srinivas,
> 
> Is this patchset ok with you ? Do you want to me to change something ?
> 
Patches look good to me, Can you rebase them on top of 4.17, I will send 
it to Greg once rc4 is out.

thanks,
srini
> Regards
> Jerome
> 
>>
>> [0]: https://lkml.kernel.org/r/20180316145021.8517-1-jbrunet at baylibre.com
>>
>> Jerome Brunet (2):
>>    nvmem: meson-efuse: remove econfig global
>>    nvmem: meson-efuse: add write support
>>
>>   drivers/nvmem/meson-efuse.c | 37 +++++++++++++++++++++++++++----------
>>   1 file changed, 27 insertions(+), 10 deletions(-)
>>
> 
