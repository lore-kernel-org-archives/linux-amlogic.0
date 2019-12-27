Return-Path: <SRS0=RZf2=2R=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B327C2D0C6
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Dec 2019 16:38:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E20B20882
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Dec 2019 16:38:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A2GJ113v";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="rCb6yLvY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E20B20882
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WIz4gg7A7m+n3UXz7a83pAS/6vChGCg8/iyrxVxNAXo=; b=A2GJ113vHNWtqY
	YuM2SpFO/QqRa9hvfCNo+wricdgqd9aZUmMJEySer7y6fXCevrcz65LJQJ98O924Tbk/oOwK9beGd
	GUISYYgkBoMPfR82HzYIa+pHoX/uxypgTQv4+Uc7cR9W9kDhiO8Kcv6YkjoWLza0PIselVEQ9/Ebq
	UMeG0TodL1sx5tYt91FxaQvvGiNLt7aNH02cG9k7r3QPGL7jCMXLbUOLcg9fPrKwUD7klVJE/ckLP
	URJQQCNQWNRW6alZowtX5zxYQgPGxq8hb0BdDqZErzwf3PyJWanadGKIquFlmxLzN57UvTq61rDpa
	MbLqRaOVnM03Y7cT73ww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iksd5-0001CB-NF; Fri, 27 Dec 2019 16:38:23 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iksd3-0001Bj-FQ; Fri, 27 Dec 2019 16:38:23 +0000
Received: by mail-ed1-x543.google.com with SMTP id i16so25715375edr.5;
 Fri, 27 Dec 2019 08:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6YTB1fNIm79m/hiZxeT3tYKFD5H8aAnuxvQfJh9UTTA=;
 b=rCb6yLvYVvl/bhWTiHwA3cx/pPDMQSYDZjENCpcrW46hTqEU+37cxTsRfQbFZWgxnQ
 8lAZ3VnOW6o4VNL4GLpbT+x7T62C1KAFCX6q78uC1Jqr2tffxf0f3GWDIYdHlOmMn6c0
 D2gFJ28f+y57Us0+szO7vgqbXxMi15owj96gWUV2Vsc826+PMIOSLSe3X9FX6RzD8LA9
 VHlwek/F+/vnefGNtzo/32g1LnHSVG9grbquv7p1Qafnn7SenyEgVHxIWNyfaCLBR8LU
 uWOlhhWEOQpoGiItymVbpilrcKbra+UJRHiyIzE1CTuloR4yCh+mMaQiU/deAi2BA+j7
 72Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6YTB1fNIm79m/hiZxeT3tYKFD5H8aAnuxvQfJh9UTTA=;
 b=ZshB0TPAPDBKjeQ3MNFAqmBRueKEKwOa0BtrtIkFtJmGVTNImOHgDA2r1k3QhbH7u1
 63KgbLSLTSDS7EzdzQmtTb2Hh4AwkQrXppsiFaO+uiSpaUYvJRYVTQMwzkq239UARHJo
 v26pKI6w+3346OUA2UVgsOrBMb8UWOGlgCpxVxJgwk9zVlr1bsOAptuZOnPZNlrPbTYG
 T+pUOIEMJ8SenmVWypOUj0H8zI+2RZW+6o9C4Yzu0XcN7STSm1UJyQatWEVoSY7DBTWc
 e0sTTezV5HlMqwChVOHo3u20DlxNoFhh6XW178V/6481izsWGyvhvT830bX+jKy1dsS0
 2WcQ==
X-Gm-Message-State: APjAAAVLHLh9XTDnbQSxm5TDA75u5+sJqpd4nApEVdpJQ1EyMaxE3ttS
 t8zngzzvFku3stUi/XMP5EYR1QXio4FE93hb5so=
X-Google-Smtp-Source: APXvYqzXINFtgDqMBlIV6U4EBXznckvgHZpZ4LhokGGqjDtkp3WySsLLrOwjy/HccteQFMutQpmQt9YGz45Q+BIy3TM=
X-Received: by 2002:a17:906:e219:: with SMTP id
 gf25mr54733718ejb.51.1577464697886; 
 Fri, 27 Dec 2019 08:38:17 -0800 (PST)
