Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAAD5C3DA78
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Jan 2023 08:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NGzJkvqn9iELicKl5N/nvBSlYDwes4hxchwEIa04wlA=; b=UvLOsyW5gu7uvv
	KFMJy+rDLnXC58iz/t4qcQb65MhAZ19dPwoWgwytd1UoRyD/a3vpXv+wSAe++hSxC2otQDdfYwPJy
	uRXQbdH/0mqPO33nE93iEOuRFe8QNS2qkpCzs4Obi/bUoobjQEXk++geDIM/hMwsFMurq5Khbzhmx
	MoKsIWyC2W0uQwkFz3hpRVAiftxNsgfFx1SZH9flk4I/8Sq9oXSJjCBnAu7PybsD2T9uE2KvjX84v
	2Tx12iIjpnIHmxGym5kH9wfGHICtkND8xF54MDwk0L2jrcD/4QbtpKkY+8EXz4fEkjrPXv04UiHpt
	CdWIBahNnuyIwPdzGsog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHhO0-00DKYw-HV; Tue, 17 Jan 2023 08:32:04 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHhNx-00DKXp-6w
	for linux-amlogic@lists.infradead.org; Tue, 17 Jan 2023 08:32:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C3E4EB80E74;
	Tue, 17 Jan 2023 08:31:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4560CC433F0;
	Tue, 17 Jan 2023 08:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673944315;
	bh=8uUX5CbGfhfHSNhlfNoYAhVgzakXKP3QFtiVxG4xGQY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CBMC1byv8p64gKubbCku9nqX58IT5fcGTAQYVcZ299UD8F+G6shUftd6FiezC34pI
	 Lmh6grgyHTvY28URYg7vKRkHPODXuzOhFaR09WM6OLrwnWptvykjgjyQIU4TU6rq7J
	 bp5a918ji0C6a5+0cYYYyu7SMYca3GDK10dLmEcIHOA+JcLczFLNQlHEN0soZn4ZPe
	 Qk5v99FUy4zqFBysZmL+KvLokW92AfkS3fDCMvKlX4Nk/8lVMqJc+oBtxV89yOmVZt
	 4XQHei6XzfIkt5eNdXXO4O9u9xrxCu5q/QHwTDigJkrzzanmKT7tTkmxFWasot9IVj
	 eo1giXE1PeGVA==
Message-ID: <4be60ea2-cb67-7695-1144-bf39453e9e1f@kernel.org>
Date: Tue, 17 Jan 2023 09:31:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: add amlogic gxl mdio
 multiplexer
To: Jerome Brunet <jbrunet@baylibre.com>, netdev@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Da Xue <da@lessconfused.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230116091637.272923-1-jbrunet@baylibre.com>
 <20230116091637.272923-2-jbrunet@baylibre.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230116091637.272923-2-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_003201_581507_C3C04CC8 
X-CRM114-Status: GOOD (  19.75  )
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

On 16/01/2023 10:16, Jerome Brunet wrote:
> Add documentation for the MDIO bus multiplexer found on the Amlogic GXL
> SoC family

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../bindings/net/amlogic,gxl-mdio-mux.yaml    | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/amlogic,gxl-mdio-mux.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/amlogic,gxl-mdio-mux.yaml b/Documentation/devicetree/bindings/net/amlogic,gxl-mdio-mux.yaml
> new file mode 100644
> index 000000000000..d21bce695fa9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/amlogic,gxl-mdio-mux.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/amlogic,gxl-mdio-mux.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic GXL MDIO bus multiplexer
> +
> +maintainers:
> +  - Jerome Brunet <jbrunet@baylibre.com>
> +
> +description:
> +  This is a special case of a MDIO bus multiplexer. It allows to choose between
> +  the internal mdio bus leading to the embedded 10/100 PHY or the external
> +  MDIO bus on the Amlogic GXL SoC family.
> +
> +allOf:
> +  - $ref: mdio-mux.yaml#
> +
> +properties:
> +  compatible:
> +    const: amlogic,gxl-mdio-mux
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: ref
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    eth_phy_mux: mdio@558 {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      compatible = "amlogic,gxl-mdio-mux";

compatible, then reg then the rest.

> +      clocks = <&refclk>;
> +      clock-names = "ref";
> +      reg = <0x558 0xc>;
> +      mdio-parent-bus = <&mdio0>;
> +
> +      external_mdio: mdio@0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        reg = <0x0>;

reg is before other properties.

> +      };
> +
> +      internal_mdio: mdio@1 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        reg = <0x1>;

Ditto. If you resend, keep my tag and finally use get_maintainers.pl

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
