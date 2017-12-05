From: jbrunet@baylibre.com (Jerome Brunet)
Date: Tue, 05 Dec 2017 16:57:10 +0100
Subject: [PATCH net-next] net: phy: meson-gxl: cleanup by defining the
 control registers
In-Reply-To: <970919cd-cf0f-1782-22b8-46746a92fc43@amlogic.com>
References: <20171205093334.8261-1-jbrunet@baylibre.com>
 <970919cd-cf0f-1782-22b8-46746a92fc43@amlogic.com>
Message-ID: <1512489430.21892.3.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Tue, 2017-12-05 at 23:23 +0800, Yixun Lan wrote:
> > +static inline int meson_gxl_write_reg(struct phy_device *phydev,
> > +                                   unsigned int bank, unsigned int reg,
> > +                                   uint16_t value)
> > +{
> > +     int ret;
> > +
> > +     /* Enable Analog and DSP register Bank access by
> > +      * toggling TSTCNTL_TEST_MODE bit in the TSTCNTL register
> > +      */
> > +     ret = phy_write(phydev, TSTCNTL, 0);
> > +     if (ret)
> > +             goto out;
> > +     ret = phy_write(phydev, TSTCNTL, TSTCNTL_TEST_MODE);
> > +     if (ret)
> > +             goto out;
> > +     ret = phy_write(phydev, TSTCNTL, 0);
> > +     if (ret)
> > +             goto out;
> > +     ret = phy_write(phydev, TSTCNTL, TSTCNTL_TEST_MODE);
> > +     if (ret)
> > +             goto out;
> > +
> 
> how about just do the above enable procedure once?
> from the datasheet, the access won't be disabled if don't reset, or
> write to register TSTCNTL with TEST_MODE=0

It just seems more clean. This is way, the write function is self sufficient and
we can use it w/o making assumption about what happened out of it.
