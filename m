Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A38BFC433F5
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jan 2022 22:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=muQnCQbn16RdzvhWfINeuOtxp0oKBhfETwk6IwqU2gY=; b=Y1WH/3EfW9QqPg
	3SC3wwLJEEaB9ejpam7cxOLdutih/DSP3LNr2P9uhdHdZ5fFZRrCkeacZQy4yrUUD/n0JT6UZwK4j
	KQbIJhFMlZ5LyA+tgZnivK4Gxvwl6GXdoaSNAT7WhSRWfUk6+mPWwJAEQLC5ex+qGlhXoEcjBiHT9
	KMqGEh/rRHxKTgm5GMqy1n/6XI/Q37GRByyRueWXvmlqKTR8Fck1GKBkU1EJAbXijpl+axgyfmHiU
	UgcfKJ/EAKj4LccguOARAd0SutguIouQ4PojjSyyyVlkhWNgbG1xhLLFa3pb2G4hMl4P/xBz4QOPQ
	DBIRqjgaONWedDp9jPXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5y38-005QnN-Hw; Fri, 07 Jan 2022 22:49:30 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5y35-005Qmz-Mi; Fri, 07 Jan 2022 22:49:29 +0000
Received: by mail-ed1-x52c.google.com with SMTP id b13so27472092edd.8;
 Fri, 07 Jan 2022 14:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0jAJoVGwKCLDgKpaY3NT5v3Vqx+TvDpkuQx8Gs0x1gs=;
 b=DmtAvonseYsCB/mOaNcr+9nV05NBD10NPqvkp30dSg0RL2Ppk4MI0R1ncIbDvgrdOz
 pH06HbrpA9kNXZzu3OsyLUiKaHDljZYG9iUYT5ihOs/BFJ4iZ4uUXUoNlx5DkwWl5heW
 9YGXJTrJ9O8jzWtOUeULIdIJUlVkCuxqVn+ekKmvTRMsrj98IwG4PCLOAXfnnsHeNhB1
 FfI/Hu5ucpsOV/SSHBjlmtM8TipBKMeqYmUS+d3iiNve7HmWJhYrb8Gy/1pCyXtbqQeD
 +zxYcX/ZqWm6lcL9EPUtEgqCfq+aG2YjOebBRvJ+/jxjSQwlgM4Wp+5Ba/ECM1thr6tB
 ZfRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0jAJoVGwKCLDgKpaY3NT5v3Vqx+TvDpkuQx8Gs0x1gs=;
 b=ClUZ4sejYkRGqjh+W7zZJcde518BR7zw1jKxPps+m63iiCvro7sdH6uGZI75rK9JCu
 HEhcsShPWNIReHs4nEBmYYiRLXbhVeDwfThpU7/1NE+jUED5zpb1U6TqdujiZK4GDI0J
 Lgo7e6ZI6iGcP5exAdYh8yDu2/PRhvMuntVV6/sd46e6AtATJLB3PKL0R3qxyHRZq7Rf
 CFV5B51p7BjDt/3lVHgGbxeU5rS8NGYO9uob3CjWy9/M8E3mMg3Y80B33+VkR4P6VYvW
 InQIJnzriaMdM/rRWvDpvTyoaixgP2KqI1bbtogVmu4z66uj/bnH7sJ5orkljXk+7PEe
 0AuQ==
X-Gm-Message-State: AOAM533b+VSpuHPlhwFArtx/u08xd8JucDNjUeKyPDuWryrhSiG+XnPb
 r1PPNmHOFlpLqht553tk4BiAxc6W64cOCHVz2RM=
X-Google-Smtp-Source: ABdhPJwwX9ho759ZVzvF+W55tvIMEqaGGO7Vp4Mpcx74sZoQafx4zes9X+G/lG9j1CKl/613d0xbAiXn3pl1+kmoznY=
X-Received: by 2002:aa7:d5c7:: with SMTP id d7mr7934096eds.280.1641595766362; 
 Fri, 07 Jan 2022 14:49:26 -0800 (PST)
MIME-Version: 1.0
References: <20220107145515.613009-1-narmstrong@baylibre.com>
 <20220107145515.613009-7-narmstrong@baylibre.com>
In-Reply-To: <20220107145515.613009-7-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 7 Jan 2022 23:49:15 +0100
Message-ID: <CAFBinCB3+dSjQFRp5CBpGk5Qi8zoxRDRaobuCtXzU6VtM8+ryQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] drm/meson: add support for MIPI-DSI transceiver
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_144927_787302_B4E01D53 
X-CRM114-Status: GOOD (  14.50  )
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

Hi Neil,

