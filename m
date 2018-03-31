From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sat, 31 Mar 2018 22:12:33 +0200
Subject: [PATCH] usb: core: phy: Fix usb_phy_roothub_add_phy if
 GENERIC_PHY=n
In-Reply-To: <1522524508-4670-1-git-send-email-stefan.wahren@i2se.com>
References: <1522524508-4670-1-git-send-email-stefan.wahren@i2se.com>
Message-ID: <CAFBinCBX-tZpEexdv-muR9cEzFM3aLfFbeUGXo+xx4QYuiyT2A@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hello Stefan,

On Sat, Mar 31, 2018 at 9:28 PM, Stefan Wahren <stefan.wahren@i2se.com> wrote:
> If the generic PHY support is disabled the stub of devm_of_phy_get_by_index
> returns ENOSYS. This corner case isn't handled properly by
> usb_phy_roothub_add_phy and at least breaks USB support on Raspberry Pi
> (bcm2835_defconfig):
>
>     dwc2 20980000.usb: dwc2_hcd_init() FAILED, returning -38
>     dwc2: probe of 20980000.usb failed with error -38
thank you for reporting and proposing a fix!

> Fixes: 07dbff0ddbd8 ("usb: core: add a wrapper for the USB PHYs on the HCD")
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---
>  drivers/usb/core/phy.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/usb/core/phy.c b/drivers/usb/core/phy.c
> index 09b7c43..c89e9be 100644
> --- a/drivers/usb/core/phy.c
> +++ b/drivers/usb/core/phy.c
> @@ -39,7 +39,7 @@ static int usb_phy_roothub_add_phy(struct device *dev, int index,
>         struct phy *phy = devm_of_phy_get_by_index(dev, dev->of_node, index);
>
>         if (IS_ERR_OR_NULL(phy)) {
> -               if (!phy || PTR_ERR(phy) == -ENODEV)
> +               if (!phy || PTR_ERR(phy) == -ENODEV || PTR_ERR(phy) == -ENOSYS)
>                         return 0;
>                 else
>                         return PTR_ERR(phy);
> --
> 2.7.4
I have three patches pending, one of them (the patch from [1]) touches
the same function:
- "usb: core: phy: fix return value of usb_phy_roothub_exit()" [0]
- "usb: core: split usb_phy_roothub_{init, alloc}" [1]
- "usb: core: use phy_exit during suspend if wake up is not supported" [2]

maybe we should make it more explicit that the whole code is only
useful if CONFIG_GENERIC_PHY is enabled
what do you think about adding the following two lines at the
beginning of usb_phy_roothub_alloc (after patch [1] is applied, before
this function was basically called usb_phy_roothub_init)
    if (!IS_ENABLED(CONFIG_GENERIC_PHY))
        return NULL;

this should even allow the compiler to optimize away some unused code


Regards
Martin


[0] https://patchwork.kernel.org/patch/10306053/
[1] https://patchwork.kernel.org/patch/10311701/
[2] https://patchwork.kernel.org/patch/10311703/
