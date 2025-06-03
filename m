Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B750FC5AD49
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Jun 2025 15:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lbVUJyUSelHp+wGQf7/hkksWLL4SCZI8dWPrfrzRfMA=; b=NT2B4Hjs/u/0XE
	Z+WkSw5QLPeI8Xdp9/l19GXvp3vVrK83y5FAm15yCzLzod172TKntVM3TCVrfgOXtoc3jvwQHgW16
	LS1PXPbi6RnmwqVu23mkc0XDUaB4AGF4oGoJxR9rjCMHwQUg9SUQYj86rM+pEbOUEJxJakiaC/Zei
	/V0cA4gePLEyA+fOQOi8IMbzoYUBIZd0CvoHEftYrCv7WuUMialyezBZRKcxmJOh3pa/+vSDwnYAp
	P1NwjIY13Z+WE/uje37yMPLx/dTkrwFCCZgsv4uzQiFBqE7WTvM0w7btDzIM+WUgNk6KWXEDCElef
	C0VE3PUHW4qAAr0gw3XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMU0R-0000000BLWY-1voA;
	Tue, 03 Jun 2025 15:56:51 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMTqM-0000000BJyo-0I04;
	Tue, 03 Jun 2025 15:46:27 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 553FkCqT3554911;
	Tue, 3 Jun 2025 10:46:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748965572;
	bh=zFZ6YwHvgSl9V9Kq7xYCisv6g+dcYL2KAPMk93hOPSQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=x9DStk0B/Xr4bClFB1xeGxAnulnzCKY/VfdSQUMrAR1wRYGfZ+/x1Oxg3zd665GLX
	 vJJiVawJI2CJtPXonTu7obh4+Rcc6kSsWbMWiZU6QzUit7jkg5tUW/Lnh48mfE8Izw
	 hP2vUYebW5iTPRvd7EaWoQlPphzUnHNVwbMyv8NY=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 553FkCPo1411998
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 3 Jun 2025 10:46:12 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 3
 Jun 2025 10:46:12 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 3 Jun 2025 10:46:12 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 553FkC0i566876;
	Tue, 3 Jun 2025 10:46:12 -0500
Date: Tue, 3 Jun 2025 10:46:12 -0500
From: Nishanth Menon <nm@ti.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman
	<khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
        Chen-Yu Tsai
	<wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland
	<samuel@sholland.org>, Sven Peter <sven@svenpeter.dev>,
        Janne Grunau
	<j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Neal Gompa
	<neal@gompa.dev>, Hector Martin <marcan@marcan.st>,
        Thierry Reding
	<thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>, Suman
 Anna <s-anna@ti.com>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-amlogic@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
        <asahi@lists.linux.dev>, <linux-tegra@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 3/5] dt-bindings: mailbox: Correct example indentation
Message-ID: <20250603154612.ksi2jq5dqhc4wkhu@despise>
References: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
 <20250603-dt-bindings-mailbox-cleanup-v1-3-724407563997@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250603-dt-bindings-mailbox-cleanup-v1-3-724407563997@linaro.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_084626_196150_58DF5043 
X-CRM114-Status: GOOD (  11.59  )
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

On 13:57-20250603, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces, so
> correct a mixture of different styles to keep consistent 4-spaces.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
[...]

> diff --git a/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml b/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml
> index 682ccd76f5c25fc13bb3375007d39e6208cdddc0..c321b69f0ccd3cdc7cedefadf46982b42cce915e 100644
> --- a/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml
> @@ -68,12 +68,12 @@ examples:
>    - |
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>      secure_proxy: mailbox@32c00000 {
> -          compatible = "ti,am654-secure-proxy";
> -          #mbox-cells = <1>;
> -          reg-names = "target_data", "rt", "scfg";
> -          reg = <0x32c00000 0x100000>,
> -                <0x32400000 0x100000>,
> -                <0x32800000 0x100000>;
> -          interrupt-names = "rx_011";
> -          interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
> +        compatible = "ti,am654-secure-proxy";
> +        #mbox-cells = <1>;
> +        reg-names = "target_data", "rt", "scfg";
> +        reg = <0x32c00000 0x100000>,
> +              <0x32400000 0x100000>,
> +              <0x32800000 0x100000>;
> +        interrupt-names = "rx_011";
> +        interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
>      };

Reviewed-by: Nishanth Menon <nm@ti.com>

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
