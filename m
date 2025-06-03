Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C844C5AE59
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Jun 2025 15:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KBh+Hfg1w+ZF3TwkHGRjkOr31ZeQ+dKiq8fiSk7t1Ys=; b=mPvCiXAuI/iEEP
	zjhcLJyMqu97KYdGVA/PDvPT9F8HMiB+A/GxR8IXzJ6zk8WbCxC1H9owyM6HhRgSEadgtMEgOCAoR
	/4PqCioMrR5Nspdn4+gfT1qDd4OU/cXWHV1oACknBiLmTNKysKa7bjXgyymuUQUTvKbRPsK/Jx3sO
	wXro/nM9jKEZlL42IMXrzuHDhv0InFhXdwZtmMMmNmh7BuXKy2Xx4er+a+x//y8DS20R74Jz7ir3c
	024U/TSS1XDGcJ7oFYA8z7MNmZq7MDYrVKqiu53bSgMCBN/J9ySvJwFAIKzrdiBxjz8uDtetvkZyS
	AAhgs5UooHdoJ/9Ujtkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMU2d-0000000BLzJ-1f7s;
	Tue, 03 Jun 2025 15:59:07 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMTtA-0000000BKKS-0hnD;
	Tue, 03 Jun 2025 15:49:21 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 553Fn5bq556677;
	Tue, 3 Jun 2025 10:49:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748965745;
	bh=Ar5D4zBSs/YUAUx/REy11enEaNMluqXtZe67Zl84UoY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=FPVbgXwMAZE/ZsvtLocKXO3Y3kWf4ta5LsqRBF84wWrOSiq7MrQaGxAofMCJRvFag
	 q534Ov6HTadamlsWXy5sNeqsNM2W3mbasRZBdG90ky87j88oF60ugwyhXorSRgw568
	 YTexki4PRPNXAJAAw5YEFaaAC6IIdx3BF+R+Qp4E=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 553Fn4O53854379
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 3 Jun 2025 10:49:04 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 3
 Jun 2025 10:49:04 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 3 Jun 2025 10:49:04 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 553Fn4is569045;
	Tue, 3 Jun 2025 10:49:04 -0500
Date: Tue, 3 Jun 2025 10:49:04 -0500
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
Subject: Re: [PATCH 5/5] dt-bindings: mailbox: Drop consumers example DTS
Message-ID: <20250603154904.oa5lx5loywmzoqhr@varmint>
References: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
 <20250603-dt-bindings-mailbox-cleanup-v1-5-724407563997@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250603-dt-bindings-mailbox-cleanup-v1-5-724407563997@linaro.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_084920_298237_574172CE 
X-CRM114-Status: GOOD (  11.96  )
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
> Providers DTS examples should not contain consumer nodes, because they
> are completely redundant, obvious (defined in common schema) and add
> unnecessary bloat.  Drop consumer examples and unneeded node labels.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

[...]

> diff --git a/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
> index 1a2001e58880d2fc26954b26cff8ed53e7667f33..8504ceb64806bc7e25468597acdff99624571e9f 100644
> --- a/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
> @@ -242,7 +242,7 @@ examples:
>    - |
>      /* OMAP4 */
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
> -    mailbox: mailbox@4a0f4000 {
> +    mailbox@4a0f4000 {
>          compatible = "ti,omap4-mailbox";
>          reg = <0x4a0f4000 0x200>;
>          interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
> @@ -260,13 +260,9 @@ examples:
>          };
>      };
>  
> -    dsp {
> -        mboxes = <&mailbox &mbox_dsp>;
> -    };
> -
>    - |
>      /* AM33xx */
> -    mailbox1: mailbox@480c8000 {
> +    mailbox@480c8000 {
>          compatible = "ti,omap4-mailbox";
>          reg = <0x480c8000 0x200>;
>          interrupts = <77>;
> @@ -283,7 +279,7 @@ examples:
>  
>    - |
>      /* AM65x */
> -    mailbox0_cluster0: mailbox@31f80000 {
> +    mailbox@31f80000 {
>          compatible = "ti,am654-mailbox";
>          reg = <0x31f80000 0x200>;
>          #mbox-cells = <1>;
> 

Reviewed-by: Nishanth Menon <nm@ti.com>

> -- 
> 2.45.2
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
