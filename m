Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D712ACF9C71
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Sep 2024 09:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WnEJqjXXsl9TQDZoVo1n+O9KZC7fCx7nzgb6aUOEICI=; b=Pvi0lR0+hMMTZ7
	o3g5VtAet+OE3tulXzruZzvV35R/sy+0GVIUptluQwwmuVyJx8pqqfjkKtLuN7ugZgT4o9a/T0ien
	hGrRSBOpFcAs6IJNmMTvEheUGbQ7v/y4AGECQQyQ9jdNrmLHJZWz4WirwxHpAbmfzuUA+KAnH7/br
	fOKV6XEK7HBDSSDJ8sghXR78tJ/vfUVzvznpP2UDT0odLHLeiqkmXroCod/8zR4YXu5sSNpTNll36
	IgFewI4M27KMlMaYibvFeEuG4TKidnST8ThAFXog9zpR81woyoLN/jUg0ID5UxRD35+IbwRvzEQYs
	ElEWb6I7PfgJgZYbvOHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st1eH-00000001lEN-2IJT;
	Tue, 24 Sep 2024 09:15:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st1da-00000001l83-0elP;
	Tue, 24 Sep 2024 09:15:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5D5C95C5B97;
	Tue, 24 Sep 2024 09:15:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1575C4CEC4;
	Tue, 24 Sep 2024 09:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727169313;
	bh=2KVuSiYdwxbydC/A7uEWSSCNb1LsPPeJVYNuNNT1jtQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dtkeOj0JCO59riq3o9U7q6HoDynCZ1sHI7fJLReBh3tlc1BFCSnjKd3DU2py+0Gdl
	 MJnTRjoRAPJdvcxv0U6KK7S63atk/TaGkYF4PClyYuDbWPBJcWp7EVpSQXsutDNMB8
	 mBLnYOQ3XZXMn+Rsr/TDCpSGmP0+wreQyaeKuWMjyHyP3JTiIyGaGHrEVAuUCpSRQe
	 Mekys1F9NomtKLjEFb3fenl3Agt40AD9Ettn/OjTuiL1IeFmHnbZGg7DB+GmOY/TgB
	 YeeQZB5ccTK4+Ee3UXz7TSKohcXZdX2lhAe9zmV7fTjVKlyWB47nEHu3riDwPaXy+w
	 MBrUwq7FEa1cQ==
Date: Tue, 24 Sep 2024 11:15:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: mmc: document mmc-slot
Message-ID: <5o2q5kmchnr3e4opmtp2xq3xqlzkq2hudecd5fszamoav4twhb@o3kcftkoxwzg>
References: <20240920-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v2-0-5aa8bdfe01af@linaro.org>
 <20240920-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v2-2-5aa8bdfe01af@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240920-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v2-2-5aa8bdfe01af@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_021514_424731_C259EA4B 
X-CRM114-Status: GOOD (  16.23  )
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

typo: controller

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

description here saying what is the MMC slot, e.g. what you wrote in
commit msg.

> +allOf:
> +  - $ref: mmc-controller.yaml
> +

Just to be sure - the slots do not have dedicated resources like clocks,
resets, power supplies, right? IOW, it is indeed one device which
exposes multiple controllers?

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

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
