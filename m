Return-Path: <SRS0=94bh=OM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65465C04EB9
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Dec 2018 22:28:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DC56206B7
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Dec 2018 22:28:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WbNHhh9I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DC56206B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XkzKBO8rBqYLJDqxrdgo8RTspieZMjzoM+uE+t8CRPk=; b=WbNHhh9IUQ6ql8
	IQsjo/ipZkUWtDMNMEv//gXLghl+AjZoFl02vSqtWTUKFc+Is6M55oofcuilVOCLGsVNOFfBvpt3G
	a/9fYK5nPK2sfb3mLb+yVRDPmHuBDD8B2ZN2+t7sqTeg64KIPV8TFw17PCKqQCC0YKw0C+McAlmG3
	uXirfi/dKGDYvlnzSwyrVX33dxbv4G781QWnfN+4UntIGd7lCc4KM+Es/wI1AOf2iu+UNUIczqj67
	FdnCZHmH/JAuZ0lNuFUqe8pr/1coShQePLOa4REHxB8jp8kwODVI2sxiUU+psgPjnLVye+hNRr8Tn
	hyHOf7EixagJItvTFs5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gTwh6-0005vL-UH; Mon, 03 Dec 2018 22:28:00 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTwh3-0005uS-B4; Mon, 03 Dec 2018 22:27:59 +0000
Received: from mail.mleia.com (localhost [127.0.0.1])
 by mail.mleia.com (Postfix) with ESMTP id 3958142ECAA;
 Mon,  3 Dec 2018 22:27:41 +0000 (GMT)
Subject: Re: [PATCH] ARM: dts: Kill off skeleton{64}.dtsi
To: Rob Herring <robh@kernel.org>, arm@kernel.org
References: <20181130170634.9467-1-robh@kernel.org>
From: Vladimir Zapolskiy <vz@mleia.com>
Message-ID: <a10f92c0-50f9-1e10-4b17-c694353e4580@mleia.com>
Date: Tue, 4 Dec 2018 00:27:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20181130170634.9467-1-robh@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20181203_222741_273947_21674916 
X-CRM114-Status: GOOD (  16.26  )
/bin/ln: failed to access
 'reaver_cache/texts/20181203_222741_273947_21674916': No such file or
 directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181203_222741_273947_21674916 
X-CRM114-Status: GOOD (  18.38  )
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
Cc: Andrew Lunn <andrew@lunn.ch>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Linus Walleij <linus.walleij@linaro.org>, Baruch Siach <baruch@tkos.co.il>,
 David Brown <david.brown@linaro.org>, Jamie Iles <jamie@jamieiles.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@axis.com,
 Jon Mason <jonmason@broadcom.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 bcm-kernel-feedback-list@broadcom.com, Hauke Mehrtens <hauke@hauke-m.de>,
 Andy Gross <andy.gross@linaro.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 Jason Cooper <jason@lakedaemon.net>,
 Antoine Tenart <antoine.tenart@bootlin.com>, Ray Jui <rjui@broadcom.com>,
 Sylvain Lemieux <slemieux.tyco@gmail.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, linux-mediatek@lists.infradead.org,
 Lars Persson <lars.persson@axis.com>, Gregory Fong <gregory.0xf0@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Barry Song <baohua@kernel.org>, linux-oxnas@groups.io,
 Eric Miao <eric.y.miao@gmail.com>, Scott Branden <sbranden@broadcom.com>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Li Yang <leoyang.li@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Viresh Kumar <vireshk@kernel.org>,
 Carlo Caione <carlo@caione.org>, Jun Nie <jun.nie@linaro.org>,
 Brian Norris <computersforpeace@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Tsahee Zidenberg <tsahee@annapurnalabs.com>, Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 11/30/2018 07:06 PM, Rob Herring wrote:
> Remove the usage of skeleton.dtsi in the remaining dts files. It was
> deprecated since commit 9c0da3cc61f1 ("ARM: dts: explicitly mark
> skeleton.dtsi as deprecated"). This will make adding a unit-address to
> memory nodes easier.
> 
> The main tricky part to removing skeleton.dtsi is we could end up with
> no /memory node at all when a bootloader depends on one being present. I
> hacked up dtc to check for this condition.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

[snip]

> diff --git a/arch/arm/boot/dts/lpc32xx.dtsi b/arch/arm/boot/dts/lpc32xx.dtsi
> index b7303a4e4236..44b468e4c37a 100644
> --- a/arch/arm/boot/dts/lpc32xx.dtsi
> +++ b/arch/arm/boot/dts/lpc32xx.dtsi
> @@ -11,12 +11,12 @@
>   * http://www.gnu.org/copyleft/gpl.html
>   */
>  
> -#include "skeleton.dtsi"
> -
>  #include <dt-bindings/clock/lpc32xx-clock.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  
>  / {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
>  	compatible = "nxp,lpc3220";
>  	interrupt-parent = <&mic>;
>  

For lpc32xx:

Acked-by: Vladimir Zapolskiy <vz@mleia.com>

--
Best wishes,
Vladimir

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
