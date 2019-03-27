Return-Path: <SRS0=DOpU=R6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DB33C43381
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Mar 2019 20:40:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DE402054F
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Mar 2019 20:40:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iijKIXy2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DE402054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AS+DHlH6Dd+z61EmJv+p15BVf7dzHKrKGoOd2riSvmc=; b=iijKIXy2dYmd4+
	4hSLB7tM3XV3xcWKPJy/jyNibyrfYuAIXlm5kdvFV9FpzX4NVWCN4OkihwTxn62yllfhdOAcsR6iM
	Dxi/Z1NVoWVJCOhRgV7z53CuntWoOAehSxiAXgUr6aoCUXKbkBWn7I44gGzPkXnLDwds42nK0w9dv
	8ijaxr+TX7HVmJpf49eswG+0t8lNaxKV/J5cJLQaV+BaXWr9X3CBlWsDA7otIH8LNglr7e3okJlmD
	wuCkvISMI7sjxoCDt/988zKh3goe0jAL6fu1xlIFonCxQfK11katdpqHx1WHN8Q36KYSudgm/0+fA
	tX6NmoQ3rowB+Yta0nZg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9FLD-0007Tr-C7; Wed, 27 Mar 2019 20:40:07 +0000
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9FL9-00070y-9d; Wed, 27 Mar 2019 20:40:05 +0000
Received: by mail-oi1-f196.google.com with SMTP id v84so14032470oif.4;
 Wed, 27 Mar 2019 13:40:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4gs1k9h/r+rR22WgCUHcRbiFNQiFMIAqAW+9dotws5o=;
 b=AjXySQ3c+vm7O9IOyaJFwfx2q50qpBxZQgMli1u0/bbwicLNAgOdpMGdEzbs4yhnIg
 ohA5xtfDMaltwvLX89DgihrY8emZPmydUT3PRaaq9fZJuMRlflIlI7V8EjC4cw5o9Bya
 ZXID9IpEeOLVRluwJVRn6ZQCBbsQkLOOVhqCk1QCnNnnzzK2Xcv3FxOT3icADYwrONTX
 8Jp7/XKKbRYryHKahipw1KH5kopo2NH70ryYz4BFMoMUkZbFd23TTba7eF1mKGC0TqS0
 w5gSWSi3Oa4ox5xjKfDCnYBNPhvg3v4LqgdDFu61Bic3ZJdEzIEh3GWePHl7ROhjbckk
 /DSg==
X-Gm-Message-State: APjAAAURMMKACnj3TURZeFBqRxbQLmNYnp6RNGo/oSb/lIvXS7IFM1JP
 W3O/y5xm/6AUsW5hx10ExwEE9Eg=
X-Google-Smtp-Source: APXvYqwiLSwO8LZWbdcBRnH42bGTBkfd4DgaMpEeNCh1wnZaZdD3X72tHIoPAa+g7pIuHz+CxCG+Aw==
X-Received: by 2002:aca:5757:: with SMTP id l84mr21554261oib.155.1553719201655; 
 Wed, 27 Mar 2019 13:40:01 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id a34sm2067893otc.46.2019.03.27.13.39.59
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 27 Mar 2019 13:39:59 -0700 (PDT)
Date: Wed, 27 Mar 2019 15:39:59 -0500
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v3] dt-bindings: gpu: add bindings for the ARM Mali
 Bifrost GPU
