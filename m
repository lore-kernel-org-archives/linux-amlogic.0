Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 549F1C433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 May 2022 13:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ncCBZX2tL/EfpFVKuTb/yZw5UilJXeouiEtvC1LG2/0=; b=0k1ZmYimjUl6qVHDope6LVXhot
	pKUWJ1cXRtkDIwy1fR1sCZaKHG4Uow+2K8nxlwkFbqmZFWAZqjdEMPBOc7cRU16QyzG+vG/xAGSxX
	fuP6cgi4rsgJ923IlwAot9QYKODH4hYhA0vuToJvveoxpYkvu+AYM5HN3r9go+BhXsaGopixaXqXz
	dKL1J9Oa3v9C8jbeQPGaxhlFOuG4RzU0J6ibSfYcQjSGu5NW0csl6/LCxqvDT43sGRO2N4Pb+cBaW
	JrCB1pLbfmkiGU0X7A4dV3Prohee5WWHqsMxEoYTMuPwqCrqtXtYdFBfCtX/6kI6dQ3VtHR/sMKLK
	bqqWOVHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npV5S-00GBbr-DA; Fri, 13 May 2022 13:12:06 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npV5N-00GBa1-IF
 for linux-amlogic@lists.infradead.org; Fri, 13 May 2022 13:12:04 +0000
Received: by mail-wr1-x433.google.com with SMTP id h16so10713633wrb.2
 for <linux-amlogic@lists.infradead.org>; Fri, 13 May 2022 06:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=Adu/PZhDolUEMKiVKpZA6GZDPdmRypNweWzGttwTN8Y=;
 b=LsOmxwfPKq/nJxCmxJMdoDM6KTfuR+9SL5wrF+Fb1+lcvvSlbM6fS6MmkB/7lZUjRS
 By/EUKeQvOOzsdWrZ7SPnOX01M1bqL83O4r+ELf0JzD10By7OnK5xoIqV1zLbOnjCW/d
 hfjAvWcpCMBdblmtdF6vEZO2RSI6wWW445tstV1hEE+jER2OKU32XDVRLowOpDfiPITi
 jeqjX+ZlId+skvbOExQaH1lOyjD0dNRJND6iZHBYrMsXfSac4EEC+mWh1UZ9gI6egqiI
 ENg8uTRV4fx/4ODf1xSxfErKyUquWjTNmAgNvoCHgleLZEMWUo1kbP2lYkT3ee/TyUUf
 LTlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Adu/PZhDolUEMKiVKpZA6GZDPdmRypNweWzGttwTN8Y=;
 b=KkhI8882n/2s8WieR96CvDQjTI9uAl3QxLEAf3fP/yTKX9bpJ1cxHy1heaeS77wMJ9
 rhS9xVlINbaHKa2J0p7iaS3X0dKrcCdyRBUVHw8Z67jtXVNVWohyWU0bSFHkWxitPT+8
 Cr09S9LgHbD1vibW5zDKTkJ4MvpUZ0pJy2RAnF9C0m0nlBFIDhU3YnCWgvWQ636zHlLv
 zwDR4KmZpRCG7SA+KIsp1wuzjnMuuN0rXrQ+KuFjchuj28ELhXHGOhTHCtpOaLZLz/Iu
 Rs43ANMEcVfcva8pV4B/t+p/FIB3LxrGxsRCujfZBkxUpNgC2OwFApdAErpFJG2ko1+B
 pB3A==
X-Gm-Message-State: AOAM533g1BmkI/nHTEDkAW4imXCfClU1XsVwpCLCRpIC7dgAObJVTAYG
 KQ2OjlBBUNApqqD9ucOiSNdV7DfSBXl/miqD
X-Google-Smtp-Source: ABdhPJwEIG6QehwH6y3kKCFw5NyL6uM1NsLEqL4j2IQqv3jap8YCyJslFVsurIQ5MUxlKiHFv+lsrA==
X-Received: by 2002:adf:df81:0:b0:20c:dec3:e24a with SMTP id
 z1-20020adfdf81000000b0020cdec3e24amr3934903wrl.585.1652447515073; 
 Fri, 13 May 2022 06:11:55 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:7639:a43b:f4c1:258d?
 ([2001:861:44c0:66c0:7639:a43b:f4c1:258d])
 by smtp.gmail.com with ESMTPSA id
 bg33-20020a05600c3ca100b003942a244f57sm460668wmb.48.2022.05.13.06.11.54
 for <linux-amlogic@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 06:11:54 -0700 (PDT)
