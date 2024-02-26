Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 387ABC48BF6
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Feb 2024 15:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fFvQZII/1oRTHBlSwe6vKhbRCscVvcEw9hYMaefMms4=; b=SRT3V1pxpHLUEd2R0ObdZ7/A48
	+Wu6FS1o/miH1lvuVMnTGw7HrXO8YqvQXOZ7kqSjuHLMZBzoKhOKo3vp7RdKzcC3eiWwvZUWhYJ4l
	FXpoYWKtQiovH2EVX65SfRx/Vb2sA56JMTcUiVryIW5Pd5ZKMEEmT28rUWocf0jHy/Dy+gE5Q9cEs
	Et1c541HqKqLXJrqtUZQzpY+5vBU9Ad/cEb1pnsZRrycEJAYX1qQi/bfGIVhbLO8J6MyHM3ieGnnZ
	PlochSyp7e/8fCpM3nYohxkyqNB+364eauoAWsU1UwN0x8PJSumjbnI6JK1vLpVCuHv3/YMWEAAII
	YPeW/56A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1red7r-00000001TrL-2Bu2;
	Mon, 26 Feb 2024 15:42:43 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1red7p-00000001Tqp-1Z6P
	for linux-amlogic@lists.infradead.org;
	Mon, 26 Feb 2024 15:42:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 65788CE17B2;
	Mon, 26 Feb 2024 15:42:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EBAEC433F1;
	Mon, 26 Feb 2024 15:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708962157;
	bh=eL3Sq0didjuZIcQ0uUGAVgBF4oFDIInfGkYzwsFtZ5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UPxjAqrNQZU6c56kJP7tvRbFozDBHAeT/Ki1LV0YiumSxdtDrvz13EA0H4KhswR51
	 Y42pqnYvuSEXWhAKu4zJrAmA8dw+IOspFIpDgy6jeF2aEgXXVp9/fvvcOsIv/jBcUy
	 YhIhoVAOY6nJfSFI+2lm3thxc5OE85qOK+MQehEgLbvRGa+Svu8CDqcfTDADH9x6rR
	 pg/tC6RN35XNFt+HtOLHmfFbl2MXWFx9MpCZtMhxfskVDrRf9UbmgltQResfhSEAAo
	 CKKCen9AItd4FaRcKTIgeh2LYngENnSn7DBcZla/oSg1zzI7SZd/MaNh1n4LdxQMAr
	 w/AWH3h/w19WQ==
Date: Mon, 26 Feb 2024 15:42:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 6/6] ASoC: meson: axg-fifo: use FIELD helpers
Message-ID: <a828b4f7-282b-4b83-9a64-04557edf9b6a@sirena.org.uk>
References: <20240223175116.2005407-1-jbrunet@baylibre.com>
 <20240223175116.2005407-7-jbrunet@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20240223175116.2005407-7-jbrunet@baylibre.com>
X-Cookie: Your mileage may vary.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_074241_605884_60988D04 
X-CRM114-Status: UNSURE (   8.71  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============4664861332845281046=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============4664861332845281046==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="US/dKDUluQQUZ0hF"
Content-Disposition: inline


--US/dKDUluQQUZ0hF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 23, 2024 at 06:51:12PM +0100, Jerome Brunet wrote:

> Use FIELD_GET() and FIELD_PREP() helpers instead of doing it manually.

This breaks the build for me:

/build/stage/linux/sound/soc/meson/axg-fifo.c: In function =E2=80=98axg_fif=
o_pcm_hw_para
ms=E2=80=99:
/build/stage/linux/sound/soc/meson/axg-fifo.c:149:28: error: implicit decla=
ratio
n of function =E2=80=98FIELD_PREP=E2=80=99 [-Werror=3Dimplicit-function-dec=
laration]
  149 |                            FIELD_PREP(CTRL0_INT_EN, irq_en));
      |                            ^~~~~~~~~~
/build/stage/linux/sound/soc/meson/axg-fifo.c: In function =E2=80=98axg_fif=
o_pcm_irq_blo
ck=E2=80=99:
/build/stage/linux/sound/soc/meson/axg-fifo.c:207:18: error: implicit decla=
ratio
n of function =E2=80=98FIELD_GET=E2=80=99 [-Werror=3Dimplicit-function-decl=
aration]
  207 |         status =3D FIELD_GET(STATUS1_INT_STS, status);
      |                  ^~~~~~~~~
cc1: all warnings being treated as errors

--US/dKDUluQQUZ0hF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXcsWgACgkQJNaLcl1U
h9DIlgf/fnA/FeDBqMLROkPy3MIwMuQ3ZxxLtkBhK7VmoZBxa9cH7MWNDQ84B1pt
Ed/CFYuM8JzavBhDYl1s+qGi7RRsz36Zk/FAPftRdm/zCTl7L0oXH5a26CgU2WHJ
DiB6tY1QkkAFWj6nHAlNlNUeIkAXBa8py0pOOv7JKNGiGMVZnEcsRZKtgyhbUdK7
jvUE3YvTXnjxDtBVKat0fe2/rOVqtefqpnKL94l7BkjlIeRgJ8DmWfGH6gibUm1t
GFY9mTOE5niV34ypQlId8dCtJEP6tbplAssdgnw0GbMceZ/xlztKtKNy3wMv+W3m
27/rAv8zQA4CUE078XdfAcxYGntAug==
=GD+7
-----END PGP SIGNATURE-----

--US/dKDUluQQUZ0hF--


--===============4664861332845281046==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4664861332845281046==--

