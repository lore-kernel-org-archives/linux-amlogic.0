Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06183CFB45D
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Oct 2024 20:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yojxVIznJqKxmtAsXomABhRspJyFyVe/lhEuzSX5wPs=; b=fyWpeeIHsVwaUR
	gCfnx3r3bCWfKIJI+S/j5DF/ys/paOzgAbRBdy+FXpq7YE9OHeftVbZ9BQ8Tik06H06CTw0qi3feu
	fCXaebunCz4fmk2m6PPAxihtjKyU22YzJo/2lmN/cMLoxdeJLU1mUyPtTd6w/79vfirH2spgh4qMg
	Hw9mDPPBSi1E20PLIlCtjStBnkMD7Co7RIz4vBUDrZX/un+IlCWMyAlG9HcrJlQ1d7asn5oq0f++6
	PkdGra5pb4MkuHyxcW38NPyKUQ0cv47tBczXykniV9TuOsM702TFTq9XvWn0fPuQZJFEqFTRrUe92
	RlbMtCOXYS73zfYlAXBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxtwD-00000003gaE-44ck;
	Mon, 07 Oct 2024 20:02:37 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxtw8-00000003gYp-0hbw;
	Mon, 07 Oct 2024 20:02:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B9D18A4253C;
	Mon,  7 Oct 2024 20:02:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E258CC4CEC6;
	Mon,  7 Oct 2024 20:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728331351;
	bh=CM6TIaoUMM1aOKZxZbqPZyH9MnAjPn5Ii/dP5/bMWUc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=medooyt80R852gUZikPYEgpPcGVWBjImxv3bb3hfzTcP8tUjDd/18JXVfAUnB8fEw
	 GJKjNM6r/z6sodvqOqfORnGeUs45YgO7LRIvVJcrHQEXsM1v4e+tW6B842vfLWjQRK
	 4CruZa07hTD9LWmPpXA1qQB1Vogf7OgRmUTbNyG4X0y9WuUUJ9/5op678b4C55NQ9R
	 ZbPjgDJHDHrbzlj80gq0YSqSPDzsnvqjg+jfHM25lB7vM3mzY5xi99z1pyMXIgTCbF
	 c/39uaVuK/bsv8LV0zip2XKb7heTauc3n5+00IQz94Hj/HtzuUKaIYSo0y6gJsNYSP
	 Zc/8SUq7diNxA==
Date: Mon, 7 Oct 2024 15:02:30 -0500
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
Message-ID: <20241007200230.GA2301832-robh@kernel.org>
References: <20241007-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v3-0-ad4eb22c2a8d@linaro.org>
 <20241007-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v3-1-ad4eb22c2a8d@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241007-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v3-1-ad4eb22c2a8d@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_130232_368928_F7050BDD 
X-CRM114-Status: GOOD (  16.36  )
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
> +  These properties are common to multiple MMC host controllers and the
> +  possible slots or ports for multi-slot controllers.
> +
> +properties:
> +  "#address-cells":
> +    const: 1
> +    description: |
> +      The cell is the slot ID if a function subnode is used.

Actually, this comment is wrong. When slot is used, this is still the 
cell size for the mmc bus.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
