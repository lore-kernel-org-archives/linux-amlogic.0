Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6250EC00528
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Jul 2023 20:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z5cPQuAbEZXBfnVM4fsyvMt1sRstClOd/6sBIoLe73s=; b=f7iZ/51i/6JAzw
	aLieLVtKFnH6rnVCwuKQmenu/fJBvzBLtr3HrV+YnmH76Khox6XbrBaQ7JVqHMug+8RLUlyhvetjK
	orq0382OizbfCEn+D+ho1vOUl+zKre6d/olkBRrQZywFHVP3M2w/tZx0jok/AzA1iYcsqh+zoQ+IW
	8nF0oW9MQUeMO7IZsHcSzb1XK7e6OusrkPdRcn/bZOd/ubfWsuH1aoeqayiZm9WqQrf6IHK49VJ0u
	qGtkYRFfaUMjYP6vzOjSB/3n9JKtMP9G6ah3+m74qmo0qp3h1lJkQCnqNAnQnc/Ax1EgsRg5WIwNU
	1Os0CXrOXhTPZYo3S6PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOOBq-008NyN-17;
	Tue, 25 Jul 2023 19:59:26 +0000
Received: from viti.kaiser.cx ([2a01:238:43fe:e600:cd0c:bd4a:7a3:8e9f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOOBm-008Nwf-21;
	Tue, 25 Jul 2023 19:59:24 +0000
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1qOOBR-0007K0-M1; Tue, 25 Jul 2023 21:59:01 +0200
Date: Tue, 25 Jul 2023 21:59:01 +0200
From: Martin Kaiser <lists@kaiser.cx>
To: Alexey Romanov <avromanov@sberdevices.ru>
Cc: narmstrong@baylibre.com, neil.armstrong@linaro.org, olivia@selenic.com,
	herbert@gondor.apana.org.au, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, f.fainelli@gmail.com,
	hkallweit1@gmail.com, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-crypto@vger.kernel.org,
	kernel@sberdevices.ru
Subject: Re: [PATCH v1 1/3] drivers: rng: add check status bit feature
Message-ID: <20230725195901.n2klvgz7outqaatk@viti.kaiser.cx>
References: <20230725141252.98848-1-avromanov@sberdevices.ru>
 <20230725141252.98848-2-avromanov@sberdevices.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230725141252.98848-2-avromanov@sberdevices.ru>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_125922_831730_00D4E15C 
X-CRM114-Status: GOOD (  22.53  )
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

Alexey Romanov (avromanov@sberdevices.ru) wrote:

> For some Amlogic SOC's, mechanism to obtain random number
> has been changed. For example, S4 now uses status bit waiting algo.

> Signed-off-by: Alexey Romanov <avromanov@sberdevices.ru>
> ---
>  drivers/char/hw_random/meson-rng.c | 77 ++++++++++++++++++++++++++++--
>  1 file changed, 74 insertions(+), 3 deletions(-)

> diff --git a/drivers/char/hw_random/meson-rng.c b/drivers/char/hw_random/meson-rng.c
> index a4eb8e35f13d..c6d7349630a1 100644
> --- a/drivers/char/hw_random/meson-rng.c
> +++ b/drivers/char/hw_random/meson-rng.c
> @@ -14,19 +14,65 @@
>  #include <linux/of.h>
>  #include <linux/clk.h>

> -#define RNG_DATA 0x00
> +struct meson_rng_priv {
> +	bool check_status_bit;
> +	unsigned int data_offset;
> +	unsigned int cfg_offset;
> +};

>  struct meson_rng_data {
>  	void __iomem *base;
>  	struct hwrng rng;
> +	struct device *dev;
> +	const struct meson_rng_priv *priv;
>  };

> +#define RUN_BIT			0
> +#define SEED_READY_STS_BIT	31
> +#define RETRY_CNT		100
> +
> +static int meson_rng_wait_status(void __iomem *cfg_addr, int bit)
> +{
> +	u32 status;
> +	u32 cnt = 0;
> +
> +	do {
> +		status = readl_relaxed(cfg_addr) & BIT(bit);
> +		cpu_relax();
> +	} while (status && (cnt++ < RETRY_CNT));
> +

Could you use readl_relaxed_poll_timeout here instead of open coding the
loop?

> +	if (status)
> +		return -EBUSY;
> +
> +	return 0;
> +}
> +
>  static int meson_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
>  {
>  	struct meson_rng_data *data =
>  			container_of(rng, struct meson_rng_data, rng);
> +	const struct meson_rng_priv *priv = data->priv;
> +
> +	if (priv->check_status_bit) {
> +		void __iomem *cfg_addr = data->base + priv->cfg_offset;
> +		int err;
> +
> +		writel_relaxed(readl_relaxed(cfg_addr) | BIT(SEED_READY_STS_BIT), cfg_addr);

> -	*(u32 *)buf = readl_relaxed(data->base + RNG_DATA);
> +		err = meson_rng_wait_status(cfg_addr, SEED_READY_STS_BIT);
> +		if (err) {
> +			dev_err(data->dev, "Seed isn't ready, try again\n");
> +			return err;
> +		}
> +
> +		err = meson_rng_wait_status(cfg_addr, RUN_BIT);
> +		if (err) {
> +			dev_err(data->dev, "Can't get random number, try again\n");
> +			return err;
> +		}
> +	}
> +
> +	*(u32 *)buf = readl_relaxed(data->base + priv->data_offset);

>  	return sizeof(u32);
>  }
> @@ -41,6 +87,10 @@ static int meson_rng_probe(struct platform_device *pdev)
>  	if (!data)
>  		return -ENOMEM;

> +	data->priv = device_get_match_data(&pdev->dev);
> +	if (!data->priv)
> +		return -ENODEV;
> +
>  	data->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(data->base))
>  		return PTR_ERR(data->base);
> @@ -53,11 +103,32 @@ static int meson_rng_probe(struct platform_device *pdev)
>  	data->rng.name = pdev->name;
>  	data->rng.read = meson_rng_read;

> +	data->dev = &pdev->dev;
> +
>  	return devm_hwrng_register(dev, &data->rng);
>  }

> +static const struct meson_rng_priv meson_rng_priv = {
> +	.check_status_bit = false,
> +	.data_offset = 0x0,
> +	.cfg_offset = 0x0,
> +};
> +
> +static const struct meson_rng_priv meson_rng_priv_s4 = {
> +	.check_status_bit = true,
> +	.data_offset = 0x8,
> +	.cfg_offset = 0x0,
> +};
> +
>  static const struct of_device_id meson_rng_of_match[] = {
> -	{ .compatible = "amlogic,meson-rng", },
> +	{
> +		.compatible = "amlogic,meson-rng",
> +		.data = (void *)&meson_rng_priv,
> +	},
> +	{
> +		.compatible = "amlogic,meson-rng-s4",
> +		.data = (void *)&meson_rng_priv_s4,
> +	},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, meson_rng_of_match);
> -- 
> 2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
