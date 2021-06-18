Return-Path: <SRS0=X3sA=LM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B367EC48BDF
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jun 2021 13:21:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CF9F61154
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jun 2021 13:21:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CF9F61154
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AamS5QRvOuxWYOQDawDxtD8LxqMDjSG4IYV0YKs1Szw=; b=SO4IQy8iOYBFW0
	pYUr6mPDjoM2lEVdiZrPl8GLMTKHUZOC6CGMFkyv1K4NLOFP/7udh5n0rSNLMGE637gwofBF2/B4Q
	jcfQO4sgvWjbFhdboNjKreYwHa4WiJVZjyrHh5g7JJ3hV+I+Am1vX3zhAmF2IiG+RiAX7lJN0gxq+
	UwhxJPu1JyhTM7AvAHds4oWw+hqMvGZ895VYw839SBCWfX/uGst4XOwWP7CZ0OZxOs2LeQs7pfHPj
	pf2fBraZ4toF3q1l41k2lIcVwecTE3E7+MtrD2u5XhYoljm4HbbsLmomoacgTT9UbyXJWwwbP1PYK
	G2YALMp1eguvuonFd5uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luERG-00EBve-1w; Fri, 18 Jun 2021 13:21:38 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luEP0-00EAd3-JQ; Fri, 18 Jun 2021 13:19:22 +0000
Received: by mail-ej1-x634.google.com with SMTP id he7so15841933ejc.13;
 Fri, 18 Jun 2021 06:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P8V4PPjDC1gz6JriGuuoHP1QKqxpavt/zsBJP5m9gcE=;
 b=e2Cic6CbgHhdrBDz14ZdYtzulhyV+7dKvI09WXaTR0dOvZ5PLsNABW3otQIIncHt1J
 gO1LWIfD2zc2qKiF/HubchlTc6kC2PEV7FHsWhO+5zL0y/0c8EOsIUtZTfE/4wReDKZf
 t6czmTxN9sU1EgNvlESX6xVb/wGfM4VDXD8KMkTOnIiXJGqPaGetbyWordY1KAkyhbj6
 pC+7CGaUmLEeS/bnJFapglFMEoG+xTPbcKz0PaZBGQEiItiXF2wtUmPlfV6jCSNx3D/j
 LQ4ZNDBIzH1ojYb7mNzFMlGjU4sEADW7/IDd1oZ/Y2AeX8YclE0ZZjhbCcYmsDG7xFbz
 cc7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P8V4PPjDC1gz6JriGuuoHP1QKqxpavt/zsBJP5m9gcE=;
 b=mQMPgyftflA1adVc3eP0zY99QNSoswrukhKz9rgSgqYrmWEDKuQqnKRllqz6wTUaTw
 wc70lemVhTIQkpKh4bz5I7cg9/ifTz0uRof6DixUW3bbnXdxLJ3IiloaCSnsZOdSLd6t
 10IJkBc3num8xRR23OemOp6UuJ3TpvDMbq+fVh9uppzclO2vQXSDxMY3HsqoAydaojhv
 lW1bw2LzHZXowvJyZw19HlA3C9KTHaMLJu3ls331F3IZpYa7nbPG6kkswnXWPY9ZQoLi
 iPgpFh6ArS3ebLx+o4gGKcfyoAioQf/GMp7KlBwLTeIdc419q97m0pp1oT1KX0Evmfd1
 mshA==
X-Gm-Message-State: AOAM530toLwtBh/8AH3PBnCNB7XAEVOf1NCQ3lzPpix8UXzx1GlOATmw
 WkJr4/w+bG3iPyQ7PJXJFvRhdIz8DuehqnWn/ZU=
X-Google-Smtp-Source: ABdhPJwWJL6HHS3kXwwEJ2gM8GNLYhNhomtQGKiImb6LnNLsv+4EMk98BFu7/G2bgbQrIGlpl2DkoSY82MVmAMI4VVc=
X-Received: by 2002:a17:907:7848:: with SMTP id
 lb8mr11322909ejc.494.1624022357121; 
 Fri, 18 Jun 2021 06:19:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210617194154.2397-1-linux.amoon@gmail.com>
 <20210617194154.2397-5-linux.amoon@gmail.com>
 <CAFBinCB1rrmJ5=M0tSGS_47BarFcrs2Kz5qFzrHw8+OEYxX3DA@mail.gmail.com>
In-Reply-To: <CAFBinCB1rrmJ5=M0tSGS_47BarFcrs2Kz5qFzrHw8+OEYxX3DA@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 18 Jun 2021 18:49:05 +0530
Message-ID: <CANAwSgQVgKUoTpfaJyfxdphqc6M=Oq6jj5zZ7An9St7PdzQHYA@mail.gmail.com>
Subject: Re: [RFCv1 4/8] phy: amlogic: meson8b-usb2: Use phy set_mode callback
 function
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-phy@lists.infradead.org, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-amlogic@lists.infradead.org, 
 Linux Kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_061918_719648_24DAF664 
