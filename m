Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C4B2CF9C6B
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Sep 2024 20:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BaE4d69jVxnSiUdEe9hIkJeOD6sLK6Z3RAvtN9RAK9s=; b=sgL6ixYd2aMzH0
	sDOGqPzK+3XI8xq+viztl9hoyibRPhdgRmKlkbQKkIgySx6sMNodF2HZKlb1zBN0rIt+GWXKpLItH
	6wIe2tvYyriI4rU9CATLLoe2Z4um8LCxD8jPguveuHzDOd/Ys5Ag597a1A1K1vcOBB7+2iFM26P3B
	gNwPPiGkK9X6//8bbzbB1JrSfK45Q90AUe9m7KY9nKrjSVqMyNkfe9rXnvMD9+wXUiGw4rovDuHzq
	G4lrGGW8qXHc5PXigGWqmM38qdBpt09+5QJySOYfO7iIiiCR/4R8s8ZR6aXEn7Y3jo2hwTn69Vox1
	jVInFMgU/QTrTcpMSEGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stCAk-00000003F7C-3nyp;
	Tue, 24 Sep 2024 20:30:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stCAi-00000003F5Q-0alN;
	Tue, 24 Sep 2024 20:30:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 902F65C5D04;
	Tue, 24 Sep 2024 20:30:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 008CAC4CEC4;
	Tue, 24 Sep 2024 20:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727209807;
	bh=2u0zeg+dHBdxKoMgMF1vko+I8IQky5fnMmQgoOzaaEg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qhrdvOitcuBAEovMd5FLA8/jNrjkcFLI6ze/m/bUC+tgG1KdEOhNsqUbVrgWyWRem
	 PFR4c463Nem9cI8uj1VUlAYthS3VUcAY2MqSZpq1l7qiBkhBz2Mcc4EKrvcUifzqO8
	 Nj3HxXWnueDWNP4zELMGFPx8t7Tu/iJyPEw+sA6numO+MzZnhOSbCM6ZdD/WXgtxXH
	 P3Hpzz+a1Bv3EWJ/YA/xQUpl1TDifK24yCj/nRsEuEVpPlcbvE/La1M/DEVkTURKDX
	 ApGFPJMJi07DIbVulX7ef4eqKrP4xMarslXJVmneuCAwcEtQQDmO4vn7W57YoJnFXR
	 JES2/7uISerRQ==
Date: Tue, 24 Sep 2024 15:30:06 -0500
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: mmc: document mmc-slot
Message-ID: <20240924203006.GA283611-robh@kernel.org>
References: <20240920-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v2-0-5aa8bdfe01af@linaro.org>
 <20240920-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v2-2-5aa8bdfe01af@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240920-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v2-2-5aa8bdfe01af@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_133008_247090_F0459817 
X-CRM114-Status: GOOD (  15.12  )
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

On Fri, Sep 20, 2024 at 10:38:04AM +0200, Neil Armstrong wrote:
> Document the mmc-slot, which is a subnode of a multi-slot
> MMC controlle, each slot is represented as a full MMC controller,
> the top node handling all the shared resources and slot mux.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../devicetree/bindings/mmc/mmc-slot.yaml          | 40 ++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/mmc-slot.yaml b/Documentation/devicetree/bindings/mmc/mmc-slot.yaml
> new file mode 100644
> index 000000000000..c30eda4fd2a6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mmc/mmc-slot.yaml
> @@ -0,0 +1,40 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mmc/mmc-slot.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MMC/SD/SDIO slot of a multi-slot controller
> +
> +maintainers:
> +  - Ulf Hansson <ulf.hansson@linaro.org>
> +
> +allOf:
> +  - $ref: mmc-controller.yaml
> +
> +properties:
> +  compatible:
> +    const: mmc-slot
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    mmc-controller {

mmc {

> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      slot@0 {
> +        compatible = "mmc-slot";
> +        reg = <0>;
> +        bus-width = <4>;
> +      };
> +    };
> +
> +...
> 
> -- 
> 2.34.1
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
