From: khilman@baylibre.com (Kevin Hilman)
Date: Mon, 27 Nov 2017 15:47:14 -0800
Subject: [PATCH 0/5] meson_saradc fixes and minor improvements
In-Reply-To: <20171102150512.0000558c@huawei.com> (Jonathan Cameron's message
 of "Thu, 2 Nov 2017 15:05:12 +0000")
References: <20171031200147.14660-1-martin.blumenstingl@googlemail.com>
 <20171102150512.0000558c@huawei.com>
Message-ID: <7hr2sjcmil.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Jonathan,

Jonathan Cameron <Jonathan.Cameron@huawei.com> writes:

> On Tue, 31 Oct 2017 21:01:42 +0100
> Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:
>
>> Meson8 and Meson8b require that the driver initializes the registers
>> correctly, while on GXBB and newer this is done by the firmware.
>> Thus the changes from this series are only relevant for Meson8 and
>> Meson8b.
>> 
>> The first two patches are bugfixes:
>> - the first patch fixes an issue where the SAR ADC would not work at
>>   all
>> - the second patch initializes the bandgrap register on Meson8 and
>>   Meson8b (which is required for the SAR ADC to operate)
>> 
>> The third patch is mainly a cosmetic fix because we don't want to
>> read/write registers that are not documented.
>> 
>> Patch four is purely cosmetic so the mainline driver uses the same
>> settings as Amlogic's vendor kernel driver.
>> 
>> The last patch initializes the channel muxes. There are sane defaults
>> for these in the hardware itself. However, some bootloaders are
>> setting strange values - the result is that reading the ADC gives
>> garbage values.
>> I did not tag this as "fix" since in my opinion it's a feature for
>> fixing broken bootloaders.
>> 
>> Tested on:
>> - a Meson8m2 board (compatible with Meson8)
>> - a Meson8b EC-100
>> - on a Khadas VIM to ensure that the newer SoCs are still working
>> 
>> 
>> Martin Blumenstingl (5):
>>   iio: adc: meson-saradc: fix the bit_idx of the adc_en clock
>>   iio: adc: meson-saradc: initialize the bandgap correctly on older
>> SoCs iio: adc: meson-saradc: Meson8 and Meson8b do not have REG11 and
>> REG13 iio: adc: meson-saradc: fix the clock frequency on Meson8 and
>> Meson8b iio: adc: meson-saradc: program the channel muxes during
>>     initialization
>> 
>>  drivers/iio/adc/meson_saradc.c | 92
>> +++++++++++++++++++++++++++++++++++------- 1 file changed, 78
>> insertions(+), 14 deletions(-)
>> 
> Series seems fine to me.  If no one else raises anything I'll pick this
> up when I'm am back in the UK the week after next.

Just a gentle ping on the status of this series as I'm not seeing it in
linux-next.

Thanks,

Kevin
