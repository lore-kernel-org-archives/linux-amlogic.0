Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8BCBC2BD09
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Jul 2024 11:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GFJ3vE04yux6lpaKmcCSpI0kbvjPhuVjjanKwv5F3sQ=; b=bnBABS5qODD6u1
	9ksHdDIFfoULREQHXUohwVGq/+uKhfbLCaGkSeoE+W4AOi24k1PpXiyj+GW8iWV1aJ6UVcqfLK+1W
	BA08rYaoQX3PJ/NxN+G0BMYWSNZe2+3QkPrSSvCe+WaaPfb6vxmUCVZ0QjmwU0odtzwXa/o0GuQ+A
	ehAW9YwwonXasVJwo9pwbV1dsOcOie+FSvldsTNfFGCH75u18GKrauer9rH3daD20Q5dY/IDSlfXL
	7WIRg6n+BZ17t41beypCdO9GlMw05qLQM3VS6P0uiPFo8icYvQPFa0XdGsPGcUjVYIgTGLgWayoj+
	Afo2ICRj45uRgH+yMeyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOy1I-00000009zdi-3kAc;
	Wed, 03 Jul 2024 11:19:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOy1F-00000009zd2-04tX;
	Wed, 03 Jul 2024 11:19:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2BEA6367;
	Wed,  3 Jul 2024 04:19:47 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 524863F762;
	Wed,  3 Jul 2024 04:19:19 -0700 (PDT)
Date: Wed, 3 Jul 2024 12:17:50 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet
 <jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Vladimir
 Zapolskiy <vz@mleia.com>, Bjorn Andersson <andersson@kernel.org>, Chen-Yu
 Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Michal Simek <michal.simek@amd.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 09/10] clk: sunxi-ng r40: Constify struct regmap_config
Message-ID: <20240703121750.0dc2eb3a@donnerap.manchester.arm.com>
In-Reply-To: <20240703-clk-const-regmap-v1-9-7d15a0671d6f@gmail.com>
References: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
	<20240703-clk-const-regmap-v1-9-7d15a0671d6f@gmail.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_041925_147937_C7877B3F 
X-CRM114-Status: GOOD (  15.27  )
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

On Wed, 03 Jul 2024 11:50:22 +0200
Javier Carrasco <javier.carrasco.cruz@gmail.com> wrote:

> `sun8i_r40_ccu_regmap_config` is not modified and can be declared as
> const to move its data to a read-only section.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Looks alright, we indeed don't change it, and the only user takes a const
pointer. Also the compiler seems happy.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  drivers/clk/sunxi-ng/ccu-sun8i-r40.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-r40.c b/drivers/clk/sunxi-ng/ccu-sun8i-r40.c
> index 984ad3f76b18..2f51ceab8016 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun8i-r40.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun8i-r40.c
> @@ -1292,7 +1292,7 @@ static bool sun8i_r40_ccu_regmap_accessible_reg(struct device *dev,
>  	return false;
>  }
>  
> -static struct regmap_config sun8i_r40_ccu_regmap_config = {
> +static const struct regmap_config sun8i_r40_ccu_regmap_config = {
>  	.reg_bits	= 32,
>  	.val_bits	= 32,
>  	.reg_stride	= 4,
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
