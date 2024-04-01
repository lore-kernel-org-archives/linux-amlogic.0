Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD69CD1292
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Apr 2024 14:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CdTVNiMZLX3Pq39Gmzlr2WdT8dzWHZoNIPNcd+1RtvM=; b=2pf+GuGUcZS8S+
	/PctrmwBf8+nM4NDnROUTjbvInloIyDt/dgrJ+6yLsPAt07WvkbfYDq/Tnh1c5XzF+Mi6QhLlu5xy
	2c8QeUUzDdoH4wK/uTBlv2wA05IQiJRsA+6tyAje83c7NHMZN617Dmt6Z8b9S2/8QQOi9GGF6L1LZ
	cWOQN2Wzcs801LV4+vUuzUXnQ/PcLRXMIwgsfo/H9A4kqYbaV1svnCaoXtwcTjGY0hxVuDguKUVTK
	fzifj+wmKxu0zWavNNWafZc70PeQkXUrrGIHtkI9Sdisk7sTjOtPEXmSldbLpQdZcEh/pokYybHwM
	yqG5edmtqfO35ZX+n2cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrIXf-000000082tz-2BEg;
	Mon, 01 Apr 2024 14:21:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrIXc-000000082sD-1GK1;
	Mon, 01 Apr 2024 14:21:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7A06860C68;
	Mon,  1 Apr 2024 14:21:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DADD6C43394;
	Mon,  1 Apr 2024 14:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711981299;
	bh=4iM2W3ENye1EjjINEM9MZSd721nlwsc4Mz61aqbvpO0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bW2aEOn5dRM4Tv6hNuT1wmspPzXPjVcTS4A+m6VEdzx5dIXw9/VMnwVVKGVRBA6TC
	 LAyIUjoyxApNHNJtHFc4eKGDkpe77MH1Agkb/C4rk+Z4xtS7W3Gp6+L1xt5oTVTAJU
	 BVAtccQMAKhTokiuNBTXsftQFMe1Qdi/ey4NfOOQaFnq/PiiRaiRlN7oVPrU0mKbvA
	 x42ox1dfkUEadgXTE67j7h9C7u8krNErXwpjmIaFNaTvyTt1m3bQpGrDtwzYVYxQDY
	 g1PQNgOU6JdZRtYLBnQXlR7bpMn76gnzYrs6fKJnH3EUgaB5nu5204VrjCYxjG6Ddj
	 HLc6qQGp4j4Ig==
Date: Mon, 1 Apr 2024 09:21:36 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: neil.armstrong@linaro.org, jbrunet@baylibre.com,
	mturquette@baylibre.com, sboyd@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com,
	martin.blumenstingl@googlemail.com, kernel@salutedevices.com,
	rockosov@gmail.com, linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 3/6] dt-bindings: clock: meson: a1: peripherals:
 support sys_pll_div16 input
Message-ID: <20240401142136.GA559114-robh@kernel.org>
References: <20240329205904.25002-1-ddrokosov@salutedevices.com>
 <20240329205904.25002-4-ddrokosov@salutedevices.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240329205904.25002-4-ddrokosov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_072140_405040_0991DE75 
X-CRM114-Status: GOOD (  14.69  )
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

On Fri, Mar 29, 2024 at 11:58:43PM +0300, Dmitry Rokosov wrote:
> The 'sys_pll_div16' input clock is used as one of the sources for the
> GEN clock.
> 
> Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> ---
>  .../bindings/clock/amlogic,a1-peripherals-clkc.yaml          | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,a1-peripherals-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a1-peripherals-clkc.yaml
> index 6d84cee1bd75..f6668991ff1f 100644
> --- a/Documentation/devicetree/bindings/clock/amlogic,a1-peripherals-clkc.yaml
> +++ b/Documentation/devicetree/bindings/clock/amlogic,a1-peripherals-clkc.yaml
> @@ -29,6 +29,7 @@ properties:
>        - description: input fixed pll div5
>        - description: input fixed pll div7
>        - description: input hifi pll
> +      - description: input sys pll div16
>        - description: input oscillator (usually at 24MHz)
>  
>    clock-names:
> @@ -38,6 +39,7 @@ properties:
>        - const: fclk_div5
>        - const: fclk_div7
>        - const: hifi_pll
> +      - const: sys_pll_div16
>        - const: xtal

And adding an entry in the middle is also an ABI break. New entries go 
on the end (and should be optional).

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
