From: gregkh@linuxfoundation.org (Greg KH)
Date: Sun, 22 Apr 2018 15:01:09 +0200
Subject: [PATCH usb v6 6/6] usb: core: phy: add the
 SPDX-License-Identifier and include guard
In-Reply-To: <20180418193951.17922-7-martin.blumenstingl@googlemail.com>
References: <20180418193951.17922-1-martin.blumenstingl@googlemail.com>
 <20180418193951.17922-7-martin.blumenstingl@googlemail.com>
Message-ID: <20180422130109.GA5781@kroah.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Wed, Apr 18, 2018 at 09:39:51PM +0200, Martin Blumenstingl wrote:
> This clarifies the license of the code. While here also add an include
> guard to the header file.
> 
> Fixes: 07dbff0ddbd86c ("usb: core: add a wrapper for the USB PHYs on the HCD")
> Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  drivers/usb/core/phy.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/usb/core/phy.h b/drivers/usb/core/phy.h
> index bbc969383074..88a3c037e9df 100644
> --- a/drivers/usb/core/phy.h
> +++ b/drivers/usb/core/phy.h
> @@ -1,3 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */

Do you _really_ mean GPLv2 or anything later?

I have to ask...

thanks,

greg k-h
