From: jbrunet@baylibre.com (Jerome Brunet)
Date: Mon, 19 Feb 2018 09:07:17 +0100
Subject: [RFC PATCH v1] pinctrl: meson: meson8b: fix requesting GPIOs
 greater than GPIOZ_3
In-Reply-To: <CAFBinCC=Oo0BOvSzp59xriTse3ViLd24RiGNSF0uKEwHnrXj+g@mail.gmail.com>
References: <20180124002738.32338-1-martin.blumenstingl@googlemail.com>
 <1516782493.2344.48.camel@baylibre.com>
 <CAFBinCCBHcjMRJ5sd9qWnL3FDEcHxp96rahgcYmSS3q-af-9Pw@mail.gmail.com>
 <1516805576.2344.86.camel@baylibre.com>
 <CAFBinCAC8d=qEf-DSkp8bjwRJCwCjuHfhVO-9h+mY3zHEy0fcg@mail.gmail.com>
 <CAFBinCC=Oo0BOvSzp59xriTse3ViLd24RiGNSF0uKEwHnrXj+g@mail.gmail.com>
Message-ID: <1519027637.2883.118.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sat, 2018-02-17 at 20:44 +0100, Martin Blumenstingl wrote:
> Hi Jerome,
> 
> On Wed, Jan 24, 2018 at 6:54 PM, Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
> > Hi Jerome,
> > 
> > On Wed, Jan 24, 2018 at 3:52 PM, Jerome Brunet <jbrunet@baylibre.com> wrote:
> > > On Wed, 2018-01-24 at 11:10 +0100, Martin Blumenstingl wrote:
> > > > Hi Jerome,
> > > > 
> > > > On Wed, Jan 24, 2018 at 9:28 AM, Jerome Brunet <jbrunet@baylibre.com> wrote:
> > > > > On Wed, 2018-01-24 at 01:27 +0100, Martin Blumenstingl wrote:
> > > > > > Meson8b is a cost reduced variant of the Meson8 SoC. It's package size
> > > > > > is smaller than Meson8.
> > > > > > Unfortunately there are a few key differences which cannot be seen
> > > > > > without close inspection of the code and the public S805 data-sheet:
> > > > > > - the GPIOX bank is missing the GPIOX_12, GPIOX_13, GPIOX_14 and
> > > > > >   GPIOX_15 GPIOs
> > > > > > - the GPIOY bank is missing the GPIOY_2, GPIOY_4, GPIOY_5, GPIOY_15 and
> > > > > >   GPIOY_16 GPIOs
> > > > > > - the GPIODV bank is missing all GPIOs except GPIODV_9, GPIODV_24,
> > > > > >   GPIODV_25, GPIODV_26, GPIODV_27, GPIODV_28 and GPIODV_29
> > > > > > - the GPIOZ bank is missing completely
> > > > > > - there is a new GPIO bank called "DIF"
> > > > > > - (all other pads exist on both, Meson8 and Meson8b)
> > > > > > 
> > > > > > The pinctrl-meson driver internally uses struct meson_bank, which
> > > > > > assumes that the GPIOs are continuous, without any holes in between.
> > > > > > This also matches with how the registers work:
> > > > > > - GPIOX_0 for example uses bit 0 for switching this pad between
> > > > > >   input/output, configuring pull-up/down, etc.
> > > > > > - GPIOX_16 uses bit 16 for switching this pad between input/output,
> > > > > >   configuring pull-up/down/, etc
> > > > > > GPIOX_16 uses bit 16 even though GPIOX12..15 don't exist. (This is
> > > > > > probably the reason why Meson8b inherits the dt-bindings - with all GPIO
> > > > > > IDs - from Meson8)
> > > > > > This means that Meson8b only has 83 actual GPIO lines. Without any holes
> > > > > > there would be 130 GPIO lines in total (120 are inherited from Meson8
> > > > > > plus 10 new from the DIF bank).
> > > > > > 
> > > > > > The pinctrl framework handles holes in the pin list fine, which can be
> > > > > > seen in debugfs:
> > > > > > $ cat /sys/kernel/debug/pinctrl/c1109880.pinctrl/pins
> > > > > > pin 9 (GPIOX_9)  c1109880.pinctrl
> > > > > > pin 10 (GPIOX_10)  c1109880.pinctrl
> > > > > > pin 11 (GPIOX_11)  c1109880.pinctrl
> > > > > > pin 16 (GPIOX_16)  c1109880.pinctrl
> > > > > > pin 17 (GPIOX_17)  c1109880.pinctrl
> > > > > 
> > > > > Hi Martin,
> > > > > 
> > > > > While working on this controller a few weeks ago, I have seen that our current
> > > > > design does not tolerate having holes in the declared PINS. This is something
> > > > > that predate the changes mentioned here.
> > > > > 
> > > > > I'm not a big fan of the this overrides_ngpio here, I'm sure it fixes your
> > > > > problem but it seems a bit hacky, don't you think ?
> > > > 
> > > > this is the reason why I sent it as RFC - I'm open to better solutions!
> > > > 
> > > > > I would prefer either of these 2 approach:
> > > > > 
> > > > > * Update the binding and kill the necessary pins. We are still figuring out
> > > > > those chips, which is why the bindings are marked as un-stable. If sharing the
> > > > > binding with meson8 was a mistake, now is the time to fix it.
> > > > 
> > > > let's say we produce a header file which does not contain GPIOX_12:
> > > > this would be nice since it gives compile errors if non-existent GPIOs
> > > > are used (instead of failing only at run-time)
> > > > 
> > > > however, the problem is meson8b_cbus_banks (annotated here to make it
> > > > easier to read):
> > > > BANK("X", /* name */
> > > >           GPIOX_0, GPIOX_21, /* first and last GPIO */
> > > >           97, 118, /* first and last IRQ */
> > > >           4,  0, /* pull-up/down enable register and bit offset */
> > > >           4,  0, /* pull-up/down configuration register and bit offset */
> > > >           0,  0, /* input/output direction register and bit offset */
> > > >           1,  0, /* output value register and bit offset */
> > > >           2,  0), /* input value register and bit offset */
> > > > 
> > > > let's say we want to configure GPIOX_0 as an input:
> > > > - we need to find the "offset" of this pad within the bank -> 0
> > > > - find the input/output direction register -> 0
> > > > - find the bit in that register: bit 0 + pad offset 0 = 0
> > > > - we clear bit 0 in register 0
> > > > 
> > > > with the current code configuring GPIOX_16 as input works like this:
> > > > - we need to find the "offset" of this pad within the bank -> 16
> > > > - find the input/output direction register -> 0
> > > > - find the bit in that register: bit 0 + pad offset 16 = 16
> > > > - we clear bit 16 in register 0
> > > 
> > > If offset calculation is really the problem, nothing is stopping you from the
> > > splitting BANK in two. With your example of GPIOX_12...15 missing:
> > > 
> > > BANK("X1", /* name */
> > >            GPIOX_0, GPIOX_11, /* first and last GPIO */
> > >            97, 108, /* first and last IRQ */
> > >            4,  0, /* pull-up/down enable register and bit offset */
> > >            4,  0, /* pull-up/down configuration register and bit offset */
> > >            0,  0, /* input/output direction register and bit offset */
> > >            1,  0, /* output value register and bit offset */
> > >            2,  0), /* input value register and bit offset */
> > > 
> > > BANK("X2", /* name */
> > >            GPIOX_16, GPIOX_21, /* first and last GPIO */
> > >            113, 118, /* first and last IRQ */
> > >            X,  Y, /* pull-up/down enable register and bit offset */
> > >            X,  Y, /* pull-up/down configuration register and bit offset */
> > >            Z,  XX, /* input/output direction register and bit offset */
> > >            FOO,  0, /* output value register and bit offset */
> > >            BAR,  0), /* input value register and bit offset */
> > 
> > nice thinking :)
> > the only solution I could come up with was to change the MESON_PIN
> > definition to something like:
> > #define MESON_PIN(pad, pullen_bit, pull_bit, direction_bit,
> > output_bit, input_bit, irq_num)
> > 
> > that however means that we would have to change a lot of code in all
> > pinctrl drivers
> > 
> > > > 
> > > > let's assume that we removed GPIOX_12...15 from Meson8b
> > > > GPIOX_16 could now have the same value that was assigned to GPIOX_12
> > > > before (= 12)
> > > > but how do we now know the offset of GPIOX_16?
> > > > if we don't consider it in the calculation above we would end up
> > > > writing to bit 12 (instead of bit 16).
> > > > 
> > > > we could still cleanup the header file but leave the IDs of the
> > > > existing GPIOs untouched (so GPIOX_16 would still be 16).
> > > 
> > > I don't really get the point of doing so, especially is this patch is still
> > > needed in the end.
> > > 
> > > > however, that means that this patch is still needed because our last
> > > > ID would be DIF_4_N (= value 129) again (so with holes our total count
> > > > is still 130).
> > > > with that we wouldn't even break the DT ABI
> > > 
> > > While I prefer changing the bindings over the 'over_ngpio' tweak, it is not my
> > > favorite solution.
> > > 
> > > > 
> > > > > * If meson8b is indeed a cost reduction, it is likely to be same the approach as
> > > > > s905x vs s905d: The D version is the same SoC with less ball pad but, as far as
> > > > > we know, the logic is still there on the silicium (same die), it is just not
> > > > > routed to the outside world. Both version share the same pinctrl driver (gxl).
> > > > > The pad not routed to the outside world can just be considered "internal pads"
> > > > 
> > > > there are a few differences between Meson8 and Meson8b, see also [0]:
> > > > - Meson8 (and Meson8m2) CPU cores: 4x Cortex-A9
> > > > - Meson8b CPU cores: 4x Cortex-A5
> > > > - Meson8 (and Meson8m2) GPU: Mali-450MP8
> > > > - Meson8b GPU: Mali-450MP4
> > > > - Meson8 (and Meson8m2) package size: 19mm x 19 mm, LFBGA
> > > > - Meson8b package size: 12mm x 12 mm, LFBGA
> > > > 
> > > > the pinctrl register layout seems to be *mostly* compatible between
> > > > Meson8 and Meson8b.
> > > > unfortunately it's not entirely compatible, here is one example:
> > > > - Meson8: GROUP(uart_tx_b1, 6, 23),
> > > > - Meson8b: GROUP(uart_tx_b1, 6, 19),
> > > > - Meson8: GROUP(eth_mdc, 6, 5),
> > > > - Meson8b: GROUP(eth_mdc, 6, 9),
> > > > 
> > > > > Long story short, if meson8 and meson8b share the same bindings, maybe they
> > > > > should also share the driver. If they can't share the driver because they are
> > > > > definitely incompatible, maybe they should not share the same bindings
> > > > 
> > > > based on what I have seen so far I believe that they should not share
> > > > the same bindings
> > > 
> > > It looks to me to be same gpio/pinconf IP with a few pads not exposed to the
> > > outside world, so I think they could share the bindings, and apparently fair
> > > part of the driver data.
> > > 
> > > Apparently amlogic tweaked a bit the pinmux. With the current architecture of
> > > our pinctrl driver, it should be fairly easy to register 2  drivers sharing
> > > everything but the GROUP table (and maybe the FUNCS if necessary)
> > > 
> > > If possible, I would be more in favor of this last solution, as we could kill
> > > one the pinctrl-meson8.c file, which are mostly a copy/paste of one another.
> > > While fixing you issue, we would end up with less code to maintain and save a
> > > bit of memory.
> > > 
> > > Do you see any other big issue with this approach ?
> > 
> > I would have to go through the whole list of pads to see what the
> > actual differences are
> 
> I tried to automate this as far as possible with the attached script
> you can use it like this:
> - first get the gpio.c files from the Amlogic 3.10 kernel for Meson8
> and Meson8b: [0] and [1]
> - ./list-meson8-pinmux-reg-bits.sh path/to/meson8/gpio.c | sort -u > meson8.txt
> - ./list-meson8-pinmux-reg-bits.sh path/to/meson8b/gpio.c | sort -u >
> meson8b.txt
> - diff -Naur meson8.txt meson8b.txt > diff.patch
> - (the resulting diff is attached)
> - compare the Meson8 documentation (found in a .csv file, see [2])
> with the public Meson8b datasheet (see [3])
> 
> the major differences are:
> - DIF_TTL bank only exists on Meson8b
> - GPIOZ bank only exists on Meson8
> - HDMI_TTL bank only exists on Meson8b (not supported by our mainline driver)
> - some of the Ethernet pins are using the GPIOH bank on Meson8b while
> Meson8 has these in the GPIOZ bank
> - Meson8b has various SPI pins in the GPIOH bank while Meson8 has them
> in the GPIOZ bank
> - Meson8 only has pins for one TSin interface, Meson8b seems to
> support two TSin interfaces
> 
> smaller differences are:
> - the LCD_* pins (maybe even all of the LCD support) in GPIODV only
> exists on Meson8
> - Meson8b has the I2C_A pins on GPIODV_24 and GPIODV_25 (Meson8 has
> multiple pins for this in the GPIOZ bank)
> - Meson8b has the I2C_B pins on GPIODV_26 and GPIODV_27 (Meson8 has
> these on GPIOZ_2 and GPIOZ_3)
> - Meson8b has the I2C_C pins on GPIODV_28 and GPIODV_29 (Meson8 two
> chices: either GPIOY_0 and GPIOY_1 or GPIOZ_4 and GPIOZ_5)
> - the XTAL_24M_OUT signal uses GPIODV_29 on Meson8b but GPIOX_11 on Meson8
> - Meson8b can output UART_CTS_B on GPIOX_10 - Meson8 supports GPIODV_26 instead
> - Meson8b can output UART_RTS_B on GPIOX_20 - Meson8 supports GPIODV_27 instead
> - Meson8b can output SPI_SS0 on GPIOX_20 - Meson8 supports GPIOZ_9 instead
> 
> not checked yet:
> - Meson8b seems to have a few more bits in BOOT_8 BOOT_10 and BOOT_18
> - Meson8b seems to have a few more bits in GPIOAO_2, GPIOAO_3,
> GPIOAO_6, GPIOAO_7, GPIOAO_9, GPIOAO_10 and GPIOAO_13
> - GPIOY_0, GPIOX_4, GPIOX_5, GPIOX_6, GPIOX_7, GPIOX_8, GPIOX_9
> - the changes (there are quite a few) in the GPIOY bank
> 
> notes for other pins I have randomly checked:
> - Meson8b's gpio.c has a function for GPIOX_0 at reg9[24] - this seems
> undocumented
> - Meson8b's gpio.c has a function for GPIOX_1 at reg9[23] - this seems
> undocumented
> - Meson8b's gpio.c has a function for GPIOX_2 at reg9[22] - this seems
> undocumented
> - Meson8b's gpio.c has a function for GPIOX_3 at reg9[21] - this seems
> undocumented
> 
> I'm not sure if we should try to create a unified pinctrl driver for
> Meson8 and Meson8b

