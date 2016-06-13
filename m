From: khilman@baylibre.com (Kevin Hilman)
Date: Mon, 13 Jun 2016 10:55:07 -0700
Subject: [PATCH 0/7] Add support for AmLogic GXBB clock controller
In-Reply-To: <575A8472.3090403@baylibre.com> (Neil Armstrong's message of
 "Fri, 10 Jun 2016 11:12:18 +0200")
References: <1465518774-26924-1-git-send-email-mturquette@baylibre.com>
 <575A8472.3090403@baylibre.com>
Message-ID: <m2eg81vuro.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> On 06/10/2016 02:32 AM, Michael Turquette wrote:
>> This series is based on the AmLogic Meson8b rewrite/cleanup[0]. The
>> AmLogic GXBB is an ARMv8-based SoC, fed by a 24MHZ xtal, and it provides
>> several PLLs, muxes dividers and gates to drive CPUs and peripherals.
>> 
>> While based on the Meson8b clock controller driver, this series adds
>> supports for Multi-phase Locked Loops (mpll) and support for PLLs with
>> fractional rates.
>> 
>> This series introduces the clock controller driver for the gxbb,
>> including the DT binding description and accompanying change in the gxbb
>> dtsi. Only three clocks are exposed via the headers in the dt-bindings
>> include-chroot. More can be added later, but since these values
>> represent an ABI I wanted to start small. I'm not sure about the names
>> for the gate clocks, so I especially tried to avoid putting those in the
>> binding (with the exception of the Ethernet gate, which Kevin has needed
>> for a while).
>> 
>> Notably missing from this driver are the branch clocks (e.g. the mess of
>> muxes and dividers that come after the PLLs and MPLLs). I could have
>> guessed how things were wired up from the resources available to me, but
>> I'm hoping to get some improved documentation soon and then I'll go back
>> and fill them in.
>> 
>> [0] http://lkml.kernel.org/g/1465518467-23939-1-git-send-email-mturquette at baylibre.com
>> 
>> Michael Turquette (7):
>>   clk: meson: add peripheral gate macro
>>   clk: meson: add mpll support
>>   clk: meson: fractional pll support
>>   clk: gxbb: Document bindings for the GXBB clock controller
>>   clk: gxbb: add AmLogic GXBB clk controller driver
>>   arm64: amlogic: select gxbb clk driver
>>   arm64: dts: gxbb clock controller
>> 
>>  .../bindings/clock/amlogic,gxbb-clkc.txt           |  36 +
>>  arch/arm64/Kconfig.platforms                       |   2 +
>>  arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        |   7 +
>>  drivers/clk/meson/Kconfig                          |   7 +
>>  drivers/clk/meson/Makefile                         |   3 +-
>>  drivers/clk/meson/clk-mpll.c                       |  94 ++
>>  drivers/clk/meson/clk-pll.c                        |  32 +-
>>  drivers/clk/meson/clkc.h                           |  39 +
>>  drivers/clk/meson/gxbb.c                           | 954 +++++++++++++++++++++
>>  drivers/clk/meson/gxbb.h                           | 271 ++++++
>>  include/dt-bindings/clock/gxbb-clkc.h              |  12 +
>>  11 files changed, 1454 insertions(+), 3 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
>>  create mode 100644 drivers/clk/meson/clk-mpll.c
>>  create mode 100644 drivers/clk/meson/gxbb.c
>>  create mode 100644 drivers/clk/meson/gxbb.h
>>  create mode 100644 include/dt-bindings/clock/gxbb-clkc.h
>> 
>
> Mike,
>
> I did not receive the 5/7 on the mailing list, can you resend ?
>

Neil, did you end up receiving this?

The mailing-list had a size limit that caught this one.  I bumped it up
and approved the mail, so it shold've gone through, and shows in
patchwork: https://patchwork.kernel.org/patch/9170173/

Kevin
