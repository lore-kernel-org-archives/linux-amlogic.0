Return-Path: <SRS0=H3eD=OU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEBCEC67839
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Dec 2018 20:37:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE1A82084C
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Dec 2018 20:37:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ezSg706b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE1A82084C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KYsEu4d+QPS214eLyTpRv09OzBlEjYuJDGK1/o8cids=; b=ezSg706bQzGyDu4u8hneH8S/T
	UJ3g5fgR1p/NKuvlZrPOTr7bnpZB3EEc3EWQVWmfyxywQ+6i8lAqTbgWSkTaEoNI2ZMLU60vSk6vk
	0i5OA9tH71zYto4amH3EfCAs3xdgszL1QQ0WR3LWOSR5RG5Xzgro2m0GrGOJo/rtOyRBKfxO28fQT
	l92O6tHg5++M/UWv2JVXEuj74fCI7LIIVJf+M/JV7PmWcRcRT7Th6DEveA4BvDY0WhbHw4dsw7fNl
	QVx/iN2iz/wjqGzsoiRNb62FCqAIML+rsCsDkSXOnhSJqBB4C2fHBEfx2WCssVifSaQNnSYMcYwz9
	vLY5aMKow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gWomB-0002gf-51; Tue, 11 Dec 2018 20:37:07 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWom8-0002ff-L8; Tue, 11 Dec 2018 20:37:06 +0000
Received: from localhost (p54B334A7.dip0.t-ipconnect.de [84.179.52.167])
 by pokefinder.org (Postfix) with ESMTPSA id ACF164C0E90;
 Tue, 11 Dec 2018 21:36:53 +0100 (CET)
Date: Tue, 11 Dec 2018 21:36:53 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Jian Hu <jian.hu@amlogic.com>
Subject: Re: [PATCH 0/2] i2c: meson: add support for Meson G12A SoC i2c
 controller
Message-ID: <20181211203652.rogajl4ajwu7cs6f@ninjato>
References: <1543489197-183181-1-git-send-email-jian.hu@amlogic.com>
 <8a6a204b28523e5a181f9e85dda18fade76a26a3.camel@baylibre.com>
 <b2bceaf4-92ce-92a4-c382-713d29ae3b70@amlogic.com>
MIME-Version: 1.0
In-Reply-To: <b2bceaf4-92ce-92a4-c382-713d29ae3b70@amlogic.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181211_123704_840722_052D16EE 
X-CRM114-Status: UNSURE (   7.21  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 Hanjie Lin <hanjie.lin@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
 linux-i2c@vger.kernel.org, Carlo Caione <carlo@caione.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: multipart/mixed; boundary="===============1478254805742828322=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============1478254805742828322==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="r6j4ocolv5vcwqhy"
Content-Disposition: inline


--r6j4ocolv5vcwqhy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> I am okay if it is reasonable below in file
> arch/arm64/boot/dts/amlogic/meson-g12a.dtsi. I2c controller node just uses
> axg's compatible.
>=20
> 			i2c0: i2c@1f000 {
> 				compatible =3D "amlogic,meson-axg-i2c";

Actually, you should have

	compatible =3D "amlogic,meson-g12a-i2c", "amlogic,meson-axg-i2c";

in the DT to have support for future SoC specific additions. And then,
patch 1 is needed.

Or do you handle this differently? I'd think this is DT standard.


--r6j4ocolv5vcwqhy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlwQH+QACgkQFA3kzBSg
KbYghA//e+Y8jxdhjD74FHRwHJedpaaTeb8kDXLWeywBEDsZikyyg521dDLFYodO
1fm88aVcj21Of70l3aXd5XlRUndSa701Rm/JStWJR6xgHY1wmU0MiuUAINO3XvbE
90yyjh5gVOonytSaEM1at5rvgsuMknBPDWigRNEbPfQkXckMYyh+Ini2nAvKs5ZB
GZUNMt1JZcKRdd599coNfhuKPQAxp+SmikdPBJ+H9RSm58IyU8iitPw9AR6JesMM
7ihWoNOC5REbI8CzCKlYTFM0J8ppRnpJfzAkDKDl18V147TAmXVBQ+hPSDKfTxYH
VbtZQ9AUPUawMWhTVmt7ZsZuZPmOoPjccsLo+nWqz/db/JDyhyMzjY/46AWl37U2
b6H55meUJyPVf/AKDY67ey/DpjA00C6URXkOLCelW0vV4qy71hzYgMXGGJ3yWdwi
4NmJtPpqax3st/K2/mwDQc4humJ+4FeLw9OREsLhdOw++3fRkYr8ZrysJDmNH7yS
h5cgVTGqE0rtCt9sct8Om88gut//78pusStosThw+nwHbTOL5gsK405OrSQFoe2N
nitfLq2ISw/njOwajTWSgdUcWa9kkwmTk/UixXjBe8r5VEiv32qmt/Q/K8vmyDES
O9MOHcWu3slySjEBzXQs519PblIQJCYgUdHVaXwuIStWkHpkO1k=
=Uiz1
-----END PGP SIGNATURE-----

--r6j4ocolv5vcwqhy--


--===============1478254805742828322==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============1478254805742828322==--

