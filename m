Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2831C46467
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Jan 2023 20:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PT2Zi+oo1lKOGSLf7HSl4oeP50IzABGvFoWvQ2z1OBQ=; b=t9hPD51qLNRcZD
	jz4u3TOnmCBQFQhB0Gu0wXDtx0c6LKytDrF7GudrU80XoGzBkSzvJud5YctI7+tJN57RsXdz5vpxb
	Xdk50E5LTZPyh99CwKb4w5bIkBk02GZ7Ek2xy8Ustortmpob9xbQdqAKG7Umi6uxH+T56E5hMfg39
	+3UWomavfwipfJPHizPjXspY30DLJY0raOHICF7L3wCVIOmd9uGVNUzAd2dePQdjw2YJA/xc8BZ1T
	wWQV+GGzu6NXQbz4Vlxk4MRMXYJoBfPkA6zXSsd4wUW4v70C//fCUpSje/Y9J0+O0Lnt2CXlZ61tQ
	JHUvqwchmil2KUfdZj3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDAN6-00BqwF-E4; Wed, 04 Jan 2023 20:28:24 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDAN2-00Bquj-HJ
	for linux-amlogic@lists.infradead.org; Wed, 04 Jan 2023 20:28:23 +0000
Received: by mail-il1-x130.google.com with SMTP id u8so20042185ilq.13
        for <linux-amlogic@lists.infradead.org>; Wed, 04 Jan 2023 12:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U09sCY05I0lgOik13tLPEAUzNpPuoB0bv6c/i5l03pM=;
        b=FtLIMZ2EW8oJ3S+rWX0scL9X/78Tm7TdycCwBvBGRlnsJqnUaSRBn0eIp3wIrRSI8h
         E7aAUbfR9QjPw9YJg2UFIgye2I7VqkXF9ls3FVX8iMlvoUlPU3GqRg/fyGLMotKdC4Tt
         u0y//4/3H+AAEz7NWKB7zZ/42dWD0ugNzbNX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U09sCY05I0lgOik13tLPEAUzNpPuoB0bv6c/i5l03pM=;
        b=Fd2xMJHkmF4+/HGeRQc5ybQSuC4N7qe3r6qEgY5S2FqnmdQVobZ6XEmL1UufldvBQ7
         svW8/qxP9ypduGBMlUE/akQWiWO/IpXffSkTIDVnzGdkkjpvL+uYNpfgpXxyajH6Nqn3
         nMDabzhKR74JwCPdbHysEGkGvJ3b/w+MXNRgu51SK2syASqDtJs4XWG+Mkko42kMF3g9
         GXCxO33AIt1xE6marWUcuUeHw3EasWqhekcNWyTyERikjwCTKXNIlMOMMk2mx3XmESQ1
         TxWHFHGgFfh48nREYJFUTPIARpBC9WkxXqnB10ywKoJbyvrriw6myNEt8UE73PZmT2lE
         UeBw==
X-Gm-Message-State: AFqh2kroUPyjciYgymIMbGSNTdRAsgYQMa36Vnw9lKV7n12QWd2YbAMD
	MZgV9mz96+7hmMxAZyc0H872uQ==
X-Google-Smtp-Source: AMrXdXuyuPSoDNQ0srwnO0clhF90LpLk0NmVj+xDseIlPnC9zy8tymPFa/yesZxHXlzMF/rOCESknw==
X-Received: by 2002:a05:6e02:143:b0:30c:609b:340d with SMTP id j3-20020a056e02014300b0030c609b340dmr4844369ilr.0.1672864099303;
        Wed, 04 Jan 2023 12:28:19 -0800 (PST)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id u24-20020a02b1d8000000b0038a5b48f3d4sm10950716jah.3.2023.01.04.12.28.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jan 2023 12:28:18 -0800 (PST)
Date: Wed, 4 Jan 2023 20:28:18 +0000
From: Matthias Kaehlcke <mka@chromium.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 05/11] usb: misc: onboard_usb_hub: add Genesys Logic
 GL852G-OHG hub support
Message-ID: <Y7XhYm0nvBsSS8MN@google.com>
References: <20221228100321.15949-1-linux.amoon@gmail.com>
 <20221228100321.15949-6-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221228100321.15949-6-linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_122821_722252_E48DF5BB 
X-CRM114-Status: GOOD (  18.21  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Dec 28, 2022 at 10:03:14AM +0000, Anand Moon wrote:
> Genesys Logic GL852G-OHG is a 4-port USB 2.0 STT hub that has a reset pin to
> toggle and a 5.0V core supply exported though an integrated LDO is
> available for powering it.
> 
> Add the support for this hub, for controlling the reset pin and the core
> power supply.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>  drivers/usb/misc/onboard_usb_hub.c | 1 +
>  drivers/usb/misc/onboard_usb_hub.h | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/misc/onboard_usb_hub.c b/drivers/usb/misc/onboard_usb_hub.c
> index 94e7966e199d..c0e8e6f4ec0a 100644
> --- a/drivers/usb/misc/onboard_usb_hub.c
> +++ b/drivers/usb/misc/onboard_usb_hub.c
> @@ -409,6 +409,7 @@ static void onboard_hub_usbdev_disconnect(struct usb_device *udev)
>  
>  static const struct usb_device_id onboard_hub_id_table[] = {
>  	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0608) }, /* Genesys Logic GL850G USB 2.0 */
> +	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0610) }, /* Genesys Logic GL852G-OHG USB 2.0 */
>  	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2514) }, /* USB2514B USB 2.0 */
>  	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x0411) }, /* RTS5411 USB 3.1 */
>  	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x5411) }, /* RTS5411 USB 2.1 */
> diff --git a/drivers/usb/misc/onboard_usb_hub.h b/drivers/usb/misc/onboard_usb_hub.h
> index 62129a6a1ba5..2ee1b0032d23 100644
> --- a/drivers/usb/misc/onboard_usb_hub.h
> +++ b/drivers/usb/misc/onboard_usb_hub.h
> @@ -31,6 +31,7 @@ static const struct of_device_id onboard_hub_match[] = {
>  	{ .compatible = "usb451,8140", .data = &ti_tusb8041_data, },
>  	{ .compatible = "usb451,8142", .data = &ti_tusb8041_data, },
>  	{ .compatible = "usb5e3,608", .data = &genesys_gl850g_data, },
> +	{ .compatible = "genesys,usb5e3,610", .data = &genesys_gl850g_data, },

s/genesys,//

>  	{ .compatible = "usbbda,411", .data = &realtek_rts5411_data, },
>  	{ .compatible = "usbbda,5411", .data = &realtek_rts5411_data, },
>  	{ .compatible = "usbbda,414", .data = &realtek_rts5411_data, },
> -- 
> 2.38.1
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
