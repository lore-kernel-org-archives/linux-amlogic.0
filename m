Return-Path: <SRS0=sMge=MM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60F33C07E9B
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Jul 2021 22:09:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EEDF611F2
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Jul 2021 22:09:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1EEDF611F2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AaGnphyyjf/fuu2AJTM3aMdMZqfwJl6q4Q93T4AIH04=; b=vvNxbqhaay0XWq
	7MdvVKWgOpr4wbW5dfemGZ5B+5P2SvVVtQCjXqdxwDr+e+FEcmOgXQ9s8K3GiHjBrP03sr/uSKjDm
	Y6oFJKR/yA33wTnS454Yan361YMjVLlUDdvIN5LqSuxdA3IKQbUOz1uECmY5AEsq6KajMIjy98L9k
	xmJT36YtjlHVhLOx2nM1WKAj+QjaEtyUVf9Yw1mU0bB+pow3dRnvPuau7JuVuBoVKaPqGJ5+yc8tX
	KhgtzQNRLfzE1U37h8xQmiDzsFGVTk8FmKqnMi4O7ZpVtqSqVS4EAZ/3GcTqMeK7tvupwYGu2y1dy
	zroCuVfTJf6r3f3YBNsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5xvL-00E3Hl-FM; Tue, 20 Jul 2021 22:09:11 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5xvI-00E3Ge-Fw; Tue, 20 Jul 2021 22:09:10 +0000
Received: by mail-ej1-x62e.google.com with SMTP id hr1so269429ejc.1;
 Tue, 20 Jul 2021 15:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9yBLdY7KHxHrlVOjcFhT5on4b0ty5A/PIQKOp8H8sX0=;
 b=Of5GcmXFYsBBYYwA+L8dlDsyNx8xmE73+coBwK7Tw+ci53/8kYSkvDkgDDBRPbvyD1
 0Y3KxVY3h8Ae1p59bRAC1yUmonHZ5rnN6/Sv/YVJKpZ0SqsjgggRL00pHg2vTcV7sQBq
 NsBOB5rILAoCNQ0Drn1vV7yp0ZvzJ4FlrPbxh5Wzkfw3KeiR3CaX11xjlW32LxDurc71
 sZfeRDl6D/eOd3oDJK/hN2Cutp385DgIaBoZij79Kt9UzWdj5pKJfEx8TI1pVZ3NAH4o
 3qiGNMZj2w3aRlz0w6JNxGBbSyaW6/Bo5Z8q8ar9LdgBYbGAqbZkYSwye+Jr3I7fB6dR
 0+EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9yBLdY7KHxHrlVOjcFhT5on4b0ty5A/PIQKOp8H8sX0=;
 b=gfaWdEl7pqZqvRFAiWAmjW2Lx7Wi3AjW9a5HyuqXSdweulwM8zhpCzLn/ql8/GO67Z
 S5W81FQUhxZaksIIVM33sh0lkgiTnVOIw8C7YgO0XDt/u8ApgGE15Rczzl8gLGPyr4xf
 YV/S5VntJFWvmK+GIGmmOyBYYghrU3V7A8CT8DMvi1wx88j9CrIu59GezhJSbUdBy/Qw
 2O1GKr5yd9yDtR+INM618KEIQnmWkqwad090L0OxixerjSe9Cj5ckbJhNznl2sBT+GTY
 SkkDX3yBG2OC45EXikOcKy/CKOv1F0uhRCbQhvP2QecRpkA+OP4QpyvJy2BEm53Xvq2D
 OElw==
X-Gm-Message-State: AOAM532m82qBhN/7Wf0DHWAHOPoQmzKC/b/XZPOHVHTglJCCcNpDojug
 7gHaiiIE/LxjHCCFzVm/TJmE2qY/H+9dKQJQf1s=
X-Google-Smtp-Source: ABdhPJwqJT12MjIkIm+nGR/6gUPI783Xejf4KnzDG/n9SAhxLQdAmS4aC0+kTR5vSb9DzeZdy4c9V3+Qx+c6osjThL8=
X-Received: by 2002:a17:906:53d1:: with SMTP id
 p17mr35539038ejo.208.1626818946563; 
 Tue, 20 Jul 2021 15:09:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210629182047.893415-1-martin.blumenstingl@googlemail.com>
 <20210629182047.893415-3-martin.blumenstingl@googlemail.com>
 <YPaLKwEKcDLWwztM@matsya>
In-Reply-To: <YPaLKwEKcDLWwztM@matsya>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 21 Jul 2021 00:08:55 +0200
Message-ID: <CAFBinCCJ5DjvjkfjYg7SveDB0bvJ-XV6BwcF_yEeUqxRN9awiQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] phy: amlogic: Add a new driver for the HDMI TX PHY
 on Meson8/8b/8m2
To: Vinod Koul <vkoul@kernel.org>
Cc: robh+dt@kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, kishon@ti.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210720_150908_576482_62A2CDF0 
X-CRM114-Status: GOOD (  21.83  )
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

Hi Vinod,

On Tue, Jul 20, 2021 at 10:37 AM Vinod Koul <vkoul@kernel.org> wrote:
[...]
> > +     if (clk_get_rate(priv->tmds_clk) >= 2970UL * 1000 * 1000)
> > +             hdmi_ctl0 = 0x1e8b;
> > +     else
> > +             hdmi_ctl0 = 0x4d0b;
>
> magic numbers..? I guess these are register offsets, would be better to
> define..
Unfortunately these are register values, not offsets
The only "documentation" I have is:
- documentation for the bits/bit-fields in these registers [0]
- some reference code with magic values from the vendor BSP: [1]

HDMI_CTL0/HDMI_CTL1 (the names from the datasheet) is not very
specific and I could not find any other explanation on what the values
mean.
That's why I cannot offer more than these magic values (same situation
for your finding below).

[...]
> > +     ret = device_property_read_u32_array(&pdev->dev, "reg", reg,
> > +                                          ARRAY_SIZE(reg));
>
> we have reg as single property, why array with 2 entries here?
My thought when Rob requested a "reg" property in the dt-bindings was
that I should use offset and size.
I am not validating the size here, which would be in reg[1].
If it's fine for Rob as well then I'll switch the dt-bindings to just
have the offset inside the reg property.

[...]
> > +static const struct of_device_id phy_meson8_hdmi_tx_of_match[] = {
> > +     { .compatible = "amlogic,meson8-hdmi-tx-phy" },
> > +     { .compatible = "amlogic,meson8b-hdmi-tx-phy" },
> > +     { .compatible = "amlogic,meson8m2-hdmi-tx-phy" },
> > +     { /* sentinel */ }
>
> I see that all three are handled similarly, no difference!
So far this is correct, they're all treated the same.
However, it happened to me (multiple times) in the past that later on
I would spot a difference hidden in the vendor BSP.
One example is commit f004be596c28f9 ("phy: amlogic: meson8b-usb2: Add
a compatible string for Meson8m2").
I know that other parts of the graphics pipeline are different on
Meson8 compared to the other two SoCs (because Meson8b/Meson8m2 have
some reset lines which need to be toggled after updating the video
clocks. these resets don't exist on Meson8).
So I decided to play safe and add compatible strings for every SoC so
I can easily handle any differences in the future (in case I find
any).


Best regards,
Martin


[0] https://dn.odroid.com/S805/Datasheet/S805_Datasheet%20V0.8%2020150126.pdf
[1] https://github.com/endlessm/linux-meson/blob/d6e13c220931110fe676ede6da69fc61a7cb04b6/arch/arm/mach-meson8/hdmi_tx_hw/hdmi_tx_hw.c#L2350-L2381

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
