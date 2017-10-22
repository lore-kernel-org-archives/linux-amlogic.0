From: sjg@chromium.org (Simon Glass)
Date: Sun, 22 Oct 2017 16:36:10 +0200
Subject: [PATCH u-boot 1/3] net: phy: Add Amlogic Meson GXL Internal PHY
 support
In-Reply-To: <1508313732-19282-2-git-send-email-narmstrong@baylibre.com>
References: <1508313732-19282-1-git-send-email-narmstrong@baylibre.com>
 <1508313732-19282-2-git-send-email-narmstrong@baylibre.com>
Message-ID: <CAPnjgZ1-oU0E1-tH-Z3mu0snsYBt87p_FDnJ5hgP1fLU8nXoNQ@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 18 October 2017 at 10:02, Neil Armstrong <narmstrong@baylibre.com> wrote:
> The Amlogic Meson GXL/GXM families embeds an internal RMII Ethernet PHY.
>
> The PHY acts as a generic PHY but needs a slight configuration right
> before it's configuration.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/net/phy/Kconfig     |  3 +++
>  drivers/net/phy/Makefile    |  1 +
>  drivers/net/phy/meson-gxl.c | 57 +++++++++++++++++++++++++++++++++++++++++++++
>  drivers/net/phy/phy.c       |  3 +++
>  include/phy.h               |  1 +
>  5 files changed, 65 insertions(+)
>  create mode 100644 drivers/net/phy/meson-gxl.c

We really should create a uclass for PHY drivers before adding any
more of these.

Regards,
Simon
