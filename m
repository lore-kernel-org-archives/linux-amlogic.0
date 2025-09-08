Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E88BCA1016
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Sep 2025 20:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vNGZW3wx22keu9tcemnopGy8tkwC6xrZzetJQqlyWvA=; b=3FyOQHwSK04BxYlL2A1jbvJGIh
	jaAb2OCt3x+7YQ7hDZ786UNLhRI3qyNf3bfHzHucQWlXfaBD/byOpa5IquW+0i9FckLPdmCgR0xTf
	MQQox1+NeCYXz35z0CAM/mMt/P0kcy/FiIHkNertenpfJdRi30G+OwSY3SfGoVd9Buti25Ue4S6HB
	1WGftcfH0a9VY92m+Jnl/QvoJe5Uo7Wyzj+CkeKIg19FwEO72cZaNUQltNAzMszCskLC5wdhB+r6t
	aidZiHfEfao0pqam4cIdiQTOh+kZtHbqxCrXuSuxTox4kYSebLtZJGHvkozmliUX3piEITFmVwkTw
	eE2vfkbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvieE-00000002F9z-1opW;
	Mon, 08 Sep 2025 20:39:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvf9G-00000000wic-1vtY
	for linux-amlogic@lists.infradead.org;
	Mon, 08 Sep 2025 16:55:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A1E96601D4;
	Mon,  8 Sep 2025 16:55:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47313C4CEF1;
	Mon,  8 Sep 2025 16:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757350521;
	bh=N7pBRflNbpZRPZMuii9nwONjoWuvr1R3Jr0vP87Whsg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M2ynJhajh0iJUzWLvuY8fgkhCn//kD7ghrkUA87oVkxkpijFJ66cSd6cYFl3bGqlE
	 JeRDnK9TfGjmRtQh40EXtr5iKATQRpsqjK7MvFN4I9Oa6utDu8QTEqyDUOxdbGsBbD
	 uL0ZDDVwoYOlHYock+ZQd524f+ngfg5Cc6Fr9B8aHDn8/9H1aGBJetlJx0MlDiSV3Q
	 eoUnQ4mBe/v7UkSdYQg74i2k+n4PKfoJczGhwzsLydxxTR/lsphDmshMEMAtD+E4mN
	 zfYllwth+GGOdRZ8QYuUZWCqrR02rCLNCtzWQE7skpwkM094pPOQsrZ5U/TNNvPuJR
	 Awr3dhXofwYsQ==
Date: Mon, 8 Sep 2025 17:55:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liang Yang <liang.yang@amlogic.com>,
	Feng Chen <feng.chen@amlogic.com>, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v4 2/3] spi: amlogic: add driver for Amlogic SPI Flash
 Controller
Message-ID: <e010ff93-574a-45d9-a5dc-0942b3fc90f2@sirena.org.uk>
References: <20250829-spifc-v4-0-1e57fd39f584@amlogic.com>
 <20250829-spifc-v4-2-1e57fd39f584@amlogic.com>
MIME-Version: 1.0
In-Reply-To: <20250829-spifc-v4-2-1e57fd39f584@amlogic.com>
X-Cookie: Parsley
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
Content-Type: multipart/mixed; boundary="===============7406835647066547584=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============7406835647066547584==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PLQf2sl8yZV7v94v"
Content-Disposition: inline


--PLQf2sl8yZV7v94v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 29, 2025 at 01:16:14PM +0800, Xianwei Zhao wrote:
> From: Feng Chen <feng.chen@amlogic.com>
>=20
> This driver provides support for the SPI mode of the Amlogic
> Flash Controller. It supports both SPI NOR flash and SPI NAND
> flash. For SPI NAND, the Host ECC hardware engine can be enabled.

This breaks an x86 allmodconfig build with clang-19 for me:

