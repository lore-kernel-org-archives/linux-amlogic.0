Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A957C54E76
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Jan 2023 20:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ys1aYfy2CFaKKcK6edqd8HyXbIJDSb+vOGTiAjJULxE=; b=cyFti5oNiUpO+u
	m8jsCKnDS5xKtkuumi48oKGsAidka/milOF6TDr2HOw7K9u8pXdV5TejXKplTpcr6NCKLmnP5/hrs
	sgcQtLRwd3l1U20cwMGgVqGaOTwzWRwiHK5RDHI2qOuzySPyN4SWuztzZPCG/Fe5M3Oyk4T94v1nn
	w/+Ao70M+ctiN5HZLQ2Inj8OQmq7gWgHUaayixWxF00xkzKNBHRDCuBgiMpz0pwqRc1r5EZqSey1i
	LzB6Y1peipaOD1ex3NxmHSzX3ED6ZKw2siZw+PbNfURQ0fSQXwRCakTTB8cLojclh93t4psMhK8ND
	n9NJOj+zKx9T2PyMcHyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDAHP-00BoFh-U3; Wed, 04 Jan 2023 20:22:31 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDAHK-00BoAn-2G
	for linux-amlogic@lists.infradead.org; Wed, 04 Jan 2023 20:22:27 +0000
Received: by mail-io1-xd2f.google.com with SMTP id h6so18596439iof.9
        for <linux-amlogic@lists.infradead.org>; Wed, 04 Jan 2023 12:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9rZvl8+1gYwkdYRJIjwY/CuQIIJARDw0zn6scUesZko=;
        b=Ab51jq4uLpXQ7JMNlgVg7xiThp4ID8vN8Rq+2aeRprZvCVs73I8rNbm0h5qQInJxIQ
         HeKPTKAGgh6yFGUSBfCk6nCVI+zSYH+sJCAah7RhAk/WH7wyq/C/CBkRfAmyY6anrpoS
         b2mmD0tS5DGeoG4JIRsjKPIlqjk5N0LCCrFms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9rZvl8+1gYwkdYRJIjwY/CuQIIJARDw0zn6scUesZko=;
        b=I5MBKTDubSWCVU2Azj9B+9Rtzi6G4CmsYUEkcxR7/l1J8lMvPme0eEe7FNwVPJp7Ob
         zEz1D5BUV3ICV+zu9i17B/1p2vJ1tSzzbPiMzz7VLCKboPlsfUyotkTz+eNXas86zSOJ
         DUCBRFsUPD0EH50bdhNQClHcWkTTtkMR+BDKGwLSbLRQ84zPnKqeFjkflU+UMMDKb2PE
         nuhi//V2peCRZTtx+5ldtdRvjqf6M13Y18mNP2fhmmAns4pxyUzBjjWlkdR+vONdEh87
         LTjdPxxtakZz5G/0gTtS/AGFVKxJNH6ulX4X2UsKdEy0E2weVfdWQAGEVaS1z95nl9pN
         pUVw==
X-Gm-Message-State: AFqh2kpIWojpGch/9TEqlUsRdR6PYiuhzB7CM/Z/fu6harmBeC+5zxUK
	kdAo041U+IXmv03nMYDWOxIg/WbGqSsb6OYf
X-Google-Smtp-Source: AMrXdXuahbSA9M5OOU+OtHMSnbd2z4FaE5Z/RhTKQ1tFJhNGArlFjZdRnIMUpivN633+JN8ouZ+mMg==
X-Received: by 2002:a05:6602:21d4:b0:6e9:7156:3b7a with SMTP id c20-20020a05660221d400b006e971563b7amr40648314ioc.3.1672863743927;
        Wed, 04 Jan 2023 12:22:23 -0800 (PST)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id az36-20020a05663841a400b0039db6cffcbasm9390843jab.71.2023.01.04.12.22.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jan 2023 12:22:23 -0800 (PST)
Date: Wed, 4 Jan 2023 20:22:23 +0000
From: Matthias Kaehlcke <mka@chromium.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 10/11] usb: misc: onboard_usb_hub: add VIA LAB VL817Q7
 hub support
