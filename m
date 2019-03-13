Return-Path: <SRS0=5XDc=RQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE43C43381
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Mar 2019 13:07:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7811214AE
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Mar 2019 13:07:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SvU+X/8E";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="dfh+0Xj8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7811214AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vzNdVkqbVzExa7ETIgQRqJb7yD5QVQPQxl/gYsHlos8=; b=SvU+X/8EXQ5XRn
	DeZD/rGMZ1cdqy6kgiVAtqy/nhlO7ukuF88WAdjzu74Ir5gt1WTXhPbzY/ghZKx2tRjVA7fFF2GW0
	dZ9lMQTc2HsEeVvBpd2v6M0vXUVE2nleSHFOluCj0XmulSIzX97EdGBbMsEwsuGdmJr+hxehx4mW7
	zQJiXfXOGxKqMKFzomLi7gfUkfFiPf/oEIAXR5cphfIOxAg/how1az3dirIMzprCHZu5n1F6ypdr/
	bjh74H1bJ++XW2GHzEft5MccDORAgyez5o/Bjn0DI4VEXF00jsFVC22QUcIb3vk3wtonAXPF+H2lX
	Vu9cLDuZbM0XYr+e023Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h43bo-0002HS-UN; Wed, 13 Mar 2019 13:07:48 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h43bf-00029m-KR
 for linux-amlogic@lists.infradead.org; Wed, 13 Mar 2019 13:07:42 +0000
Received: by mail-wm1-x342.google.com with SMTP id e16so1815709wme.1
 for <linux-amlogic@lists.infradead.org>; Wed, 13 Mar 2019 06:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=IBo+DBpE7PjOSK85PtKC0sATIkCGRwdLxv9Wjklcv6o=;
 b=dfh+0Xj8pbvVs+aBFEq6cuO4OcJp4Xqqt/OkKODGm7qC188RrdgammC4PmT2nxQ0N/
 0vqUlPZORa3lFNwm2Fs8FSKlMFJzW8AJy6b8crKqs941a/3GKlQppFqG9qKQt4R+TmGL
 KvPtWy6zLv3RxFCHQbdchDi2oUqO8t3GUxh2xmT16j8AVP4/uiLvWGogfKSt5SI1U+DW
 wE3V1KqEGzPRh4Tx8aVNpcKe1A8bwZqvYlnI5UNwDfZsB1ugxdQERbhsn41N1iUVzCow
 frv4srCr1fuQ0RTbOGB4oUvKSubGNvX4JvJlyJSUSvlRiihktzNVewAnL/sIpO9FN1Tg
 zbxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=IBo+DBpE7PjOSK85PtKC0sATIkCGRwdLxv9Wjklcv6o=;
 b=DP5Ni7NPjWyt1t7Gpc6Ya3W18SmqlBgwBu6qSMgED7MmdiHvqrY3lhBEK/eDNm1C2I
 MnB1hpPDZCy7ojE8CsvQyKuGhy0rhGLYjXKsd6GlQOzCgJvQNNn25FNhGsTbo1CKMIbA
 GkNfUrNe7HLbMfCJmgDBZ7H1H9YpvQ5U45QdcbgPVHE4Aoxz9ZovVMLp7LAN9Yt+hYnp
 6VFOdXEmMZHhYeO9quyUJo0Cdi2nWscJ49uGR85gXdBKal0tAjl8uMqGD1lBsGzdaVwi
 mv9ZpMHRHQA0OXhc3jRVJuB1NY1psFtTxsqpcoBq39p24/sJJaXeYO6IYq9rvoBzYu1k
 Ou7w==
X-Gm-Message-State: APjAAAVmJB9Qi+l7JaT+JkNJprxHqBgVo4iT61VDm3M3+6N79NqMx4ib
 6LWGinXr1y0aauvhMNv4e6WrgA==
X-Google-Smtp-Source: APXvYqwYzcqGtYogBKnPVDgxOsUBnc6HiltAr1hMl6teCxpeWReBjVi5cm6tJOqUqcLgqjB4ZiDS1Q==
X-Received: by 2002:a1c:6341:: with SMTP id x62mr2080105wmb.11.1552482456642; 
 Wed, 13 Mar 2019 06:07:36 -0700 (PDT)
