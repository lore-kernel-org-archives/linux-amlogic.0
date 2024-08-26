Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62023C5321E
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Aug 2024 13:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d+MLwlQz/nvkpem0i0X5KggAFXezj/w8rBlRUoNBWdk=; b=1EOlNIZNk2BrG0
	6coOI4iJdbQhr+Vb/FOAlDaEjW5j2ZwVPWWzmILmjNgn1glwrgHVnyuD8ipo/TLNG6C0nVxJC+PfL
	t3jcoHHqGLB4O0y1i3oLFGU6E+mfBst6Hl6TOWMcx6xrp4iJOZA0GQOcPJN9ettO8J0tVlx7PM8GI
	uIMKHTo0QTC/lfdWtPC6fW/gHCPjMA13I1EYJivZPVkIOpGsS8lR9jmKDLlqv4OdBI5ziWe+EBU9l
	2u+KCD0Hqd5cjUZqQ6Hs6d7jHELQeqD8uqUuZscHLqo2j6LDV0Akl7m22b4yifnPpYQU9o23J0GCe
	rhBX+BjHtQ9Pylkne54w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sia7C-00000007YSU-0rM1;
	Mon, 26 Aug 2024 13:50:38 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sia79-00000007YRp-1ZQw;
	Mon, 26 Aug 2024 13:50:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1BB1FA42754;
	Mon, 26 Aug 2024 13:50:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60EB2C52FC7;
	Mon, 26 Aug 2024 13:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724680233;
	bh=048956Hz69VplOQW8TIX6foE8BvnSSaO5WdBcuYMZ9g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yq7SRW9EcBKoGIL2P95KHrhwnlkRvqgFlUzzr7DM5u2r8244vaOSdNZoG61bFoRPC
	 hrCZSE8Z1s8q0BUMss7PMJBTmO6jig0fesc7seDjQJcFnbXkH7/hRgAcdfajxNonON
	 HQhStcPhBtU8xNQtw5FMsidSRS8rcPSVBcTDtZwi1+0KdW6JM3CWHWT5G84uLqm1uo
	 nSqr0V6p6R8Wkaxrr2WH3z4+YezLnmB07/i/n1CZTTWoVW2JdVuM1AsnePmYPMueBf
	 WlVVrIB4mkWIa8MSDfgkFI2+6dQUG6OUuJzn61wXo715pzHqIHtYWzI0Uwl9gX18BI
	 hBj3/0WedhfUg==
Date: Mon, 26 Aug 2024 08:50:31 -0500
From: Rob Herring <robh@kernel.org>
To: Alexey Romanov <avromanov@salutedevices.com>
Cc: neil.armstrong@linaro.org, clabbe@baylibre.com,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, vadim.fedorenko@linux.dev,
	linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@salutedevices.com
Subject: Re: [PATCH v9 19/23] arch: arm64: dts: meson: gxl: correct crypto
 node definition
Message-ID: <20240826135031.GA55751-robh@kernel.org>
References: <20240820145623.3500864-1-avromanov@salutedevices.com>
 <20240820145623.3500864-20-avromanov@salutedevices.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240820145623.3500864-20-avromanov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_065035_504744_4FA68BCC 
X-CRM114-Status: GOOD (  15.77  )
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

On Tue, Aug 20, 2024 at 05:56:19PM +0300, Alexey Romanov wrote:
> GXL and newer SoC's uses the DMA engine (not blkmv) for crypto HW.
> Crypto HW doesn't actually use the blkmv clk. At RTL level, crypto
> engine is hard weired to clk81 (CLKID_CLK81). And remove clock-names
> field: according to the new dt-binding, it is no longer required.

Subject should be "arm64: dts: amlogic: ...". IIRC, Amlogic stuff has 
moved away from using "meson".

> 
> Also, GXL crypto IP isn't to seconnd interrput line. So we must
> remove it from dt-bindings.
> 
> Fixes: c4a0457eb858 ("ARM64: dts: amlogic: adds crypto hardware node")
> Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-gxl.dtsi | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
> index 17bcfa4702e1..c29d5b81ce67 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
> @@ -68,10 +68,8 @@ acodec: audio-controller@c8832000 {
>  		crypto: crypto@c883e000 {
>  			compatible = "amlogic,gxl-crypto";
>  			reg = <0x0 0xc883e000 0x0 0x36>;
> -			interrupts = <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>,
> -				     <GIC_SPI 189 IRQ_TYPE_EDGE_RISING>;
> -			clocks = <&clkc CLKID_BLKMV>;
> -			clock-names = "blkmv";
> +			interrupts = <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>;
> +			clocks = <&clkc CLKID_CLK81>;
>  			status = "okay";
>  		};
>  	};
> -- 
> 2.34.1
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
