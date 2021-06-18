Return-Path: <SRS0=X3sA=LM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50982C48BDF
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jun 2021 20:02:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18B51613C1
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jun 2021 20:02:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18B51613C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xi+CIlSQILU99EDsvTIitn9dbCosfbIOtt0Uui8r9tQ=; b=at9yZqsXOqHxEO
	GCFsjH1RLSMQ+Nf0GtsKi4BPg+aPaSX3L7q552RmYSUngemEeYsCnKlahv51/Ki8bQ7m0Yt06s9iU
	+EjqAte/N34Q4/JKpa0SgbiBwh+54ue1ePnJETaJ+bOk74puiAaQsLZu7ByRCKfxLuveE2aO4cHX1
	0aG0l1aux/lM/UTHTt0CrJYde/LIDSLDJKu+ARkvsm5ImzQNRaVkUGZlp9Wy0GQ0A3RzcJ/nAUpRN
	mfPLir+juII3eh9xBuywNPOVXa4VouNYjefcDMV11Kzjlbxmk2GV08y1ptHR7IMOll6u+f0dSgmTe
	s9OjV3KYDA0vI7Kt+ctg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luKgj-00FP4x-1y; Fri, 18 Jun 2021 20:02:01 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luKgW-00FP2j-4z; Fri, 18 Jun 2021 20:01:49 +0000
Received: by mail-ed1-x529.google.com with SMTP id s15so10124820edt.13;
 Fri, 18 Jun 2021 13:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6QTjBFDFCa5wxgzXV7/ZQNMNegFSSiirJH3DOi2Mowg=;
 b=U4p6NUo6NxmDTnbo2R00GUSqOPKE+qjZt8Klk6p9jMVaMwcujnDAhKDocwfnPzjfJa
 7g7w/VxyBj/G+S2lqjPNd6lGwHp+FU2Y5YP4kz3a1mSzGjEodtZYT0xRNXqcrcl0Yfbh
 4DIUFApCND6+hnkPtPI4EX3/vYFjEr9GZqkub0TOYThSX2LFzdV1N/Z2jWVwxZRff5KA
 CsLl3WMtOMbXaUpK4GcJAr0ade4BluXa7DFCladX8l9jkgHBncxIm0YbcCQbfN1EBXZL
 HOBjx9yl9ur6YHWnH+V4yYyeIY0kzAKwZ8bLmxcUQ5Gbp9KDiwLdv7YlVywxo0jogVlQ
 PpPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6QTjBFDFCa5wxgzXV7/ZQNMNegFSSiirJH3DOi2Mowg=;
 b=Op3XbsJhMIQEccq3ufGY82TbTj53Sg154Xnz8r0kfDnjEZHsXWaBAHfcnp1dLIQMvn
 aC4D5iyTd0qONbur50Ukuz88JNaihg4LxwWY7nkudRwwK6Vi1HSZKCPMctGjl25ykQ0U
 YpuR9JFVPgcoGBwGwJ/jiQ9MrD0bRuNT+Mh+7H492A7bC0AoSZTsTqTZ+h5OVilbUqj4
 BhfIuWifi22WQ4gFWQs4wSz8wM9mlkI/tZ9j55wVnmR1pmMeeFYqXWEdBwkT9I8inNkc
 kUg9kPBSOjGaBpiN/uD51O/QbRcTPC9Psm87wrzkZ6KZZaVTtil8RP7yx2ubBUgTrujK
 IbWQ==
X-Gm-Message-State: AOAM531VmmFGM6oekHvcWWwF0Od0u0ZyX7YCd3EfdRDxTvsYvppdMO5N
 LNfLDjdSWVbWr3I85oFAnrzJ9LsLdR8TN5bZ98A=
