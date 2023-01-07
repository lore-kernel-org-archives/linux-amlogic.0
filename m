Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8DA7C46467
	for <linux-amlogic@archiver.kernel.org>; Sat,  7 Jan 2023 14:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7a3nUA1rxyK3RiaBsjEWVyoya6qjx0baEXuRFeykQzM=; b=x1ovyg2jn526V0
	6L9LnJkUDuCX81zjZpBbr2tHbp6MpTTovc9z+IprnN6L8waNM3Nx0BQ/yxKvgHnc+Aws4UWBmDGQe
	aCbS4+4CVxxokpYu+XHhuDnK57Gc227fWEBaL0CiRR6cYh/H2XNo7thx987CkQQDx7DLx0nhjSzC5
	4F5DLb2sAF2tAgfOL/BZBASuAjBkVc4raqSklFEoQkKoQCqzwp8ZUZSvPBdM4WLaHuBzkEAQVIV+d
	To93KaB/3MveqgcXGPFacZoKjRUKIY4IpIUiHSYEnCjMzhOM3UFcvmqjlJ0lnE5shC0qcvvqxIBsb
	jJTs7aDNLHblYOkjgANA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEAfe-007RRe-8d; Sat, 07 Jan 2023 14:59:42 +0000
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEAfb-007RQt-2l
	for linux-amlogic@lists.infradead.org; Sat, 07 Jan 2023 14:59:40 +0000
Received: by mail-vs1-xe36.google.com with SMTP id p30so4346704vsr.1
        for <linux-amlogic@lists.infradead.org>; Sat, 07 Jan 2023 06:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ifhz4k4RvVQRROiBmQhqZMFI/gQRGOwvv+dCEJY7ups=;
        b=oNN52TyIaEqppiUBzhnfEZ2EPtrjybrqfacMaGByapzK5ORfo4GNy2K0uM0Jt0J5SY
         /Udu+x+3fMORcRP3u1ysg0nx9fg6tCBgCLy53p3VdwmQMH4KP9SwmcQBE/P2IWA091TF
         Ta0AqgpXidUu3aKa1y54/eTg0vX19Dgwpc+kVLC21BcOCl/d05xJj7hMysgam7m0mKqr
         jwP78g3VkOBvvQO0Eb8QYKjhYtpw7eXyodiEZYnFuru43NBNs4aTTJST6kqdkLntTiIW
         cjWjhg0jKsxhGs4RON7ZBYsUmKU3Tc+rtl2/IM7wzmImdD8SYrrJnqPKhnk5LR1m7iJS
         qQoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ifhz4k4RvVQRROiBmQhqZMFI/gQRGOwvv+dCEJY7ups=;
        b=XRWge8CHYacKgU+ZTSGQ+Xs/bbPgk59EI6CqrQJ6CkQrcpMkAc399hIwO99UdICcKZ
         zLF9erEFLUt5qnj1X8FmiElUq4jfUdnlbfNGEcZCmTHKqlBhOGBXy/9dOVPWyXqgPKGZ
         bsRqe05s22s+Tfvt9cA/994+LdEANQGqM4uCruojL/XtT2h8C31bBDjtYfXlFDi/JsCA
         NnP+0BXsz+Vo4+ldwWGknRo4+frV5dJC6XX/yyDVIfZmbOQXDYmRolYb53e299VGridz
         NRdwF8BnJSAqlXgjNENaJ/MsGs7chNiDWgiILn1MIR4Y8xLKean3gqZSUfH3YJOS7v+k
         tffQ==
X-Gm-Message-State: AFqh2krfPqwm1rqFzrvgRVAUwFhxILUS1FHrQosVdRYeZ0CV/0qtPZHz
	iPmqPipF2L6yDtxzaXLsplRAo8mZcgaPw1GPUwv8nPJkaKA=
X-Google-Smtp-Source: AMrXdXuDChX+sgH5LBiE4Tvb58gSe0MpmgTJ7NVHsb4/MuSNW1o/09jLO6adWzht1g+B0vAN5g4RMvG89TTjIAA1Skc=
X-Received: by 2002:a67:1703:0:b0:3ce:f9ed:ad70 with SMTP id
 3-20020a671703000000b003cef9edad70mr384547vsx.76.1673103577869; Sat, 07 Jan
 2023 06:59:37 -0800 (PST)
MIME-Version: 1.0
References: <20221228100321.15949-1-linux.amoon@gmail.com> <20221228100321.15949-11-linux.amoon@gmail.com>
 <Y7Xf/92iCHD5WhpA@google.com>
In-Reply-To: <Y7Xf/92iCHD5WhpA@google.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 7 Jan 2023 20:29:20 +0530
Message-ID: <CANAwSgQijsKkjd6NJ7GMpph-cVpch6yXCdimyCjhQj5RKV_Cvw@mail.gmail.com>
Subject: Re: [PATCH v1 10/11] usb: misc: onboard_usb_hub: add VIA LAB VL817Q7
 hub support
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-amlogic@lists.infradead.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230107_065939_142827_D3C1E448 
X-CRM114-Status: GOOD (  28.54  )
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