Thanks the detailed summary Martin ! I agree with you. meson8b obviously derives
from meson8 but there is to many subtle differences to create unified driver ...
w/o adding spaghetti code around

Is the "2 banks" solution enough to solve the problem cleanly ?

If not and it still leaves problems to be solved in the future, maybe we would
be better off with different bindings for meson8 and meson8b ? and be done with
it ...


> so far we have:
> - meson_pmx_group are roughly 67% identical (meson_pmx_func depend on
> meson_pmx_group)
> - different pinctrl_pin_desc (due to different GPIO banks)
> - different IRQ numbering
> 
> so I wonder how much we would actually save by creating a unified
> Meson8/Meson8b pinctrl driver.
> 
> as a side-note: I found out that Meson8m2 has 10 pins which each add
> one function compared to Meson8, see: [4]
> I would integrate these into the Meson8 driver (if we keep separate
> drivers for Meson8 and Meson8b) when needed, because these definitely
> don't justify adding a new pinctrl driver
> 
> 
> Regards
> Martin
> 
> 
> [0] https://github.com/endlessm/linux-meson/blob/5cb4882cdda584878a29132aeb9a90497a121df9/arch/arm/mach-meson8/gpio.c
> [1] https://github.com/endlessm/linux-meson/blob/5cb4882cdda584878a29132aeb9a90497a121df9/arch/arm/mach-meson8b/gpio.c
> [2] https://github.com/endlessm/linux-meson/blob/5cb4882cdda584878a29132aeb9a90497a121df9/arch/arm/mach-meson8/tool/m8_gpio.csv
> [3] https://dn.odroid.com/S805/Datasheet/S805_Datasheet%20V0.8%2020150126.pdf
> [4] https://github.com/endlessm/linux-meson/blob/5cb4882cdda584878a29132aeb9a90497a121df9/arch/arm/mach-meson8/gpio.c#L242