some high-level comments from me below.

On Fri, Jan 7, 2022 at 3:58 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
[...]
> +/*  MIPI DSI Relative REGISTERs Definitions */
> +/* For MIPI_DSI_TOP_CNTL */
> +#define BIT_DPI_COLOR_MODE        20
> +#define BIT_IN_COLOR_MODE         16
> +#define BIT_CHROMA_SUBSAMPLE      14
> +#define BIT_COMP2_SEL             12
> +#define BIT_COMP1_SEL             10
> +#define BIT_COMP0_SEL              8
> +#define BIT_DE_POL                 6
> +#define BIT_HSYNC_POL              5
> +#define BIT_VSYNC_POL              4
> +#define BIT_DPICOLORM              3
> +#define BIT_DPISHUTDN              2
> +#define BIT_EDPITE_INTR_PULSE      1
> +#define BIT_ERR_INTR_PULSE         0
Why not use BIT() and GENMASK() for these and prefixing them with
MIPI_DSI_TOP_CNTL_?
That would make them consistent with other parts of the meson sub-driver.

[...]
> +static void meson_dw_mipi_dsi_hw_init(struct meson_dw_mipi_dsi *mipi_dsi)
> +{
> +       writel_relaxed((1 << 4) | (1 << 5) | (0 << 6),
> +                      mipi_dsi->base + MIPI_DSI_TOP_CNTL);
please use the macros from above

> +       writel_bits_relaxed(0xf, 0xf, mipi_dsi->base + MIPI_DSI_TOP_SW_RESET);
> +       writel_bits_relaxed(0xf, 0, mipi_dsi->base + MIPI_DSI_TOP_SW_RESET);

[...]
> +       phy_power_on(mipi_dsi->phy);
Please propagate the error code here.
Also shouldn't this go to a new dw_mipi_dsi_phy_power_on() as the PHY
driver uses the updated settings from phy_configure only in it's
.power_on callback?

[...]
> +       phy_configure(mipi_dsi->phy, &mipi_dsi->phy_opts);
please propagate the error code here as the PHY driver has some
explicit code to return an error in it's .phy_configure callback

[...]
> +       phy_init(mipi_dsi->phy);
please propagate the error code here

[...]
> +       phy_exit(mipi_dsi->phy);
please propagate the error code here

[...]
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       mipi_dsi->base = devm_ioremap_resource(&pdev->dev, res);
other parts of the meson DRM driver have been converted to use
devm_platform_ioremap_resource()
I suggest updating this as well to simplify the code here

[...]
> +       mipi_dsi->phy = devm_phy_get(&pdev->dev, "dphy");
> +       if (IS_ERR(mipi_dsi->phy)) {
> +               ret = PTR_ERR(mipi_dsi->phy);
> +               dev_err(&pdev->dev, "failed to get mipi dphy: %d\n", ret);
> +               return ret;
you can simplify this with:
  return dev_err_probe(&pdev->dev, PTR_ERR(mipi_dsi->phy, "failed to
get mipi dphy\n");

[...]
> +       mipi_dsi->px_clk = devm_clk_get(&pdev->dev, "px_clk");
> +       if (IS_ERR(mipi_dsi->px_clk)) {
> +               dev_err(&pdev->dev, "Unable to get PLL clk\n");
> +               return PTR_ERR(mipi_dsi->px_clk);
you can simplify this with:
  return dev_err_probe(&pdev->dev, PTR_ERR(mipi_dsi->px_clk, "Unable
to get PLL clk\n");
Also should it say s/PLL clk/px clock/?

[...]
> +       top_rst = devm_reset_control_get_exclusive(&pdev->dev, "top");
> +       if (IS_ERR(top_rst)) {
> +               ret = PTR_ERR(top_rst);
> +
> +               if (ret != -EPROBE_DEFER)
> +                       dev_err(&pdev->dev, "Unable to get reset control: %d\n", ret);
> +
> +               return ret;
you can simplify this with:
  return dev_err_probe(&pdev->dev, PTR_ERR(top_rst, "Unable to get
reset control\n");

[...]
> +       mipi_dsi->dmd = dw_mipi_dsi_probe(pdev, &mipi_dsi->pdata);
> +       if (IS_ERR(mipi_dsi->dmd)) {
> +               ret = PTR_ERR(mipi_dsi->dmd);
> +               if (ret != -EPROBE_DEFER)
> +                       dev_err(&pdev->dev,
> +                               "Failed to probe dw_mipi_dsi: %d\n", ret);
you can simplify this with:
  dev_err_probe(&pdev->dev, ret, "Failed to probe dw_mipi_dsi\n");


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
