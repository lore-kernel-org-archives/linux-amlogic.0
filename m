Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB69C54E58
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2024 13:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vyYTh+12zS3NjS027glrNrmH6/VH59oZJKw0FKzuBC8=; b=o07FmkKA9L+CmXRlc3od5LoPlB
	ci7T0hqPhWcXxFz6OYK3GBXf7zZtprh+VmWWoYAXaIB+LspxdyV3h2KCalXFRbsyKy37+eteEtxgx
	LBFo39/CK6cMWvJJHdytBIa9ffuVeE90MoFM+fWl2RBVYxc1AfpEA6LTKZycltpgX76qzEizKbl46
	t1LSWUuuJhpJ0CAKd3A9iA6lR1nQQBWo7INEluQJuBaOdoCFzBowm4DyPw2hVEnofjutiA7iF4f3Q
	Oogh3jQjlpzqq3J0gUCzqrkP6N8Sj8Oo6d74xCCV2Ib8HakobOYZYj74voT1YJoluCq3L0LvpKKKF
	FmLv62jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl7gm-00000000LGk-2KI6;
	Fri, 15 Mar 2024 13:33:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl7gk-00000000LGG-1Lc9;
	Fri, 15 Mar 2024 13:33:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1FBD4616D5;
	Fri, 15 Mar 2024 13:33:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1682EC433C7;
	Fri, 15 Mar 2024 13:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710509612;
	bh=JfFjAgEhqLnBfKgjQe9qzywYHRntA6N/TCPrlY0SO3s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aqYoumkNxTsioqSB8CHVWJv6WqJg7w80kOK6LuxD1ntomlPu2KhueYUskFagoOWcV
	 +/GjL/DAHUdcNR9lvwtkhKtwlRxaMhAv/b+c2X1Wr1J/+op42sMSrJYd11dOIStcRe
	 sD8Wsy1gnp7j/MgKDTbm6sc1Vi6hOZ9PwGlNWJBVz5Hl5puzNVm+BIwNOYT7l3I9Up
	 q3w9tASq5ZFgvWlIwcQlOstwahLObdzOuPViX3fhg+nIJyjfoqcWW1G4cdjJUe6JVh
	 40RmBTRBjMvoflBe/rhfxo04DMidctU7GO2AIDeYBE4zZ0/4hurR2VoNINr8LCSNyE
	 FFrSLJjsySVZQ==
Date: Fri, 15 Mar 2024 13:33:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org,
	kernel@salutedevices.com
Subject: Re: [PATCH 09/25] ASoC: meson: g12a-toacodec: add support for A1 SoC
 family
Message-ID: <2a41e8b6-7e8a-4995-a1d7-c5d30e53c2d5@sirena.org.uk>
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-10-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
In-Reply-To: <20240314232201.2102178-10-jan.dakinevich@salutedevices.com>
X-Cookie: A well-known friend is a treasure.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_063334_429982_5ADD7B06 
X-CRM114-Status: GOOD (  10.61  )
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
Content-Type: multipart/mixed; boundary="===============4564041864735766726=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============4564041864735766726==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="whZtyi24go8F2IXG"
Content-Disposition: inline


--whZtyi24go8F2IXG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 15, 2024 at 02:21:45AM +0300, Jan Dakinevich wrote:

>  static const struct regmap_config g12a_toacodec_regmap_cfg = {
> -	.reg_bits	= 32,
> -	.val_bits	= 32,
> -	.reg_stride	= 4,
> +	.reg_bits		= 32,
> +	.val_bits		= 32,
> +	.reg_stride		= 4,
> +	.max_register		= TOACODEC_CTRL0,
> +	.max_register_is_0	= true,

If the maximum register is 0 how does the regmap have a stride?

--whZtyi24go8F2IXG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmX0TiMACgkQJNaLcl1U
h9CfZwf9FCsJlpA0ZVHlgM+29kv/xJWAC/kxB2g9thms8cg6YPHLUd9VqS+DpK4u
Q1506N0mbJUukxVui6tAnM0IUp+AZDr/ZmpdA1+qqTmHXWJYdGW9AlLdwMKLrURg
HfnYEEeIqCizK2nTTVhOJfkIR9W7ynS35aFJvmsO4BYd1LD4eh4SeD+Qg+L+rW/p
rmEIYL1arUZjZy0n7oFuinL7TImzcPP64lNK2AN9ilTmp5QtoV6TX+Vs/3bifpct
GmTkrmSC7N+jX9S9djridoNIVNXjWGZIofNCpNZbOm+vnkwmAZ+jyKz5uPt+twrQ
R4METAHd4l9JPhWejRP3JBTwMZ3pug==
=VGfS
-----END PGP SIGNATURE-----

--whZtyi24go8F2IXG--


--===============4564041864735766726==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4564041864735766726==--

