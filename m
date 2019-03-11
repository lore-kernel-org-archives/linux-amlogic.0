Return-Path: <SRS0=n5rD=RO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4448FC43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Mar 2019 21:56:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F7D32147C
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Mar 2019 21:56:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ATUJYUY6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="nmrXrFEC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F7D32147C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Ox0+1n9ouhlu6uW7g2NrLLOqQXZuL//rZ3aRBHWzhg=; b=ATUJYUY6JF4F5K
	NnVSNaht4x3q2CQo+L89R2oKNCxJKTwxtXOuDcoP67S/OiQaDAxmg+d1HXqVKP3MvLcO1NK1uqWdj
	LRflvMOw+vhh74ZBglKNZTLFikf8X1iUeFaqH0lXnMr+BXIBySYG63SNqkt9ZKbItCZqdm02KVatk
	UBmPRYcDCJQVn2CU/DLZNgqJI6OpnyBuuzrROhDSpDlDbq72kFH9d8WdWQLYFENVnoJlzNmF264T5
	L5wJ/i4Pk483dsmu03x1JT9xJ6ZgoJBq9vnSw337r80f2V+bmldpqHhaz/I0h3ooWJlRK1WSpPVrV
	GPZdFj/PDlG/Hri0+13Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3Suc-0007Pq-Dx; Mon, 11 Mar 2019 21:56:46 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3SuZ-0007PS-5Y; Mon, 11 Mar 2019 21:56:44 +0000
Received: by mail-oi1-x242.google.com with SMTP id u128so421923oie.2;
 Mon, 11 Mar 2019 14:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J0SY9H+O5ksKh1g2euAqzMNvIQqAp2NPRH3/hUfSXSI=;
 b=nmrXrFECfAZa+kQV7ME+dHSTTCSJJHBIKRmpDB2RUkIv6fFcoyGyNkW2LwfiuFY5mf
 3k77Jpi0cf124K1FqmNQ0WDRSArqoHTEPMk1bfKar+EnVMx63uk56JXq2IcFD16XGBX3
 v6Ea0yqEW/WaUc6H4a2vfi8fZeHZXDfLIQM82+sHD7cTOOM1w5H/FNhaU8Uh0fnJGXBW
 Jn8VTNJRleKyUjAdm05Fy4as7Div2flRXyJsQHkVfGStWfMhsBpFfdCStB+o3lH2wu9J
 pGv9sMAp3W9NJxfFk8D+FqCX48s62SfACSAdWN1Ik7CK2xCSl8IxoZoc0i6QaQQ+ko/B
 U36w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J0SY9H+O5ksKh1g2euAqzMNvIQqAp2NPRH3/hUfSXSI=;
 b=GsQSwJS67PZxS44xRzQFEc89cXzjaElw9oMoH+J2k0YUzF9Iph4lx8mIOtiifTjZbF
 ffAoMhsk+WSDii9abQQsRYNayoBmfq21Zte8UgBd39/JMJ1d6y8wKs/QlMW2dlHS8Qv5
 zf8d+gm1+IBKK0vfgxoMp/gElOfe/fe8BTTLhzNB68Tkf9crDEcHTy8WDpoyjyFX259F
 ZCzowaQspokFxNBjEd92qUqTCiuBIVGZqrOYIxiS2/paynRH8Z5QP1aAjatk52YWEJ8I
 C4zU3VDwEPrH2V68Qe2/3m3h4Th3K95ZwhEZ9nZA7bNeznS5uj/h0SErsP2YoA8xYtnc
 eUuw==
X-Gm-Message-State: APjAAAUtEVlizAeOYJjAe/x5ZsLHpO2MoXlIq0dMQ7UNAjMfGn/QkMeA
 a/Cu78VBE1x8vzEYgNM55F0KMauV0S/aCKJHyb0=
X-Google-Smtp-Source: APXvYqyWTN1xngTAbvSsQbgPComY8HN376Jpmgcm2ToVxD21XHUQFW7eR3EKrIUTMaG734oMsVyd7kJ/LXEd1MAqeJA=
X-Received: by 2002:aca:c286:: with SMTP id s128mr263743oif.39.1552341401702; 
 Mon, 11 Mar 2019 14:56:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190304103846.2060-1-narmstrong@baylibre.com>
 <20190304103846.2060-9-narmstrong@baylibre.com>