/build/stage/linux/drivers/spi/spi-amlogic-spifc-a4.c:592:7: error: variabl=
e 'is
_datain' is used uninitialized whenever 'if' condition is false [-Werror,-W=
somet
imes-uninitialized]
  592 |                 if (!buf) {
      |                     ^~~~
/build/stage/linux/drivers/spi/spi-amlogic-spifc-a4.c:601:12: note: uniniti=
alize
d use occurs here
  601 |                                        is_datain ? sfc->info_buf : =
NULL,
      |                                        ^~~~~~~~~
/build/stage/linux/drivers/spi/spi-amlogic-spifc-a4.c:592:3: note: remove t=
he 'i
f' if its condition is always true
  592 |                 if (!buf) {
      |                 ^~~~~~~~~
/build/stage/linux/drivers/spi/spi-amlogic-spifc-a4.c:590:13: error: variab=
le 'is_datain' is used uninitialized whenever 'if' condition is false [-Wer=
ror,-Wsometimes-uninitialized]
  590 |         } else if (op->data.dir =3D=3D SPI_MEM_DATA_OUT) {
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/build/stage/linux/drivers/spi/spi-amlogic-spifc-a4.c:601:12: note: uniniti=
alized use occurs here
  601 |                                        is_datain ? sfc->info_buf : =
NULL,
      |                                        ^~~~~~~~~
/build/stage/linux/drivers/spi/spi-amlogic-spifc-a4.c:590:9: note: remove t=
he 'if' if its condition is always true
  590 |         } else if (op->data.dir =3D=3D SPI_MEM_DATA_OUT) {
      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/build/stage/linux/drivers/spi/spi-amlogic-spifc-a4.c:568:16: note: initial=
ize the variable 'is_datain' to silence this warning
  568 |         bool is_datain;
      |                       ^
      |                        =3D 0
/build/stage/linux/drivers/spi/spi-amlogic-spifc-a4.c:590:13: error: variab=
le 'buf' is used uninitialized whenever 'if' condition is false [-Werror,-W=
sometimes-uninitialized]
  590 |         } else if (op->data.dir =3D=3D SPI_MEM_DATA_OUT) {
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/build/stage/linux/drivers/spi/spi-amlogic-spifc-a4.c:600:38: note: uniniti=
alized use occurs here
  600 |         ret =3D aml_sfc_dma_buffer_setup(sfc, buf, op->data.nbytes,
      |                                             ^~~
/build/stage/linux/drivers/spi/spi-amlogic-spifc-a4.c:590:9: note: remove t=
he 'if' if its condition is always true
  590 |         } else if (op->data.dir =3D=3D SPI_MEM_DATA_OUT) {
      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/build/stage/linux/drivers/spi/spi-amlogic-spifc-a4.c:566:11: note: initial=
ize the variable 'buf' to silence this warning
  566 |         void *buf;
      |                  ^
      |                   =3D NULL
3 errors generated.

--PLQf2sl8yZV7v94v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmi/CnMACgkQJNaLcl1U
h9AFIQf/f76yjg7V+ltEyf/0nt8AgNdYiP6VUdfMQJowsncIUdiTKd13aXljtg9n
d4uzj9vpTGUZaE9CXSKzYoEySvqalTaZ3XvrCYzK1JpMXcvZB1Mk3xVhSCTOlVje
t7o0Iy5enTcG9jN4yuuTxSxA2MOKA/wD+w9HPRL8gWVVa+YKW9vjOv3e0da2pkXC
7ydiS8/kpdAhoaW0Z1ziRwwDr16yeh/9XKSFOd6VDJDEOwL5yVdId9EozmY/SP/L
0TTHSrOf7i5stNtdgnvRd+pyUuw3WTjMc6t2p0JPk44vhnnBD5W6IkLvhVlCqFLz
mI021XiGLDP6F+IorwAhjYyrANfWqA==
=qXe/
-----END PGP SIGNATURE-----

--PLQf2sl8yZV7v94v--


--===============7406835647066547584==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7406835647066547584==--

