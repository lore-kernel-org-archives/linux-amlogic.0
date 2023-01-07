Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E59C54EBC
	for <linux-amlogic@archiver.kernel.org>; Sat,  7 Jan 2023 14:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OdsT5m1nHjZ67dthdoawPuMmS0Dm3tb0Aoef8o9+S/s=; b=yiezmz30hZswHh
	zJW3ACGRZKnIee0CwmMtb9ez9R92KXVBjGjPV1xeeiNPHRtltWYPRO5rQlz0krnyEpik6Y2P4oGpw
	sGAIurT9w8Dv1Npnl0GgVBZTZC6EuMscgmZrEG61Pb467w5VLThxjMqcV2/zTIS/SYjoLsQrPJjev
	PGKHTxK0/vOn4g/iGOECE2qsJxPjhf3yNA0Yl6ZlDsdFPh0xx31mfV+qr53OAwHYFbI5OjABGjf1s
	MDmwEWeNQuf2gyB/L9DDMmxYrpdHaaOSLGKzyVns2R2lmeB8jFmEBSldd5Z13kI6kxy9JZVu4HNEI
	l2ba0LdZNc+by4JHeMtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEAcx-007Qwt-VW; Sat, 07 Jan 2023 14:56:55 +0000
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEAcv-007Qva-LA
	for linux-amlogic@lists.infradead.org; Sat, 07 Jan 2023 14:56:55 +0000
Received: by mail-vs1-xe2e.google.com with SMTP id s127so4335700vsb.5
        for <linux-amlogic@lists.infradead.org>; Sat, 07 Jan 2023 06:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3swf10ZLFW6qNCeoSiTN3mu6SiPLmmuQ4t5ZCg5wVZA=;
        b=QBFARmrXyHI5HZM3Q0ihwFQxWbcR6kBOXFFassyzG9LexAUhsmCax3azLn0lf3vdDw
         XMyngcRVcPPsTTtN2l8PbXRbZMiiWyn2geSUPcHzqkninsdMSMJwFRLhE1Pq7apbKSYW
         QOxzVWD58or5FB+ZiUHzxpDVWRR0psjq/ayYoJComGPHdiadelsckVVbigwc904xbluM
         RHpbG30eOb4PMBTrcVENkWjhtYHJw0XQ0JqHyMnxn1tPNNL8biRQ9piErW0g0MDnz3r9
         pc5RJfgMQ5UvUTAHEsiYoN/ARrYg5oXlmHv5lJODgtkTIHQuBgMotF8W3nL/bZL3TEpn
         FlhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3swf10ZLFW6qNCeoSiTN3mu6SiPLmmuQ4t5ZCg5wVZA=;
        b=IXZ/JVuP2ZMUz/Jm98W9oAixuUzpwPCjhYxovXmfxKppSXgZ43R+lQXbEvaMPtFz0R
         j/4JinsYo2gH7wHk26PDGwqosV14G/4tmzM4KKCV+FipB67Vrn35MQspZNW0NKzUOwHu
         zh0H+1TV0rHUzVLDbq3PNz4Kp6+BFaqlyLSaFMHebNsK8GLmQgwcQtGiWnAjdyhu5NgK
         ceQZouZyoOoA51i2eHOyTFt4MFt6AGH4s+cQL1RhzuLDfAGXdy28gW9hAdUxYpGg2Q+B
         vMeel0v8inza4SQ7s78H7sB/inxLa5lF9/eWnGHmAqTaUgp2BuAeeLCY4g1XpnUj4Bpe
         nI6Q==
X-Gm-Message-State: AFqh2korTuyUJYn97UFHOdgMC96itikCWXCe6suL5s0dRRsaFuLBg22W
	sZZoKLK8MMJIfm/IxJLoFodSQtXzMZFuupaHCK4=
X-Google-Smtp-Source: AMrXdXvs9T8wmAXwlDyiXHkA86ONHle7RLbgEv6JwSPgfa031J28MbXvqQlbUJyjGi5C2k0Uc+4Gs3X0//SJWYY0fYE=
X-Received: by 2002:a05:6102:510e:b0:3b1:2b83:1861 with SMTP id
 bm14-20020a056102510e00b003b12b831861mr7199612vsb.10.1673103410149; Sat, 07
 Jan 2023 06:56:50 -0800 (PST)
