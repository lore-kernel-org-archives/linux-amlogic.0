Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1718F8FA90
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Apr 2026 17:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nokw76TdqJblibx4x3gsMS3TFClKpqwa7y2yXBul6h8=; b=Tr2Ih2BGLWzQysXfK64X1hBe1h
	EU7HGLEO/0QwNfDCJH+/nWxqWW7Y8CVVxTuoJl4z32bT/zMFumL5yZotoSxJd+SuGaC7kcWkAejwE
	3RwHt+t5SWDMPm82qLSkqkpXZ8CKFN21tqtH0COPTlyo1f3y9JfMu8BYoR2iarKpeNuQuRZ+xod4h
	LiYdZxsEHFK4RX/Q+Qb1skUAFuBNG2b6yHPjCLXlG0g2yGTlAeZNl+fU0wnEdzSXRQ0pYHTg4iZqF
	+A74CjM6MP7uRBMySvpLr2ITRgNyVj7qjeZx1iPfrqcBeEF7QNk3yjiLDrPdEzDoCV1EDoiKrdmGk
	FDoQRBSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFEfG-00000008xM3-40fp;
	Tue, 21 Apr 2026 17:13:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFEfF-00000008xLP-3P79;
	Tue, 21 Apr 2026 17:13:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 46C6560142;
	Tue, 21 Apr 2026 17:13:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6678C2BCB0;
	Tue, 21 Apr 2026 17:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776791613;
	bh=juy8vvjaKj7ECiU5zZaw/79uupGBeCVQesLH9Ly/Iqk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CggrhaXrPlLHxH33w4Vl5GjAA8kyLeFV2zJFGFl5V5/45vR6+hGLuMbwHutCH/tHH
	 y91PN4z5UobOB1dMuOWkSbpAGzTNZagfr/Wv8yxvvDY8mV9oSNsPIC01Fh/FAyy1xC
	 GDItMWb+DgM7vqFTsMsI5fr8Pi+Ybgj60k+lTnAqILsztOGEdlQPy9rZ47a0JG9nbw
	 mdVFdxzVkUNMbQ8/cVLe0h6f+p9CiYdEuh6KoytCa4O7aw3itST6km3sk7F/xP9F/p
	 oitdsr7Nn2WZx0WJfXh5zrOS8jlAGeWHZz7r1ndEsjC81VVzA0DOj3+hYE27oXxdUq
	 6LJksxHkZleiA==
Date: Tue, 21 Apr 2026 18:13:28 +0100
From: Conor Dooley <conor@kernel.org>
To: christian.koever-draxl@student.uibk.ac.at
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	neil.armstrong@linaro.org, khilman@baylibre.com,
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: amlogic: add support for
 Amediatech X98Q
Message-ID: <20260421-scribing-paternal-e855cdee5944@spud>
References: <20260421155328.26359-1-christian.koever-draxl@student.uibk.ac.at>
 <20260421155328.26359-2-christian.koever-draxl@student.uibk.ac.at>
MIME-Version: 1.0
In-Reply-To: <20260421155328.26359-2-christian.koever-draxl@student.uibk.ac.at>
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
Content-Type: multipart/mixed; boundary="===============5509861563332096858=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============5509861563332096858==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4Xt2J/yWb1gzAPTi"
Content-Disposition: inline


--4Xt2J/yWb1gzAPTi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 05:53:27PM +0200, christian.koever-draxl@student.ui=
bk.ac.at wrote:
> From: Christian Stefan K=F6v=E9r-Draxl <christian.koever-draxl@student.ui=
bk.ac.at>
>=20
> Add the board binding for the Amediatech X98Q TV box
>=20
> Signed-off-by: Christian Stefan K=F6v=E9r-Draxl <christian.koever-draxl@s=
tudent.uibk.ac.at>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--4Xt2J/yWb1gzAPTi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeewOAAKCRB4tDGHoIJi
0t9wAQCnOaMRmKZPShx/jet1Ljjx5OwgLBaDjEl3uD1VWrQNdwEAwLrXKr4Ax5A2
ixb69eoU02+OpKk7wIsYjzMrDxpiwwk=
=MSwk
-----END PGP SIGNATURE-----

--4Xt2J/yWb1gzAPTi--


--===============5509861563332096858==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============5509861563332096858==--

