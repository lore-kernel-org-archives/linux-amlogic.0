From: trini@konsulko.com (Tom Rini)
Date: Sun, 29 Oct 2017 08:04:11 -0400
Subject: [PATCH u-boot 1/3] net: phy: Add Amlogic Meson GXL Internal PHY
 support
In-Reply-To: <0921db70-a4bb-ea2e-d273-44280a2acc3c@baylibre.com>
References: <1508313732-19282-1-git-send-email-narmstrong@baylibre.com>
 <1508313732-19282-2-git-send-email-narmstrong@baylibre.com>
 <CAPnjgZ1-oU0E1-tH-Z3mu0snsYBt87p_FDnJ5hgP1fLU8nXoNQ@mail.gmail.com>
 <0921db70-a4bb-ea2e-d273-44280a2acc3c@baylibre.com>
Message-ID: <20171029120411.GV12185@bill-the-cat>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Thu, Oct 26, 2017 at 03:39:17PM +0200, Neil Armstrong wrote:
> On 22/10/2017 16:36, Simon Glass wrote:
> > On 18 October 2017 at 10:02, Neil Armstrong <narmstrong@baylibre.com> wrote:
> >> The Amlogic Meson GXL/GXM families embeds an internal RMII Ethernet PHY.
> >>
> >> The PHY acts as a generic PHY but needs a slight configuration right
> >> before it's configuration.
> >>
> >> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> >> ---
> >>  drivers/net/phy/Kconfig     |  3 +++
> >>  drivers/net/phy/Makefile    |  1 +
> >>  drivers/net/phy/meson-gxl.c | 57 +++++++++++++++++++++++++++++++++++++++++++++
> >>  drivers/net/phy/phy.c       |  3 +++
> >>  include/phy.h               |  1 +
> >>  5 files changed, 65 insertions(+)
> >>  create mode 100644 drivers/net/phy/meson-gxl.c
> > 
> > We really should create a uclass for PHY drivers before adding any
> > more of these.
> > 
> > Regards,
> > Simon
> > 
> 
> Hi Simon,
> 
> Sure, this would indeed be necessary, but is it necessary to wait for
> the uclass to merge mode PHYs ?

Well, this isn't going in before the next release (along with all of the
other amlogic stuff, which looks good otherwise btw).  So, do you have
time to take a pass at a uclass?

-- 
Tom
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20171029/9ed4e0fe/attachment.sig>
