Return-Path: <SRS0=PQn9=2Z=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34867C00523
	for <linux-amlogic@archiver.kernel.org>; Sat,  4 Jan 2020 00:22:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 090BC21835
	for <linux-amlogic@archiver.kernel.org>; Sat,  4 Jan 2020 00:22:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kiB5rDFT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 090BC21835
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NI90+hsfnteLs9slbBUnXJLko+Tlk/7QXW2/SavLx7A=; b=kiB5rDFTQm3w3T
	5/xg8F6tD/YiQpkYnzrmKNjvTwGn5b+JuY015lqeypVDNNdA7ZRahr9K2kS7j4UF0YA39kIgmwjWh
	mrFvmqsJwP8ZUBpy9CrMfF0JRLVdiTfnufUn3Soj5Uqe4XmKk8uQwOoPAtrBzLa7irJmXlVhRbcCI
	HykdbRkYjyqoPMCND3mYkoYuRympSlvP5lYV7WlVYaZ6FJCgjtT04acDShR5zsYEPPPfKyYQJA0eg
	lNHlpQEsflLNkQsodUoCto+RUBFsfz1u7SmSWOGY6sRHK65P1KvQ8nF0Y+SPd3hJyhqyX9P1oFgP0
	Xr1U06wgEMTPLdzqfSmQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1inXCY-0007cV-MG; Sat, 04 Jan 2020 00:21:58 +0000
