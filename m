Return-Path: <SRS0=wpca=XL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32829C4CECE
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Sep 2019 13:43:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0849D216C8
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Sep 2019 13:43:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XEJ4Rakv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0849D216C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FsdEOvvxDCyxJusZ8IjmAd8srfx1q4m+XgjAGteEU4M=; b=XEJ4RakvUx9tL+
	Nf2Kzk5h4TL77VDB+BGHC430RP2VgjDL2tVf9++vbvpElgrCXB3oZiY6RBwK/53cH9yPYjHTFBD+3
	ASgE8zNFUlWCyhOi6m5W5nbYRKI6PPRjGSjMFoX8NEERKOyBbF11qdKK/IqCc2NU40Th3tSqbEmpr
	xw7Vm4M7j/8BwKf8yQhcdrYQ96yhEPuQP+s8JkK0hyEghyp1lH97AttxXKMg+XqOM0ecg1ewGKlKI
	EPRJ4XqqvKg9hDbox4LWCBUx48Y5DCp2nYmBJKGt83XRAA/e7bM+xx1Z3tOcR/h9Webtn45/nAybH
	0m8qT2ZIfIpYjXY1hiTw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i9rHR-0000MQ-5n; Mon, 16 Sep 2019 13:43:01 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i9rHE-0000Ha-3h; Mon, 16 Sep 2019 13:42:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B21AD337;
 Mon, 16 Sep 2019 06:42:44 -0700 (PDT)
Received: from localhost (unknown [10.37.6.20])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 288663F67D;
 Mon, 16 Sep 2019 06:42:43 -0700 (PDT)
Date: Mon, 16 Sep 2019 14:42:42 +0100
From: Andrew Murray <andrew.murray@arm.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 5/6] arm64: dts: meson-g12a: Add PCIe node
Message-ID: <20190916134241.GR9720@e119886-lin.cambridge.arm.com>
References: <20190916125022.10754-1-narmstrong@baylibre.com>
 <20190916125022.10754-6-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190916125022.10754-6-narmstrong@baylibre.com>
User-Agent: Mutt/1.10.1+81 (426a6c1) (2018-08-26)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190916_064248_476704_FB58C129 
X-CRM114-Status: GOOD (  15.46  )
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
Cc: maz@kernel.org, lorenzo.pieralisi@arm.com, gouwa@khadas.com,
 khilman@baylibre.com, nick@khadas.com, linux-kernel@vger.kernel.org,
 kishon@ti.com, repk@triplefau.lt, linux-pci@vger.kernel.org,
 bhelgaas@google.com, linux-amlogic@lists.infradead.org, yue.wang@Amlogic.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Sep 16, 2019 at 02:50:21PM +0200, Neil Armstrong wrote:
> This adds the Amlogic G12A PCI Express controller node, also
> using the USB3+PCIe Combo PHY.
> 
> The PHY mode selection is static, thus the USB3+PCIe Combo PHY
> phandle would need to be removed from the USB control node if the
> shared differential lines are used for PCIe instead of USB3.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Reviewed-by: Andrew Murray <andrew.murray@arm.com>

> ---
>  .../boot/dts/amlogic/meson-g12-common.dtsi    | 33 +++++++++++++++++++
>  arch/arm64/boot/dts/amlogic/meson-sm1.dtsi    |  4 +++
>  2 files changed, 37 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> index 852cf9cf121b..7330dc37b7a6 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> @@ -95,6 +95,39 @@
>  		#size-cells = <2>;
>  		ranges;
>  
> +		pcie: pcie@fc000000 {
> +			compatible = "amlogic,g12a-pcie", "snps,dw-pcie";
> +			reg = <0x0 0xfc000000 0x0 0x400000
> +			       0x0 0xff648000 0x0 0x2000
> +			       0x0 0xfc400000 0x0 0x200000>;
> +			reg-names = "elbi", "cfg", "config";
> +			interrupts = <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
> +			#interrupt-cells = <1>;
> +			interrupt-map-mask = <0 0 0 0>;
> +			interrupt-map = <0 0 0 0 &gic GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
> +			bus-range = <0x0 0xff>;
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +			device_type = "pci";
> +			ranges = <0x81000000 0 0 0x0 0xfc600000 0 0x00100000
> +				  0x82000000 0 0xfc700000 0x0 0xfc700000 0 0x1900000>;
> +
> +			clocks = <&clkc CLKID_PCIE_PHY
> +				  &clkc CLKID_PCIE_COMB
> +				  &clkc CLKID_PCIE_PLL>;
> +			clock-names = "general",
> +				      "pclk",
> +				      "port";
> +			resets = <&reset RESET_PCIE_CTRL_A>,
> +				 <&reset RESET_PCIE_APB>;
> +			reset-names = "port",
> +				      "apb";
> +			num-lanes = <1>;
> +			phys = <&usb3_pcie_phy PHY_TYPE_PCIE>;
> +			phy-names = "pcie";
> +			status = "disabled";
> +		};
> +
>  		ethmac: ethernet@ff3f0000 {
>  			compatible = "amlogic,meson-axg-dwmac",
>  				     "snps,dwmac-3.70a",
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
> index 91492819d0d8..ee9ea3c69433 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
> @@ -135,6 +135,10 @@
>  	power-domains = <&pwrc PWRC_SM1_ETH_ID>;
>  };
>  
> +&pcie {
> +	power-domains = <&pwrc PWRC_SM1_PCIE_ID>;
> +};
> +
>  &pwrc {
>  	compatible = "amlogic,meson-sm1-pwrc";
>  };
> -- 
> 2.22.0
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
