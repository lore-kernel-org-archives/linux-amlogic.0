Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC5CC001E0
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Jul 2023 15:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4ikGzxLqi+jwupffY+nVSb0M7u7dEqhtM0fJ5unouhI=; b=jHYSF3hq2audM2
	olwckuoCgV75somCpIBngwc7cT/h11TmY9f62r2KHtxrWgFw8dy0/IA1q7SiBpvcsVDE2sDISStQr
	FNr4aYfPxXUH7XBDAOKyrXaxU61S5czZ99KTeMooMKnNaqqP+I2NzqRCaeL0VIA5nI8bgTq3k6k+t
	GsWHrFy+I8Ya//J3wyL8hQJGY2CER7Es4boIsas3rxq3pNFerK6rwPeZgxjWuj+eUSPi303JNVigD
	MYGphOz8c2bnUy5N3S4Zkr9OsmU4q5YQCPPwr0oZjTnmS07ZEcNR7ORLjRPkojyv1c148pG4qO22B
	H2m2c1J0yIClUN+r8Smg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPPiv-003uOQ-2w;
	Fri, 28 Jul 2023 15:49:49 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPPit-003uNc-1G
	for linux-amlogic@lists.infradead.org;
	Fri, 28 Jul 2023 15:49:48 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1qPPim-0001iv-S3; Fri, 28 Jul 2023 17:49:40 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1qPPil-002jwn-ME; Fri, 28 Jul 2023 17:49:39 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1qPPil-000H6q-11;
	Fri, 28 Jul 2023 17:49:39 +0200
Message-ID: <f7b72ee90009f6749700a7bd79a3a63786a82a32.camel@pengutronix.de>
Subject: Re: [PATCH v3 1/3] dt-bindings: reset: Add compatible and DT
 bindings for Amlogic C3 Reset Controller
From: Philipp Zabel <p.zabel@pengutronix.de>
To: zelong dong <zelong.dong@amlogic.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Rob
 Herring <robh+dt@kernel.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski
	 <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, 
	kelvin.zhang@amlogic.com
Date: Fri, 28 Jul 2023 17:49:39 +0200
In-Reply-To: <20230719060954.14864-2-zelong.dong@amlogic.com>
References: <20230719060954.14864-1-zelong.dong@amlogic.com>
	 <20230719060954.14864-2-zelong.dong@amlogic.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_084947_428674_AE384FB8 
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

On Mi, 2023-07-19 at 14:09 +0800, zelong dong wrote:
> From: Zelong Dong <zelong.dong@amlogic.com>
> 
> Add new compatible and DT bindings for Amlogic C3 Reset Controller
> 
> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
> ---
>  .../bindings/reset/amlogic,meson-reset.yaml   |   1 +
>  include/dt-bindings/reset/amlogic,c3-reset.h  | 119 ++++++++++++++++++
>  2 files changed, 120 insertions(+)
>  create mode 100644 include/dt-bindings/reset/amlogic,c3-reset.h
> 
> diff --git a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
> index d3fdee89d4f8..f0c6c0df0ce3 100644
> --- a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
> +++ b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
> @@ -18,6 +18,7 @@ properties:
>        - amlogic,meson-axg-reset # Reset Controller on AXG and compatible SoCs
>        - amlogic,meson-a1-reset # Reset Controller on A1 and compatible SoCs
>        - amlogic,meson-s4-reset # Reset Controller on S4 and compatible SoCs
> +      - amlogic,c3-reset # Reset Controller on C3 and compatible SoCs
>  
>    reg:
>      maxItems: 1
> diff --git a/include/dt-bindings/reset/amlogic,c3-reset.h b/include/dt-bindings/reset/amlogic,c3-reset.h
> new file mode 100644
> index 000000000000..d9127863f603
> --- /dev/null
> +++ b/include/dt-bindings/reset/amlogic,c3-reset.h

Given that this is only included by
arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi, should this header be
moved to arch/arm64/boot/dts/amlogic ?

regards
Philipp

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