MIME-Version: 1.0
References: <20221228100321.15949-1-linux.amoon@gmail.com> <20221228100321.15949-6-linux.amoon@gmail.com>
 <Y7XhYm0nvBsSS8MN@google.com> <Y7XnLYbHxfADz7gk@google.com>
In-Reply-To: <Y7XnLYbHxfADz7gk@google.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 7 Jan 2023 20:26:34 +0530
Message-ID: <CANAwSgQbABi9QxO7eEZ5rKQY-2d5QZ+bUTOyv9sBWV8+4LGU8Q@mail.gmail.com>
Subject: Re: [PATCH v1 05/11] usb: misc: onboard_usb_hub: add Genesys Logic
 GL852G-OHG hub support
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-amlogic@lists.infradead.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230107_065653_715528_0B3459B1 
X-CRM114-Status: GOOD (  21.98  )
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

Hi Matthias

On Thu, 5 Jan 2023 at 02:23, Matthias Kaehlcke <mka@chromium.org> wrote:
>
> On Wed, Jan 04, 2023 at 08:28:18PM +0000, Matthias Kaehlcke wrote:
> > On Wed, Dec 28, 2022 at 10:03:14AM +0000, Anand Moon wrote:
> > > Genesys Logic GL852G-OHG is a 4-port USB 2.0 STT hub that has a reset pin to
> > > toggle and a 5.0V core supply exported through an integrated LDO is
> > > available for powering it.
> > >
> > > Add the support for this hub, for controlling the reset pin and the core
> > > power supply.
> > >
> > > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > > ---
> > >  drivers/usb/misc/onboard_usb_hub.c | 1 +
> > >  drivers/usb/misc/onboard_usb_hub.h | 1 +
> > >  2 files changed, 2 insertions(+)
> > >
> > > diff --git a/drivers/usb/misc/onboard_usb_hub.c b/drivers/usb/misc/onboard_usb_hub.c
> > > index 94e7966e199d..c0e8e6f4ec0a 100644
> > > --- a/drivers/usb/misc/onboard_usb_hub.c
> > > +++ b/drivers/usb/misc/onboard_usb_hub.c
> > > @@ -409,6 +409,7 @@ static void onboard_hub_usbdev_disconnect(struct usb_device *udev)
> > >
> > >  static const struct usb_device_id onboard_hub_id_table[] = {
> > >     { USB_DEVICE(VENDOR_ID_GENESYS, 0x0608) }, /* Genesys Logic GL850G USB 2.0 */
> > > +   { USB_DEVICE(VENDOR_ID_GENESYS, 0x0610) }, /* Genesys Logic GL852G-OHG USB 2.0 */
>
> Do you happen to know what '-OHG' stands for? The Genesys website only
> mentions a GL852G with different package types (none of them 'OHG').
> Unless there is an 'OHG' variant with a different product id I'd say
> let's drop the suffix.

Ok, done.


>
> > >     { USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2514) }, /* USB2514B USB 2.0 */
> > >     { USB_DEVICE(VENDOR_ID_REALTEK, 0x0411) }, /* RTS5411 USB 3.1 */
> > >     { USB_DEVICE(VENDOR_ID_REALTEK, 0x5411) }, /* RTS5411 USB 2.1 */
> > > diff --git a/drivers/usb/misc/onboard_usb_hub.h b/drivers/usb/misc/onboard_usb_hub.h
> > > index 62129a6a1ba5..2ee1b0032d23 100644
> > > --- a/drivers/usb/misc/onboard_usb_hub.h
> > > +++ b/drivers/usb/misc/onboard_usb_hub.h
> > > @@ -31,6 +31,7 @@ static const struct of_device_id onboard_hub_match[] = {
> > >     { .compatible = "usb451,8140", .data = &ti_tusb8041_data, },
> > >     { .compatible = "usb451,8142", .data = &ti_tusb8041_data, },
> > >     { .compatible = "usb5e3,608", .data = &genesys_gl850g_data, },
> > > +   { .compatible = "genesys,usb5e3,610", .data = &genesys_gl850g_data, },
> >
> > s/genesys,//
> >
> > >     { .compatible = "usbbda,411", .data = &realtek_rts5411_data, },
> > >     { .compatible = "usbbda,5411", .data = &realtek_rts5411_data, },
> > >     { .compatible = "usbbda,414", .data = &realtek_rts5411_data, },
> > > --
> > > 2.38.1
> > >

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
