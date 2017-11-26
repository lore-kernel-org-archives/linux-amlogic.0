From: b.galvani@gmail.com (Beniamino Galvani)
Date: Sun, 26 Nov 2017 17:49:59 +0100
Subject: [PATCH 1/2] i2c: add Amlogic Meson driver
In-Reply-To: <CAPnjgZ16FmTk0ev5z=p5ng+SfhPWujkFF26_nFsAE8bdMQ0+QQ@mail.gmail.com>
References: <20171029090901.24299-1-b.galvani@gmail.com>
 <20171029090901.24299-2-b.galvani@gmail.com>
 <CAPnjgZ16FmTk0ev5z=p5ng+SfhPWujkFF26_nFsAE8bdMQ0+QQ@mail.gmail.com>
Message-ID: <20171126164959.GA28091@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Mon, Nov 20, 2017 at 08:36:34AM -0700, Simon Glass wrote:
> Hi Benjamin,
> 
> On 29 October 2017 at 03:09, Beniamino Galvani <b.galvani@gmail.com> wrote:
> >
> > Add a driver for the I2C controller available on Amlogic Meson SoCs.
> >
> > Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
> > ---
> >  arch/arm/include/asm/arch-meson/i2c.h |  11 ++
> >  drivers/i2c/Kconfig                   |   6 +
> >  drivers/i2c/Makefile                  |   1 +
> >  drivers/i2c/meson_i2c.c               | 263 ++++++++++++++++++++++++++++++++++
> >  4 files changed, 281 insertions(+)
> >  create mode 100644 arch/arm/include/asm/arch-meson/i2c.h
> >  create mode 100644 drivers/i2c/meson_i2c.c
> 
> Reviewed-by: Simon Glass <sjg@chromium.org>
> 
> But please look at the comments below.

Hi Simon,

I addressed your suggestions in a follow-up series, thanks.

> > +U_BOOT_DRIVER(i2c_meson) = {
> > +       .name = "i2c_meson",
> > +       .id   = UCLASS_I2C,
> > +       .of_match = meson_i2c_ids,
> > +       .probe = meson_i2c_probe,
> > +       .priv_auto_alloc_size = sizeof(struct meson_i2c),
> 
> I think meson_i2c_priv might be a better name since it indicates that
> it is driver-private data. But if you prefer the shorter name, that's
> fine with me.

I think I slightly prefer it, but both would be fine. Since the patch
is already applied, let's keep it as is?

Beniamino