X-CRM114-Status: GOOD (  24.16  )
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

hi Martin.

Thanks for your review comments.

On Fri, 18 Jun 2021 at 03:46, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Anand,
>
> On Thu, Jun 17, 2021 at 9:43 PM Anand Moon <linux.amoon@gmail.com> wrote:
> >
> > Reorder the code for phy set_mode in .set_mode callback function.
> > For now configure the phy in host mode.
> as mentioned in the cover-letter: to my knowledge these register bits
> are "static"
> The settings for dr_mode == USB_DR_MODE_HOST mainly apply to the
> second PHY (usb1_phy)
>
> [...]
> > +static int phy_meson8b_usb2_setmode(struct phy *phy, enum phy_mode mode,
> > +                                   int submode)
> >  {
> >         struct phy_meson8b_usb2_priv *priv = phy_get_drvdata(phy);
> >         u32 reg;
> >
> > +       switch (mode) {
> > +       case PHY_MODE_USB_HOST:
> > +               if (priv->match->host_enable_aca) {
> > +                       regmap_update_bits(priv->regmap, REG_ADP_BC,
> > +                                          REG_ADP_BC_ACA_ENABLE,
> > +                                          REG_ADP_BC_ACA_ENABLE);
> > +
> > +                       udelay(ACA_ENABLE_COMPLETE_TIME);
> > +
> > +                       regmap_read(priv->regmap, REG_ADP_BC, &reg);
> > +                       if (reg & REG_ADP_BC_ACA_PIN_FLOAT) {
> > +                               dev_warn(&phy->dev, "USB ID detect failed!\n");
> > +                               return -EINVAL;
> > +                       }
> > +               }
> > +               break;
> > +       default:
> > +               dev_warn(&phy->dev, "USB ID detect failed to setnode! %d\n", mode);
> > +               return -EINVAL;
> I have tested this driver already with PHY_MODE_USB_DEVICE (on my
> Odroid-C1) so I don't see why we should drop support for this
> Also if we want runtime mode switching in this driver then we would
> need to undo the changes from "case PHY_MODE_USB_HOST" above
>
> I suggest dropping this patch until we know for sure if and which
> registers need to be updated based on the DR mode.

Yes, I have observed this, Can you give these small changes a try?
With the below changes, I got the  PHY_MODE_USB_DEVICE support working.

Here is the boot log of odroid c1+
[0] https://pastebin.com/pCXLS5Vu

$ lsusb -t
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=dwc2/1p, 480M
    |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M
        |__ Port 3: Dev 4, If 0, Class=Mass Storage, Driver=usb-storage, 480M
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=dwc2/1p, 480M
    |__ Port 1: Dev 2, If 0, Class=Human Interface Device, Driver=usbhid, 12M
    |__ Port 1: Dev 2, If 1, Class=Human Interface Device, Driver=usbhid, 12M

 git diff drivers/phy/amlogic/phy-meson8b-usb2.c
diff --git a/drivers/phy/amlogic/phy-meson8b-usb2.c
b/drivers/phy/amlogic/phy-meson8b-usb2.c
index bd624781d914..9b79e86d7a0d 100644
--- a/drivers/phy/amlogic/phy-meson8b-usb2.c
+++ b/drivers/phy/amlogic/phy-meson8b-usb2.c
@@ -204,6 +204,22 @@ static int phy_meson8b_usb2_setmode(struct phy
*phy, enum phy_mode mode,
                        }
                }
                break;
+       case PHY_MODE_USB_DEVICE:
+       case PHY_MODE_USB_OTG:
+               regmap_update_bits(priv->regmap, REG_ADP_BC,
+                                  REG_ADP_BC_DCD_ENABLE,
+                                  REG_ADP_BC_DCD_ENABLE);
+
+               udelay(ACA_ENABLE_COMPLETE_TIME);
+
+               regmap_read(priv->regmap, REG_ADP_BC, &reg);
+               if (reg & REG_ADP_BC_ACA_PIN_FLOAT) {
+                       dev_warn(&phy->dev, "USB ID detect failed!\n");
+                       return -EINVAL;
+               }
+               regmap_update_bits(priv->regmap, REG_ADP_BC,
+                                  REG_ADP_BC_ID_PULLUP, REG_ADP_BC_ID_PULLUP);
+               break;
        default:
                dev_warn(&phy->dev, "USB ID detect failed to setnode!
%d\n", mode);
                return -EINVAL;
>
>
> Best regards,
> Martin

Thanks


-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
