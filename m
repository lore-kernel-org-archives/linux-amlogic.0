Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E06C1C3DA61
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jul 2024 14:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t4eAiRiiAqQCDhzIcp3jdNxINbT/Zw3L2Gynr6eiNtA=; b=eFZhUdk2bpXU1fBYlM2wBkGzoN
	CKlYzrbuZ7K43n9AG7i5tphkjCDXFMr0i7gItKxUob3E3iPuHU5L2VMF0tYIJPgcZhiQaQpFgY8ii
	YErixzB7H1ymd82Rnfqj1oImcTDzRejAK4mOEKNTZ9cg5xRJNPSWbYqWSh2uzz6jqI94jbSXXgDlg
	X1P7fhW/vMdIAjmp1wrbDVYF3Y69PBX18oZabiPRcZSZQ39iBhYyG26tkyUU0ctJGteP7H86Mzqp7
	vSrRKZDwjxxOh3l5GIoXdeJQ3EJzbduValdgDi9Cwon0oY+L+NSghpAHDLklKiWjYI/AyjyhA/l0J
	7ndQ8Kwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYRnH-0000000BlEo-2tYO;
	Mon, 29 Jul 2024 14:56:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYRcE-0000000Bi7g-2VRd;
	Mon, 29 Jul 2024 14:44:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C82CE61A40;
	Mon, 29 Jul 2024 14:44:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF204C32786;
	Mon, 29 Jul 2024 14:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722264285;
	bh=KxWBR2WQwkmRfSCkEK5fdabdTfFVBLXY+ljiSnLfdNQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FMtdyXcrDjT+14PVlW/6r4syixCSaKqIUXnSi5kCjwQiJj5LOu4ZUqzenz79NmnX7
	 Tg6sEsWl6CUJ/EYNhNBQiwTdMokOfYuEaVXI/JPCH+j84wR8FjKieJ7j5R7DxeTBmU
	 wKREQYsVBwyh3ib3rqriS1HDCQNdeNX22vlq/BNKu4FtT93/GoELWvgBTscEnDCNdG
	 VvMdH+M2ndsoFkjOEwL/XsgnDzb0jiTIfydbxBj6IK4FPJ0zArJKuoWVUQqZYL6Sdb
	 b+s5UF5eYt1RriuBvNDjeRVzkbdV2UDIjHqby0cFZRf+I1GaEu7Rc2/N0DYe+68VWL
	 4yPPeWBVHl/Fw==
Date: Mon, 29 Jul 2024 15:44:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Arseniy Krasnov <avkrasnov@salutedevices.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@sberdevices.ru, oxffffaa@gmail.com
Subject: Re: [PATCH v1] ASoC: meson: axg-fifo: set option to use raw spinlock
Message-ID: <2b16b95e-196e-4d8a-98c3-3be568cdd18a@sirena.org.uk>
References: <20240729131652.3012327-1-avkrasnov@salutedevices.com>
 <1ja5i0wags.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
In-Reply-To: <1ja5i0wags.fsf@starbuckisacylon.baylibre.com>
X-Cookie: List was current at time of printing.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_074446_815032_9F0F05BD 
X-CRM114-Status: GOOD (  11.66  )
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
Content-Type: multipart/mixed; boundary="===============4900248932619848046=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============4900248932619848046==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2XEkMrvS0Bz782eU"
Content-Disposition: inline


--2XEkMrvS0Bz782eU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 29, 2024 at 04:15:31PM +0200, Jerome Brunet wrote:

> Maybe mmio regmap should '.use_raw_spinlock = true' by default when
> '.fast_io' is set ?

> Mark, what is your opinion on this ? I guess it is not the first time
> this occurs ?

I don't recall this coming up much TBH.  It may be that people just set
raw spinlocks when they need it, or that there's not many people using
relevant devices with RT kernels.

--2XEkMrvS0Bz782eU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmanqtUACgkQJNaLcl1U
h9CHbAf/QzKprEIGtlybUxTku0YVZcAyep64Z+8aqLmUDAfk4G0fPQ8c/sghHsJ+
NlkYK9n5h4eVGX0XEcU0Gh1ScYM6rBG0Xn2iHzN+6RynQTy2jUwCGeNP5HqkZ0H9
GpQgDqYAoslZ86VjMS04UrpgvrzTUz8B0iS3xgAf2E65lLR44GkZXIDtcjSm2/XV
Y3wjjPjiD6km5Y2Z+C0b0Gk2/5jka1JWGk7f4vDnLJKANam8hC7F5500PVV/TY57
xFSlsxbh3qBpCqDPHx/Fpcp3tXpNjVyTRP3LRWGQ1AP9PBXe6/932SYV83k+0r60
lqoZkKKHkfVlHKnHfhfWuswMCX6bAQ==
=187k
-----END PGP SIGNATURE-----

--2XEkMrvS0Bz782eU--


--===============4900248932619848046==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4900248932619848046==--

