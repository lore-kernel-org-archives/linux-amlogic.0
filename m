Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AAE2C46467
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Jan 2023 20:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=224RjPWHVJgaaiFLvmm/z4/tIHnGsI+6myRAvySWWn4=; b=OBbbjoEAjh/Oul
	m/PbkSNLxLaW2Uw0ocr4RVw/LFe2VZ9X+tP6kdpa+p4sljhMv3dOkD7G187mLFvO1hWWyssAzGZrI
	euSomvOMkFl9PQaarhG6LRbBPQfSuS/lv2yrrHavDZ3R4vQk8Jd/7Q9Qu5+RDMjrUNwGoIyhExFRU
	p8QbOpSuI9UbQbU3JoDtIXLINjIr2qpInmuI75a7rXJQztCmS4rsc3OU6MtVjqrCuljjjNhb1oPc6
	Sij/Ny+dednCKHP/Yt6KBMVBqqOSa4jhfqAKJRZ91vK8KqIhNPMSds/eSgUR0FaCZMf94osDVFD0r
	U/bOQ/Gs00UK+FaMezmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDAl1-00C08j-77; Wed, 04 Jan 2023 20:53:07 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDAky-00C07m-Ju
	for linux-amlogic@lists.infradead.org; Wed, 04 Jan 2023 20:53:05 +0000
Received: by mail-il1-x12f.google.com with SMTP id a9so7767106ilk.6
        for <linux-amlogic@lists.infradead.org>; Wed, 04 Jan 2023 12:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VvPBmhnK4Q9HxzeQD/MDc8OKkrjpvJu9PsbKOMLRVCY=;
        b=apfUpUE2RvS7EjOZFtrYAW0yRTMG0bsW1XpF8htHBA0KyqAtCEuH625OtLnkI5Q2mb
         /SKBvQ49ge1I9Ynf7k4QIDPQWPQ3UJ7OIhcXi0qgkGR9q7QEe9goF11NPUFHWgCYKLYF
         U8xRmH7vmHiD9pVgtiY+W6lW6WxolyoaLsjX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VvPBmhnK4Q9HxzeQD/MDc8OKkrjpvJu9PsbKOMLRVCY=;
        b=upJ3XY40etW/3PS4xZAvWNiJz59h5OXA6IDOyE3UHSez8bcrVeCOGjBngaoqUB85nc
         gcHA0tFolAUF0Y+FeyMKmQ31X4ItjjN1PxUNzUEH329KEGJQENAePMUs0NChmDVKOGjr
         MqB1l+i2nF91Lxo1E50Tc9QXUunGF8tedTjJniKkcKffhWdDD8GzEDz0+n3byz7oQcx+
         NydCSN1muj9QoXJNdBT4Yr8zvH2BSzbuiE+klV1ULtzdxEgP005JQmvadUf6bWaCiMj6
         HS1lZSi9DnMNHwD8EcgIcm0CMmSaRPc4fzrmreT7p/wrUDX7XeAZs7c2SpU4Q0wTxs3X
         m1RA==
X-Gm-Message-State: AFqh2konBoh4aHWgjFPanx2JCSukjbz/G6ryRzNfZ/HptBU9aNHdtuAv
	cKbHMZVkleq/WiSxvsdOTByNjQ==
X-Google-Smtp-Source: AMrXdXuiVXIyPMuGV80wVV0FEy5DR2Fndb+zQsxWmkdLzfYvfBdyxmNScdXxPiSBV7teuXTX45TGjQ==
X-Received: by 2002:a05:6e02:1ba9:b0:30b:fdb5:bd07 with SMTP id n9-20020a056e021ba900b0030bfdb5bd07mr30415134ili.1.1672865582405;
        Wed, 04 Jan 2023 12:53:02 -0800 (PST)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id c7-20020a023307000000b0038a6ae38ceasm11404660jae.26.2023.01.04.12.53.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jan 2023 12:53:02 -0800 (PST)
Date: Wed, 4 Jan 2023 20:53:01 +0000
From: Matthias Kaehlcke <mka@chromium.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 05/11] usb: misc: onboard_usb_hub: add Genesys Logic
 GL852G-OHG hub support
Message-ID: <Y7XnLYbHxfADz7gk@google.com>
References: <20221228100321.15949-1-linux.amoon@gmail.com>
 <20221228100321.15949-6-linux.amoon@gmail.com>
 <Y7XhYm0nvBsSS8MN@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y7XhYm0nvBsSS8MN@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_125304_695324_AD76711B 
X-CRM114-Status: GOOD (  20.66  )
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

On Wed, Jan 04, 2023 at 08:28:18PM +0000, Matthias Kaehlcke wrote:
> On Wed, Dec 28, 2022 at 10:03:14AM +0000, Anand Moon wrote:
> > Genesys Logic GL852G-OHG is a 4-port USB 2.0 STT hub that has a reset pin to
> > toggle and a 5.0V core supply exported though an integrated LDO is
> > available for powering it.
> > 
> > Add the support for this hub, for controlling the reset pin and the core
> > power supply.
> > 
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> >  drivers/usb/misc/onboard_usb_hub.c | 1 +
> >  drivers/usb/misc/onboard_usb_hub.h | 1 +
> >  2 files changed, 2 insertions(+)
> > 
> > diff --git a/drivers/usb/misc/onboard_usb_hub.c b/drivers/usb/misc/onboard_usb_hub.c
> > index 94e7966e199d..c0e8e6f4ec0a 100644
> > --- a/drivers/usb/misc/onboard_usb_hub.c
> > +++ b/drivers/usb/misc/onboard_usb_hub.c
> > @@ -409,6 +409,7 @@ static void onboard_hub_usbdev_disconnect(struct usb_device *udev)
> >  
> >  static const struct usb_device_id onboard_hub_id_table[] = {
> >  	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0608) }, /* Genesys Logic GL850G USB 2.0 */
> > +	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0610) }, /* Genesys Logic GL852G-OHG USB 2.0 */

Do you happen to know what '-OHG' stands for? The Genesys website only
mentions a GL852G with different package types (none of them 'OHG').
Unless there is an 'OHG' variant with a different product id I'd say
let's drop the suffix.

> >  	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2514) }, /* USB2514B USB 2.0 */
> >  	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x0411) }, /* RTS5411 USB 3.1 */
> >  	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x5411) }, /* RTS5411 USB 2.1 */
> > diff --git a/drivers/usb/misc/onboard_usb_hub.h b/drivers/usb/misc/onboard_usb_hub.h
> > index 62129a6a1ba5..2ee1b0032d23 100644
> > --- a/drivers/usb/misc/onboard_usb_hub.h
> > +++ b/drivers/usb/misc/onboard_usb_hub.h
> > @@ -31,6 +31,7 @@ static const struct of_device_id onboard_hub_match[] = {
> >  	{ .compatible = "usb451,8140", .data = &ti_tusb8041_data, },
> >  	{ .compatible = "usb451,8142", .data = &ti_tusb8041_data, },
> >  	{ .compatible = "usb5e3,608", .data = &genesys_gl850g_data, },
> > +	{ .compatible = "genesys,usb5e3,610", .data = &genesys_gl850g_data, },
> 
> s/genesys,//
> 
> >  	{ .compatible = "usbbda,411", .data = &realtek_rts5411_data, },
> >  	{ .compatible = "usbbda,5411", .data = &realtek_rts5411_data, },
> >  	{ .compatible = "usbbda,414", .data = &realtek_rts5411_data, },
> > -- 
> > 2.38.1
> > 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
