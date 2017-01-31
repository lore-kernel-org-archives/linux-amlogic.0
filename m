From: khilman@baylibre.com (Kevin Hilman)
Date: Tue, 31 Jan 2017 12:53:10 -0800
Subject: [GIT PULL] Amlogic 64-bit DT updates for v4.11
In-Reply-To: <20170131052206.GE16560@localhost> (Olof Johansson's message of
 "Mon, 30 Jan 2017 21:22:06 -0800")
References: <7hinowwg3u.fsf@baylibre.com> <20170131052206.GE16560@localhost>
Message-ID: <m260kvt0i1.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Olof Johansson <olof@lixom.net> writes:

> On Mon, Jan 30, 2017 at 10:35:33AM -0800, Kevin Hilman wrote:
>> Arnd, Olof,
>> 
>> Below is a pull request for Amlogic DT updates.
>> 
>> There is a minor conflict (moved DT node) with arm-soc/for-next with a
>> fix that has gone in already.  I could've rebased this branch on
>> v4.10-rc5 but decided to leave it based on an older -rc since that tends
>> to be the preference, and the conflict resolution is simple (just remove
>> completely the conflicting part in meson-gxbb.dtsi.)  If you prefer, I
>> can rebase on v4.10-rc5 and take care of the conflict myself.
>
> No worries, easy to patch up. However:
>
>> Kevin
>> 
>> The following changes since commit a121103c922847ba5010819a3f250f1f7fc84ab8:
>> 
>>   Linux 4.10-rc3 (2017-01-08 14:18:17 -0800)
>> 
>> are available in the git repository at:
>> 
>>   git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt64
>> 
>> for you to fetch changes up to 249a2243e97edcd2cb0bef01a934d4ba21fb167f:
>> 
>>   ARM64: dts: meson-gxl: add the pwm_ao_b pin (2017-01-27 11:00:41 -0800)
>> 
>> ----------------------------------------------------------------
>> Amlogic DT changes for v4.11
>> 
>> - pinctrl updates: PWM, UART and HDMI updates
>> - clock ID cleanups, exports for DT
>> - new board support: WeTek Hub and Play
>> - misc. cleanup/reorg for sharing with new GXM family
>> 
>> ----------------------------------------------------------------
>> Andreas F??rber (1):
>>       ARM64: dts: meson-gxbb-vega-s95: Add LED
>> 
>> Kevin Hilman (1):
>>       ARM64: dts: meson-gxl: rename Nexbox A95x for consistency
>> 
>> Martin Blumenstingl (7):
>>       ARM64: dts: meson-gx: move the SCPI and SRAM nodes to meson-gx
>>       ARM64: dts: meson-gxm: add SCPI configuration for GXM
>>       ARM64: dts: meson-gx: add the missing uart_AO_B
>>       ARM64: dts: meson-gx: add the serial CTS and RTS pin groups
>>       clk: gxbb: add the SAR ADC clocks and expose them
>>       ARM64: dts: meson-gx: add the missing pwm_AO_ab node
>>       ARM64: dts: meson-gxl: add the pwm_ao_b pin
>> 
>> Neil Armstrong (6):
>>       clk: meson-gxbb: Export HDMI clocks
>>       ARM64: dts: meson-gx: Add HDMI HPD/DDC pinctrl nodes
>>       ARM64: dts: meson-gxm: Rename q200 and q201 DT files for consistency
>>       dt-bindings: vendor-prefix: Add wetek vendor prefix
>>       ARM64: dts: meson-gxbb: Add support for WeTek Hub and Play
>>       dt-bindings: amlogic: Add WeTek boards
>> 
>> jbrunet (1):
>>       clk: gxbb: fix CLKID_ETH defined twice
>
> I'm a little confused of the mix of patches here. Sometimes we get a base clock
> branch that adds some of the dt-includes that is brought in as a dependency --
> and I usually argue that the platform should just use the numerical clock
> values for a release and then switch to the defined values once both sides have
> landed.
>
> However, that's not the case here, since you've gone full out and
> intermixed clk commits and dts commits. Was there a reason for doing so?

The reason was an agreement with Stephen Boyd these simple header
changes that affect DT includes would be acked by them (clock
maintainers) and merged via the platform trees.

I've Cc'd clock maintainers in case I misunderstood their preference
here.

Kevin