In-Reply-To: <20190304103846.2060-9-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 11 Mar 2019 22:56:30 +0100
Message-ID: <CAFBinCAWEEKdsG2ZGCsFd1XyTUerAJpxJFEGGF-6j3UmpOmc=Q@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] usb: dwc3: Add Amlogic G12A DWC3 glue
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190311_145643_235906_E0D47C1A 
X-CRM114-Status: GOOD (  18.72  )
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

On Mon, Mar 4, 2019 at 11:41 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
[...]
> +static void dwc3_meson_g12a_usb_init_mode(struct dwc3_meson_g12a *priv)
> +{
> +       if (priv->otg_phy_mode == PHY_MODE_USB_DEVICE) {
> +               regmap_update_bits(priv->regmap, USB_R0,
> +                               USB_R0_U2D_ACT, USB_R0_U2D_ACT);
> +               regmap_update_bits(priv->regmap, USB_R0,
> +                               USB_R0_U2D_SS_SCALEDOWN_MODE_MASK, 0);
> +               regmap_update_bits(priv->regmap, USB_R4,
> +                               USB_R4_P21_SLEEP_M0, USB_R4_P21_SLEEP_M0);
> +       } else {
> +               regmap_update_bits(priv->regmap, USB_R0,
> +                               USB_R0_U2D_ACT, 0);
> +               regmap_update_bits(priv->regmap, USB_R4,
> +                               USB_R4_P21_SLEEP_M0, 0);
> +       }
> +}
I was already confused by the name of this function in v1.
do you think "dwc3_meson_g12a_usb_otg_apply_mode" is a suitable name?

