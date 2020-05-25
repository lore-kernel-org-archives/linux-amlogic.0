Return-Path: <SRS0=ry3l=7H=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CFFBC433DF
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 May 2020 20:18:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34616205CB
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 May 2020 20:18:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rRd2Nese"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34616205CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ucw.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vuCJ4BUd8DWeKdcG01L9tFkNgMT8DhwWw+/ICQ4uJf0=; b=rRd2NeseGO2yIkVmPCMBmG3tC
	5cdjU0sh4z14cvSd+C84hd+3Iub9yfAZCAgmQEytHOqrqiht7u4tbHtsMCBWjBEf3PaUwPnPFOtgg
	70SGTzJyiNbxPysYfpApY+pknUWFGal+YgJcHjpVy/MdXoPpVwhbW7v/ZUHO9jrBFM+KhYKCBK78M
	lcyy0LDgN+eeQF+mVyePVGSArQhaAGmD5bvoM8UyB4CbTIrl7GCPQJFkWjnm+SMn/jv2ACgtgv3Yo
	DwG7mExjB5KdBMc0iMRDr+5TlIbCZFgaq/ivdGraoaYfPj4dNmg9WZq1pU8CAaGWox10ThX6wpR0G
	5eeI/4njg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdJXl-0006T6-Mg; Mon, 25 May 2020 20:17:53 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdJXi-0006SW-DU; Mon, 25 May 2020 20:17:52 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id D8C551C02CC; Mon, 25 May 2020 22:17:46 +0200 (CEST)
Date: Mon, 25 May 2020 22:17:46 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v3 1/8] dt-bindings: net: meson-dwmac: Add the
 amlogic,rx-delay-ns property
Message-ID: <20200525201746.GA5528@duo.ucw.cz>
References: <20200512211103.530674-1-martin.blumenstingl@googlemail.com>
 <20200512211103.530674-2-martin.blumenstingl@googlemail.com>
 <20200524212843.GF1192@bug>
 <d3f596d7-fb7f-5da7-4406-b5c0e9e9dc3f@gmail.com>
 <20200525090718.GB16796@amd> <20200525135728.GE752669@lunn.ch>
MIME-Version: 1.0
In-Reply-To: <20200525135728.GE752669@lunn.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200525_131750_610339_136FB684 
X-CRM114-Status: GOOD (  10.49  )
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
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 jianxin.pan@amlogic.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-amlogic@lists.infradead.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============6607752021804685181=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============6607752021804685181==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bp/iNruPH9dso1Pn"
Content-Disposition: inline


--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2020-05-25 15:57:28, Andrew Lunn wrote:
> > > standardizing on rx-delay-ps and tx-delay-ps would make sense since t=
hat
> > > is the lowest resolution and the property would be correctly named wi=
th
> > > an unit in the name.
> >=20
> > Seems like similar patch is already being reviewed from Dan Murphy (?)
> > from TI.
>=20
> Dan is working on the PHY side. But there is probably code which can
> be shared.
>=20
> One question to consider, do we want the same properties names for MAC
> and PHY, or do we want to make them different, to avoid confusion?

We have same properties accross different hardware (compatible, reg),
so same property between MAC and PHY seems to make sense.

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXswn6gAKCRAw5/Bqldv6
8i7zAJ4jCAV144tVxiIyf3sNBn1JDz7j+QCgvR80vjeIJZeqGeR77nVrZk4D4ck=
=JqOQ
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--


--===============6607752021804685181==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============6607752021804685181==--