Message-ID: <20190327203959.GA31523@bogus>
References: <20190304105802.6010-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190304105802.6010-1-narmstrong@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190327_134003_921996_6E04FA2B 
X-CRM114-Status: GOOD (  22.53  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Mar 04, 2019 at 11:58:02AM +0100, Neil Armstrong wrote:
> Add the bindings for the Bifrost family of ARM Mali GPUs.
> 
> The Bifrost GPU architecture is similar to the Midgard family,
> but with a different Shader Core & Execution Engine structures.
> 
> Bindings are based on the Midgard family bindings, but the inner
> architectural changes makes it a separate family needing separate
> bindings.
> 
> The Bifrost GPUs are present in a number of recent SoCs, like the
> Amlogic G12A Family, and many other vendors.
> The Amlogic vendor specific compatible is added to handle the
> specific IP integration differences and dependencies.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../bindings/gpu/arm,mali-bifrost.txt         | 90 +++++++++++++++++++
>  1 file changed, 90 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.txt
> 
> Changes since v2:
> - moved to a single compatible since HW is fully discoverable
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.txt b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.txt
> new file mode 100644
> index 000000000000..e068fccf4ce9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.txt
> @@ -0,0 +1,90 @@
> +ARM Mali Bifrost GPU
> +====================
> +
> +Required properties:
> +
> +- compatible :
> +  * Must contain one the following:
> +    + "arm,mali-bifrost"

Perhaps a note that the specific model/revision is discoverable.

> +  * which must be preceded by one of the following vendor specifics:
> +    + "amlogic,meson-g12a-mali"
> +
> +- reg : Physical base address of the device and length of the register area.
> +
> +- interrupts : Contains the three IRQ lines required by Mali Bifrost devices.
> +
> +- interrupt-names : Contains the names of IRQ resources in the order they were
> +  provided in the interrupts property. Must contain: "job", "mmu", "gpu".

Please make the order defined.

> +
> +Optional properties:
> +
> +- clocks : Phandle to clock for the Mali Bifrost device.
> +
> +- mali-supply : Phandle to regulator for the Mali device. Refer to
> +  Documentation/devicetree/bindings/regulator/regulator.txt for details.
> +
> +- operating-points-v2 : Refer to Documentation/devicetree/bindings/opp/opp.txt
> +  for details.
> +
> +- resets : Phandle of the GPU reset line.
> +
> +Vendor-specific bindings
> +------------------------
> +
> +The Mali GPU is integrated very differently from one SoC to
> +another. In order to accomodate those differences, you have the option
> +to specify one more vendor-specific compatible, among:
> +
> +- "amlogic,meson-g12a-mali"
> +  Required properties:
> +  - resets : Should contain phandles of :
> +    + GPU reset line
> +    + GPU APB glue reset line
> +
> +Example for a Mali-G31:
> +
> +gpu@ffa30000 {
> +	compatible = "amlogic,meson-g12a-mali", "arm,mali-bifrost";
> +	reg = <0xffe40000 0x10000>;
> +	interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
> +		     <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>,
> +		     <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>;
> +	interrupt-names = "job", "mmu", "gpu";
> +	clocks = <&clk CLKID_MALI>;
> +	mali-supply = <&vdd_gpu>;
> +	operating-points-v2 = <&gpu_opp_table>;
> +	resets = <&reset RESET_DVALIN_CAPB3>, <&reset RESET_DVALIN>;
> +};
> +
> +gpu_opp_table: opp_table0 {
> +	compatible = "operating-points-v2";
> +
> +	opp@533000000 {
> +		opp-hz = /bits/ 64 <533000000>;
> +		opp-microvolt = <1250000>;
> +	};
> +	opp@450000000 {
> +		opp-hz = /bits/ 64 <450000000>;
> +		opp-microvolt = <1150000>;
> +	};
> +	opp@400000000 {
> +		opp-hz = /bits/ 64 <400000000>;
> +		opp-microvolt = <1125000>;
> +	};
> +	opp@350000000 {
> +		opp-hz = /bits/ 64 <350000000>;
> +		opp-microvolt = <1075000>;
> +	};
> +	opp@266000000 {
> +		opp-hz = /bits/ 64 <266000000>;
> +		opp-microvolt = <1025000>;
> +	};
> +	opp@160000000 {
> +		opp-hz = /bits/ 64 <160000000>;
> +		opp-microvolt = <925000>;
> +	};
> +	opp@100000000 {
> +		opp-hz = /bits/ 64 <100000000>;
> +		opp-microvolt = <912500>;
> +	};
> +};
> -- 
> 2.20.1
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
