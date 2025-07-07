Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17457C83F07
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Jul 2025 13:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8dRIqMlJijGzig0CW0N0LyYYJtihwgjjNwE1Sc3jTbs=; b=4BSUvqDPXDMrivNkMJxJsixFnK
	OdVVlxjLkAkoXTWLGEwekIJDJv60hdmz8fgZ2WFWz4rifRW+F1L2ceTONpmwDfQW6LpDh8iJfVzYT
	cogCI/5Qb1tXWK7/7bsCPLzi9tcJWM6zILHcGxAaDVfQewrUR2VwD2HW1W6Bo3qJ2mNzHsV3nmDso
	4RQQrJ/KYS4y4tkvaUb32Yu6FHWLmBD9w7EiE+Gx0cpeWSHA6yRPecq6VtBxDlyP9JCLnV8fKkr+w
	WH6Jhs9mtwSjdX1OMx/pHIS9a85RSNKl6016aCd6oaLqbitsHUrbnFbd5JkkzM+r/p2lcbn9xYo6a
	QMt9tG9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYlXm-00000002VOl-009y;
	Mon, 07 Jul 2025 13:06:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYlXj-00000002VNx-1NMw
	for linux-amlogic@lists.infradead.org;
	Mon, 07 Jul 2025 13:06:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B767A43ACD;
	Mon,  7 Jul 2025 13:05:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3C28C4CEE3;
	Mon,  7 Jul 2025 13:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751893558;
	bh=PuLkdsqUGDmezMVAO49b/CuVBHRcasZBx/jY/Y7ONeI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=auVZl2ME5ZhvPj5grOu5VjEFBMbi/SAqVXXpQHVX0V3478vEwPNBhTaGP08auugIt
	 oEu88gjSXXLi8nB8TnB5XFvk0FCkFPHwgPQCMtL5Ef1m+HEmx/BRyOJ3HTiAtlPMRY
	 BYv8x5LS/idAmMaRFpQ7fITg/TjwhRqZLdbW//BIMenxKnoBu8W4Yq2kggebe0Y5f2
	 46Vkwax1UGXn7Yqp6UceR/iSyKfUBuYZ74B6nyFKdOi7oFtxcEDCOsEnv1AJteWdRB
	 sqSkf7uxtuOOBGEnhN5/Ou56UuhvQ8RdqYBHBPK6Mg+WEi2aE2K4cwK7EfjlMgv3fs
	 dnpUkAWjl768w==
Date: Mon, 7 Jul 2025 14:05:53 +0100
From: Mark Brown <broonie@kernel.org>
To: xianwei.zhao@amlogic.com
Cc: Sunny Luo <sunny.luo@amlogic.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] spi: Add Amlogic SPISG driver
Message-ID: <3ac88119-9980-42df-9e1c-c0ec30bbaadd@sirena.org.uk>
References: <20250704-spisg-v4-0-6b731dfbe610@amlogic.com>
 <20250704-spisg-v4-2-6b731dfbe610@amlogic.com>
MIME-Version: 1.0
In-Reply-To: <20250704-spisg-v4-2-6b731dfbe610@amlogic.com>
X-Cookie: We are what we are.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_060559_406867_149BD59C 
X-CRM114-Status: GOOD (  18.71  )
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
Content-Type: multipart/mixed; boundary="===============0775102888032836208=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============0775102888032836208==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XuNRsNwpi0P6rBB3"
Content-Disposition: inline


--XuNRsNwpi0P6rBB3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 04, 2025 at 10:59:33AM +0800, Xianwei Zhao via B4 Relay wrote:

> Introduced support for the new SPI IP (SPISG) driver. The SPISG is
> a communication-oriented SPI controller from Amlogic,supporting
> three operation modes: PIO, block DMA, and scatter-gather DMA.

This looks good, a few small things below but nothing major.

> +static bool aml_spisg_can_dma(struct spi_controller *ctlr,
> +			      struct spi_device *spi,
> +			      struct spi_transfer *xfer)
> +{
> +	return true;
> +}

Is it worth having a copybreak such that smaller transfers are done
using PIO?  With a lot of controllers that increases performance due to
the extra overhead of setting up DMA, talking to the DMA and interrupt
controllers can be as expensive as directly accessing the FIFOs.

> +static irqreturn_t aml_spisg_irq(int irq, void *data)
> +{
> +	struct spisg_device *spisg = (void *)data;
> +	u32 sts;
> +
> +	spisg->status = 0;
> +	regmap_read(spisg->map, SPISG_REG_IRQ_STS, &sts);
> +	regmap_write(spisg->map, SPISG_REG_IRQ_STS, sts);
> +	if (sts & (IRQ_RCH_DESC_INVALID |
> +		   IRQ_RCH_DESC_RESP |
> +		   IRQ_RCH_DATA_RESP |
> +		   IRQ_WCH_DESC_INVALID |
> +		   IRQ_WCH_DESC_RESP |
> +		   IRQ_WCH_DATA_RESP |
> +		   IRQ_DESC_ERR))
> +		spisg->status = sts;
> +
> +	complete(&spisg->completion);
> +
> +	return IRQ_HANDLED;

It'd be better to check if there's an interrupt actually flagged and
return IRQ_NONE if not, as well as supporting sharing that means that
the interrupt core can handle any errors that cause the interrupt to
latch on.

> +	ret = devm_request_irq(&pdev->dev, irq, aml_spisg_irq, 0, NULL, spisg);
> +	if (ret) {
> +		dev_err(&pdev->dev, "irq request failed\n");
> +		goto out_controller;
> +	}
> +
> +	ret = aml_spisg_clk_init(spisg, base);
> +	if (ret)
> +		goto out_controller;

Do we need the clocks for register access - if so what happens if the
interrupt fires as soon as it is registered?  I'd have expected
requesting the interrupt to be one of the last things done.

--XuNRsNwpi0P6rBB3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhrxjEACgkQJNaLcl1U
h9BsIQf6A+9yaMYcp1gxZdLMx2jltWF7cHCNvSupFRmtYZ0ljM+gNdKkaigkOinq
rHrYqdyrb+tJLA7AKeFshHPiEVJi4v9hZXJTlVWSE9dO0GaZ+/C7wDGzFejo/V2V
ZD+3xVNkv/SO8hv/eeay1Y8eL4iMKfIcZZn3sBepyLR1Hlo6YrrmyxnYsvDOzVYH
RxE+wvzzB10bC/Bjsvg3HnkYpnmb01a9o0awWFw324+uDcv91wp5i+Bsv9NQLkBs
tmobLgDQjVj6WihO2nmXoB+2vbAmrWZQaFNl7FS2TnyanYBUwNRPkWi/UhGDwoHK
AqUULN21wUgdXzCXib52d1c67OyQYQ==
=dEip
-----END PGP SIGNATURE-----

--XuNRsNwpi0P6rBB3--


--===============0775102888032836208==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============0775102888032836208==--

