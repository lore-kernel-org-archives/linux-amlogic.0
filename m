Return-Path: <SRS0=Xszf=CZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B64A5C433E2
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Sep 2020 17:05:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37A41206BE
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Sep 2020 17:05:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ManU1KKS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37A41206BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jyL9rRc3N7qWgPcgFqzyUU/qadC8duc8i4R/oWrNB6w=; b=ManU1KKSXNAtUem8UprbPJ1E8
	reZFZdO8QD+iijYIjjZlpf8fobgQzRg/N7suOGRyi+NG3D1VezwEBAY0v32jMGRT3WJXz5nQ6iC1Q
	h2lNYoaBc1wKTbPtZ7w0Hnp00T1C4GAI0Yq5QzXHgpBh4dYoHMp00Qw09O3fNtVBISn7G5++pQTZl
	HB58AxMteh8LtI0kjK404jeqaWtyqZLqE/5VyiqATgkfTD+X/GobRy0BFJIeyfnthEKrfO2Jpnjjk
	lIyCJ0hzpn2PyAL7FzPHBlddWYLNXqZYsQ+TUNDcuDA8t1pf37MoLVV5N/UOs0sDXgkU8bUO553iq
	l/3PZdhuQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIas1-0004hP-2P; Wed, 16 Sep 2020 17:05:25 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIary-0004gQ-Jx; Wed, 16 Sep 2020 17:05:23 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 9357629166C
Date: Wed, 16 Sep 2020 13:05:16 -0400
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 0/3] drm/panfrost: add Amlogic integration quirks
Message-ID: <20200916170516.GB2543@kevin>
References: <20200916150147.25753-1-narmstrong@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20200916150147.25753-1-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200916_130522_738264_B8A374BD 
X-CRM114-Status: GOOD (  14.19  )
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
Cc: robh@kernel.org, tomeu.vizoso@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============3318413631434225001=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============3318413631434225001==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="61jdw2sOBCFtR2d/"
Content-Disposition: inline


--61jdw2sOBCFtR2d/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

series r-b, nice!
On Wed, Sep 16, 2020 at 05:01:44PM +0200, Neil Armstrong wrote:
> The T820, G31 & G52 GPUs integrated by Amlogic in the respective GXM, G12=
A/SM1 & G12B
> SoCs needs a quirk in the PWR registers at the GPU reset time.
>=20
> This serie adds the necessary quirks for the Amlogic integrated GPUs only.
>=20
> Changes since v1 at [1]:
> - removed the BROKEN_SH quirk after [2] was sent by robin
> - rebased on top of [3] by steven and moved the vendor quirk in the prope=
r quirk function
> - added PWR_KEY unlock definition, and cleaned definition
>=20
> [1] https://lkml.kernel.org/r/20200908151853.4837-1-narmstrong@baylibre.c=
om
> [2] https://lkml.kernel.org/r/cover.1600213517.git.robin.murphy@arm.com
> [3] https://lkml.kernel.org/r/20200909122957.51667-1-steven.price@arm.com
>=20
> Neil Armstrong (3):
>   drm/panfrost: add support for vendor quirk
>   drm/panfrost: add amlogic reset quirk callback
>   drm/panfrost: add Amlogic GPU integration quirks
>=20
>  drivers/gpu/drm/panfrost/panfrost_device.h |  3 +++
>  drivers/gpu/drm/panfrost/panfrost_drv.c    | 11 +++++++++++
>  drivers/gpu/drm/panfrost/panfrost_gpu.c    | 15 +++++++++++++++
>  drivers/gpu/drm/panfrost/panfrost_gpu.h    |  2 ++
>  drivers/gpu/drm/panfrost/panfrost_regs.h   |  4 ++++
>  5 files changed, 35 insertions(+)
>=20
> --=20
> 2.22.0
>=20

--61jdw2sOBCFtR2d/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl9iRcwACgkQ/v5QWgr1
WA16Ww//cCG6HDblemm8T2W/m5FqeFuVtTwp2eNVCNN2pyJPT9FzLLtGMWPeAozs
6c4+3NCIJJX9ysEz9L1q5g7a5DbaN+4C7Z6FRJ3Ss1sNi/PmAlh0donBt5oiHAyJ
hptyz1bSM7ZyUDYuH564so9MpQRaBcR7Iz1gexVyhDO8Yi/rG133BgPOQ30EokTy
Kj42cVrmGxQg8rb64NTlDLf3nOYmSSWQN5z87v1mFMEzeZCWmm7gtbOicSQ8xV8a
xqCrm6he8ZHE6/3Ddmkw/IBeRrpD20d7TTcnzsvYtJeIGhTwzmlF8i/3ULYNsVvn
lCP7TMXxv50LUZM96wgSXetEOmZVDAWQG11Dxr7pTBx/DqYHOiGrqjqN87+g6wK7
TFsb4HbJRYguALvLaxLFhLUlMExYuiXJFkAYULJ/YudmVhBRwl/ZZfYNjeAyjzPd
TZ+aWkMrLaf3tXwV2h73EiqGrMb/48AJzOxntUCz9dFmEqPZLmjcX3uHb1HbYsdK
RdcIGA6Lr4M8ImKmBzJPnJ5G0QWFM2JzZAFWoiZvAEk2vSIHx2Tcou1zGXzJF6oH
O/jXUB8CL3D+lCF8z4eDv77dTiZ/W1qlTJmpQ2aFx4Kf3Q/sS4R+MG0e168cOGK4
yfGXfv1CWz9wPd4GSgcSed+SYWMqKzGGL0LCDgtdoEiez2X+KLA=
=7+0X
-----END PGP SIGNATURE-----

--61jdw2sOBCFtR2d/--


--===============3318413631434225001==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============3318413631434225001==--

