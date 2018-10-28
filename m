From: jic23@kernel.org (Jonathan Cameron)
Date: Sun, 28 Oct 2018 19:02:23 +0000
Subject: [PATCH 2/7] iio: adc: meson-saradc: add support for the chip's
 temperature sensor
In-Reply-To: <CAFBinCAy_1R01RH=JcT6Fhf_ScDvZ2g3cYdaT-s=VsVQGN+LNg@mail.gmail.com>
References: <20181028122629.10144-1-martin.blumenstingl@googlemail.com>
 <20181028122629.10144-3-martin.blumenstingl@googlemail.com>
 <20181028163506.4305f0b8@archlinux>
 <CAFBinCAy_1R01RH=JcT6Fhf_ScDvZ2g3cYdaT-s=VsVQGN+LNg@mail.gmail.com>
Message-ID: <20181028190223.35fb8f49@archlinux>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sun, 28 Oct 2018 18:02:28 +0100
Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

Hi Martin,
..

> > > +     if (buf[3] & MESON_SARADC_EFUSE_BYTE3_IS_CALIBRATED)
> > > +             priv->temperature_sensor_calibrated = true;
> > > +     else
> > > +             priv->temperature_sensor_calibrated = false;  
> >
> > Could just assign?
> >         priv->temperature_sensor_calibrated =
> >                 buf[3] & MEESON_SARADC_EFUSE_BYTE3_IS_CALIBRATED;  
> I could change this but (personal preference here) my eyes are not
> trained to read variable assignments where the value is broken into a
> new line
> looking back at it I could also remove the whole "else" block as
> "false" is obviously the default value
> 
> let me know whether you'd like me to change this, then I'll do that for v2

I don't feel strongly on any of the options.. Take your pick!

> 
> > > +
> > > +     priv->temperature_sensor_coefficient = buf[2] & trimming_mask;
> > > +
> > > +     upper_adc_val = FIELD_GET(MESON_SARADC_EFUSE_BYTE3_UPPER_ADC_VAL,
> > > +                               buf[3]);
> > > +
> > > +     priv->temperature_sensor_adc_val = buf[2];
> > > +     priv->temperature_sensor_adc_val |= upper_adc_val << BITS_PER_BYTE;
> > > +     priv->temperature_sensor_adc_val >>= trimming_bits;
> > > +
> > > +     kfree(buf);
> > > +
> > > +     return 0;
> > > +}
> > > +  
> > ...  
> 
> 
> Regards
> Martin