Message-ID: <faebc697-fdba-0a68-3f8c-5d0ac7e45a5c@baylibre.com>
Date: Fri, 13 May 2022 15:11:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v5 2/4] mtd: rawnand: meson: fix the clock
Content-Language: en-US
To: linux-amlogic@lists.infradead.org
References: <20220513123404.48513-1-liang.yang@amlogic.com>
 <20220513123404.48513-3-liang.yang@amlogic.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220513123404.48513-3-liang.yang@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_061201_863356_FAC6CC51 
X-CRM114-Status: GOOD (  26.90  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 13/05/2022 14:34, Liang Yang wrote:
> EMMC and NAND have the same clock control register named 'SD_EMMC_CLOCK'
> which is defined in EMMC port internally. bit0~5 of 'SD_EMMC_CLOCK' is
> the divider and bit6~7 is the mux for fix pll and xtal. At the beginning,
> a common MMC and NAND sub-clock was discussed and planed to be implemented
> as NFC clock provider, but now this series of patches of a common MMC and
> NAND sub-clock are never being accepted.  the reasons for giving up are:
> 1. EMMC and NAND, which are mutually exclusive anyway
> 2. coupling the EMMC and NAND.
> 3. it seems that a common MMC and NAND sub-clock is over engineered.
> and let us see the link fot more information:
> https://lore.kernel.org/all/20220121074508.42168-5-liang.yang@amlogic.com
> so The meson nfc can't work now, let us rework the clock.
> 
> Signed-off-by: Liang Yang <liang.yang@amlogic.com>
> ---
>   drivers/mtd/nand/raw/meson_nand.c | 82 +++++++++++++++----------------
>   1 file changed, 41 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
> index ac3be92872d0..cc93667a1e7f 100644
> --- a/drivers/mtd/nand/raw/meson_nand.c
> +++ b/drivers/mtd/nand/raw/meson_nand.c
> @@ -10,6 +10,7 @@
>   #include <linux/dma-mapping.h>
>   #include <linux/interrupt.h>
>   #include <linux/clk.h>
> +#include <linux/clk-provider.h>
>   #include <linux/mtd/rawnand.h>
>   #include <linux/mtd/mtd.h>
>   #include <linux/mfd/syscon.h>
> @@ -56,6 +57,9 @@
>   
>   #define NFC_RB_IRQ_EN		BIT(21)
>   
> +#define CLK_DIV_SHIFT		0
> +#define CLK_DIV_WIDTH		6
> +
>   #define CMDRWGEN(cmd_dir, ran, bch, short_mode, page_size, pages)	\
>   	(								\
>   		(cmd_dir)			|			\
> @@ -151,15 +155,15 @@ struct meson_nfc {
>   	struct nand_controller controller;
>   	struct clk *core_clk;
>   	struct clk *device_clk;
> -	struct clk *phase_tx;
> -	struct clk *phase_rx;
> +	struct clk *nand_clk;
> +	struct clk_divider nand_divider;
>   
>   	unsigned long clk_rate;
>   	u32 bus_timing;
>   
>   	struct device *dev;
>   	void __iomem *reg_base;
> -	struct regmap *reg_clk;
> +	void __iomem *reg_clk;
>   	struct completion completion;
>   	struct list_head chips;
>   	const struct meson_nfc_data *data;
> @@ -235,7 +239,7 @@ static void meson_nfc_select_chip(struct nand_chip *nand, int chip)
>   	nfc->timing.tbers_max = meson_chip->tbers_max;
>   
>   	if (nfc->clk_rate != meson_chip->clk_rate) {
> -		ret = clk_set_rate(nfc->device_clk, meson_chip->clk_rate);
> +		ret = clk_set_rate(nfc->nand_clk, meson_chip->clk_rate);
>   		if (ret) {
>   			dev_err(nfc->dev, "failed to set clock rate\n");
>   			return;
> @@ -987,6 +991,8 @@ static const struct mtd_ooblayout_ops meson_ooblayout_ops = {
>   
>   static int meson_nfc_clk_init(struct meson_nfc *nfc)
>   {
> +	struct clk_parent_data nfc_divider_parent_data[1];
> +	struct clk_init_data init = {0};
>   	int ret;
>   
>   	/* request core clock */
> @@ -1002,21 +1008,28 @@ static int meson_nfc_clk_init(struct meson_nfc *nfc)
>   		return PTR_ERR(nfc->device_clk);
>   	}
>   
> -	nfc->phase_tx = devm_clk_get(nfc->dev, "tx");
> -	if (IS_ERR(nfc->phase_tx)) {
> -		dev_err(nfc->dev, "failed to get TX clk\n");
> -		return PTR_ERR(nfc->phase_tx);
> -	}
> -
> -	nfc->phase_rx = devm_clk_get(nfc->dev, "rx");
> -	if (IS_ERR(nfc->phase_rx)) {
> -		dev_err(nfc->dev, "failed to get RX clk\n");
> -		return PTR_ERR(nfc->phase_rx);
> -	}
> +	init.name = devm_kasprintf(nfc->dev,
> +				   GFP_KERNEL, "%s#div",
> +				   dev_name(nfc->dev));
> +	init.ops = &clk_divider_ops;
> +	nfc_divider_parent_data[0].fw_name = "device";
> +	init.parent_data = nfc_divider_parent_data;
> +	init.num_parents = 1;
> +	nfc->nand_divider.reg = nfc->reg_clk;
> +	nfc->nand_divider.shift = CLK_DIV_SHIFT;
> +	nfc->nand_divider.width = CLK_DIV_WIDTH;
> +	nfc->nand_divider.hw.init = &init;
> +	nfc->nand_divider.flags = CLK_DIVIDER_ONE_BASED |
> +				  CLK_DIVIDER_ROUND_CLOSEST |
> +				  CLK_DIVIDER_ALLOW_ZERO;
> +
> +	nfc->nand_clk = devm_clk_register(nfc->dev, &nfc->nand_divider.hw);
> +	if (IS_ERR(nfc->nand_clk))
> +		return PTR_ERR(nfc->nand_clk);
>   
>   	/* init SD_EMMC_CLOCK to sane defaults w/min clock rate */
> -	regmap_update_bits(nfc->reg_clk,
> -			   0, CLK_SELECT_NAND, CLK_SELECT_NAND);
> +	writel(CLK_SELECT_NAND | readl(nfc->reg_clk),
> +	       nfc->reg_clk);
>   
>   	ret = clk_prepare_enable(nfc->core_clk);
>   	if (ret) {
> @@ -1030,29 +1043,21 @@ static int meson_nfc_clk_init(struct meson_nfc *nfc)
>   		goto err_device_clk;
>   	}
>   
> -	ret = clk_prepare_enable(nfc->phase_tx);
> +	ret = clk_prepare_enable(nfc->nand_clk);
>   	if (ret) {
> -		dev_err(nfc->dev, "failed to enable TX clock\n");
> -		goto err_phase_tx;
> +		dev_err(nfc->dev, "pre enable NFC divider fail\n");
> +		goto err_nand_clk;
>   	}
>   
> -	ret = clk_prepare_enable(nfc->phase_rx);
> -	if (ret) {
> -		dev_err(nfc->dev, "failed to enable RX clock\n");
> -		goto err_phase_rx;
> -	}
> -
> -	ret = clk_set_rate(nfc->device_clk, 24000000);
> +	ret = clk_set_rate(nfc->nand_clk, 24000000);
>   	if (ret)
> -		goto err_disable_rx;
> +		goto err_disable_clk;
>   
>   	return 0;
>   
> -err_disable_rx:
> -	clk_disable_unprepare(nfc->phase_rx);
> -err_phase_rx:
> -	clk_disable_unprepare(nfc->phase_tx);
> -err_phase_tx:
> +err_disable_clk:
> +	clk_disable_unprepare(nfc->nand_clk);
> +err_nand_clk:
>   	clk_disable_unprepare(nfc->device_clk);
>   err_device_clk:
>   	clk_disable_unprepare(nfc->core_clk);
> @@ -1061,8 +1066,7 @@ static int meson_nfc_clk_init(struct meson_nfc *nfc)
>   
>   static void meson_nfc_disable_clk(struct meson_nfc *nfc)
>   {
> -	clk_disable_unprepare(nfc->phase_rx);
> -	clk_disable_unprepare(nfc->phase_tx);
> +	clk_disable_unprepare(nfc->nand_clk);
>   	clk_disable_unprepare(nfc->device_clk);
>   	clk_disable_unprepare(nfc->core_clk);
>   }
> @@ -1396,13 +1400,9 @@ static int meson_nfc_probe(struct platform_device *pdev)
>   	if (IS_ERR(nfc->reg_base))
>   		return PTR_ERR(nfc->reg_base);
>   
> -	nfc->reg_clk =
> -		syscon_regmap_lookup_by_phandle(dev->of_node,
> -						"amlogic,mmc-syscon");
> -	if (IS_ERR(nfc->reg_clk)) {
> -		dev_err(dev, "Failed to lookup clock base\n");
> +	nfc->reg_clk = devm_platform_ioremap_resource_byname(pdev, "emmc");
> +	if (IS_ERR(nfc->reg_clk))
>   		return PTR_ERR(nfc->reg_clk);
> -	}
>   
>   	irq = platform_get_irq(pdev, 0);
>   	if (irq < 0)

Looks fine for me, thank for the changes:

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
