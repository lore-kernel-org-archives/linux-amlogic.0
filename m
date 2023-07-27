Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE104C001DC
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Jul 2023 18:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K27z5QxE2QfjXC9NKVeg73yITCkLeULxip/ryuQRPLk=; b=kL+F7lw8+Orvbz
	TfgN1Frtmh1aZg6MuvnnUbzP3NluhpFWpXu8eCJrxktSITZsyh4Oe4FemrA+LRaJpcwX5R4XZkUT9
	CEr9hmL5TQpgR0xnOe4aR8iZte+H7ESiO4xhcYEyPHHmwSqTU0gRYy821nscTGok/RATe8TKxGMZN
	pDqrCP7oA4kGxQHKhBujfpiVUHJTXbZrl3Z/is/2QaaMh7nvDsIkR2emPbLCYBz+Zfj11XTMROi7V
	18oY5RfafCv8hy1U0kfauJEZH5ziXiEotRiqkmEabbQlFHO6Uf384b48h8gM7sD1nBqHZVEwMbxRI
	fnzXXVkD1YMkYjUeoI0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qP5rC-0009q9-1J;
	Thu, 27 Jul 2023 18:37:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP5r9-0009o9-37
	for linux-amlogic@lists.infradead.org;
	Thu, 27 Jul 2023 18:37:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690483013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y/ZOuF37rEmg7dV7sW7i6E+d7yQkyDTk71SeAdCrRk4=;
	b=OppyT2vMSXyK/iCLuMg6exYmbYjjhO18JtNx5ujnGFa3f0XQEHndW3r1UYAPxU9DVitW3J
	xIzACGkDJZLqoPcPBZ9lEkDKgjVev0Z73dZZ1Kqjh4OY7vII+rjurhMVxyQiAepfkTTRRf
	TpsUFopXKdXhro7tR8jdQIKQeoPMLYk=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-457-KtmgxA_-MdmQQb_PAAOg4g-1; Thu, 27 Jul 2023 14:36:52 -0400
X-MC-Unique: KtmgxA_-MdmQQb_PAAOg4g-1
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-4864dcc0e67so331545e0c.0
        for <linux-amlogic@lists.infradead.org>; Thu, 27 Jul 2023 11:36:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690483009; x=1691087809;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y/ZOuF37rEmg7dV7sW7i6E+d7yQkyDTk71SeAdCrRk4=;
        b=fo0NOkFs+YLHmMxdDaS3TAdT0WgXjGG9rnBnMk/E6hQbE3USVy0jYO0K1No39rzJXL
         h4ULoOeTrAXUHKnRjsvT2xftVXZwk4gmInUpTkqFmUP9mdX4y6xxxX0l43oLHf1w24hm
         1ERu/KSEEaesPL7iiWgUWXot9JQp6Ou1ZKuqyPg3thWM8AFX4F2zk6RKNKqj6HFD3ufF
         CnHWPcNnksEtGiC/hfKz9bfY/+fpF5lds29NeTFW1vPUNpHBDTRPh3p/msDeSOnE11pR
         S5rJVVO4TQQVb1s2DKH1QIayDbbnfBndZXW3SMAgnoid3ZffF+wWAlEjOQwoZkXbMoTb
         FKcg==
X-Gm-Message-State: ABy/qLYpM6s0V97tW2nviqnhtXoP9KxzAaOrGtNciqM2mHt0/VP9S1Ml
	OvWqGQ4fh5vDJJWfmqinr8F04ag2wHDaVHJCaD6ILndPlTJ4G3EVvhrOXf0mNieBQ12Zt0afRUu
	UEgPywUYav3A+lcd/2/e1URrl7I2vLtE=
X-Received: by 2002:a1f:5f03:0:b0:486:4c0e:9ae5 with SMTP id t3-20020a1f5f03000000b004864c0e9ae5mr376106vkb.13.1690483009050;
        Thu, 27 Jul 2023 11:36:49 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE53Gop5/7fuUY1ixEZawAnKaFZZ1nwoAdNLa3rzIVQi83+W1FiA0MBHmhVRBUb5DmjYcHCnQ==