Received: from [192.168.1.62] (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id i62sm1762771wmg.17.2019.03.13.06.07.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 13 Mar 2019 06:07:35 -0700 (PDT)
Subject: Re: [PATCH v2 8/8] usb: dwc3: Add Amlogic G12A DWC3 glue
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20190304103846.2060-1-narmstrong@baylibre.com>
 <20190304103846.2060-9-narmstrong@baylibre.com>
 <CAFBinCAWEEKdsG2ZGCsFd1XyTUerAJpxJFEGGF-6j3UmpOmc=Q@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <6f84d21f-1093-185f-dd70-b470bfa9c7da@baylibre.com>
Date: Wed, 13 Mar 2019 14:07:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <CAFBinCAWEEKdsG2ZGCsFd1XyTUerAJpxJFEGGF-6j3UmpOmc=Q@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190313_060739_685245_41CFA385 
X-CRM114-Status: GOOD (  28.32  )
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

On 11/03/2019 22:56, Martin Blumenstingl wrote:
> Hi Neil,
> 
> On Mon, Mar 4, 2019 at 11:41 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
> [...]
>> +static void dwc3_meson_g12a_usb_init_mode(struct dwc3_meson_g12a *priv)
>> +{
>> +       if (priv->otg_phy_mode == PHY_MODE_USB_DEVICE) {
>> +               regmap_update_bits(priv->regmap, USB_R0,
>> +                               USB_R0_U2D_ACT, USB_R0_U2D_ACT);
>> +               regmap_update_bits(priv->regmap, USB_R0,
>> +                               USB_R0_U2D_SS_SCALEDOWN_MODE_MASK, 0);
>> +               regmap_update_bits(priv->regmap, USB_R4,
>> +                               USB_R4_P21_SLEEP_M0, USB_R4_P21_SLEEP_M0);
>> +       } else {
>> +               regmap_update_bits(priv->regmap, USB_R0,
>> +                               USB_R0_U2D_ACT, 0);
>> +               regmap_update_bits(priv->regmap, USB_R4,
>> +                               USB_R4_P21_SLEEP_M0, 0);
>> +       }
>> +}
> I was already confused by the name of this function in v1.
> do you think "dwc3_meson_g12a_usb_otg_apply_mode" is a suitable name?

Yep changed

> 
> [...]
>> +static int dwc3_meson_g12a_otg_mode_set(struct dwc3_meson_g12a *priv,
>> +                                       enum phy_mode mode)
>> +{
>> +       int ret;
>> +
>> +       if (!priv->phys[USB2_OTG_PHY])
>> +               return -EINVAL;
>> +
>> +       if (mode == PHY_MODE_USB_HOST)
>> +               dev_info(priv->dev, "switching to Host Mode\n");
>> +       else
>> +               dev_info(priv->dev, "switching to Device Mode\n");
>> +
>> +       if (priv->vbus) {
>> +               if (mode == PHY_MODE_USB_DEVICE)
>> +                       ret = regulator_disable(priv->vbus);
>> +               else
>> +                       ret = regulator_enable(priv->vbus);
> do we need to track the regulator status (whether it's enabled or not)?
> the regulator framework WARN()s if it detects "unbalanced disables for
> <regulator>"
> (I haven't tested this on one of my boards yet, so maybe it works
> because the callers of dwc3_meson_g12a_otg_mode_set() protect against
> this by not calling this function if the mode doesn't change)

I handled this case by enabling the regulator _before_, as we default in
Host/OTG mode in probe, then eventually switch to device.

In this case, we don't have to track the status, and further calls
to dwc3_meson_g12a_otg_mode_set() will only change the regulator
on mode change.

> 
>> +               if (ret)
>> +                       return ret;
>> +               }
>> +
>> +               priv->otg_phy_mode = mode;
>> +
>> +               dwc3_meson_g12a_usb2_set_mode(priv, USB2_OTG_PHY, mode);
>> +
>> +               dwc3_meson_g12a_usb_init_mode(priv);
>> +
>> +               return phy_set_mode(priv->phys[USB2_OTG_PHY], mode);
>> + }
> this is the only place where phy_set_mode is called
> I'm fine with keeping it but then it should be consistent at least for
> all USB2 PHYs.
> I suggest to either move the phy_set_mode call to
> dwc3_meson_g12a_usb2_set_mode or to remove it.

I will remove it, it's useless for now.

> 
> [...]
>> +static int dwc3_meson_g12a_role_set(struct device *dev, enum usb_role role)
>> +{
>> +       struct dwc3_meson_g12a *priv = dev_get_drvdata(dev);
>> +       enum phy_mode mode;
>> +
>> +       if (role == USB_ROLE_NONE)
>> +               return 0;
>> +
>> +       mode = role == USB_ROLE_HOST ? PHY_MODE_USB_HOST : PHY_MODE_USB_DEVICE;
> (without surrounding parens I find the "role == USB_ROLE_HOST" part
> hard to distinguish from the "mode =" operation. if more people think
> this way then please speak up - otherwise it's probably just my
> personal taste)

Yep, I added parenthesis and changed indentation to make it clearer.

> 
> [...]
>> +static struct device *dwc3_meson_g12_find_child(struct device *dev,
>> +                                               const char *compatible)
>> +{
>> +       struct platform_device *pdev;
>> +       struct device_node *np;
>> +
>> +       np = of_find_compatible_node(dev->of_node, NULL, compatible);
>> +       if (!np)
>> +               return NULL;
>> +
>> +       pdev = of_find_device_by_node(np);
> maybe switch to of_get_compatible_child() here? This was done for the
> MMC driver in c483a5cc9d09f4 ("mmc: meson-mx-sdio: fix OF child-node
> lookup"), but I'm not sure if the problem described there also applies
> to dwc3_meson_g12_find_child

of_get_compatible_child() is new to me, switching to it !

> 
> [...]
>> +static int dwc3_meson_g12a_probe(struct platform_device *pdev)
>> +{
>> +       struct dwc3_meson_g12a  *priv;
>> +       struct device           *dev = &pdev->dev;
>> +       struct device_node      *np = dev->of_node;
>> +       void __iomem *base;
>> +       struct resource *res;
>> +       enum phy_mode otg_id;
>> +       int ret, i;
>> +
>> +       priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>> +       if (!priv)
>> +               return -ENOMEM;
>> +
>> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +       base = devm_ioremap_resource(dev, res);
>> +       if (IS_ERR(base))
>> +               return PTR_ERR(base);
>> +
>> +       priv->regmap = devm_regmap_init_mmio(dev, base,
>> +                                            &phy_meson_g12a_usb3_regmap_conf);
>> +       if (IS_ERR(priv->regmap))
>> +               return PTR_ERR(priv->regmap);
>> +
>> +       priv->vbus = devm_regulator_get_optional(dev, "vbus");
>> +       if (IS_ERR(priv->vbus)) {
>> +               if (PTR_ERR(priv->vbus) == -EPROBE_DEFER)
>> +                       return PTR_ERR(priv->vbus);
>> +               priv->vbus = NULL;
>> +       }
>> +
>> +       priv->clk = devm_clk_get(dev, NULL);
>> +       if (IS_ERR(priv->clk))
>> +               return PTR_ERR(priv->clk);
>> +
>> +       ret = clk_prepare_enable(priv->clk);
>> +       if (ret)
>> +               return ret;
>> +
>> +       platform_set_drvdata(pdev, priv);
>> +       priv->dev = dev;
>> +
>> +       priv->reset = devm_reset_control_get(dev, NULL);
>> +       if (IS_ERR(priv->reset)) {
>> +               ret = PTR_ERR(priv->reset);
>> +               dev_err(dev, "failed to get device reset, err=%d\n", ret);
>> +               return ret;
>> +       }
> clk_prepare_enable is called a few lines above but this (and a few
> more) error-paths don't call clk_disable_unprepare.
> Jerome suggested in the dwmac-meson8b driver that I use something
> like, which will even allow you to drop the clk_disable_unprepare call
> from dwc3_meson_g12a_remove and catch all error cases in
> dwc3_meson_g12a_probe at the same time:
>   devm_add_action_or_reset(dev, (void(*)(void
> *))clk_disable_unprepare, priv->clk);
> (if you go with this then you also need to remove the
> clk_disable_unprepare after of_platform_populate)

Indeed I totally forgot this, thanks !

> 
> [...]
>> +static int dwc3_meson_g12a_remove(struct platform_device *pdev)
>> +{
>> +       struct dwc3_meson_g12a *priv = platform_get_drvdata(pdev);
>> +       struct device *dev = &pdev->dev;
>> +       int i;
>> +
>> +       usb_role_switch_unregister(priv->role_switch);
>> +
>> +       of_platform_depopulate(dev);
>> +
>> +       for (i = 0 ; i < PHY_COUNT ; ++i) {
>> +               phy_power_off(priv->phys[i]);
>> +               phy_exit(priv->phys[i]);
>> +               phy_put(priv->phys[i]);
>> +       }
>> +
>> +       clk_disable_unprepare(priv->clk);
>> +       clk_put(priv->clk);
> priv->clk is obtained with devm_clk_get so the common clock framework
> will call clk_put for us automatically

Right

> 
> [...]
>> +static int __maybe_unused dwc3_meson_g12a_suspend(struct device *dev)
>> +{
>> +       struct dwc3_meson_g12a *priv = dev_get_drvdata(dev);
>> +       int i;
>> +
>> +       for (i = 0 ; i < PHY_COUNT ; ++i)
>> +               if (priv->phys[i])
>> +                       phy_exit(priv->phys[i]);
> phy_init is NULL-safe, so you can drop the NULL-check above

Forgot this one


> 
>> +
>> +       reset_control_assert(priv->reset);
>> +
>> +       return 0;
>> +}
>> +
>> +static int __maybe_unused dwc3_meson_g12a_resume(struct device *dev)
>> +{
>> +       struct dwc3_meson_g12a *priv = dev_get_drvdata(dev);
>> +       int i, ret;
>> +
>> +       reset_control_deassert(priv->reset);
>> +
>> +       dwc3_meson_g12a_usb_init(priv);
>> +
>> +       /* Init PHYs */
>> +       for (i = 0 ; i < PHY_COUNT ; ++i) {
>> +               if (priv->phys[i]) {
>> +                       ret = phy_init(priv->phys[i]);
> phy_init is NULL-safe, so you can drop the NULL-check above

Good catch...

> 
> 
> Regards
> Martin
> 

Thanks !!

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
