Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B016C47422
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Jan 2024 07:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UvLKlZQpeCchAPMyD627TE7mRsTvPECCp0ACrO4lU1k=; b=TY+IEzPdjK3sFS
	hDs7DjWnHNaK3lmI4g5XvadsBR1MBEOGY/qH4xsxgg5geVihDQHlr8mlqRLrNYKbER843wqXftnCG
	BMUWV+jZ0OW9vsDj9dtdi0L4s61s+12dFN29AbgsjdDdEmn1ACgNS1okQp4IjmP80aQUOu2ltEfS4
	pofkXePyV78GX4MDl7xdm01L0nsHAHybENTNtrps0ysiw2OdsloOm/jKD8gXMktwBbAzcH92M0t6L
	gBzjPG2Fs5301iYNmx/uC73XyGJnmznn3mwpJy42Dn+cm2AfxzwROrDXpXTDoWcLnLJCnLcc3dMzC
	zdjgpqpN27J061XBzpxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSXiq-001rjo-2e;
	Wed, 24 Jan 2024 07:30:56 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSXin-001rjL-0b;
	Wed, 24 Jan 2024 07:30:54 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40e87d07c07so64684075e9.1;
        Tue, 23 Jan 2024 23:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706081450; x=1706686250; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3q1o6aAekTHAGtHaTxP4kjBlXWWUej4AyBNrNnh309M=;
        b=Ep089UW0d8+0nFZu+ZJi6iwOyjKPu8WWDdnzQ3rY7sPt4aVpmOxk22lcLKawyAn3Hq
         V1HcYyhHNBseLfdY96mVtu2A8jl2tMjMt+FQvPuNnU6SuUG+xC0NlUboj4lPuF4fS+zy
         pNTwMpKKKPc7cPmfZ0M0XFNlV57SwzbkofHK8RVVPlYLhICl6aMRNGBAk2NZrjuDl7g3
         ydSRgn3JEGwhx2mM2NYupYdc/7AhIl570rZ9z3XXv3tdpPyxAmQHhhsOwbTPny1BSUFK
         wegh+bXntlWEnVavvFntIA7YONkijRMhTzDL5JlG/6Ho+sS07MMY1DhMZ+eJtrtysoih
         1qpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706081450; x=1706686250;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3q1o6aAekTHAGtHaTxP4kjBlXWWUej4AyBNrNnh309M=;
        b=CSlkWRwRIXdUKKUw8KMNZgJ8UsOYPyG5T36c11arwerfOwNGlpBdOLzMxrD0I3NiVl
         MJevg5LOanktyXD/SgF+IbxGRTfRJN/vR8+4rvK8J8VNV+HyIlcl4gzQPfjmhXy5QbvM
         DzNeumY4CKPD0QooUu8g7Bz/pdgXmHBwFpBJWfkhEy3nOBDtH9FOFtP6rNEExPY7iOw4
         p7BPZejq5XpEc2XB9Og+EFWswHqD/fQLtIgPpspxHrvX3g9pjtYlfP82Uiy5B1+uoohA
         EktsjefdWlJBsrJL+mQUT/SeBSeywt3ob0elG7HgNuAb3iuNm4e+o7VIFG4mLvLvNnPX
         Qm0A==
X-Gm-Message-State: AOJu0Yx+NqySiEeUdareCqPHKkoYm5fQR0aOAdU52xpN9vhhVUmasdPs
	uiDdsczH6Y/ttYw0ctqrK9CPvGm4mzt5PWfssU8MrwH2YtMkjzgU
X-Google-Smtp-Source: AGHT+IFgs85NIjlXfM9SBtUmGybQ1WPXBV4OIlQceBFmgtfQOL0aW4ydBfYNlu7dBZ7BJKo1rSz6Hw==
X-Received: by 2002:a05:600c:4514:b0:40e:4a58:2a85 with SMTP id t20-20020a05600c451400b0040e4a582a85mr853492wmo.99.1706081450216;
        Tue, 23 Jan 2024 23:30:50 -0800 (PST)