Message-ID: <Y7Xf/92iCHD5WhpA@google.com>
References: <20221228100321.15949-1-linux.amoon@gmail.com>
 <20221228100321.15949-11-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221228100321.15949-11-linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_122226_151973_2BE9BAAC 
X-CRM114-Status: GOOD (  24.46  )
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

Hi Andand,

On Wed, Dec 28, 2022 at 10:03:19AM +0000, Anand Moon wrote:
> VIA LAB VL817Q7 is a 4-port USB 3.1 hub that has a reset pin to
> toggle and a 5.0V core supply exported though an integrated LDO is
> available for powering it.
> 
> Add the support for this hub, for controlling the reset pin and the core
> power supply.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>  drivers/usb/misc/onboard_usb_hub.c | 2 ++
>  drivers/usb/misc/onboard_usb_hub.h | 5 +++++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/usb/misc/onboard_usb_hub.c b/drivers/usb/misc/onboard_usb_hub.c
> index 699050eb3f17..025572019d16 100644
> --- a/drivers/usb/misc/onboard_usb_hub.c
> +++ b/drivers/usb/misc/onboard_usb_hub.c
> @@ -335,6 +335,7 @@ static struct platform_driver onboard_hub_driver = {
>  #define VENDOR_ID_MICROCHIP	0x0424
>  #define VENDOR_ID_REALTEK	0x0bda
>  #define VENDOR_ID_TI		0x0451
> +#define VENDOR_ID_VIA		0x2109
>  
>  /*
>   * Returns the onboard_hub platform device that is associated with the USB
> @@ -418,6 +419,7 @@ static const struct usb_device_id onboard_hub_id_table[] = {
>  	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x5414) }, /* RTS5414 USB 2.1 */
>  	{ USB_DEVICE(VENDOR_ID_TI, 0x8140) }, /* TI USB8041 3.0 */
>  	{ USB_DEVICE(VENDOR_ID_TI, 0x8142) }, /* TI USB8041 2.0 */
> +	{ USB_DEVICE(VENDOR_ID_VIA, 0x0817) }, /* VIA VL817Q7 3.1 */

The VL817Q7 is a single IC, however like the TI USB8041 or the RTS5414 it
provides both a USB 3.1 and a USB 2.0 hub. You should also add an entry for
the USB 2.0 hub here.


>  	{}
>  };
>  MODULE_DEVICE_TABLE(usb, onboard_hub_id_table);
> diff --git a/drivers/usb/misc/onboard_usb_hub.h b/drivers/usb/misc/onboard_usb_hub.h
> index b32fad3a70f9..1fb3371ebdae 100644
> --- a/drivers/usb/misc/onboard_usb_hub.h
> +++ b/drivers/usb/misc/onboard_usb_hub.h
> @@ -26,6 +26,10 @@ static const struct onboard_hub_pdata genesys_gl850g_data = {
>  	.reset_us = 3,
>  };
>  
> +static const struct onboard_hub_pdata vialab_vl817q7_data = {
> +	.reset_us = 3,
> +};
> +
>  static const struct of_device_id onboard_hub_match[] = {
>  	{ .compatible = "usb424,2514", .data = &microchip_usb424_data, },
>  	{ .compatible = "usb451,8140", .data = &ti_tusb8041_data, },
> @@ -37,6 +41,7 @@ static const struct of_device_id onboard_hub_match[] = {
>  	{ .compatible = "usbbda,5411", .data = &realtek_rts5411_data, },
>  	{ .compatible = "usbbda,414", .data = &realtek_rts5411_data, },
>  	{ .compatible = "usbbda,5414", .data = &realtek_rts5411_data, },
> +	{ .compatible = "vialab,usb2109", .data = &vialab_vl817q7_data, },

ditto

Actually you added the device id entry for the 3.1 hub and a compatible string
of the 2.0 hub (or vice versa). Above the device id is 0x0817, here it is
0x2109. Please add both USB 3.1 and 2.0 and make sure the device id and the USB
version in the comment for the device id table match.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