X-Google-Smtp-Source: ABdhPJxohO1/4OynRMCvyD6kNQVy6NdX8sknWeZm6xSBJ9r5JVQ2eHpMXAwyt9cYBeaA1M2EVrmvSxABcvi/4z9tMjc=
X-Received: by 2002:a05:6402:3581:: with SMTP id
 y1mr7253865edc.143.1624046504688; 
 Fri, 18 Jun 2021 13:01:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210617194154.2397-1-linux.amoon@gmail.com>
 <20210617194154.2397-5-linux.amoon@gmail.com>
 <CAFBinCB1rrmJ5=M0tSGS_47BarFcrs2Kz5qFzrHw8+OEYxX3DA@mail.gmail.com>
 <CANAwSgQVgKUoTpfaJyfxdphqc6M=Oq6jj5zZ7An9St7PdzQHYA@mail.gmail.com>
In-Reply-To: <CANAwSgQVgKUoTpfaJyfxdphqc6M=Oq6jj5zZ7An9St7PdzQHYA@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 18 Jun 2021 22:01:33 +0200
Message-ID: <CAFBinCDpQybqD96CCMBDKYUXEYCABr0QMfxFH1AWrXP12UxxMg@mail.gmail.com>
Subject: Re: [RFCv1 4/8] phy: amlogic: meson8b-usb2: Use phy set_mode callback
 function
To: Anand Moon <linux.amoon@gmail.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-phy@lists.infradead.org, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-amlogic@lists.infradead.org, 
 Linux Kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_130148_250440_EED845C6 
X-CRM114-Status: GOOD (  18.53  )
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

Hi Anand,

On Fri, Jun 18, 2021 at 3:19 PM Anand Moon <linux.amoon@gmail.com> wrote:
[...]
> > I suggest dropping this patch until we know for sure if and which
> > registers need to be updated based on the DR mode.
>
> Yes, I have observed this, Can you give these small changes a try?
> With the below changes, I got the  PHY_MODE_USB_DEVICE support working.
first of all: sorry that I have not linked my source of information previously:
- Meson8b: [0]
- Meson8 and Meson8m2: [1]

Unfortunately I don't have any datasheet or "better documentation" of
how the registers should be programmed.
This is why I am a bit defensive when I am asked to change something
there - as I simply have no way of knowing if the changes are good or
not. I can only tell whether they're "identical" or "different" from
what the vendor kernel does.

[...]
> +       case PHY_MODE_USB_DEVICE:
> +       case PHY_MODE_USB_OTG:
> +               regmap_update_bits(priv->regmap, REG_ADP_BC,
> +                                  REG_ADP_BC_DCD_ENABLE,
> +                                  REG_ADP_BC_DCD_ENABLE);
> +
> +               udelay(ACA_ENABLE_COMPLETE_TIME);
> +
> +               regmap_read(priv->regmap, REG_ADP_BC, &reg);
> +               if (reg & REG_ADP_BC_ACA_PIN_FLOAT) {
> +                       dev_warn(&phy->dev, "USB ID detect failed!\n");
> +                       return -EINVAL;
> +               }
> +               regmap_update_bits(priv->regmap, REG_ADP_BC,
> +                                  REG_ADP_BC_ID_PULLUP, REG_ADP_BC_ID_PULLUP);
> +               break;
According to the vendor kernel this should only be applied to
"host-only" USB_PORT_IDX_B (which is usb1 in the mainline .dtsi).
Based on that I think it's not correct to apply this for DEVICE and OTG modes.

The vendor kernel does not configure REG_ADP_BC_ID_PULLUP anywhere.
Also DCD_ENABLE is only ever set to 0 (while you are enabling it now), see [2].

As mentioned before: all I can say about this patch is that it
programs the registers differently than the vendor kernel does.
From your description I am not sure if you are now getting different
behavior on Odroid-C1 with this patch (compared to what we had
before).


Best regards,
Martin


[0] https://github.com/endlessm/linux-meson/blob/03393bb8e8478626e03ee93b0a2a225d6de242b5/arch/arm/mach-meson8b/usbclock.c#L120
[1] https://github.com/endlessm/linux-meson/blob/03393bb8e8478626e03ee93b0a2a225d6de242b5/arch/arm/mach-meson8/usbclock.c#L120
[2] https://github.com/endlessm/linux-meson/blob/d6e13c220931110fe676ede6da69fc61a7cb04b6/drivers/amlogic/usb/dwc_otg/310/dwc_otg_pcd.c#L71

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
