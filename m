Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 306FCC38A2D
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Oct 2022 12:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4yf/zMsmP6B3sbMSenD0XVA+PjoCN8oBTolFioCoozs=; b=yl5zYIwuWtPVSArYe5m1jb2jvx
	8eN1KyMUfiBKAbCLp56Eklgx4DQUo1GLuUUr4CaGnWeDYDViw7yukjsQqolVonRUOi/KRgsSAKTt3
	nEWCmyOIYvClHqMBL774HpHT2wr+B8Pr6hwjGP65tO127vLf/20K+HgbNj7fNkcefItInrw7LEGxS
	lngjuWr8m6kvcOiriYJ+cacgsT90u5roJTBw7HbIOrQ/qwZhNcqxVToGb09E5nR7muu/RJook2J7b
	+ULPJIia84ScxvbUYKswd9dOSyOD8TKEQ9sf7WxwkLsYP9P3rX+mx0BaQqQPpVu06ztNvVrHcwaqM
	qJzODHpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onftC-009IK2-1Z; Wed, 26 Oct 2022 12:52:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onft7-009IHv-TD; Wed, 26 Oct 2022 12:52:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 36B5A61EBB;
	Wed, 26 Oct 2022 12:52:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADA4DC433C1;
	Wed, 26 Oct 2022 12:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666788724;
	bh=g99w7lC5JOwtIdlrGIanVT5rZTPjj0ejDg17RdGr4y8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VGrvPz9A7HozY2G68tM5Grnyj/W/v02JPqc6yPwN8D62DYj7yB7GNEzNNPIloRuj+
	 Jq4b57K3zdtZkO0WGkaiPe5RTJfkRHTzvSYoGdN0Wp1RelJUCd7TuNskhhpvqXPGhX
	 WROde92MLQ+H+Mkrv2ufQfx99LOOB4vaQPzuNKOvuwssnkIugtR7joqe7/CNHIQaEu
	 odn2/BkbfeIkuidc4/GhOphfPRMT5EJHlO4Ux+COPikDJ2m9SmO4mI2BLunsGM5dNE
	 XwECk/h6HUtIcumdLVmwGVBS+2lnhUjgcSdg6Bb4OpMPoErGrSPx1cP49p9yK5Qx36
	 R+hzMMpYJRD5w==
Date: Wed, 26 Oct 2022 13:51:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-arm-kernel@lists.infradead.org, Da Xue <da@libre.computer>,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-spi@vger.kernel.org
Subject: Re: [PATCH] spi: meson-spicc: move wait completion in driver to take
 bursts delay in account
Message-ID: <Y1ktb1ZXpLKwjI7L@sirena.org.uk>
References: <20221026-spicc-burst-delay-v1-0-1be5ffb7051a@linaro.org>
 <Y1kql/WwAX+ZV8us@sirena.org.uk>
 <7fb8e635-ef61-0773-eadc-7a5723740df6@linaro.org>
MIME-Version: 1.0
In-Reply-To: <7fb8e635-ef61-0773-eadc-7a5723740df6@linaro.org>
X-Cookie: Prunes give you a run for your money.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221026_055206_071346_080B36FD 
X-CRM114-Status: GOOD (  10.46  )
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
Content-Type: multipart/mixed; boundary="===============0766080194798597904=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============0766080194798597904==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="no6NW13eb8/jU+ir"
Content-Disposition: inline


--no6NW13eb8/jU+ir
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 26, 2022 at 02:48:07PM +0200, Neil Armstrong wrote:

> It's the case, I added a wait_for_completion_timeout() + return 0 in meson_spicc_transfer_one.

Ah, so you did sorry - it was a bit masked in the diff.

--no6NW13eb8/jU+ir
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNZLW4ACgkQJNaLcl1U
h9CTgAf/RMC3sDbxS9xaMNlF3JMbSakGFH5vYSNcVar7RsbbwNlybfndPrpu8z67
Kt/n7NQhlghUwMMbJtep+OgxkwjNk2VwfPxGHsBVCmc4ssUwjulu8QEoDtRoQjQc
RMe0SH4Lgp5aIJOxZEIXllapQ2rfkNlefj+5bWzERik+YapauO6wMccIW/8InAIl
YRZRnPqXwFg5idAqhNoV0jt99qHWbcH2z1H5T4g3QsMPuAJKcmViVVzJvfUhAdaR
bwEIEbXjPVM0rvF3mS30lW3OSsdtYdUtUFQOg14hZs+V6cDr0vUGUNvshEsyME55
b146uYjdZu0ru8ygEm55sNrvasqCDg==
=NC8n
-----END PGP SIGNATURE-----

--no6NW13eb8/jU+ir--


--===============0766080194798597904==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============0766080194798597904==--

