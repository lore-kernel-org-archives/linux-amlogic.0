Return-Path: <SRS0=bepq=SD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60188C43381
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Apr 2019 09:15:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F1E1214C6
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Apr 2019 09:15:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ELse4Z8g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F1E1214C6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:References:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ah3MDz3hvOmp/TsOf58MOVk16e+cHRxe+avirTeFT8M=; b=ELse4Z8gaejpL9
	3XFX7m1c49fif+/NQ0VtMqlUr9fC403yHz+sOH4dFcZry8uxUzR5fCLSduTUV1YvFw0LxWgYJr3wv
	Do/4VBjDhQPV0MFgAjgWbQ1bBq9VzdQVTKIf5rgrvAfOLA7Vtpo0dUg/XLm3WnjsL3KHXtt/RKvf/
	ZqhlFdjq1gY6GDh8YrZcnF+WWrvF59pqBOxQT61o7rVePPlevH2nKaJTsxO9pctaKrgRUuCZDZgN7
	E59SI6rmLI6bh3Cft2VidkQFUX2E4p4vLBdr6Mqx9rgCo6Bdse+sTO4IggMmMqC4cPH8njCSr7PMu
	Nrym7UBEwsg3O7pbhIKQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAt2N-0000o3-P4; Mon, 01 Apr 2019 09:15:27 +0000
Received: from mx.socionext.com ([202.248.49.38])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAt2K-0000n6-Hz; Mon, 01 Apr 2019 09:15:26 +0000
Received: from unknown (HELO iyokan-ex.css.socionext.com) ([172.31.9.54])
 by mx.socionext.com with ESMTP; 01 Apr 2019 18:15:20 +0900
Received: from mail.mfilter.local (m-filter-2 [10.213.24.62])
 by iyokan-ex.css.socionext.com (Postfix) with ESMTP id A3EBE611D6;
 Mon,  1 Apr 2019 18:15:20 +0900 (JST)
Received: from 172.31.9.53 (172.31.9.53) by m-FILTER with ESMTP;
 Mon, 1 Apr 2019 18:15:20 +0900
Received: from yuzu.css.socionext.com (yuzu [172.31.8.45])
 by iyokan.css.socionext.com (Postfix) with ESMTP id 5D5D740F06;
 Mon,  1 Apr 2019 18:15:20 +0900 (JST)
Received: from [127.0.0.1] (unknown [10.213.132.48])
 by yuzu.css.socionext.com (Postfix) with ESMTP id 3406C120499;
 Mon,  1 Apr 2019 18:15:20 +0900 (JST)
Date: Mon, 01 Apr 2019 18:15:19 +0900
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH 3/4] phy: socionext: get optional clock by
 devm_clk_get_optional()
In-Reply-To: <f3370a0619d40c40676ed029cc04a3ed1c12b991.1553914418.git.chunfeng.yun@mediatek.com>
References: <a8539bcf66065380069676fbea99a51254309803.1553914418.git.chunfeng.yun@mediatek.com>
 <f3370a0619d40c40676ed029cc04a3ed1c12b991.1553914418.git.chunfeng.yun@mediatek.com>
Message-Id: <20190401181519.2595.4A936039@socionext.com>
MIME-Version: 1.0
X-Mailer: Becky! ver. 2.70 [ja]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_021524_696903_A2928F45 
X-CRM114-Status: GOOD (  17.99  )
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

This looks good to me.

Reviewed-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>

Thanks,

On Sat, 30 Mar 2019 17:11:37 +0800
Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:

> Use devm_clk_get_optional() to get optional clock
> 
> Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  drivers/phy/socionext/phy-uniphier-usb3hs.c | 10 +++-------
>  drivers/phy/socionext/phy-uniphier-usb3ss.c | 10 +++-------
>  2 files changed, 6 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/phy/socionext/phy-uniphier-usb3hs.c b/drivers/phy/socionext/phy-uniphier-usb3hs.c
> index b1b048be6166..50f379fc4e06 100644
> --- a/drivers/phy/socionext/phy-uniphier-usb3hs.c
> +++ b/drivers/phy/socionext/phy-uniphier-usb3hs.c
> @@ -335,13 +335,9 @@ static int uniphier_u3hsphy_probe(struct platform_device *pdev)
>  	if (IS_ERR(priv->clk_parent))
>  		return PTR_ERR(priv->clk_parent);
>  
> -	priv->clk_ext = devm_clk_get(dev, "phy-ext");
> -	if (IS_ERR(priv->clk_ext)) {
> -		if (PTR_ERR(priv->clk_ext) == -ENOENT)
> -			priv->clk_ext = NULL;
> -		else
> -			return PTR_ERR(priv->clk_ext);
> -	}
> +	priv->clk_ext = devm_clk_get_optional(dev, "phy-ext");
> +	if (IS_ERR(priv->clk_ext))
> +		return PTR_ERR(priv->clk_ext);
>  
>  	priv->rst = devm_reset_control_get_shared(dev, "phy");
>  	if (IS_ERR(priv->rst))
> diff --git a/drivers/phy/socionext/phy-uniphier-usb3ss.c b/drivers/phy/socionext/phy-uniphier-usb3ss.c
> index 4be95679c7d8..ec231e40ef2a 100644
> --- a/drivers/phy/socionext/phy-uniphier-usb3ss.c
> +++ b/drivers/phy/socionext/phy-uniphier-usb3ss.c
> @@ -238,13 +238,9 @@ static int uniphier_u3ssphy_probe(struct platform_device *pdev)
>  		if (IS_ERR(priv->clk))
>  			return PTR_ERR(priv->clk);
>  
> -		priv->clk_ext = devm_clk_get(dev, "phy-ext");
> -		if (IS_ERR(priv->clk_ext)) {
> -			if (PTR_ERR(priv->clk_ext) == -ENOENT)
> -				priv->clk_ext = NULL;
> -			else
> -				return PTR_ERR(priv->clk_ext);
> -		}
> +		priv->clk_ext = devm_clk_get_optional(dev, "phy-ext");
> +		if (IS_ERR(priv->clk_ext))
> +			return PTR_ERR(priv->clk_ext);
>  
>  		priv->rst = devm_reset_control_get_shared(dev, "phy");
>  		if (IS_ERR(priv->rst))
> -- 
> 2.20.1

---
Best Regards,
Kunihiko Hayashi



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
