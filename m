Return-Path: <SRS0=PlEO=6S=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54FEEC47257
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 May 2020 11:00:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20886206B8
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 May 2020 11:00:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RzP4RxZH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FMqEVASM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20886206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aAiTjnq7K57mfUhjVe2Nl0/I61f/EQbpaanLDdUcAxc=; b=RzP4RxZH1YFpRv
	KaU3a7eUMknYhmLUwLRvOm+TAyMk2j8tKuitB/di/vG3kJhJ7mDVCVhBRRbDkUNHxEi4DW+gB8yK9
	Aj6TvaNd/oqIW0krTTYPvq6hH3SUEpWmQNoGwVUXVNzEVP8rMaag3VBmD/zEIM5dxuXOK9Ga9kXBP
	IiT4NFCxLrLaN+7YWvL9qY7VXg9JpFkoxqqKKO3RVdnsS2eMx/LjZ/vm7/LI1pvk24z+fEhoTcZDu
	2hHa0CD0G2nqccuMh0xVT9zTUSKj41uAVJYyLwvS82OjJKWMxtfdpUDlCg7ovTW7E75RBw/K6AKIq
	gYjDftIyD07aPK1/4M/A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVYpp-00055w-NF; Mon, 04 May 2020 11:00:29 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVYpm-000550-EX; Mon, 04 May 2020 11:00:27 +0000
Received: by mail-wm1-x343.google.com with SMTP id k12so7880484wmj.3;
 Mon, 04 May 2020 04:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j78pwgAoPIBXpzCPQa9obI1dS/AtoekTWfi/Z9wgTpE=;
 b=FMqEVASMwd4jsKWMbAfOMx/EXRykuKYV/52Xl+u4cPeVIB+mJWcN7ENXhsbR7M4YJc
 INi2krmc920kV+fanUnf0LILJH2Vmh/gmmgk4A7BXBQAfzTu+Zm58kFeDWvGGfM5dAHJ
 7R9XZXqsajrXS7/zCRbwZQGQrHHzAvouV68ESanU82QXWL2QQyIVUeA7sdBOosriWGXE
 SRtWN7QSzU6D579adzQtB5mdv/NeBhdlq+ZidnENn7rHNGyscMVcKK0DoRAVJBDpCrq+
 XeKGgCNTrGfGaVKG9C1tN6Isl3gKQkdvJTBKgL6n9rwYTdKQ7ijEgpd+WTIW3CmHcxI0
 y8GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j78pwgAoPIBXpzCPQa9obI1dS/AtoekTWfi/Z9wgTpE=;
 b=gaiFJQ7OGRvzopDvmaK9lU6j0gG+TObHFDh8cejlydctIKr1QlRv2EuDJVZ06islyE
 qiYBT8IvC2ab7egGWmA4PIECjYSXS/qR7erdv7gkoa1+TJGUI3FKmMM+gT1nDVRsxbn8
 Iz3bfBUX3TjL6LSMZibj2eCSPSEoA6rF1ZngrpHNGT21iNLy9x3bmWwX48XAeu0VYqJ7
 tVo207aY3cguBzDIPeYeXIRvXNiRdBd63zHn2/e3XvbLJA8A7m0Stgmfs6sHpRH7CtAN
 cCVv8fivUGyLxzbpmUlFqT/j1yOvTiLuvgTDDvS2rqvfhM/60aMWAPmZ9qm2sVX1LRLB
 9iXQ==
X-Gm-Message-State: AGi0PuZtBpg5fk9eWuNp/3JYnxIiB3/eRebJ8+qMHKdOY+n2mCSEbaio
 5TqUXlA96jqNKHSaFNE155AXCdMEEgRnzx9cPmJ8m0V3EHA=
X-Google-Smtp-Source: APiQypLU0iLwcBk2HNdVaMBVWBe/1k0yjxd5T16MVENu1G8k0t+p0w9Rby7rjQjjzKlds5iHe4qWJXWBe1wvpqtxMAg=
X-Received: by 2002:a05:600c:c9:: with SMTP id
 u9mr13753067wmm.15.1588590025222; 
 Mon, 04 May 2020 04:00:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200502114752.1048500-1-martin.blumenstingl@googlemail.com>
 <20200502114752.1048500-6-martin.blumenstingl@googlemail.com>
In-Reply-To: <20200502114752.1048500-6-martin.blumenstingl@googlemail.com>
From: hex dump <hexdump0815@gmail.com>
Date: Mon, 4 May 2020 13:00:10 +0200
Message-ID: <CAKTihDXSmqzBxndCRncpBRdqKCtrujpzWUJ_-3k7JvXpNKSQKQ@mail.gmail.com>
Subject: Re: [PATCH 5/6] phy: amlogic: meson8b-usb2: unset the IDDQ bit during
 PHY power-on
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200504_040026_492477_F3B478B6 
X-CRM114-Status: GOOD (  15.75  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, narmstrong@baylibre.com,
 linux-kernel@vger.kernel.org, kishon@ti.com, vkoul@kernel.org,
 robh+dt@kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, May 2, 2020 at 1:48 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> The vendor driver unsets the set_iddig bit during power-on as well and
> sets it when suspending the PHY. I did not notice this in the vendor
> driver first, because it's part of the dwc_otg driver there (instead of
> their PHY code). While here, also add all other REG_DBG_UART register
> bit definitions.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Tested-by: hexdump <hexdump0815@googlemail.com>

