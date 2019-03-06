Return-Path: <SRS0=k/HH=RJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EB3FC4360F
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 Mar 2019 21:04:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5742D206DD
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 Mar 2019 21:04:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rOD/6LDq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Cnmw59xT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5742D206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qtBcnL/zgfSHIF/5NB0WP73+ODaFK67P4BdzFPA9pFM=; b=rOD/6LDqiTexHx
	1oJual3SvsrqiUG8B0Hc9Do5peoDOhlszfhxREniRJpghL1WP4Xps62cH1VU8Upcpqg0oY3wv/yJN
	7tBL7VM8rvDhYHYfXwx3mPZTKO3zu1M/QTd1/CoTKL1jgEjfzdhRnEpuiW2vxARoXNO+K13hjf5nE
	HKAQYM0IVqD92zJDTxGxKNPcqsNHrPx1Q14HuvnxVt5DdxFwBfGxD+5iqVJhlGx0F4z8tV1cYU/Jd
	CqGwFwax1jkoCKMagl2QOycCHuK90CVNT7sht+qAsMNK/sr8wY12UtC5iUihD3JNn595xGkxILXJp
	OjPtz1MOux9XHSywScWw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1die-0007M3-Lh; Wed, 06 Mar 2019 21:04:52 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1diZ-0007LE-H3; Wed, 06 Mar 2019 21:04:51 +0000
Received: by mail-oi1-x241.google.com with SMTP id b4so11076262oif.6;
 Wed, 06 Mar 2019 13:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jgbYN7sbTtC5qybBooAIr5XzExXz/wGYviaUCOPutr0=;
 b=Cnmw59xTES08avSK1MsPmNO4e8KJ0RJx69irjQs+gmTL/Iqm0TGcuK8RmulXSmQoeb
 Z0b8WM3uemB4HjUV2yutud/+pru4iPJqbI6Al8buJWiwGuLH59en0gbqT60P2dV0ti1N
 DL6BqdZGA6GYcc/hY/Re79bJbxxWs0EUpbIbChPg6Biunwy64o0W5wjIQO56rCdK1Rcz
 cBs6JoCE8Gmxk7Oqq/+XkRStaAoZc/TLwt6ffYWmHJCnksLqxXtxzQd2il9G89zFnarU
 YLjpvDE9aUsqOsUWraei16c1hMJMvdkW5/ZZ8G4zR80my9JGag2s5g6ZcQNVGEGMIbBM
 USeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jgbYN7sbTtC5qybBooAIr5XzExXz/wGYviaUCOPutr0=;
 b=e6D3ZogCyg2mRamUdjocNpKEKeJyeiNlb6gJQpO1hqOXlJfAHFEATeJLBEFPxe7Snc
 bg+EJP6wsfeJLDA9XsfXgPAAW1liG4jRC+g1I4RjX+ZQTVmYP8BJIXenW0cbWaWvR9P0
 bRLuKSG4f++/ebgHvK+Tzi8NJA+unQ0BL4S0CDnGG9sxWtNnEHqSZ9J/6nE0cvD6rXfc
 M2mMQlTnVfAVwQZmP3cXwCa9ZfrZm36e5IayTx2PAooc9O2MpSBYVP0lcxxM050xrZhG
 avxmLo/b4M4sOXJPsOyYvueJUNlfPF3W1bg+a6st1Iy0+0J6PNYniln0mgJ0le6kw4fU
 SrFw==
X-Gm-Message-State: APjAAAWdU/Q8E3u0T6ylWypQTmIukQmJIYsiqovej/QpPd88nIBHpvx5
 Idq9FyzFNXHed+s5F2hS8BDtvYP8eJMICsorozw=
X-Google-Smtp-Source: APXvYqyVtjeWk0g8Ubz1AWZ+XM9e9958QjEqCl7+EO3jTyzf+hO4qoxHWStx0+OfNIQe6+W2ndySRo5jhuIrWEIE/5w=
X-Received: by 2002:aca:aacb:: with SMTP id t194mr3009114oie.129.1551906284488; 
 Wed, 06 Mar 2019 13:04:44 -0800 (PST)
MIME-Version: 1.0
References: <20190304103846.2060-1-narmstrong@baylibre.com>
 <20190304103846.2060-7-narmstrong@baylibre.com>
In-Reply-To: <20190304103846.2060-7-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 6 Mar 2019 22:04:33 +0100
Message-ID: <CAFBinCBnDPcHpOQ1vW1gL6FxgLSxMv-f-qMm_TTCvXfDaFr3zA@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] phy: amlogic: Add Amlogic G12A USB3 + PCIE Combo
 PHY Driver
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190306_130447_598755_7B45C250 
X-CRM114-Status: UNSURE (   8.53  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, kishon@ti.com, hminas@synopsys.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Mon, Mar 4, 2019 at 11:40 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
[...]
> +static int phy_g12a_usb3_init(struct phy *phy)
> +{
> +       struct phy_g12a_usb3_pcie_priv *priv = phy_get_drvdata(phy);
> +       int data, ret;
> +
> +       /* Switch PHY to USB3 */
> +       regmap_update_bits(priv->regmap, PHY_R0,
> +                          PHY_R0_PCIE_USB3_SWITCH,
> +                          PHY_R0_PCIE_USB3_SWITCH);
does this automatically clear PHY_R0_PCIE_POWER_STATE (in case the
bootloader incorrectly set that)?

[...]
> +static int phy_g12a_usb3_pcie_init(struct phy *phy)
> +{
> +       struct phy_g12a_usb3_pcie_priv *priv = phy_get_drvdata(phy);
> +       int ret;
> +
> +       ret = reset_control_reset(priv->reset);
> +       if (ret)
> +               return ret;
> +
> +       if (priv->mode == PHY_TYPE_USB3)
> +               return phy_g12a_usb3_init(phy);
> +
> +       /* Power UP PCIE */
> +       regmap_update_bits(priv->regmap, PHY_R0,
> +                          PHY_R0_PCIE_POWER_STATE,
> +                          FIELD_PREP(PHY_R0_PCIE_POWER_STATE, 0x1c));
similar to my question above: does this automatically clear
PHY_R0_PCIE_USB3_SWITCH (in case the bootloader incorrectly set that)?

Apart from these two questions this looks good to me!


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