Received: from Red ([2a01:cb1d:3d5:a100:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id ek15-20020a05600c3ecf00b0040e8e358f82sm21572528wmb.19.2024.01.23.23.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 23:30:50 -0800 (PST)
Date: Wed, 24 Jan 2024 08:30:48 +0100
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Alexey Romanov <avromanov@salutedevices.com>
Cc: neil.armstrong@linaro.org, clabbe@baylibre.com,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@salutedevices.com
Subject: Re: [PATCH v2 03/20] drviers: crypto: meson: add platform data
Message-ID: <ZbC8qLXogjxJD8LD@Red>
References: <20240123165831.970023-1-avromanov@salutedevices.com>
 <20240123165831.970023-4-avromanov@salutedevices.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240123165831.970023-4-avromanov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_233053_223068_D5C284FE 
X-CRM114-Status: GOOD (  23.05  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Le Tue, Jan 23, 2024 at 07:58:14PM +0300, Alexey Romanov a =E9crit :
> To support other Amlogic SoC's we have to
> use platform data: descriptors and status registers
> offsets are individual for each SoC series.
> =

> Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
> ---
>  drivers/crypto/amlogic/amlogic-gxl-cipher.c |  2 +-
>  drivers/crypto/amlogic/amlogic-gxl-core.c   | 31 +++++++++++++++------
>  drivers/crypto/amlogic/amlogic-gxl.h        | 11 ++++++++
>  3 files changed, 35 insertions(+), 9 deletions(-)
> =

> diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto=
/amlogic/amlogic-gxl-cipher.c
> index b19032f92415..7eff3ae7356f 100644
> --- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
> +++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
> @@ -225,7 +225,7 @@ static int meson_cipher(struct skcipher_request *areq)
>  =

>  	reinit_completion(&mc->chanlist[flow].complete);
>  	mc->chanlist[flow].status =3D 0;
> -	writel(mc->chanlist[flow].t_phy | 2, mc->base + (flow << 2));
> +	writel(mc->chanlist[flow].t_phy | 2, mc->base + ((mc->pdata->descs_reg =
+ flow) << 2));
>  	wait_for_completion_interruptible_timeout(&mc->chanlist[flow].complete,
>  						  msecs_to_jiffies(500));
>  	if (mc->chanlist[flow].status =3D=3D 0) {
> diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/a=
mlogic/amlogic-gxl-core.c
> index a58644be76e9..2be381e157c4 100644
> --- a/drivers/crypto/amlogic/amlogic-gxl-core.c
> +++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
> @@ -18,6 +18,7 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  =

>  #include "amlogic-gxl.h"
> @@ -30,9 +31,10 @@ static irqreturn_t meson_irq_handler(int irq, void *da=
ta)
>  =

>  	for (flow =3D 0; flow < mc->flow_cnt; flow++) {
>  		if (mc->chanlist[flow].irq =3D=3D irq) {
> -			p =3D readl(mc->base + ((0x04 + flow) << 2));
> +			p =3D readl(mc->base + ((mc->pdata->status_reg + flow) << 2));
>  			if (p) {
> -				writel_relaxed(0xF, mc->base + ((0x4 + flow) << 2));
> +				writel_relaxed(0xF, mc->base +
> +					      ((mc->pdata->status_reg + flow) << 2));
>  				mc->chanlist[flow].status =3D 1;
>  				complete(&mc->chanlist[flow].complete);
>  				return IRQ_HANDLED;
> @@ -245,15 +247,34 @@ static void meson_unregister_algs(struct meson_dev =
*mc)
>  	}
>  }
>  =

> +static const struct meson_pdata meson_gxl_pdata =3D {
> +	.descs_reg =3D 0x0,
> +	.status_reg =3D 0x4,
> +};
> +
> +static const struct of_device_id meson_crypto_of_match_table[] =3D {
> +	{
> +		.compatible =3D "amlogic,gxl-crypto",
> +		.data =3D &meson_gxl_pdata,
> +	},
> +	{},
> +};
> +
>  static int meson_crypto_probe(struct platform_device *pdev)
>  {
> +	const struct of_device_id *match;
>  	struct meson_dev *mc;
>  	int err;
>  =

> +	match =3D of_match_device(meson_crypto_of_match_table, &pdev->dev);
> +	if (!match)
> +		return -EINVAL;
> +
>  	mc =3D devm_kzalloc(&pdev->dev, sizeof(*mc), GFP_KERNEL);
>  	if (!mc)
>  		return -ENOMEM;
>  =

> +	mc->pdata =3D match->data;
>  	mc->dev =3D &pdev->dev;
>  	platform_set_drvdata(pdev, mc);
>  =

> @@ -312,12 +333,6 @@ static void meson_crypto_remove(struct platform_devi=
ce *pdev)
>  	clk_disable_unprepare(mc->busclk);
>  }
>  =

> -static const struct of_device_id meson_crypto_of_match_table[] =3D {
> -	{ .compatible =3D "amlogic,gxl-crypto", },
> -	{}
> -};
> -MODULE_DEVICE_TABLE(of, meson_crypto_of_match_table);

Hello

This patch breaks bisection, since it removes MODULE_DEVICE_TABLE.
After applying patchs 1,2,3 the driver does not load anymore on lepotato bo=
ard.

Regards

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
