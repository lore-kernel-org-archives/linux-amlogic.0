From: chunfeng.yun@mediatek.com (Chunfeng Yun)
Date: Mon, 26 Mar 2018 11:43:12 +0800
Subject: [PATCH usb-next v1] usb: core: phy: fix return value of
 usb_phy_roothub_exit()
In-Reply-To: <20180324135629.31409-1-martin.blumenstingl@googlemail.com>
References: <20180324135629.31409-1-martin.blumenstingl@googlemail.com>
Message-ID: <1522035792.3717.183.camel@mhfsdcap03>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sat, 2018-03-24 at 14:56 +0100, Martin Blumenstingl wrote:
> usb_phy_roothub_exit() should return the error code from the phy_exit()
> call if exiting the PHY failed.
> However, since a wrong variable is used usb_phy_roothub_exit() currently
> always returns 0, even if one of the phy_exit calls returned an error.
> Fix this by assigning the error code from phy_exit() to the "ret"
> variable to propagate the error correctly.
> 
> Fixes: 07dbff0ddbd86c ("usb: core: add a wrapper for the USB PHYs on the HCD")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  drivers/usb/core/phy.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/phy.c b/drivers/usb/core/phy.c
> index 09b7c43c0ea4..f19aaa3c899c 100644
> --- a/drivers/usb/core/phy.c
> +++ b/drivers/usb/core/phy.c
> @@ -111,7 +111,7 @@ int usb_phy_roothub_exit(struct usb_phy_roothub *phy_roothub)
>  	list_for_each_entry(roothub_entry, head, list) {
>  		err = phy_exit(roothub_entry->phy);
>  		if (err)
> -			ret = ret;
> +			ret = err;
Need break the loop?
>  	}
>  
>  	return ret;
