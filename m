From: jic23@kernel.org (Jonathan Cameron)
Date: Sat, 2 Dec 2017 11:30:05 +0000
Subject: [PATCH 0/5] meson_saradc fixes and minor improvements
In-Reply-To: <7hr2sjcmil.fsf@baylibre.com>
References: <20171031200147.14660-1-martin.blumenstingl@googlemail.com>
 <20171102150512.0000558c@huawei.com> <7hr2sjcmil.fsf@baylibre.com>
Message-ID: <20171202113005.4fbb128e@archlinux>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Mon, 27 Nov 2017 15:47:14 -0800
Kevin Hilman <khilman@baylibre.com> wrote:

> Hi Jonathan,
> 
> Jonathan Cameron <Jonathan.Cameron@huawei.com> writes:
> 
> > On Tue, 31 Oct 2017 21:01:42 +0100
> > Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:
> >  
> >> Meson8 and Meson8b require that the driver initializes the registers
> >> correctly, while on GXBB and newer this is done by the firmware.
> >> Thus the changes from this series are only relevant for Meson8 and
> >> Meson8b.
> >> 
> >> The first two patches are bugfixes:
> >> - the first patch fixes an issue where the SAR ADC would not work at
> >>   all
> >> - the second patch initializes the bandgrap register on Meson8 and
> >>   Meson8b (which is required for the SAR ADC to operate)
> >> 
> >> The third patch is mainly a cosmetic fix because we don't want to
> >> read/write registers that are not documented.
> >> 
> >> Patch four is purely cosmetic so the mainline driver uses the same
> >> settings as Amlogic's vendor kernel driver.
> >> 
> >> The last patch initializes the channel muxes. There are sane defaults
> >> for these in the hardware itself. However, some bootloaders are
> >> setting strange values - the result is that reading the ADC gives
> >> garbage values.
> >> I did not tag this as "fix" since in my opinion it's a feature for
> >> fixing broken bootloaders.
> >> 
> >> Tested on:
> >> - a Meson8m2 board (compatible with Meson8)
> >> - a Meson8b EC-100
> >> - on a Khadas VIM to ensure that the newer SoCs are still working
> >> 
> >> 
> >> Martin Blumenstingl (5):
> >>   iio: adc: meson-saradc: fix the bit_idx of the adc_en clock
> >>   iio: adc: meson-saradc: initialize the bandgap correctly on older
> >> SoCs iio: adc: meson-saradc: Meson8 and Meson8b do not have REG11 and
> >> REG13 iio: adc: meson-saradc: fix the clock frequency on Meson8 and
> >> Meson8b iio: adc: meson-saradc: program the channel muxes during
> >>     initialization
> >> 
> >>  drivers/iio/adc/meson_saradc.c | 92
> >> +++++++++++++++++++++++++++++++++++------- 1 file changed, 78
> >> insertions(+), 14 deletions(-)
> >>   
> > Series seems fine to me.  If no one else raises anything I'll pick this
> > up when I'm am back in the UK the week after next.  
> 
> Just a gentle ping on the status of this series as I'm not seeing it in
> linux-next.

Sure, I'll be sending out a pull request including the first couple
of patches later today at which time they'll hit Greg's tree and show
up in linux-next. (patches 1, 2 and 3)

The series was a spit of fixes and improvements that will take longer
as we'll have to wait for the fixes to go up to mainline and come
back to me - so will be a few weeks before I can apply those and they
won't hit linux-next for perhaps a week after that.
(this covers patches 4 and 5)

Jonathan

> 
> Thanks,
> 
> Kevin
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo at vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