Received: from mail-io1-f65.google.com ([209.85.166.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1inXCW-0007cB-Hq
 for linux-amlogic@lists.infradead.org; Sat, 04 Jan 2020 00:21:58 +0000
Received: by mail-io1-f65.google.com with SMTP id z193so43088196iof.1
 for <linux-amlogic@lists.infradead.org>; Fri, 03 Jan 2020 16:21:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GRrMCIevFS+50QdWWWGaYeUVyp1OjoJAsbXHKCUBzfs=;
 b=Jv8qkmvCtQjt+SrOCZIqkRxPWh28QkdphbHt6bcyYQt/js32uczjJKqBrFtBRJ4mYz
 NAf7duI18y73H9rAgXwJgCUYzXebH6nEpSGQBJBLfcmgz+iYLUU8vSy6JMnwRQNVkXax
 rZbsvfrMkPI2YLclVnZSjq6nIvOXOC712pmMhnd/8BDQe1XPtto0MeCDbDxIr/pVA4a0
 gxYmaxoVNpMYtfTSHMQaHNPv03BlNyLia4LaFp2qojos73cCJ494TI01cMDg1ZmfeD9l
 9wrIoaMdTBweecW+VkPB4vJyxEySEK/HlrDqgPp+qPrc9Z3rF0lQiAxuQvDd1inbmC4p
 tNYA==
X-Gm-Message-State: APjAAAXTQsyMQzbl0P1A86i8rXOPhHRKhHpvDNXcSVs0mS4tIN3igNh9
 MgV1InxvvMOLh+ZgVOU3IwZ/mds=
X-Google-Smtp-Source: APXvYqyV1uGEA68dXH+bN3DK1CYJkbT2+zbJfe2DCr+bllbVzkC6quybXWeF8vgzskRVzPFGf8VKBw==
X-Received: by 2002:a5d:93d1:: with SMTP id j17mr4698251ioo.300.1578097314685; 
 Fri, 03 Jan 2020 16:21:54 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id a7sm15247506iod.61.2020.01.03.16.21.52
 for <linux-amlogic@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2020 16:21:53 -0800 (PST)
Received: from rob (uid 1000) (envelope-from rob@rob-hp-laptop) id 2219a5
 by rob-hp-laptop (DragonFly Mail Agent v0.11);
 Fri, 03 Jan 2020 17:21:52 -0700
Date: Fri, 3 Jan 2020 17:21:52 -0700
From: Rob Herring <robh@kernel.org>
To: Remi Pommarel <repk@triplefau.lt>
Subject: Re: [PATCH v3 4/5] dt-bindings: PCI: meson: Update PCIE bindings
 documentation
Message-ID: <20200104002152.GA32487@bogus>
References: <20191224173942.18160-1-repk@triplefau.lt>
 <20191224173942.18160-5-repk@triplefau.lt>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191224173942.18160-5-repk@triplefau.lt>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200103_162156_590864_A3AD2315 
X-CRM114-Status: GOOD (  14.82  )
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
Cc: devicetree@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yue Wang <yue.wang@Amlogic.com>,
 linux-amlogic@lists.infradead.org, Andrew Murray <andrew.murray@arm.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Dec 24, 2019 at 06:39:41PM +0100, Remi Pommarel wrote:
> Now that a new PHYs has been introduced for AXG SoC family, update
> dt bindings documentation.

This breaks compatibility. If that's okay, say so and why it is.

If only someone had said putting the phy here in the first place was 
wrong:

https://lore.kernel.org/linux-amlogic/20180829004122.GA25928@bogus/

> 
> Signed-off-by: Remi Pommarel <repk@triplefau.lt>
> ---
>  .../bindings/pci/amlogic,meson-pcie.txt       | 22 ++++++++-----------
>  1 file changed, 9 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/amlogic,meson-pcie.txt b/Documentation/devicetree/bindings/pci/amlogic,meson-pcie.txt
> index 84fdc422792e..b6acbe694ffb 100644
> --- a/Documentation/devicetree/bindings/pci/amlogic,meson-pcie.txt
> +++ b/Documentation/devicetree/bindings/pci/amlogic,meson-pcie.txt
> @@ -18,7 +18,6 @@ Required properties:
>  - reg-names: Must be
>  	- "elbi"	External local bus interface registers
>  	- "cfg"		Meson specific registers
> -	- "phy"		Meson PCIE PHY registers for AXG SoC Family
>  	- "config"	PCIe configuration space
>  - reset-gpios: The GPIO to generate PCIe PERST# assert and deassert signal.
>  - clocks: Must contain an entry for each entry in clock-names.
> @@ -26,13 +25,13 @@ Required properties:
>  	- "pclk"       PCIe GEN 100M PLL clock
>  	- "port"       PCIe_x(A or B) RC clock gate
>  	- "general"    PCIe Phy clock
> -	- "mipi"       PCIe_x(A or B) 100M ref clock gate for AXG SoC Family
>  - resets: phandle to the reset lines.
> -- reset-names: must contain "phy" "port" and "apb"
> -       - "phy"         Share PHY reset for AXG SoC Family
> +- reset-names: must contain "port" and "apb"
>         - "port"        Port A or B reset
>         - "apb"         Share APB reset
> -- phys: should contain a phandle to the shared phy for G12A SoC Family
> +- phys: should contain a phandle to the PCIE phy
> +- phy-names: must contain "pcie"
> +
>  - device_type:
>  	should be "pci". As specified in designware-pcie.txt
>  
> @@ -43,9 +42,8 @@ Example configuration:
>  			compatible = "amlogic,axg-pcie", "snps,dw-pcie";
>  			reg = <0x0 0xf9800000 0x0 0x400000
>  					0x0 0xff646000 0x0 0x2000
> -					0x0 0xff644000 0x0 0x2000
>  					0x0 0xf9f00000 0x0 0x100000>;
> -			reg-names = "elbi", "cfg", "phy", "config";
> +			reg-names = "elbi", "cfg", "config";
>  			reset-gpios = <&gpio GPIOX_19 GPIO_ACTIVE_HIGH>;
>  			interrupts = <GIC_SPI 177 IRQ_TYPE_EDGE_RISING>;
>  			#interrupt-cells = <1>;
> @@ -58,17 +56,15 @@ Example configuration:
>  			ranges = <0x82000000 0 0 0x0 0xf9c00000 0 0x00300000>;
>  
>  			clocks = <&clkc CLKID_USB
> -					&clkc CLKID_MIPI_ENABLE
>  					&clkc CLKID_PCIE_A
>  					&clkc CLKID_PCIE_CML_EN0>;
>  			clock-names = "general",
> -					"mipi",
>  					"pclk",
>  					"port";
> -			resets = <&reset RESET_PCIE_PHY>,
> -				<&reset RESET_PCIE_A>,
> +			resets = <&reset RESET_PCIE_A>,
>  				<&reset RESET_PCIE_APB>;
> -			reset-names = "phy",
> -					"port",
> +			reset-names = "port",
>  					"apb";
> +			phys = <&pcie_phy>;
> +			phy-names = "pcie";
>  	};
> -- 
> 2.24.0
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
