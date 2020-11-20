Return-Path: <SRS0=y0rr=E2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FC17C5519F
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 10:02:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 085A922240
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 10:02:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YQeHikMr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="pqMfTg3k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 085A922240
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=d1j+ilFuwglsbGuPIoQ37qETZQi78BZlNmGBSmbIxE4=; b=YQeHikMrwDbm41c6QwlPLYUuy
	WVuZMS54f7f0PElKGXCei6hGUKIA1+2+DJjdRPh7DwvUJYjeejrXxYVelljO4d0DK5yK2HOvvQNh7
	UgRDqjxZqAEpZUqPHhu5DSjULioCZG1n8mSscza75JZXeGtKPSL7ZImG8i6TUvNH1jIZrsmOche0Y
	NwxXz0YI8mdCdUqfjCanhd4OgTc0m8DXZnUupzaF5+sMpQMBlVU2L5a6xaSv7duhQmA9nK30PU2R4
	/8CPiEWaYwHjH76J/4m1IgDAHXm8EQ1lrNLbnU7V66zPZuIeERd9XgvROmhj9KMPk1hgM6Q9IrF7d
	WlLYqEOag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kg3Ex-0001Je-SK; Fri, 20 Nov 2020 10:02:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg3BX-0007u5-NQ; Fri, 20 Nov 2020 09:58:32 +0000
Received: from localhost (unknown [122.171.203.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D1F2422240;
 Fri, 20 Nov 2020 09:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605866310;
 bh=CwM4Ql9VFjQL2OMCE3BfD6NXMX4JW1TDIfSQgSQ0h5E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pqMfTg3kmaI2DtarD3Qt8jW1WZQMadVaY+9vEyfl1Qjc3gd9zld+oq1PYYjtBCt7n
 naWBhTDMT/ZkEdiUDW2gwNd7gQSS6hIwVsj3QytJ9DJ9/6JwRk6Pk1UGhfzYyZ1bmL
 vjav65BtL7WTjgHI/LRXN1BICbSDfZaAmdDqfEJU=
Date: Fri, 20 Nov 2020 15:28:25 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [RESEND PATCH v3 3/3] phy: amlogic:
 phy-meson-axg-mipi-pcie-analog: add support for MIPI DSI analog
Message-ID: <20201120095825.GD2925@vkoul-mobl>
References: <20201116101647.73448-1-narmstrong@baylibre.com>
 <20201116101647.73448-4-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201116101647.73448-4-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_045831_998717_CD8A6754 
X-CRM114-Status: GOOD (  18.30  )
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
Cc: devicetree@vger.kernel.org, Remi Pommarel <repk@triplefau.lt>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 16-11-20, 11:16, Neil Armstrong wrote:
> The AXG Analog MIPI-DSI PHY also provides functions to the PCIe PHY,
> thus we need to have inclusive support for both interfaces at runtime.
> 
> This fixes the regmap get from parent node, removes cell param
> to select a mode and implement runtime configuration & power on/off
> for both functions since they are not exclusive.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Reviewed-by: Remi Pommarel <repk@triplefau.lt>
> ---
>  drivers/phy/amlogic/Kconfig                   |   1 +
>  .../amlogic/phy-meson-axg-mipi-pcie-analog.c  | 204 ++++++++++++------
>  2 files changed, 136 insertions(+), 69 deletions(-)
> 
> diff --git a/drivers/phy/amlogic/Kconfig b/drivers/phy/amlogic/Kconfig
> index 99e8a4c7f1f3..db5d0cd757e3 100644
> --- a/drivers/phy/amlogic/Kconfig
> +++ b/drivers/phy/amlogic/Kconfig
> @@ -66,6 +66,7 @@ config PHY_MESON_AXG_MIPI_PCIE_ANALOG
>  	depends on OF && (ARCH_MESON || COMPILE_TEST)
>  	select GENERIC_PHY
>  	select REGMAP_MMIO
> +	select GENERIC_PHY_MIPI_DPHY
>  	help
>  	  Enable this to support the Meson MIPI + PCIE analog PHY
>  	  found in Meson AXG SoCs.
> diff --git a/drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c b/drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c
> index 1431cbf885e1..6eb21551bdd9 100644
> --- a/drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c
> +++ b/drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c
> @@ -4,9 +4,13 @@
>   *
>   * Copyright (C) 2019 Remi Pommarel <repk@triplefau.lt>
>   */
> +#include <linux/bitfield.h>
> +#include <linux/bitops.h>
>  #include <linux/module.h>
>  #include <linux/phy/phy.h>
>  #include <linux/regmap.h>
> +#include <linux/delay.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/platform_device.h>
>  #include <dt-bindings/phy/phy.h>
>  
> @@ -14,10 +18,10 @@
>  #define		HHI_MIPI_CNTL0_COMMON_BLOCK	GENMASK(31, 28)
>  #define		HHI_MIPI_CNTL0_ENABLE		BIT(29)
>  #define		HHI_MIPI_CNTL0_BANDGAP		BIT(26)
> -#define		HHI_MIPI_CNTL0_DECODE_TO_RTERM	GENMASK(15, 12)
> -#define		HHI_MIPI_CNTL0_OUTPUT_EN	BIT(3)
> +#define		HHI_MIPI_CNTL0_DIF_REF_CTL1	GENMASK(25, 16)
> +#define		HHI_MIPI_CNTL0_DIF_REF_CTL0	GENMASK(15, 0)
>  
> -#define HHI_MIPI_CNTL1 0x01
> +#define HHI_MIPI_CNTL1 0x04
>  #define		HHI_MIPI_CNTL1_CH0_CML_PDR_EN	BIT(12)
>  #define		HHI_MIPI_CNTL1_LP_ABILITY	GENMASK(5, 4)
>  #define		HHI_MIPI_CNTL1_LP_RESISTER	BIT(3)
> @@ -25,100 +29,170 @@
>  #define		HHI_MIPI_CNTL1_INPUT_SEL	BIT(1)
>  #define		HHI_MIPI_CNTL1_PRBS7_EN		BIT(0)
>  
> -#define HHI_MIPI_CNTL2 0x02
> +#define HHI_MIPI_CNTL2 0x08
>  #define		HHI_MIPI_CNTL2_CH_PU		GENMASK(31, 25)
>  #define		HHI_MIPI_CNTL2_CH_CTL		GENMASK(24, 19)
>  #define		HHI_MIPI_CNTL2_CH0_DIGDR_EN	BIT(18)
>  #define		HHI_MIPI_CNTL2_CH_DIGDR_EN	BIT(17)
>  #define		HHI_MIPI_CNTL2_LPULPS_EN	BIT(16)
> -#define		HHI_MIPI_CNTL2_CH_EN(n)		BIT(15 - (n))
> +#define		HHI_MIPI_CNTL2_CH_EN		GENMASK(15, 11)
>  #define		HHI_MIPI_CNTL2_CH0_LP_CTL	GENMASK(10, 1)
>  
> +#define DSI_LANE_0              (1 << 4)
> +#define DSI_LANE_1              (1 << 3)
> +#define DSI_LANE_CLK            (1 << 2)
> +#define DSI_LANE_2              (1 << 1)
> +#define DSI_LANE_3              (1 << 0)
> +#define DSI_LANE_MASK		(0x1F)

This should use BIT(), also there are interesting helpers in bitfield.h
to help with register fields, do send follow up patches..

-- 
~Vinod

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
