Return-Path: <SRS0=KhJ2=2S=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC5ECC2D0C3
	for <linux-amlogic@archiver.kernel.org>; Sat, 28 Dec 2019 02:54:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CC1A207E0
	for <linux-amlogic@archiver.kernel.org>; Sat, 28 Dec 2019 02:54:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lkBKh3mT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Xqb8qm4V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CC1A207E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sqsXZx2+im6hNUi2LF+db9Vh6JFoc4llXI7HDohk8Nw=; b=lkBKh3mTB+78lY
	uds7VuwGwoBAfrGIqST+FEfJ1pi0tvFIOStj+zoKE4APTa1eskVh31fWL2OwH22kyXo/YfmRaaAaX
	y3dDpsAbU92Kccud9ZGqDQQW1uW+0YgDDQo1FfOTsTyp5XeANQetuT5WOXuwPLvFJ9rlgphGcB4U8
	S2ZtKNq2yO/mNffNhsVJjyzcJn2RJdiGVb0oTlwRyCNtTorVD/a1z3S/12+WvskJZlPfj+gHFWHPY
	c0oWCwOoomY/IGh8VZsb8TlbPHUuXT792j7jbJkGlAGFgf2F5CjILkvWCatUWEJ3sd24aH+NSbzf9
	WadKx15PW2XU4c6/13wg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1il2FQ-0007Kj-Dy; Sat, 28 Dec 2019 02:54:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1il2FE-0007BA-K7; Sat, 28 Dec 2019 02:54:25 +0000
X-UUID: 8f72a633fe8e4b2c964a2f6bb7712a5d-20191227
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=DuK72F7gBZXvEYq3y3vW4ZuOMFEZduG7ni5TClqn+Jw=; 
 b=Xqb8qm4VIFCwJy9or7rS3RLV8gGOtdoZSvTFnFmjX0rcv8HHXjTmhsDuT6K4czVKSUes1e5HDS62BaaMNCTRZJxaRyEk5xR+5yjZy1d+sGewC/wYEiyycvQlt2wLzYOAuzoRTqU1VdyYMxUGH3sM97AWxddrvudiryLpj9rru98=;
X-UUID: 8f72a633fe8e4b2c964a2f6bb7712a5d-20191227
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1038913153; Fri, 27 Dec 2019 18:54:19 -0800
Received: from MTKMBS32N1.mediatek.inc (172.27.4.71) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 27 Dec 2019 18:54:24 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS32N1.mediatek.inc
 (172.27.4.71) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Sat, 28 Dec 2019 10:53:43 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sat, 28 Dec 2019 10:54:44 +0800
Message-ID: <1577501595.21256.8.camel@mhfsdcap03>
Subject: Re: [PATCH v3 3/6] phy: amlogic: Add Amlogic A1 USB2 PHY Driver
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Hanjie Lin <hanjie.lin@amlogic.com>
Date: Sat, 28 Dec 2019 10:53:15 +0800
In-Reply-To: <1577428606-69855-4-git-send-email-hanjie.lin@amlogic.com>
References: <1577428606-69855-1-git-send-email-hanjie.lin@amlogic.com>
 <1577428606-69855-4-git-send-email-hanjie.lin@amlogic.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 7D6A139BDF8753CECA92F2F08A4142A8071CBE782207FE70DB2AA7114E397CFB2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191227_185424_668926_3EDC882C 
X-CRM114-Status: GOOD (  12.13  )
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
Cc: Rob Herring <robh@kernel.org>, Victor Wan <victor.wan@amlogic.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-usb@vger.kernel.org,
 Yue Wang <yue.wang@amlogic.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, Liang Yang <liang.yang@amlogic.com>,
 Qiufang Dai <qiufang.dai@amlogic.com>, Xingyu
 Chen <xingyu.chen@amlogic.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Carlo Caione <carlo@caione.org>,
 linux-amlogic@lists.infradead.org, Jian Hu <jian.hu@amlogic.com>,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, 2019-12-27 at 14:36 +0800, Hanjie Lin wrote:
> This adds support for the USB2 PHY found in the Amlogic A1 SoC Family.
> 
> It supports host mode only.
> 
> Signed-off-by: Hanjie Lin <hanjie.lin@amlogic.com>
> Signed-off-by: Yue Wang <yue.wang@amlogic.com>
> ---
>  drivers/phy/amlogic/phy-meson-g12a-usb2.c | 93 +++++++++++++++++++++----------
>  1 file changed, 64 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/phy/amlogic/phy-meson-g12a-usb2.c b/drivers/phy/amlogic/phy-meson-g12a-usb2.c
> index 9065ffc..a564747 100644
> --- a/drivers/phy/amlogic/phy-meson-g12a-usb2.c
> +++ b/drivers/phy/amlogic/phy-meson-g12a-usb2.c
> @@ -146,11 +146,17 @@
[...]
> +	priv->soc_id = (enum meson_soc_id)of_device_get_match_data(&pdev->dev);
> +
>  	priv->regmap = devm_regmap_init_mmio(dev, base,
>  					     &phy_meson_g12a_usb2_regmap_conf);
>  	if (IS_ERR(priv->regmap))
>  		return PTR_ERR(priv->regmap);
>  
> -	priv->clk = devm_clk_get(dev, "xtal");
> -	if (IS_ERR(priv->clk))
> -		return PTR_ERR(priv->clk);
> +	if (priv->soc_id == MESON_SOC_G12A) {
> +		priv->clk = devm_clk_get(dev, "xtal");
> +		if (IS_ERR(priv->clk))
> +			return PTR_ERR(priv->clk);
> +	}
How about use devm_clk_get_optional(), then make it as optional clock
also in dt-binding
>  

>  

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
