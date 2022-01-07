Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E18DDC433EF
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jan 2022 22:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cy6mHgn/SAvPK/Uk3BznkFS3y6rSfIXWJB28CDqOC7I=; b=QgB+ckKMiMMeqb
	hOPpLdr1FOI45cL1m7NJmgeVKbgnJO+zwwIDQl0E8S6nulxcBBbya8ersRe7uth4VY2QDM0+To3Gs
	KJp4D1+cUwMg7OdPO1Fs+alHlwOHwVLSVxxCfG1PaZVntAmifTg1S3uoHDybV/ccEfm+ur4OqFda/
	okkrTz+aZlDaHYcPP38OKquWayu/UUgXrPG4LQIgqmUJHABtASETQH5UFM3Rkv+Y9G0evv4FnrngC
	U2J97UiQ3dD+yPN9p+YiMFAOBZ+AN8W/sfPBMbEtFpkV6LDC/gXXeEDUN6dY1Bj6S6DRR2RR57sJD
	tOGqVevaldD+dINn0LcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5xQN-005MID-O1; Fri, 07 Jan 2022 22:09:27 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5xQL-005MHK-2o; Fri, 07 Jan 2022 22:09:26 +0000
Received: by mail-ed1-x536.google.com with SMTP id b13so27179615edd.8;
 Fri, 07 Jan 2022 14:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4+0ZpFdgBKihQctxGsR5tz5extrL8aulkQZU1Kn3azo=;
 b=K3ZcUyDM3Xy3mHkSHSdku4XVutFc0wBOgQ298XZZbl41dH+SV1Sl+YTDH+ZmccgVZW
 cB26EaTH8yMaFESd5M5Th5+qVyZ03IB4fQSqVTXj4FLapg+1CxRABeGIYtAffiZzQyMK
 TN6NxI2Wl/1dWBLuzo+NnsvN41LR1844VIEE1Vnp+MkzVERHGS7ipLxo5Ce7BF7I9oDH
 Oagxs56lCIYgtdwoccq9K1e76+ieIEVenbc7fWE234q4sDZg2ESsLw0w0IDga11NXeKy
 xKVTTYh85E1msdtQ7lZpf2gRI+jxrN0bsKxeXEJc5Q5ixbwnT68SELi4Js8kf2nNfcmG
 RI1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4+0ZpFdgBKihQctxGsR5tz5extrL8aulkQZU1Kn3azo=;
 b=IsqicYCWD1XJXVTtGAxIcsggmeFIIptQvgdtRkZCX+xX7/xkAqEZrKiuf+0KJsZqoD
 vhSkz4tglUwQ/amrn9/Qw3j9ptCPD7blqwJ5ZTnmP0bZMSOkXbm1yPgfiDUzopRb4cb8
 GKjD7w06EznWu3oZ9rW91lYEfn3+YSM8RxsFAR/NcX5ZblUjRsabh9dv0X+22ymMxaY9
 jH98lk+oK03kGM+1/lNZW0gDk3PUGhTpKS+aAgaxGooVZM8ykxPydy75jlp8y4jr4lwE
 Z22nJRwDr81Elwaz0kFxTsU3HjQPdrBTZrFScan2u+DJ09+vBHjOY9mRE8aMRekifmJk
 nPRA==
X-Gm-Message-State: AOAM533pLOewG9ZMjac4w9htHgTLF5FWFxeLSpGh2lTZ4DwK4u6uyqzh
 mndh6y2i1FIV1BGOoeBqOfv+rnBv7dQAbBvYLY4=
X-Google-Smtp-Source: ABdhPJzeY83EKOGSCN9Dn8swluMDNbgvxPIXcBwiH7LpXk5Wf7DawvbKULi0rEQR33XhaAtyGEHq3NwqqLMBBhKLhMs=
X-Received: by 2002:a05:6402:518a:: with SMTP id
 q10mr61116623edd.29.1641593363736; 
 Fri, 07 Jan 2022 14:09:23 -0800 (PST)
MIME-Version: 1.0
References: <20220107150512.614423-1-narmstrong@baylibre.com>
 <20220107150512.614423-3-narmstrong@baylibre.com>
In-Reply-To: <20220107150512.614423-3-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 7 Jan 2022 23:09:13 +0100
Message-ID: <CAFBinCC9J_w9JM-TmrXp7SXT27V7Ze37wrxHZZQ1==N4y2-0dg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] phy: amlogic: Add G12A Analog MIPI D-PHY driver
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: kishon@ti.com, vkoul@kernel.org, linux-phy@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_140925_189713_36189F89 
X-CRM114-Status: GOOD (  12.76  )
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

Hi Neil,

On Fri, Jan 7, 2022 at 4:06 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
[...]
> +#define HHI_MIPI_CNTL2 0x08
> +#define                HHI_MIPI_CNTL2_DIF_TX_CTL1      GENMASK(31, 16)
> +#define                HHI_MIPI_CNTL2_CH_EN            GENMASK(15, 11)
> +#define                HHI_MIPI_CNTL2_DIF_TX_CTL0      GENMASK(10, 0)
> +
> +#define DSI_LANE_0                             BIT(4)
> +#define DSI_LANE_1                             BIT(3)
> +#define DSI_LANE_CLK                           BIT(2)
> +#define DSI_LANE_2                             BIT(1)
> +#define DSI_LANE_3                             BIT(0)
At first I thought that these should be named
HHI_MIPI_CNTL2_DSI_LANE_0 (and similar).
But then I understood that they aren't bits directly in HHI_MIPI_CNTL2
but they belong to HHI_MIPI_CNTL2_CH_EN.
Have you considered naming them for example
HHI_MIPI_CNTL2_CH_EN_DSI_LANE_0 to make this more clear?

[...]
> +       if (IS_ERR(map)) {
> +               dev_err(dev,
> +                       "failed to get HHI regmap\n");
> +               return PTR_ERR(map);
I suggest using:
  return dev_err_probe(dev, PTR_ERR(map), "failed to get HHI regmap\n");
to simplify the code

[...]
> +       if (IS_ERR(priv->phy)) {
> +               ret = PTR_ERR(priv->phy);
> +               if (ret != -EPROBE_DEFER)
> +                       dev_err(dev, "failed to create PHY\n");
> +               return ret;
and similar here:
  return dev_err_probe(dev, PTR_ERR(priv->phy), "failed to create PHY\n");

[...]
> +static const struct of_device_id phy_g12a_mipi_dphy_analog_of_match[] = {
> +       {
> +               .compatible = "amlogic,g12a-mipi-dphy-analog",
> +       },
> +       { },
In the past I was suggested to use:
  { /* sentinel */ }
meaning: no trailing comma here so nobody can add entries after the
sentinel by accident.
I suggest doing the same here if you re-spin this series.


Thank you!
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
