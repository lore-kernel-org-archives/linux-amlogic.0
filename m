Return-Path: <SRS0=JUPl=DO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18D51C4363C
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Oct 2020 10:04:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB6AE20870
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Oct 2020 10:04:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PnmEM2/G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB6AE20870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ucw.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rLZhoAFsv770s/lsW8SXbHnFHAjdU0l2cjKSgXfviVY=; b=PnmEM2/GHcm5cTec+5nWwlWKz
	StelYM6afpUtrsbigMA4Vd+l66H/roztF3akcdfUIsWki4OFBc3Aw4IxFGsrYQfRc7XrYvkAtJ0Z8
	kQ6kEeqx1qdEbpH+/rdKDtRvXhAOHJmUhedKR7I/Nch4p/6injbDK/jPMexH+hQXaxNrt331Zrf8w
	WYoZmL46O6vSB3+0JwNZDfHNRF0iChf1ufjJ92L1VV5zxJH4rpL9wp1FXh2XMlIEWkeXhbPcFMZdb
	nJ+ArYUDrXKyIAWFr66SvX1HsYLstzlVNEgX5ofvbyV4ofp5ONSpNh9B0KWV0yxi4Fy66L/p0tzTw
	jojX7L4UQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQ6Ir-0007Ym-SN; Wed, 07 Oct 2020 10:04:09 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQ6Il-0007Vu-65; Wed, 07 Oct 2020 10:04:04 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 2F2FE1C0B7A; Wed,  7 Oct 2020 12:04:00 +0200 (CEST)
Date: Wed, 7 Oct 2020 12:03:59 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Alexander Dahl <post@lespocky.de>
Subject: Re: [PATCH v7 03/12] dt-bindings: mfd: Fix schema warnings for
 pwm-leds
Message-ID: <20201007100359.GC12224@duo.ucw.cz>
References: <20201005203451.9985-1-post@lespocky.de>
 <20201005203451.9985-4-post@lespocky.de>
MIME-Version: 1.0
In-Reply-To: <20201005203451.9985-4-post@lespocky.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201007_060403_369298_A2268585 
X-CRM114-Status: GOOD (  10.94  )
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
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 Jeff LaBundy <jeff@labundy.com>, Rob Herring <robh+dt@kernel.org>,
 Dan Murphy <dmurphy@ti.com>, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>
Content-Type: multipart/mixed; boundary="===============5000993421852479034=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============5000993421852479034==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/Uq4LBwYP4y1W6pO"
Content-Disposition: inline


--/Uq4LBwYP4y1W6pO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> The node names for devices using the pwm-leds driver follow a certain
> naming scheme (now).  Parent node name is not enforced, but recommended
> by DT project.
>=20
>   DTC     Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml
>   CHECK   Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml
> /home/alex/build/linux/Documentation/devicetree/bindings/mfd/iqs62x.examp=
le.dt.yaml: pwmleds: 'panel' does not match any of the regexes: '^led(-[0-9=
a-f]+)?$', 'pinctrl-[0-9]+'
>         From schema: /home/alex/src/linux/leds/Documentation/devicetree/b=
indings/leds/leds-pwm.yaml
>=20
> Signed-off-by: Alexander Dahl <post@lespocky.de>

Okay, so I need Rob's ack here, I guess... and rest of the series is
not really for my tree.

Best regards,
								Pavel
							=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--/Uq4LBwYP4y1W6pO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX32SjwAKCRAw5/Bqldv6
8j2vAKCrp2lJsTwvDpUEUfMmPs/16q8FEwCeMqObBKksCi7uVCLOO12E0DIPrBo=
=7lMU
-----END PGP SIGNATURE-----

--/Uq4LBwYP4y1W6pO--


--===============5000993421852479034==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============5000993421852479034==--

