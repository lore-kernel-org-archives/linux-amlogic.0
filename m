From: trini@konsulko.com (Tom Rini)
Date: Mon, 26 Nov 2018 07:58:51 -0500
Subject: [PATCH u-boot v2 00/19] Amlogic Meson cleanup for AXG SoC support
In-Reply-To: <258ad68f-a711-9998-71aa-a3521709cf44@baylibre.com>
References: <20181122090740.29739-1-narmstrong@baylibre.com>
 <258ad68f-a711-9998-71aa-a3521709cf44@baylibre.com>
Message-ID: <20181126125851.GR11247@bill-the-cat>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Mon, Nov 26, 2018 at 09:59:33AM +0100, Neil Armstrong wrote:
> Hi Tom,
> 
> On 22/11/2018 10:07, Neil Armstrong wrote:
> > This patchset will refactor the Amlogic Meson SoC support in order to
> > easily add support for the Amlogic AXg SoC family, and later the G12x SoCs.
> > 
> > In order :
> > - Cleanup the mach-meson configs
> > - Move board support to reference design common boards
> > - Move board Kconfig into mach-meson
> > - Add AXG pinctrl & clock support
> > - Add AXG device tree and mach-meson support
> > - Add support for S400 reference design
> > - Do a final factorization of the code
> > - Add USB boot support in U-boot
> > 
> > At the end of the patches, the board code is lighter and we maintain
> > only the reference designs, where each board will differ in the defconfig.
> > 
> > It will be simpler to add custom board support for future boards with
> > more changes against the reference designs.
> > 
> > The complete AXG support depends on the :
> > - mmc: meson-gx: Add AXG compatible
> > - net: designware: add meson meson axg compatible
> > patches submitted to the U-Boot mailing list.Hi 
> 
> Would it be simpler if I send you a pull-request with this patchset
> and all dependencies ?
> 
> Tell me if you have any comments on the patchset and the 2
> dependencies !

Sure, lets try that.  Do you want to get a tree setup on git.denx.de or
will you use github/etc?  Traditionally we host things on git.denx.de
but at least Alex has been doing the EFI and RPi stuff from his github
instead, and I'm fine taking a signed tag to pull from either.  Thanks!

-- 
Tom
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20181126/96bab64e/attachment.sig>