X-Received: by 2002:a1f:5f03:0:b0:486:4c0e:9ae5 with SMTP id t3-20020a1f5f03000000b004864c0e9ae5mr376063vkb.13.1690483008694;
        Thu, 27 Jul 2023 11:36:48 -0700 (PDT)
Received: from fedora ([2600:1700:1ff0:d0e0::17])
        by smtp.gmail.com with ESMTPSA id c3-20020a0ce143000000b0063d32f515bbsm602059qvl.127.2023.07.27.11.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 11:36:48 -0700 (PDT)
Date: Thu, 27 Jul 2023 13:36:45 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Bhupesh Sharma <bhupesh.sharma@linaro.org>, Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, 
	Simon Horman <simon.horman@corigine.com>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Wong Vee Khee <veekhee@apple.com>, Revanth Kumar Uppala <ruppala@nvidia.com>, 
	Jochen Henneberg <jh@henneberg-systemdesign.com>, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	imx@lists.linux.dev, Frank Li <frank.li@nxp.com>
Subject: Re: [PATCH v2 net 2/2] net: stmmac: dwmac-imx: pause the TXC clock
 in fixed-link
Message-ID: <4govb566nypifbtqp5lcbsjhvoyble5luww3onaa2liinboguf@4kgihys6vhrg>
References: <20230727152503.2199550-1-shenwei.wang@nxp.com>
 <20230727152503.2199550-3-shenwei.wang@nxp.com>
MIME-Version: 1.0
In-Reply-To: <20230727152503.2199550-3-shenwei.wang@nxp.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_113700_076802_155B30FF 
X-CRM114-Status: GOOD (  37.38  )
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

On Thu, Jul 27, 2023 at 10:25:03AM -0500, Shenwei Wang wrote:
> When using a fixed-link setup, certain devices like the SJA1105 require a
> small pause in the TXC clock line to enable their internal tunable
> delay line (TDL).
> 
> To satisfy this requirement, this patch temporarily disables the TX clock,
> and restarts it after a required period. This provides the required
> silent interval on the clock line for SJA1105 to complete the frequency
> transition and enable the internal TDLs.
> 
> So far we have only enabled this feature on the i.MX93 platform.
> 

I'd just like to highlight that because of a quirk (I think this is not
standard) in the particular connected switch on a board you're making the
whole "fsl,imx93" platform (compatible) implement said switch quirk.

If you don't think there's any harm in doing that for other fixed-link
scenarios, that's fine I suppose... but just highlighting that.

I have no idea at a higher level how else you'd tackle this. You could
add a dt property for this, but I also don't love that you'd probably
encode it in the MAC (maybe in the fixed-link description it would be
more attractive). At least as a dt property it isn't unconditional.

> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> Reviewed-by: Frank Li <frank.li@nxp.com>
> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-imx.c   | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
> index 53ee5a42c071..e7819960128e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
> @@ -40,6 +40,9 @@
>  #define DMA_BUS_MODE			0x00001000
>  #define DMA_BUS_MODE_SFT_RESET		(0x1 << 0)
>  #define RMII_RESET_SPEED		(0x3 << 14)
> +#define MII_RESET_SPEED			(0x2 << 14)
> +#define RGMII_RESET_SPEED		(0x0 << 14)
> +#define CTRL_SPEED_MASK			(0x3 << 14)

GENMASK() would be cleaner, as well as BIT() usage, but I do see
the driver currently does shifts.. so /me shrugs

