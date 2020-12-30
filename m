Return-Path: <SRS0=S7dH=GC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 844ACC433DB
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Dec 2020 18:55:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C68A622242
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Dec 2020 18:55:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C68A622242
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ucw.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ohoKps8w/uuIqJiBv6tsZ51IdkDGAnDNy1PKCbshV2E=; b=oJWwV2bls54hFQb0GSMFKe1F7
	FqDLEihe1RsU4sLlRA9Qa+ucHlG3scYOf+cW4tKn0oeQqotl5dXN3trRAffhbB+inhQZ+lsuJWLnD
	fj5weDFWtTZvDpTyFxPwo69smFye4AB3W4VXg9ZTi2yrLOo9W7Z+kJMJ0O7PAL63lHx6vArgXDqHa
	U2MEPUOhR9qzMWX/I7aL47PIFeJCIvBpAin4P4khsvqmAp0VABqIa7D5QoH7VCnOm5Hb0vNhRDDQQ
	UMcLuDkACdwjJmrhtuZQygTZxAFcF9GMej03ANKyXz/9teY+b+BBAIXEtjcsPA5MRu9EXu7aBxLrw
	PPD+QKFbA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kugcW-0001Jt-4n; Wed, 30 Dec 2020 18:54:52 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kugcT-0001J9-E7; Wed, 30 Dec 2020 18:54:50 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 1838D1C0B79; Wed, 30 Dec 2020 19:54:40 +0100 (CET)
Date: Wed, 30 Dec 2020 19:54:39 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Alexander Dahl <post@lespocky.de>
Subject: Re: [PATCH v9 1/4] dt-bindings: mfd: Fix schema warnings for pwm-leds
Message-ID: <20201230185439.GC25903@duo.ucw.cz>
References: <20201228163217.32520-1-post@lespocky.de>
 <20201228163217.32520-2-post@lespocky.de>
MIME-Version: 1.0
In-Reply-To: <20201228163217.32520-2-post@lespocky.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201230_135449_609914_77125E93 
X-CRM114-Status: UNSURE (   9.30  )
X-CRM114-Notice: Please train this message.
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
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, Jeff LaBundy <jeff@labundy.com>,
 Lee Jones <lee.jones@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-leds@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============3380432628615507203=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============3380432628615507203==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/e2eDi0V/xtL+Mc8"
Content-Disposition: inline


--/e2eDi0V/xtL+Mc8
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
> Acked-by: Jeff LaBundy <jeff@labundy.com>
> Acked-by: Rob Herring <robh@kernel.org>

Thanks, applied.
								Pavel
							=09
--=20
http://www.livejournal.com/~pavelmachek

--/e2eDi0V/xtL+Mc8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX+zM7wAKCRAw5/Bqldv6
8sT8AJ4sSbkyvZGGUOSissG3vFkVRFGtRQCff5oybsiqQBdqq0XQhBEAK+ofAG8=
=bqv7
-----END PGP SIGNATURE-----

--/e2eDi0V/xtL+Mc8--


--===============3380432628615507203==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============3380432628615507203==--

