Return-Path: <SRS0=4PA2=DP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E087C43467
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Oct 2020 07:50:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E59392184D
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Oct 2020 07:50:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QqrzIYXK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E59392184D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ucw.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=F6xTNmcINVbO1dL7/nsu/Vc/9glqdFZgYoz5qjIkrLs=; b=QqrzIYXKEfgSPQj6CLJq2nfXv
	WXkI7C4bl4Z77ZtVwsTTgCzk74vxq4XWu2E2FrxgOIDEc9qFhuV6Qzstt80uuosXMEy88wYcC6PG8
	DHlKcBdMGUX+2N8HdBUh0sTlBJg/ooU4V8VqaxkSVtvG0F6GbYHI1hbhnD4Oj1S37cjCYQ8gPUaIv
	x3p5WPkdo/at2ibgP/CmcdjcLRbxRNhvsHrA/mQQTwtHA/brclXHlUIVZ2hLsL4fYPPKHvfH8Dzgm
	+RvCv4LUmljG3M9rTILND5UABg15nGD5zp28Rj/suXuAGm2X/Yr3MyxiPcDBv9f6VvePg4wwwFWc7
	uhOMoffwA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQQhN-0000dn-9T; Thu, 08 Oct 2020 07:50:49 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQQhK-0000cp-Bs; Thu, 08 Oct 2020 07:50:47 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 3146E1C0BA4; Thu,  8 Oct 2020 09:50:42 +0200 (CEST)
Date: Thu, 8 Oct 2020 09:50:40 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v7 03/12] dt-bindings: mfd: Fix schema warnings for
 pwm-leds
Message-ID: <20201008075039.GA32424@amd>
References: <20201005203451.9985-1-post@lespocky.de>
 <20201005203451.9985-4-post@lespocky.de>
 <20201007100359.GC12224@duo.ucw.cz> <20201008073337.GG1763265@dell>
MIME-Version: 1.0
In-Reply-To: <20201008073337.GG1763265@dell>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201008_035046_525080_91BD6537 
X-CRM114-Status: GOOD (  16.29  )
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, Alexander Dahl <ada@thorsis.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mips@vger.kernel.org, Jeff LaBundy <jeff@labundy.com>,
 Alexander Dahl <post@lespocky.de>, Dan Murphy <dmurphy@ti.com>,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>
Content-Type: multipart/mixed; boundary="===============2710758415407632360=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============2710758415407632360==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+QahgC5+KEYLbs62"
Content-Disposition: inline


--+QahgC5+KEYLbs62
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
> >=20
> > Okay, so I need Rob's ack here, I guess... and rest of the series is
> > not really for my tree.
>=20
> This patch is not for your tree either. ;)

Ah, right. Usually we have one patch series for one maintainer...

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--+QahgC5+KEYLbs62
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl9+xM8ACgkQMOfwapXb+vJWHQCcCGr6snOGoT8t/94nyB5nrCBQ
3PEAoL/19wb0n+FwjiISjFGYYOVWW1eO
=WTE5
-----END PGP SIGNATURE-----

--+QahgC5+KEYLbs62--


--===============2710758415407632360==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============2710758415407632360==--

