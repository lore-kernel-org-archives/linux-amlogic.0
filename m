Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E9BEB64D9
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Jul 2023 17:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zg8UOTPIVhkYiNND22NRAddKDxef77ZUNYYbiyJVZak=; b=x+AFCrAeKmT5s9DBGcL5W0Z2Ir
	uP/le5t6Lrxl5FuKYQAkUM/js1ek7wrtO7PCrf3kzyP2/gsLE9P+0go6Wgy2+ntxDgnvKx0J4oP0r
	dDCVtHKFNruLeQemUbeHdsU1MDY3A//MUqHgYOOmH/b3u10hwvBAqfEzzXtL8HyB30cns/IKNqY2K
	vLxuLpA5nn92mBdnD9y7BTyAAeNSQDIUKYZAFNclAnoo6W18LxQXEQ2B/OVgckpI5aIrzwmQc891O
	x8RIVOEinMoA2vmjNKVrCSb38M+MOw95l+sqqX9wxxJpLkqyNSEEa4+gk4miBuu9hTfE745ndBA0z
	ZtxPA9uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGjYF-00Dtzx-2v;
	Tue, 04 Jul 2023 17:10:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGjYD-00DtzX-2k;
	Tue, 04 Jul 2023 17:10:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4EEDC61305;
	Tue,  4 Jul 2023 17:10:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22D70C433C8;
	Tue,  4 Jul 2023 17:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688490652;
	bh=8Dr/7AdunY9Rh66EGYBdO6pdEuVWqkq1brkfB1efLMM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=spDp7NPZHlvHh8f8/hg7JANXwWf/A8Jb3ygxaIrl7kIgexT9jjiuSMxasIY6gf9k5
	 0uc296A9hDKKK9E7uZ9P+WJKxVefn95W+Httd683yp42N0+gZNPaT745DR3MJRggpt
	 J2BUMm6251psBOWBCz1+Xgv58q9CuWkJohZZZliAIoL7E5xvCXsfMOmYF8oDkd7KtP
	 IgMshHbvODfuuUyNMZxpPd+d0VRtuyifYk5ukDQzI8rc5vloiLq8vxjTsO4yxM5tpg
	 MXXl3yrAuSJUS03QaSoHwE3flhU5m6AUkddU15Pbrxn1LQnZWAJYmpEHwQ7qiDievD
	 bu5YEfhD3AW4w==
Date: Tue, 4 Jul 2023 18:10:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: gregkh@linuxfoundation.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	neil.armstrong@linaro.org, jbrunet@baylibre.com,
	jirislaby@kernel.org, khilman@baylibre.com,
	martin.blumenstingl@googlemail.com, kelvin.zhang@amlogic.com,
	xianwei.zhao@amlogic.com, kernel@sberdevices.ru, rockosov@gmail.com,
	linux-amlogic@lists.infradead.org, linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 5/5] arm64: dts: meson: a1: change uart compatible
 string
Message-ID: <20230704-staff-smilingly-401b99e28edd@spud>
References: <20230704135936.14697-1-ddrokosov@sberdevices.ru>
 <20230704135936.14697-6-ddrokosov@sberdevices.ru>
 <20230704-cannabis-cannon-19397cd806bc@spud>
 <20230704170843.wksxekltre2ob4en@CAB-WSD-L081021>
MIME-Version: 1.0
In-Reply-To: <20230704170843.wksxekltre2ob4en@CAB-WSD-L081021>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_101053_953378_418B33E1 
X-CRM114-Status: GOOD (  18.00  )
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
Content-Type: multipart/mixed; boundary="===============4261560061729545047=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============4261560061729545047==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3ZqyNyARjhPwp6q6"
Content-Disposition: inline


--3ZqyNyARjhPwp6q6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 04, 2023 at 08:08:43PM +0300, Dmitry Rokosov wrote:
> On Tue, Jul 04, 2023 at 06:02:58PM +0100, Conor Dooley wrote:
> > On Tue, Jul 04, 2023 at 04:59:36PM +0300, Dmitry Rokosov wrote:
> > > In the current implementation, the meson-a1 configuration incorporate=
s a
> > > unique compatibility tag "amlogic,meson-a1-uart' within the meson-uart
> > > driver due to its usage of the new console device name "ttyS".
> > > Consequently, the previous compatibility tag designated for the
> > > 'amlogic,meson-gx-uart' configuration has become obsolete and is no
> > > longer relevant to the current setup.
> >=20
> > I don't really see why you would remove the gx-uart to be honest, and
> > not use it as a fallback. Neil's platform though, so his call :)
> >=20
>=20
> Because of amlogic,meson-gx-uart has legacy devname, we do not want to
> use it in the A1.

Which I did read in your commit message, fallback being the operative
word here.

--3ZqyNyARjhPwp6q6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKRSlgAKCRB4tDGHoIJi
0q1CAQCJDaZX5TQ96AtLIC2BAMcsEl3+ACdSRUZh8O6dA4AmVQD5AT3UxCGqKIP8
MQ0E7A15dvDYTT1+a0WE9Zuf+uLlkg4=
=BCBN
-----END PGP SIGNATURE-----

--3ZqyNyARjhPwp6q6--


--===============4261560061729545047==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4261560061729545047==--

