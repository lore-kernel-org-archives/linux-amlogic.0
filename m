Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B35CFB458
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Oct 2024 19:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R7DOWA61QyYzwQ89FK9ee1EyZxZ5CZU4dkkBYgzpK2Y=; b=FQOdIRsejOLKFp
	JBZhsFLqFAJH27ovXWoUAMKbsbiFaYdW/XBG0wyJLP/i6yK6lFim9P9kyqqbXv1iwNEonpl7tMLjA
	y1SVT4pC2zSTcA29MwZSg3hzkvqEdYsXMrbwPsaQbJT50SWmRSSBrVuZrL+H9QUajpA0aWhzCxR0w
	q2MNa+y2D1mxVibk2AhzvRZcXGmXBls+E8D6oDkpqzSp7NAHzPKES4JgBjmoLKAhcVS1EWmh5kcCo
	vTns8Ttuv3uDJCXA0LHMITH6kvrLRdw0B4s7yU8MFaimCc2cxyo95KX/2q61rHDNGsybeXDx0XFVf
	xNnxTlA4SySHnwK8sJYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxtsG-00000003fqW-1tUM;
	Mon, 07 Oct 2024 19:58:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxtsA-00000003fnx-2Ysn;
	Mon, 07 Oct 2024 19:58:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BA9145C5D70;
	Mon,  7 Oct 2024 19:58:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89B81C4CEC6;
	Mon,  7 Oct 2024 19:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728331105;
	bh=jwOtX6r++WHZfnmg4IDHl8MDobeXzZie00SaaYI+nvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WFHd2I5v9oyhBk6X701IKJE9K2+pCm8O3PXbH7/KPCARtxeQvkd0kN43TGsmA2TVM
	 f2f9brH2ct0GI3bFc38XjWgIUn07Y9X24IXVQmSqtcLCo3FZ13ZCHp2envrM1C9Y6b
	 JbPk6QehjXs6FwnjWrA63o5XoDSf0hM+NwZATILeBpMB9DGccNd2V8xZ+rQoZ1U8ps
	 i7guyJfpR5InQeQv3t0kb4gaCH9it+pwOGoQ6EGsxQqc6/ON29zp53hro5JuEkWesh
	 Y3mmu0e80D7RYagj7mlB6/+2mAAq7xQyhUZQT4WhxBhx8eARZTeqSbptzt9yVwcly3
	 7p88L6cHQKkmQ==
Date: Mon, 7 Oct 2024 14:58:25 -0500
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
Subject: Re: [PATCH v3 1/3] dt-bindings: mmc: controller: move properties
 common with slot out to mmc-controller-common
Message-ID: <20241007195825.GA2296490-robh@kernel.org>
References: <20241007-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v3-0-ad4eb22c2a8d@linaro.org>
 <20241007-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v3-1-ad4eb22c2a8d@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241007-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v3-1-ad4eb22c2a8d@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_125826_773632_AC70321C 
X-CRM114-Status: GOOD (  15.82  )
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

On Mon, Oct 07, 2024 at 04:03:37PM +0200, Neil Armstrong wrote:
> Move the common MMC "slot" properties because they are shared by the
> single-slot or multi-slot controllers, and will help defining a simple
> mmc-slot bindings document with proper slot properties and nodename.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../bindings/mmc/mmc-controller-common.yaml        | 357 +++++++++++++++++++++
>  .../devicetree/bindings/mmc/mmc-controller.yaml    | 344 +-------------------
>  2 files changed, 360 insertions(+), 341 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
> new file mode 100644
> index 000000000000..e02d3cbcc271
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
> @@ -0,0 +1,357 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mmc/mmc-controller-common.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MMC Controller & Slots Common Properties
> +
> +maintainers:
> +  - Ulf Hansson <ulf.hansson@linaro.org>
> +
> +description: |

Don't need '|'.

> +  These properties are common to multiple MMC host controllers and the
> +  possible slots or ports for multi-slot controllers.
> +
> +properties:
> +  "#address-cells":
> +    const: 1
> +    description: |

Ditto.

> +      The cell is the slot ID if a function subnode is used.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