> ---
>  drivers/phy/amlogic/phy-meson8b-usb2.c | 44 +++++++++++++++++++-------
>  1 file changed, 32 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/phy/amlogic/phy-meson8b-usb2.c b/drivers/phy/amlogic/phy-meson8b-usb2.c
> index 7236b8885f07..436dfa1a8a04 100644
> --- a/drivers/phy/amlogic/phy-meson8b-usb2.c
> +++ b/drivers/phy/amlogic/phy-meson8b-usb2.c
> @@ -78,6 +78,17 @@
>         #define REG_ADP_BC_ACA_PIN_FLOAT                BIT(26)
>
>  #define REG_DBG_UART                                   0x10
> +       #define REG_DBG_UART_BYPASS_SEL                 BIT(0)
> +       #define REG_DBG_UART_BYPASS_DM_EN               BIT(1)
> +       #define REG_DBG_UART_BYPASS_DP_EN               BIT(2)
> +       #define REG_DBG_UART_BYPASS_DM_DATA             BIT(3)
> +       #define REG_DBG_UART_BYPASS_DP_DATA             BIT(4)
> +       #define REG_DBG_UART_FSV_MINUS                  BIT(5)
> +       #define REG_DBG_UART_FSV_PLUS                   BIT(6)
> +       #define REG_DBG_UART_FSV_BURN_IN_TEST           BIT(7)
> +       #define REG_DBG_UART_LOOPBACK_EN_B              BIT(8)
> +       #define REG_DBG_UART_SET_IDDQ                   BIT(9)
> +       #define REG_DBG_UART_ATE_RESET                  BIT(10)
>
>  #define REG_TEST                                       0x14
>         #define REG_TEST_DATA_IN_MASK                   GENMASK(3, 0)
> @@ -172,20 +183,24 @@ static int phy_meson8b_usb2_power_on(struct phy *phy)
>         regmap_update_bits(priv->regmap, REG_CTRL, REG_CTRL_SOF_TOGGLE_OUT,
>                            REG_CTRL_SOF_TOGGLE_OUT);
>
> -       if (priv->dr_mode == USB_DR_MODE_HOST &&
> -           priv->match->host_enable_aca) {
> -               regmap_update_bits(priv->regmap, REG_ADP_BC,
> -                                  REG_ADP_BC_ACA_ENABLE,
> -                                  REG_ADP_BC_ACA_ENABLE);
> +       if (priv->dr_mode == USB_DR_MODE_HOST) {
> +               regmap_update_bits(priv->regmap, REG_DBG_UART,
> +                                  REG_DBG_UART_SET_IDDQ, 0);
>
> -               udelay(ACA_ENABLE_COMPLETE_TIME);
> +               if (priv->match->host_enable_aca) {
> +                       regmap_update_bits(priv->regmap, REG_ADP_BC,
> +                                          REG_ADP_BC_ACA_ENABLE,
> +                                          REG_ADP_BC_ACA_ENABLE);
>
> -               regmap_read(priv->regmap, REG_ADP_BC, &reg);
> -               if (reg & REG_ADP_BC_ACA_PIN_FLOAT) {
> -                       dev_warn(&phy->dev, "USB ID detect failed!\n");
> -                       clk_disable_unprepare(priv->clk_usb);
> -                       clk_disable_unprepare(priv->clk_usb_general);
> -                       return -EINVAL;
> +                       udelay(ACA_ENABLE_COMPLETE_TIME);
> +
> +                       regmap_read(priv->regmap, REG_ADP_BC, &reg);
> +                       if (reg & REG_ADP_BC_ACA_PIN_FLOAT) {
> +                               dev_warn(&phy->dev, "USB ID detect failed!\n");
> +                               clk_disable_unprepare(priv->clk_usb);
> +                               clk_disable_unprepare(priv->clk_usb_general);
> +                               return -EINVAL;
> +                       }
>                 }
>         }
>
> @@ -196,6 +211,11 @@ static int phy_meson8b_usb2_power_off(struct phy *phy)
>  {
>         struct phy_meson8b_usb2_priv *priv = phy_get_drvdata(phy);
>
> +       if (priv->dr_mode == USB_DR_MODE_HOST)
> +               regmap_update_bits(priv->regmap, REG_DBG_UART,
> +                                  REG_DBG_UART_SET_IDDQ,
> +                                  REG_DBG_UART_SET_IDDQ);
> +
>         clk_disable_unprepare(priv->clk_usb);
>         clk_disable_unprepare(priv->clk_usb_general);
>
> --
> 2.26.2
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
