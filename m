Return-Path: <SRS0=R/Kg=GD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D133C433E0
	for <linux-amlogic@archiver.kernel.org>; Thu, 31 Dec 2020 09:40:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09E0F20795
	for <linux-amlogic@archiver.kernel.org>; Thu, 31 Dec 2020 09:40:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09E0F20795
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ucw.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=V2XhO8swU8OFV7Ei1HhxLqt/hi9zFZYKm8wU6g13yi4=; b=bQcg9RRctvG46HQMk3ku1wJvG
	M5nFGQd85qWw8CKn240C+yrNPho7t8HuMVVSO8jo1vM9oOMdPUUeA5BW832O7dfWXjUaYjKJ+q+Nf
	XmeisEfXTd0BiFiYQES4juUS33asQ5/Cm8di1UGNt4/ltJzxKm4VRf3A3PYCxVmcbbpc/7yMx8c5L
	r25d8UQiJ0VmfbxykXQOgKcxz3aILYjlH3qTvp6MMWXmp1vU8QQdceSMyeeB9IIbcuBzKawacQtEI
	9NhKUI7rwZNxthnWDmZZjzgFff/kaeghtQk8OxGFeQZPET2Uy4b9yZfXemqF4YMnjhZ8p3z8xlpsh
	iJScirVkQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kuuR0-00055S-Sr; Thu, 31 Dec 2020 09:39:54 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kuuQx-00054n-9J; Thu, 31 Dec 2020 09:39:53 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 9BFEC1C0B77; Thu, 31 Dec 2020 10:39:46 +0100 (CET)
Date: Thu, 31 Dec 2020 10:39:45 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v9 1/4] dt-bindings: mfd: Fix schema warnings for pwm-leds
Message-ID: <20201231093945.GA22962@amd>
References: <20201228163217.32520-1-post@lespocky.de>
 <20201228163217.32520-2-post@lespocky.de>
 <20201230185439.GC25903@duo.ucw.cz> <20201231083317.GB4413@dell>
MIME-Version: 1.0
In-Reply-To: <20201231083317.GB4413@dell>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201231_043952_237293_14CC3539 
X-CRM114-Status: GOOD (  13.94  )
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Alexander Dahl <ada@thorsis.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Alexander Dahl <post@lespocky.de>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 Jeff LaBundy <jeff@labundy.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-leds@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============8958511855142120845=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============8958511855142120845==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZPt4rx8FFjLCG7dd"
Content-Disposition: inline


--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > The node names for devices using the pwm-leds driver follow a certain
> > > naming scheme (now).  Parent node name is not enforced, but recommend=
ed
> > > by DT project.
> > >=20
> > >   DTC     Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml
> > >   CHECK   Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml
> > > /home/alex/build/linux/Documentation/devicetree/bindings/mfd/iqs62x.e=
xample.dt.yaml: pwmleds: 'panel' does not match any of the regexes: '^led(-=
[0-9a-f]+)?$', 'pinctrl-[0-9]+'
> > >         From schema: /home/alex/src/linux/leds/Documentation/devicetr=
ee/bindings/leds/leds-pwm.yaml
> > >=20
> > > Signed-off-by: Alexander Dahl <post@lespocky.de>
> > > Acked-by: Jeff LaBundy <jeff@labundy.com>
> > > Acked-by: Rob Herring <robh@kernel.org>
> >=20
> > Thanks, applied.
>=20
> Sorry, what?
>=20
> Applied to what tree?

I took it to (local copy) of leds-next tree on. But now I realised it
is mfd, not a LED patch, so I undone that. Sorry for the confusion.

Anyway, patch still looks good to me:

Acked-by: Pavel Machek <pavel@ucw.cz>
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--ZPt4rx8FFjLCG7dd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl/tnGEACgkQMOfwapXb+vL2VgCgjU5/nc2bmfwpIcF1pD2ZODxv
cMgAnR+qCehDZ4rG7JzcCf8qqHL+x3Wu
=uRXv
-----END PGP SIGNATURE-----

--ZPt4rx8FFjLCG7dd--


--===============8958511855142120845==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============8958511855142120845==--

