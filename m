Return-Path: <SRS0=deyy=4B=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F770C2BA83
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Feb 2020 18:22:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19583217F4
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Feb 2020 18:22:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tKnb1Pxa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19583217F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UB9b087VM7QWFKWXJP+k/w9QwMmSsqes4myIntKsVaU=; b=tKnb1Pxau6TT+MFp5Va9F6xB9
	E1qsoaDSWkC36SwdwWMY4kYtjOIyGr/qbZPqzNzxufLqlrv/PMyPGBhz5WmwSR+D6/WYOgSP1+4rO
	+TjvzLDvjvi2gwt94mLntWP0Lf18cFXUDwDMGG5IhEQ90h3Lw4ZIb1AlWbGPFFDG+TUSCuVhxvPXM
	6QJ4imiHC8qBr+PG/Y1tDNQHbc9Nn2AQX7ImUiyC5g5Zd8X8sRBgM5zrMUfein9MypIIez6OSpFLE
	yOoVg3EgOc16uya4FMEOMTbP2xnEYZvGfRzarpQHrGf/OCHddOHqprPK3hR01ydRtr3jdQg0vYkc/
	lKle4Lo1g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2J7j-0000To-CR; Thu, 13 Feb 2020 18:22:03 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2J7g-0000TT-Qn
 for linux-amlogic@lists.infradead.org; Thu, 13 Feb 2020 18:22:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ACFE6328;
 Thu, 13 Feb 2020 10:21:59 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 300043F68E;
 Thu, 13 Feb 2020 10:21:59 -0800 (PST)
Date: Thu, 13 Feb 2020 18:21:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 5/9] ASoC: meson: aiu: add hdmi codec control support
Message-ID: <20200213182157.GJ4333@sirena.org.uk>
References: <20200213155159.3235792-1-jbrunet@baylibre.com>
 <20200213155159.3235792-6-jbrunet@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20200213155159.3235792-6-jbrunet@baylibre.com>
X-Cookie: Academicians care, that's who.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200213_102200_911178_B646487E 
X-CRM114-Status: GOOD (  10.75  )
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============2483377842974462374=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============2483377842974462374==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QnBU6tTI9sljzm9u"
Content-Disposition: inline


--QnBU6tTI9sljzm9u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 13, 2020 at 04:51:55PM +0100, Jerome Brunet wrote:

> +int aiu_add_component(struct device *dev,
> +		      const struct snd_soc_component_driver *component_driver,
> +		      struct snd_soc_dai_driver *dai_drv,
> +		      int num_dai,
> +		      const char *debugfs_prefix)
> +{
> +	struct snd_soc_component *component;
> +
> +	component = devm_kzalloc(dev, sizeof(*component), GFP_KERNEL);
> +	if (!component)
> +		return -ENOMEM;
> +
> +#ifdef CONFIG_DEBUG_FS
> +	component->debugfs_prefix = debugfs_prefix;
> +#endif

You really shouldn't be doing this as it could conflict with something
the machine driver wants to do however it's probably not going to be an
issue in practice as it's not like there's going to be multiple SoCs in
the card at once and if there were there'd doubltess be other issues.

--QnBU6tTI9sljzm9u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5Fk8QACgkQJNaLcl1U
h9CAhwf/cuQA52n4KErDZvZn7/DzU7OY4w6BULQb6pd6r1CgFm/rd1Fgf9QLK2yQ
Yu4cKdsOCcT4YH0Abf5r7n0uNFnCdd4U9c+L+MnQ912Yu8ZV70+X9D9OniFif59u
WVmnNC/sRTatvyefGnTDu//nHF29Yc10S6V+wPbFFACYONJ2s9SKEWCGZrclawkE
mIopqJBFRcz7q2iCaPI8onRuIe5VtF7SeEk0XkFRQsdqPacrJF0JQQFuui2vYBq5
Nu1SDN2ma7iXiSssC9Oy/iCv70WpDLMtYTHz35XiooaHkYKxi2xKkluXWOpy/Dcc
hMVncK5RF58ft+ILMKSg9TXFiEcN0w==
=iCR2
-----END PGP SIGNATURE-----

--QnBU6tTI9sljzm9u--


--===============2483377842974462374==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============2483377842974462374==--