MIME-Version: 1.0
References: <1577428606-69855-1-git-send-email-hanjie.lin@amlogic.com>
 <1577428606-69855-5-git-send-email-hanjie.lin@amlogic.com>
In-Reply-To: <1577428606-69855-5-git-send-email-hanjie.lin@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 27 Dec 2019 17:38:07 +0100
Message-ID: <CAFBinCD8V-Swihz+VJ780sXJtM9cXprDcGCHVuHjjCx0DEOodQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] usb: dwc3: Add Amlogic A1 DWC3 glue
To: Hanjie Lin <hanjie.lin@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191227_083821_540119_15F500D4 
X-CRM114-Status: GOOD (  16.98  )
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
Cc: Rob Herring <robh@kernel.org>, Victor Wan <victor.wan@amlogic.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-usb@vger.kernel.org,
 Yue Wang <yue.wang@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>,
 devicetree@vger.kernel.org, Liang Yang <liang.yang@amlogic.com>,
 Jian Hu <jian.hu@amlogic.com>, Xingyu Chen <xingyu.chen@amlogic.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello Hanjie,

sorry that it took me so long to look at this
you can find my comments below

On Fri, Dec 27, 2019 at 7:37 AM Hanjie Lin <hanjie.lin@amlogic.com> wrote:
[...]
> +static const struct clk_bulk_data meson_g12a_clocks[] = {
> +       { .id = NULL},
> +};
> +
> +static const struct clk_bulk_data meson_a1_clocks[] = {
> +       { .id = "usb_ctrl"},
> +       { .id = "usb_bus"},
> +       { .id = "xtal_usb_phy"},
> +       { .id = "xtal_usb_ctrl"},
> +};
nit-pick: the values in meson_g12a_clocks and meson_a1_clocks all have
a space after the opening "{" but no space before the closing "}"
we should be consistent here (personally I prefer the variant with
space after "{" and before "}", but having no space in both cases is
fine for me too)

[...]
>  static void dwc3_meson_g12a_usb2_set_mode(struct dwc3_meson_g12a *priv,
> @@ -138,10 +156,13 @@ static int dwc3_meson_g12a_usb2_init(struct dwc3_meson_g12a *priv)
>  {
>         int i;
>
> -       if (priv->otg_mode == USB_DR_MODE_PERIPHERAL)
> -               priv->otg_phy_mode = PHY_MODE_USB_DEVICE;
> -       else
> -               priv->otg_phy_mode = PHY_MODE_USB_HOST;
> +       /* only G12A supports otg mode */
> +       if (priv->soc_id == MESON_SOC_G12A) {
> +               if (priv->otg_mode == USB_DR_MODE_PERIPHERAL)
> +                       priv->otg_phy_mode = PHY_MODE_USB_DEVICE;
> +               else
> +                       priv->otg_phy_mode = PHY_MODE_USB_HOST;
> +       }
can you comment on future Amlogic SoCs and how this code will look in
the future?
I would like to avoid having to adjust this "if" for every new SoC,
but I don't know if the majority of the SoCs will have OTG support

also one idea that just came to my mind:
you could define in the .yaml binding that for A1 only dr_mode =
"host" is allowed
then you may not need extra logic in the driver at all

[...]
> -               if (i == USB2_OTG_PHY) {
> +               if (priv->soc_id == MESON_SOC_G12A && i == USB2_OTG_PHY) {
on GXL we have two PHYs (0 and 1), the second one is OTG capable
on GXM we have three PHYs (0..2), the second one is OTG capable
on G12A/G12B we have two PHYs (0 and 1), the second one is OTG capable

you already wrote that there is only one USB2 PHY on the A1 SoC
is really only the second PHY port ("usb2-phy1" instead of
"usb2-phy0") used on A1?
if "usb2-phy0" is correct then you don't need these checks (there are
more checks like this below)

[...]
> -       usb_role_switch_unregister(priv->role_switch);
> +       if (priv->soc_id == MESON_SOC_G12A)
> +               usb_role_switch_unregister(priv->role_switch);
I didn't expect this because in _probe usb_role_switch_register is still called
on A1 we now call usb_role_switch_register() but we never call
usb_role_switch_unregister()


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
