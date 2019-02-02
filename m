Return-Path: <SRS0=Ii7+=QJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C969EC282D8
	for <linux-amlogic@archiver.kernel.org>; Sat,  2 Feb 2019 03:00:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B8B420855
	for <linux-amlogic@archiver.kernel.org>; Sat,  2 Feb 2019 03:00:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="minqILGt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B8B420855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sCdvNjJTATzYLTdf9ku3EeNxbtaJtqTtprOe7c9yk4Y=; b=minqILGtQrB2ROqw/3THsMZE3
	xR9UokvL3s9Y36NN4ZsMKjKxvDAo1UgNtWK+1GaM7PHP9kEn42BtN6p3j+TSs9zwypyT5Tvydx4jE
	EB/NGKfRvwvVJm8w4UilF71/kl33hBZdNvxT/F4Tw+A34eYL5h+wB4/Tf2C3v+cP9Pm5fl46dMaex
	iuroZogOKSQAxkNgeSkyko7/f5lUlRO6TPSwtxhGWeTFLR4i5N7g38Hyiuy5obyoq5QotREjPZqsK
	3xOhoIQVqVgZKSxC37H/sr39pmaoBAhurqr+y3G+F4zLrSmxA0H/+Y8UEgoQUE3WXE66At8GhcjhJ
	m8onKkjGw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gplXy-0005sN-0w; Sat, 02 Feb 2019 03:00:46 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gplXv-0005qQ-E6; Sat, 02 Feb 2019 03:00:44 +0000
Received: from [10.28.18.236] (10.28.18.236) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Sat, 2 Feb
 2019 11:01:33 +0800
Subject: Re: [PATCH 3/3] mtd: rawnand: meson: remove unnecessary condition in
 meson_nfc_select_chip()
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <20190201083053.GE8459@kadam>
From: Liang Yang <liang.yang@amlogic.com>
Message-ID: <40c4ae49-22fa-38ab-cbfc-9562bc6be65a@amlogic.com>
Date: Sat, 2 Feb 2019 11:01:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190201083053.GE8459@kadam>
Content-Language: en-US
X-Originating-IP: [10.28.18.236]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190201_190043_471371_5EF60207 
X-CRM114-Status: GOOD (  14.83  )
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, kernel-janitors@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Kevin Hilman <khilman@baylibre.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-amlogic@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On 2019/2/1 16:30, Dan Carpenter wrote:
> If chip is negative then we return at the very start of the function.
> Removing the check lets us pull everything in one indent level.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/mtd/nand/raw/meson_nand.c | 28 ++++++++++++----------------
>   1 file changed, 12 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
> index 0d93d0b9c1af..105d12103ca6 100644
> --- a/drivers/mtd/nand/raw/meson_nand.c
> +++ b/drivers/mtd/nand/raw/meson_nand.c
> @@ -234,23 +234,19 @@ static void meson_nfc_select_chip(struct nand_chip *nand, int chip)
>   	nfc->timing.tadl = meson_chip->tadl;
>   	nfc->timing.tbers_max = meson_chip->tbers_max;
>   
> -	if (chip >= 0) {
> -		if (nfc->clk_rate != meson_chip->clk_rate) {
> -			ret = clk_set_rate(nfc->device_clk,
> -					   meson_chip->clk_rate);
> -			if (ret) {
> -				dev_err(nfc->dev, "failed to set clock rate\n");
> -				return;
> -			}
> -			nfc->clk_rate = meson_chip->clk_rate;
> -		}
> -		if (nfc->bus_timing != meson_chip->bus_timing) {
> -			value = (NFC_CLK_CYCLE - 1)
> -				| (meson_chip->bus_timing << 5);
> -			writel(value, nfc->reg_base + NFC_REG_CFG);
> -			writel((1 << 31), nfc->reg_base + NFC_REG_CMD);
> -			nfc->bus_timing =  meson_chip->bus_timing;
> +	if (nfc->clk_rate != meson_chip->clk_rate) {
> +		ret = clk_set_rate(nfc->device_clk, meson_chip->clk_rate);
> +		if (ret) {
> +			dev_err(nfc->dev, "failed to set clock rate\n");
> +			return;
>   		}
> +		nfc->clk_rate = meson_chip->clk_rate;
> +	}
> +	if (nfc->bus_timing != meson_chip->bus_timing) {
> +		value = (NFC_CLK_CYCLE - 1) | (meson_chip->bus_timing << 5);
> +		writel(value, nfc->reg_base + NFC_REG_CFG);
> +		writel((1 << 31), nfc->reg_base + NFC_REG_CMD);
> +		nfc->bus_timing =  meson_chip->bus_timing;
>   	}

Indeed, we need not check chip >= 0 again. Thank you.

Acked-by: Liang Yang <liang.yang@amlogic.com>

>   }
>   
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
