Return-Path: <SRS0=5MM3=MV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AE30C4320A
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Jul 2021 20:38:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E35D6069E
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Jul 2021 20:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5E35D6069E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k68A/UPmUcCBA46iYPNPs/4INYSM4ZEqm7lsG9kMS6M=; b=tRPksZhO6Pyh53
	p/WE0TQ6MbjqixGGUYz+ZrcEI5kRWFBso7Gl8zBdPUirLJYPenUArDTjT3naFppC21ei/uXidd9cC
	5dpU3Nmj4zWF5n9Ig5aC8irgoefylPAaUPMDp8v/t/rJLrImY/+Q9b8xVjPNqMGeEV3HWmoS0Ix8Z
	aoj3SYTXYAGvP5He/polMBEzNMLaTrqwbaMSylbBxL0NJIw3vs21IoJhVAmgFuLpLvz9lM6V3w2yg
	Eb8Bj4njGo5/6LQzavJBYPGpqfRmaYlttudJ1sbcaifZK014X2UHLpMZFe5ccNSUPzcPtnznL9cy5
	YCU4qp5e+CvZVetxGNDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9Cn9-005xD7-LZ; Thu, 29 Jul 2021 20:38:07 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9CWj-005rQY-U4; Thu, 29 Jul 2021 20:21:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=yH5uVOP6NDV3mxanWoiwRIAPujE42QlL9/YdYceDovY=; b=xmGtGuEAFWj5j0hXzagN7x9J1u
 XnFnrOvxIglDS75jzWXEtG7QXJarvjaRNOui7f0vy94kdztYi40aMzcfIWKVJq5/LWwFNBFhZBSP2
 IViqvzi+a3rwLZZBGWrkZW7yAVFQvSoz6h8GQqd6Q8fPOtXCb69FeonaqC5gsMdJr02I=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1m9CWb-00FMil-C9; Thu, 29 Jul 2021 22:21:01 +0200
Date: Thu, 29 Jul 2021 22:21:01 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Anand Moon <linux.amoon@gmail.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 devicetree@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Emiliano Ingrassia <ingrassia@epigenesys.com>
Subject: Re: [PATCHv1 3/3] net: stmmac: dwmac-meson8b: Add reset controller
 for ethernet phy
Message-ID: <YQMNrVV1Dm+yxUiU@lunn.ch>
References: <20210729201100.3994-1-linux.amoon@gmail.com>
 <20210729201100.3994-4-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210729201100.3994-4-linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_132110_029018_F4A1AD71 
X-CRM114-Status: UNSURE (   9.63  )
X-CRM114-Notice: Please train this message.
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

> @@ -465,6 +478,13 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
>  		goto err_remove_config_dt;
>  	}
>  
> +	dwmac->eth_reset = devm_reset_control_get_exclusive(dwmac->dev, "ethreset");
> +	if (IS_ERR_OR_NULL(dwmac->eth_reset)) {
> +		dev_err(dwmac->dev, "Failed to get Ethernet reset\n");
> +		ret = PTR_ERR(dwmac->eth_reset);
> +		goto err_remove_config_dt;
> +	}
> +

Hi Anand

Since this is a new property, you need to handle it not being in the
DT blob. You probably need to use
devm_reset_control_get_optinal_exclusive()

	Andrew

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
