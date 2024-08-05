Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FDFAC3DA4A
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2024 16:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XYL7aSIaHq7dMAEDOxo5ApJ9JaoyHB2niBqwoo0qNXw=; b=EK2RlM7JDt/qfoX/BkkKolP9kO
	9IArYHyugRbQqyJVadfvEs9oJgHGNXg6BAZmNGBZb76ORhTpBxlJEBhLlrry2m9oXsZe4t334xtAN
	G1ocK0tTceLdlQsqYGOj4wiq1pymMQ2D5DapUPSp0hbjGlQy+oHwm9YU6qfS9/IluTfMeqYKKsbaM
	j+Atw+VPpIOEQ3kSTlB68g3x4w36kLHr8c0nlWRaw5Bzq2sZje7W3X0nywnB5F2i0pZYl2oEIBQTR
	VAGpCp1uh7snyTkQa9SER1uI7G0q5zE5ogevsB157SyktUd7nJn00XHULZO+MOZ81yCB6F/f2WVn/
	HiyIA8SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb10Z-0000000Gakn-3LPS;
	Mon, 05 Aug 2024 16:56:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb10X-0000000Gajo-49z4;
	Mon, 05 Aug 2024 16:56:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7EFF160C7C;
	Mon,  5 Aug 2024 16:56:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B27EFC4AF0B;
	Mon,  5 Aug 2024 16:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722876989;
	bh=cJWWhC5ntldu+JRfUJ99sO45oMidL1C+aIhRQhQ9HhI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=biWOUkoZ5sBoNUHYGurUnIIqoCBRLJ5bAmFx1TzTjhQrqkTfFCnQ37ZuIwUuokGp3
	 RuY7tEaw8jgMKjxaVkj6bCKPQlKwwbXAG/CrmwhMqOLtMyvkn0kGUtu5tZezCPjZav
	 Yr5F/9aC66HXQmBSwk1T26ph83Ka2gtp9UucMS77yZvzWlvz+fO+tC3q9Vhjdoon0I
	 aWVMobpfMB8zCj9Xx9eT79SxEgjCG8fhoEb9JOzWaZB+AAwROTPV2yV4aBtK/Hicta
	 AucsqaeypgdjrEcJIcF1ukeUUcZcEoSAIMyAinI2CfWUm+YQ/UC5DglJIs1uUYNzqO
	 OcuMSCut6P2Fg==
Date: Mon, 5 Aug 2024 17:56:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-rt-users@vger.kernel.org,
	Arseniy Krasnov <avkrasnov@salutedevices.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@sberdevices.ru, oxffffaa@gmail.com,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v1] ASoC: meson: axg-fifo: set option to use raw spinlock
Message-ID: <04b2b8c5-8b18-4594-9eeb-9971d8cf3786@sirena.org.uk>
References: <20240729131652.3012327-1-avkrasnov@salutedevices.com>
 <1ja5i0wags.fsf@starbuckisacylon.baylibre.com>
 <2b16b95e-196e-4d8a-98c3-3be568cdd18a@sirena.org.uk>
 <1j5xsow839.fsf@starbuckisacylon.baylibre.com>
 <7dfdade5-3a57-4883-bfac-067c50ec0ffb@sirena.org.uk>
 <1j1q3cw5ri.fsf@starbuckisacylon.baylibre.com>
 <20240805153309.k_SfHw62@linutronix.de>
MIME-Version: 1.0
In-Reply-To: <20240805153309.k_SfHw62@linutronix.de>
X-Cookie: Goodbye, cool world.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_095630_101392_41AF1287 
X-CRM114-Status: GOOD (  15.17  )
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
Content-Type: multipart/mixed; boundary="===============5279754410900265032=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============5279754410900265032==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PmcO6oqNBVuQAmrg"
Content-Disposition: inline


--PmcO6oqNBVuQAmrg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 05, 2024 at 05:33:09PM +0200, Sebastian Andrzej Siewior wrote:

> I'm not sure if making the lock a raw_spinlock_t solves all the
> problems. The regmap is regmap_mmio so direct memory-access and looks
> simple enough to do so. In regmap_mmio_write() I see clk_enable() and
> and this uses a spinlock_t so we should be back at the same problem.

The clk_enable() is optional, users simply shouldn't use the internal
clock management with devices that it'll cause problems for.

> There might be an additional problem if reg-caching is enabled.

The flat cache is there mostly for the benefit of things accessed from
interrupt context, it guarantees to never do any allocations and doesn't
lock.  You can also use other caches if you ensure that any registers
accessed in interrupt context are already cached so won't trigger any
new allocations.

--PmcO6oqNBVuQAmrg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmaxBDYACgkQJNaLcl1U
h9Be3wf9E7bM5pWGm5SeLcoOoFtCljwgUPX4/syxkWZ4gbzyXkWXA1jBOgucoU9o
FvwE+yafCfSo0zG2EhElLUT9dp9MLj0S8JrWfQFSeh+1OGdZR/KjK1NEVYiV6doP
Ye1L6xxIstW6NNhLYENRIUok6WX6L4vFOAWR2By2lr+0IYY9gpstt1/s72jdLamt
xhKp1TzPAOTUvjhYP5BTZJCQ0ugrCnW+T52tdExyCnj/7wdomwKf8TRUZsz1AmUF
yL//1bYA5Oynyz/rrvKNPxjcvG6sGmXaV1ZsomGzrMRnZH0kXzFu6IPUNIRG9fN2
YK8Qt4jLj7DKCNmtBrQLLUjQDKN1Lg==
=p6B8
-----END PGP SIGNATURE-----

--PmcO6oqNBVuQAmrg--


--===============5279754410900265032==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============5279754410900265032==--

