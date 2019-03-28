Return-Path: <SRS0=2qxk=R7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41DA4C43381
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Mar 2019 15:57:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11DC420823
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Mar 2019 15:57:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="urJtxxtz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11DC420823
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qqzRAXUM3OumpQTnfPiUb01bdPfoFrnxeesvY7zi9tQ=; b=urJtxxtz5uOvAF
	7R3GSmSreVkTkrITlA9PWK5NWltz5wDtr37J9r6waLgttrM1gVtDphFnp3c3lS2z0ng9ITl/LpBBj
	KSY3rnIHLnlk8zgGq/B9XIRrNLaj9ubadEIhmao64/24Gy71AZnolaXV3BffswgNRTMWsc5ZxcYU0
	6TG8NTTWegVjPs4gVqgkq0kghUyr567DWu5MQClZw4ZtlT5dTlHnXN9kQMaxbtxjMvxUe7sHSqxZk
	gqTFqHnSPCDj5ezrnJmYbBqHc3y1GWPrw50CrV8dhX3sOcMd5YSQvaiOkQDmG+N2HVxBlxMPUlZ5O
	pamgF+utAg5C5BtJllxw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9XOx-0001Fs-OC; Thu, 28 Mar 2019 15:57:11 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9XOq-0001E0-VH
 for linux-amlogic@lists.infradead.org; Thu, 28 Mar 2019 15:57:09 +0000
Received: by mail-oi1-f194.google.com with SMTP id t206so16136574oib.3
 for <linux-amlogic@lists.infradead.org>; Thu, 28 Mar 2019 08:57:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=FOI49pDZMyZISM61Z22Wl52hNCM0SzoJZZ0IhhKXih8=;
 b=XYGGUinZRqhQkXDFMe+d93v3X87yJsOK6FEGptz0jHkwe2c5igj/tCtegBc/pycEUa
 m2ZM2kIpAjP7fKqDOorYiQ0XuwsjApXlU6c+bqQWIWUH1JsoTCcN37gt3A17eJK97IGY
 MFaq9Z5K7nBHCUbHgNxTivymIqmcKXiEqqWjYH2Sylzs1QozaWxi0cdD4HgWtCjKpupD
 X2Sc78WQvtv0kRhpKgnjYEaksM2Ftq+KkLQhjSrLtrHm1XpfLe7WDk6kuS4jKrlMrSCZ
 vSnyoxIcL3J61pWXQ9SibARRRBhUli+eWPshKoSmnR8Kii7hCRac4nYQTKBHoRDYFc/j
 miCw==
X-Gm-Message-State: APjAAAVd4p0rz8Bt7mz/RoE85sgjJrW6Pd7GoUaUzQdyownYDdBIZDNc
 WjgV54YBKKcaRgRJMLRMG+CUqA4=
X-Google-Smtp-Source: APXvYqw2SUVj3FhgfmK8kV6bMrrp2YrFuJ1ePANJ6jTfJAK2WVM8Gs64eQ9px5qJB3weSsGFshLE5w==
X-Received: by 2002:aca:3dc4:: with SMTP id k187mr531387oia.40.1553788624078; 
 Thu, 28 Mar 2019 08:57:04 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id r25sm9828605otk.37.2019.03.28.08.57.03
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 28 Mar 2019 08:57:03 -0700 (PDT)
Date: Thu, 28 Mar 2019 10:57:02 -0500
From: Rob Herring <robh@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH net-next 1/3] dt-bindings: net: phy: add g12a mdio mux
 documentation
Message-ID: <20190328155702.GA24696@bogus>
References: <20190314140135.19184-1-jbrunet@baylibre.com>
 <20190314140135.19184-2-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190314140135.19184-2-jbrunet@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190328_085708_177425_C055E71D 
X-CRM114-Status: GOOD (  17.22  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-amlogic@lists.infradead.org, "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Mar 14, 2019 at 03:01:33PM +0100, Jerome Brunet wrote:
> Add documentation for the device tree bindings of the MDIO mux of Amlogic
> g12a SoC family
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../bindings/net/mdio-mux-meson-g12a.txt      | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/mdio-mux-meson-g12a.txt
> 
> diff --git a/Documentation/devicetree/bindings/net/mdio-mux-meson-g12a.txt b/Documentation/devicetree/bindings/net/mdio-mux-meson-g12a.txt
> new file mode 100644
> index 000000000000..e738bba6a9de
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/mdio-mux-meson-g12a.txt
> @@ -0,0 +1,48 @@
> +Properties for the MDIO bus multiplexer/glue of Amlogic G12a SoC family.
> +
> +This is a special case of a MDIO bus multiplexer. It allows to choose between
> +the internal mdio bus leading to the embedded 10/100 PHY or the external
> +MDIO bus.
> +
> +Required properties in addition to the generic multiplexer properties:
> +- compatible : amlogic,g12a-mdio-mux
> +- reg: physical address and length of the multiplexer/glue registers
> +- clocks: list of clock phandle, one for each entry clock-names.
> +- clock-names: should contain the following:
> +  * "pclk"   : peripheral clock.
> +  * "clkin0" : platform crytal
> +  * "clkin1" : SoC 50MHz MPLL
> +
> +Example :
> +
> +mdio-mux: mdio-multiplexer@4c000 {
> +	compatible = "amlogic,g12a-mdio-mux";
> +	reg = <0x0 0x4c000 0x0 0xa4>;
> +	clocks = <&clkc CLKID_ETH_PHY>,
> +		 <&xtal>,
> +		 <&clkc CLKID_MPLL_5OM>;
> +	clock-names = "pclk", "clkin0", "clkin1";
> +	mdio-parent-bus = <&mdio0>;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	ext_mdio: mdio@0 {
> +		reg = <0>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +	};
> +
> +	int_mdio: mdio@1 {
> +		reg = <1>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		internal_ephy: ethernet_phy@8 {

ethernet-phy@8

Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>

> +			compatible = "ethernet-phy-id0180.3301",
> +				     "ethernet-phy-ieee802.3-c22";
> +			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +			reg = <8>;
> +			max-speed = <100>;
> +		};
> +	};
> +};
> -- 
> 2.20.1
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