>  
>  struct imx_dwmac_ops {
>  	u32 addr_width;
> @@ -56,6 +59,7 @@ struct imx_priv_data {
>  	struct regmap *intf_regmap;
>  	u32 intf_reg_off;
>  	bool rmii_refclk_ext;
> +	void __iomem *base_addr;
>  
>  	const struct imx_dwmac_ops *ops;
>  	struct plat_stmmacenet_data *plat_dat;
> @@ -212,6 +216,44 @@ static void imx_dwmac_fix_speed(void *priv, uint speed, uint mode)
>  		dev_err(dwmac->dev, "failed to set tx rate %lu\n", rate);
>  }
>  
> +static void imx_dwmac_fix_speed_mx93(void *priv, uint speed, uint mode)
> +{
> +	struct imx_priv_data *dwmac = priv;
> +	int ctrl, old_ctrl, iface;
> +
> +	imx_dwmac_fix_speed(priv, speed, mode);
> +
> +	if (!dwmac || mode != MLO_AN_FIXED)
> +		return;
> +
> +	if (regmap_read(dwmac->intf_regmap, dwmac->intf_reg_off, &iface))
> +		return;
> +
> +	iface &= MX93_GPR_ENET_QOS_INTF_MODE_MASK;
> +	old_ctrl = readl(dwmac->base_addr + MAC_CTRL_REG);
> +	ctrl = old_ctrl & ~CTRL_SPEED_MASK;
> +
> +	/* by default ctrl will be RGMII */
> +	if (iface == MX93_GPR_ENET_QOS_INTF_SEL_RMII)
> +		ctrl |= RMII_RESET_SPEED;
> +	if (iface == MX93_GPR_ENET_QOS_INTF_SEL_MII)
> +		ctrl |= MII_RESET_SPEED;

I see that ctrl right now would select RGMII, but I think it would
read more clearly if you handled it and made the above an
if/else if/else statement (since they're exclusive of eachother)
vs two independent if's.

> +
> +	writel(ctrl, dwmac->base_addr + MAC_CTRL_REG);
> +
> +	/* Ensure the settings for CTRL are applied */
> +	wmb();

I saw this and recently have been wondering about this sort of pattern
(not an expert on this). From what I can tell it seems reading the
register back is the preferred pattern to force the write out. The above works,
but it feels to me personally akin to how local_lock()
in the kernel is a more fine grained mechanism than using
preempt_disable(). But that's pretty opinionated. See device-io.rst
and io_ordering.rst for how I came to that conclusion.

> +
> +	regmap_update_bits(dwmac->intf_regmap, dwmac->intf_reg_off,
> +			   MX93_GPR_ENET_QOS_INTF_MODE_MASK, 0);
> +	usleep_range(50, 100);
> +	iface |= MX93_GPR_ENET_QOS_CLK_GEN_EN;
> +	regmap_update_bits(dwmac->intf_regmap, dwmac->intf_reg_off,
> +			   MX93_GPR_ENET_QOS_INTF_MODE_MASK, iface);
> +
> +	writel(old_ctrl, dwmac->base_addr + MAC_CTRL_REG);
> +}

I don't have any documentation for the registers here, and as you can
see I'm an amateur with respect to memory ordering based on my prior
comment.

But you:

    1. Read intf_reg_off into variable iface
    2. Write the RESET_SPEED for the appropriate mode to MAC_CTRL_REG
    3. wmb() to ensure that write goes through
    4. Read intf_reg_off (regmap_update_bits())
    5. Write 0 to MX93_GPR_ENET_QOS_INTF_MODE_MASK within intf_reg_off (regmap_update_bits())
    6. Sleep for 50-100 us
    7. Read intf_reg_off (regmap_update_bits())
    8. Write MX93_GPR_ENET_QOS_CLK_GEN_EN | iface (from 1) to
       MX93_GPR_ENET_QOS_INTF_MODE_MASK within intf_reg_off (regmap_update_bits())

I don't know what those bits do, but your description sounds like you
are trying to stop the clock for 50-100 us. In your code, if I
understand the memory ordering correctly, both of the following could
occur:

    1. Write RESET_SPEED
    2. Write 0 to MX93_GPR_ENET_QOS_INTF_MODE_MASK
    3. sleep
    4. Restore MX93_GPR_ENET_QOS_CLK_GEN_EN | iface

    or

    1. Write RESET_SPEED
    2. sleep
    3. Write 0 to MX93_GPR_ENET_QOS_INTF_MODE_MASK
    4. Restore MX93_GPR_ENET_QOS_CLK_GEN_EN | iface

is the latter acceptable to you, or does that wmb() (or alternative)
need to move? It seems to me only the first situation would stop
the clock before sleeping, but that's going off the names in this driver
only.

In either case, shouldn't regmap_update_bits() force a
read of said bits, which would remove the need for that wmb() altogether
to synchronize the two writes?


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