[...]
> +static int dwc3_meson_g12a_otg_mode_set(struct dwc3_meson_g12a *priv,
> +                                       enum phy_mode mode)
> +{
> +       int ret;
> +
> +       if (!priv->phys[USB2_OTG_PHY])
> +               return -EINVAL;
> +
> +       if (mode == PHY_MODE_USB_HOST)
> +               dev_info(priv->dev, "switching to Host Mode\n");
> +       else
> +               dev_info(priv->dev, "switching to Device Mode\n");
> +
> +       if (priv->vbus) {
> +               if (mode == PHY_MODE_USB_DEVICE)
> +                       ret = regulator_disable(priv->vbus);
> +               else
> +                       ret = regulator_enable(priv->vbus);
do we need to track the regulator status (whether it's enabled or not)?
the regulator framework WARN()s if it detects "unbalanced disables for
<regulator>"
(I haven't tested this on one of my boards yet, so maybe it works
because the callers of dwc3_meson_g12a_otg_mode_set() protect against
this by not calling this function if the mode doesn't change)

> +               if (ret)
> +                       return ret;
> +               }
> +
> +               priv->otg_phy_mode = mode;
> +
> +               dwc3_meson_g12a_usb2_set_mode(priv, USB2_OTG_PHY, mode);
> +
> +               dwc3_meson_g12a_usb_init_mode(priv);
> +
> +               return phy_set_mode(priv->phys[USB2_OTG_PHY], mode);
> + }
this is the only place where phy_set_mode is called
I'm fine with keeping it but then it should be consistent at least for
all USB2 PHYs.
I suggest to either move the phy_set_mode call to
dwc3_meson_g12a_usb2_set_mode or to remove it.

[...]
> +static int dwc3_meson_g12a_role_set(struct device *dev, enum usb_role role)
> +{
> +       struct dwc3_meson_g12a *priv = dev_get_drvdata(dev);
> +       enum phy_mode mode;
> +
> +       if (role == USB_ROLE_NONE)
> +               return 0;
> +
> +       mode = role == USB_ROLE_HOST ? PHY_MODE_USB_HOST : PHY_MODE_USB_DEVICE;
(without surrounding parens I find the "role == USB_ROLE_HOST" part
hard to distinguish from the "mode =" operation. if more people think
this way then please speak up - otherwise it's probably just my
personal taste)

[...]
> +static struct device *dwc3_meson_g12_find_child(struct device *dev,
> +                                               const char *compatible)
> +{
> +       struct platform_device *pdev;
> +       struct device_node *np;
> +
> +       np = of_find_compatible_node(dev->of_node, NULL, compatible);
> +       if (!np)
> +               return NULL;
> +
> +       pdev = of_find_device_by_node(np);
maybe switch to of_get_compatible_child() here? This was done for the
MMC driver in c483a5cc9d09f4 ("mmc: meson-mx-sdio: fix OF child-node
lookup"), but I'm not sure if the problem described there also applies
to dwc3_meson_g12_find_child

[...]
> +static int dwc3_meson_g12a_probe(struct platform_device *pdev)
> +{
> +       struct dwc3_meson_g12a  *priv;
> +       struct device           *dev = &pdev->dev;
> +       struct device_node      *np = dev->of_node;
> +       void __iomem *base;
> +       struct resource *res;
> +       enum phy_mode otg_id;
> +       int ret, i;
> +
> +       priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       base = devm_ioremap_resource(dev, res);
> +       if (IS_ERR(base))
> +               return PTR_ERR(base);
> +
> +       priv->regmap = devm_regmap_init_mmio(dev, base,
> +                                            &phy_meson_g12a_usb3_regmap_conf);
> +       if (IS_ERR(priv->regmap))
> +               return PTR_ERR(priv->regmap);
> +
> +       priv->vbus = devm_regulator_get_optional(dev, "vbus");
> +       if (IS_ERR(priv->vbus)) {
> +               if (PTR_ERR(priv->vbus) == -EPROBE_DEFER)
> +                       return PTR_ERR(priv->vbus);
> +               priv->vbus = NULL;
> +       }
> +
> +       priv->clk = devm_clk_get(dev, NULL);
> +       if (IS_ERR(priv->clk))
> +               return PTR_ERR(priv->clk);
> +
> +       ret = clk_prepare_enable(priv->clk);
> +       if (ret)
> +               return ret;
> +
> +       platform_set_drvdata(pdev, priv);
> +       priv->dev = dev;
> +
> +       priv->reset = devm_reset_control_get(dev, NULL);
> +       if (IS_ERR(priv->reset)) {
> +               ret = PTR_ERR(priv->reset);
> +               dev_err(dev, "failed to get device reset, err=%d\n", ret);
> +               return ret;
> +       }
clk_prepare_enable is called a few lines above but this (and a few
more) error-paths don't call clk_disable_unprepare.
Jerome suggested in the dwmac-meson8b driver that I use something
like, which will even allow you to drop the clk_disable_unprepare call
from dwc3_meson_g12a_remove and catch all error cases in
dwc3_meson_g12a_probe at the same time:
  devm_add_action_or_reset(dev, (void(*)(void
*))clk_disable_unprepare, priv->clk);
(if you go with this then you also need to remove the
clk_disable_unprepare after of_platform_populate)

[...]
> +static int dwc3_meson_g12a_remove(struct platform_device *pdev)
> +{
> +       struct dwc3_meson_g12a *priv = platform_get_drvdata(pdev);
> +       struct device *dev = &pdev->dev;
> +       int i;
> +
> +       usb_role_switch_unregister(priv->role_switch);
> +
> +       of_platform_depopulate(dev);
> +
> +       for (i = 0 ; i < PHY_COUNT ; ++i) {
> +               phy_power_off(priv->phys[i]);
> +               phy_exit(priv->phys[i]);
> +               phy_put(priv->phys[i]);
> +       }
> +
> +       clk_disable_unprepare(priv->clk);
> +       clk_put(priv->clk);
priv->clk is obtained with devm_clk_get so the common clock framework
will call clk_put for us automatically

[...]
> +static int __maybe_unused dwc3_meson_g12a_suspend(struct device *dev)
> +{
> +       struct dwc3_meson_g12a *priv = dev_get_drvdata(dev);
> +       int i;
> +
> +       for (i = 0 ; i < PHY_COUNT ; ++i)
> +               if (priv->phys[i])
> +                       phy_exit(priv->phys[i]);
phy_init is NULL-safe, so you can drop the NULL-check above

> +
> +       reset_control_assert(priv->reset);
> +
> +       return 0;
> +}
> +
> +static int __maybe_unused dwc3_meson_g12a_resume(struct device *dev)
> +{
> +       struct dwc3_meson_g12a *priv = dev_get_drvdata(dev);
> +       int i, ret;
> +
> +       reset_control_deassert(priv->reset);
> +
> +       dwc3_meson_g12a_usb_init(priv);
> +
> +       /* Init PHYs */
> +       for (i = 0 ; i < PHY_COUNT ; ++i) {
> +               if (priv->phys[i]) {
> +                       ret = phy_init(priv->phys[i]);
phy_init is NULL-safe, so you can drop the NULL-check above


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
