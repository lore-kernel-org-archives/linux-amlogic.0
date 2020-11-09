Return-Path: <SRS0=y4a2=EP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 725F0C388F7
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Nov 2020 10:34:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5830E2083B
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Nov 2020 10:34:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yikeozLb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="gGrvZ5xB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5830E2083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XTSmG9RQxpa1rUPecLqCNuQnVhkEDyX2NpdGrtm/O/g=; b=yikeozLbxYDn1rqZfx965rKL5
	zbwD8hazZ/DEwnxzDud9Lh+cnfpTzQSPechn9zMku7CNJ1PKUQp0lkuy39VBL79ytQlqYeqqOxPL6
	qhF6m8aHUuBb3L4PavEDIelCnPeXkqhqp4I3Eku7nRKlVxTP6PO7OqWy4k804GouPt5gfHiPtYBC3
	KuX5AwTX/7yGWmNKQr20+uEi6COPY6x5E4jewKnGM3V09CPKbAL3PJa4a44YpaNX5iLWcjiPqKKmh
	hZUW5QTbFNVzI13GcfRy5eV68fo07BD6xrwgBhJf9+WuKQHSrIx1nzfKOni2m8lFYEoBSbUbfcKUA
	loIWZWJnQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kc4VT-0007fV-LF; Mon, 09 Nov 2020 10:34:39 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kc4VR-0007eM-5Y; Mon, 09 Nov 2020 10:34:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qH9b1O1m9yVoEB6n8QkB/6TaJXHCxIPP32Fq1mFfWKE=; b=gGrvZ5xBLQtSpNi2uSB0ANIyt
 afY6SWLthCnmt6Eeq9iZZax1/dyotilgV7RwYmDtVPVh7RwXnEAYDGAtLsa727gWFqK5CzSIwzblw
 DaYTkWl5eVU2agK0Wy6hnKjxer6VycAEWpMtm1NwlVYP8n9kJucFn6RRJt2oQiqC+/YAOq4k6TXTo
 dYesdPUt9+kdk2famskEu8KnvAp6sqlxtQTkKiPG+IohXg8HNv0sKPXA55oJI+hF72r+UriKjmSUr
 sydSD86p/UZ7m2nM8/IM9hJ+KGVUGO+/ml+2PkrHYDWyWW/YYlOyIF6iLw25zd+4lV3cvHJvnHiJX
 ZcxHuRLig==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56980)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1kc4V7-000858-1A; Mon, 09 Nov 2020 10:34:17 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1kc4V4-0000KD-S1; Mon, 09 Nov 2020 10:34:14 +0000
Date: Mon, 9 Nov 2020 10:34:14 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Subject: Re: [PATCH usb-next] usb: dwc3: Use devm_of_platform_populate
Message-ID: <20201109103414.GF1559@shell.armlinux.org.uk>
References: <20201109095953.7f810239@xhacker.debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201109095953.7f810239@xhacker.debian>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_053437_229810_3DFF5964 
X-CRM114-Status: GOOD (  17.27  )
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
Cc: Felipe Balbi <balbi@kernel.org>, linux-samsung-soc@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-arm-msm@vger.kernel.org,
 linux-usb@vger.kernel.org, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Patrice Chotard <patrice.chotard@st.com>, Kukjin Kim <kgene@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Nov 09, 2020 at 09:59:53AM +0800, Jisheng Zhang wrote:
> diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
> index 417e05381b5d..83015bb7b926 100644
> --- a/drivers/usb/dwc3/dwc3-meson-g12a.c
> +++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
> @@ -702,7 +702,6 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
>  {
>  	struct dwc3_meson_g12a	*priv;
>  	struct device		*dev = &pdev->dev;
> -	struct device_node	*np = dev->of_node;
>  	void __iomem *base;
>  	int ret, i;
>  
> @@ -794,7 +793,7 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
>  			goto err_phys_power;
>  	}
>  
> -	ret = of_platform_populate(np, NULL, NULL, dev);
> +	ret = devm_of_platform_populate(dev);
>  	if (ret)
>  		goto err_phys_power;
>  
> @@ -832,8 +831,6 @@ static int dwc3_meson_g12a_remove(struct platform_device *pdev)
>  	if (priv->drvdata->otg_switch_supported)
>  		usb_role_switch_unregister(priv->role_switch);
>  
> -	of_platform_depopulate(dev);
> -
>  	for (i = 0 ; i < PHY_COUNT ; ++i) {
>  		phy_power_off(priv->phys[i]);
>  		phy_exit(priv->phys[i]);

Does it matter that the order that things happen in
dwc3_meson_g12a_remove() is changed as a result of your patch? Was
the code relying on the platform devices being depopulated before
powering off the PHYs?

> diff --git a/drivers/usb/dwc3/dwc3-of-simple.c b/drivers/usb/dwc3/dwc3-of-simple.c
> index e62ecd22b3ed..f1c267e39d62 100644
> --- a/drivers/usb/dwc3/dwc3-of-simple.c
> +++ b/drivers/usb/dwc3/dwc3-of-simple.c
> @@ -73,7 +73,7 @@ static int dwc3_of_simple_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_resetc_assert;
>  
> -	ret = of_platform_populate(np, NULL, NULL, dev);
> +	ret = devm_of_platform_populate(dev);
>  	if (ret)
>  		goto err_clk_put;
>  
> @@ -97,8 +97,6 @@ static int dwc3_of_simple_probe(struct platform_device *pdev)
>  
>  static void __dwc3_of_simple_teardown(struct dwc3_of_simple *simple)
>  {
> -	of_platform_depopulate(simple->dev);
> -
>  	clk_bulk_disable_unprepare(simple->num_clocks, simple->clks);
>  	clk_bulk_put_all(simple->num_clocks, simple->clks);
>  	simple->num_clocks = 0;

Same here... and for anywhere else in this patch that you're deleting
a of_platform_depopulate().

You effectively are moving the call to of_platform_depopulate() *after*
the driver's .remove function has been called.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