Hi Matthias,

Thanks for your review comments.

On Thu, 5 Jan 2023 at 01:52, Matthias Kaehlcke <mka@chromium.org> wrote:
>
> Hi Andand,
>
> On Wed, Dec 28, 2022 at 10:03:19AM +0000, Anand Moon wrote:
> > VIA LAB VL817Q7 is a 4-port USB 3.1 hub that has a reset pin to
> > toggle and a 5.0V core supply exported though an integrated LDO is
> > available for powering it.
> >
> > Add the support for this hub, for controlling the reset pin and the core
> > power supply.
> >
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> >  drivers/usb/misc/onboard_usb_hub.c | 2 ++
> >  drivers/usb/misc/onboard_usb_hub.h | 5 +++++
> >  2 files changed, 7 insertions(+)
> >
> > diff --git a/drivers/usb/misc/onboard_usb_hub.c b/drivers/usb/misc/onboard_usb_hub.c
> > index 699050eb3f17..025572019d16 100644
> > --- a/drivers/usb/misc/onboard_usb_hub.c
> > +++ b/drivers/usb/misc/onboard_usb_hub.c
> > @@ -335,6 +335,7 @@ static struct platform_driver onboard_hub_driver = {
> >  #define VENDOR_ID_MICROCHIP  0x0424
> >  #define VENDOR_ID_REALTEK    0x0bda
> >  #define VENDOR_ID_TI         0x0451
> > +#define VENDOR_ID_VIA                0x2109
> >
> >  /*
> >   * Returns the onboard_hub platform device that is associated with the USB
> > @@ -418,6 +419,7 @@ static const struct usb_device_id onboard_hub_id_table[] = {
> >       { USB_DEVICE(VENDOR_ID_REALTEK, 0x5414) }, /* RTS5414 USB 2.1 */
> >       { USB_DEVICE(VENDOR_ID_TI, 0x8140) }, /* TI USB8041 3.0 */
> >       { USB_DEVICE(VENDOR_ID_TI, 0x8142) }, /* TI USB8041 2.0 */
> > +     { USB_DEVICE(VENDOR_ID_VIA, 0x0817) }, /* VIA VL817Q7 3.1 */
>
> The VL817Q7 is a single IC, however like the TI USB8041 or the RTS5414 it
> provides both a USB 3.1 and a USB 2.0 hub. You should also add an entry for
> the USB 2.0 hub here.
>
Ok,

>
> >       {}
> >  };
> >  MODULE_DEVICE_TABLE(usb, onboard_hub_id_table);
> > diff --git a/drivers/usb/misc/onboard_usb_hub.h b/drivers/usb/misc/onboard_usb_hub.h
> > index b32fad3a70f9..1fb3371ebdae 100644
> > --- a/drivers/usb/misc/onboard_usb_hub.h
> > +++ b/drivers/usb/misc/onboard_usb_hub.h
> > @@ -26,6 +26,10 @@ static const struct onboard_hub_pdata genesys_gl850g_data = {
> >       .reset_us = 3,
> >  };
> >
> > +static const struct onboard_hub_pdata vialab_vl817q7_data = {
> > +     .reset_us = 3,
> > +};
> > +
> >  static const struct of_device_id onboard_hub_match[] = {
> >       { .compatible = "usb424,2514", .data = &microchip_usb424_data, },
> >       { .compatible = "usb451,8140", .data = &ti_tusb8041_data, },
> > @@ -37,6 +41,7 @@ static const struct of_device_id onboard_hub_match[] = {
> >       { .compatible = "usbbda,5411", .data = &realtek_rts5411_data, },
> >       { .compatible = "usbbda,414", .data = &realtek_rts5411_data, },
> >       { .compatible = "usbbda,5414", .data = &realtek_rts5411_data, },
> > +     { .compatible = "vialab,usb2109", .data = &vialab_vl817q7_data, },
>
> ditto
>
> Actually you added the device id entry for the 3.1 hub and a compatible string
> of the 2.0 hub (or vice versa). Above the device id is 0x0817, here it is
> 0x2109. Please add both USB 3.1 and 2.0 and make sure the device id and the USB
> version in the comment for the device id table match.

Yes I messed up the compatible string
On Odrodi C4
alarm@odroid-c4:~$ lsusb -tv
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci-hcd/1p, 5000M
    ID 1d6b:0003 Linux Foundation 3.0 root hub
    |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 5000M
        ID 2109:0817 VIA Labs, Inc.
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci-hcd/2p, 480M
    ID 1d6b:0002 Linux Foundation 2.0 root hub
    |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M
        ID 2109:2817 VIA Labs, Inc.

vendor ID is 0x2109 and the device ID is 0817,
So I have fixed the compatible string as below.
      compatible = "usb2109,2817";  /* USB 2.0 hub */
      compatible = "usb2109,817";   /* USB 3.1 hub */

Thanks


-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
