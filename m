Return-Path: <SRS0=JUPl=DO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 724C3C4363C
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Oct 2020 10:02:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB6AE20870
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Oct 2020 10:02:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I2kfiXNT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB6AE20870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ucw.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lPe6JwkmjcYxl4NNUtBAIJ4BEcLSaVp1twtOQJnLfxQ=; b=I2kfiXNThddUdHJT+BErqhcbJ
	+O3zbMxV0pEpSAyS2dk8YDkhVvK0yYtaWEcwI+gSQp9b6vf4+h5deTzp8j4uQNJyUCoOwR4m8uFH5
	cH5v3ejIKpUfripwz4BJW7FTq9vzve7O0H1cu2lsUUPHk6cP+TK8S5JkpHI6U9ORLNcl/rEySbpKR
	cdXpnuLYCxjZdPvQ7mYn/5Pc3pXUuudK1jRoC0pG8ZDLKRzJoiYoO5MBajYO+GiKj8LPYsGi/UbBk
	xG/ca1MK/7FiqvaVyhmkJ53U+rJHKlLk5eFUBEkZ1BFR0CqzCET105cuRaOadsXJoNGq0K6p+7sq8
	YKhpkBr/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQ6H7-0007Au-3W; Wed, 07 Oct 2020 10:02:21 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQ6H4-00079r-K9; Wed, 07 Oct 2020 10:02:19 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id A47C41C0B7A; Wed,  7 Oct 2020 12:02:13 +0200 (CEST)
Date: Wed, 7 Oct 2020 12:02:13 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Alexander Dahl <post@lespocky.de>
Subject: Re: [PATCH v7 02/12] dt-bindings: leds: Convert pwm to yaml
Message-ID: <20201007100213.GA12224@duo.ucw.cz>
References: <20201005203451.9985-1-post@lespocky.de>
 <20201005203451.9985-3-post@lespocky.de>
MIME-Version: 1.0
In-Reply-To: <20201005203451.9985-3-post@lespocky.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201007_060218_771309_BCE5BF82 
X-CRM114-Status: GOOD (  14.62  )
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
 linux-samsung-soc@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Alexander Dahl <ada@thorsis.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-mips@vger.kernel.org,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Russell King <linux@armlinux.org.uk>,
 Rob Herring <robh+dt@kernel.org>, Dan Murphy <dmurphy@ti.com>,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>
Content-Type: multipart/mixed; boundary="===============2873649107461151198=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============2873649107461151198==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="y0ulUmNC+osPPQO6"
Content-Disposition: inline


--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2020-10-05 22:34:41, Alexander Dahl wrote:
> The example was adapted in the following ways:
>=20
> - make use of the now supported 'function' and 'color' properties
> - remove pwm nodes, those are documented elsewhere
> - align node names to new dt schema rules and dt recommendations
>=20
> License was not explicitly set before.  The license set now is
> recommended by DT project.
>=20
> Suggested-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Signed-off-by: Alexander Dahl <post@lespocky.de>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
> Cc: Russell King <linux@armlinux.org.uk>
> ---
>=20
> Notes:
>     NOTE: Due to license set/change this needs Acked-by or Signed-off-by =
=66rom:
>       * Peter Ujfalusi
>       * Russell King

Russell King authored two lines of the documentation. He can state
objections now, but I'll not wait for his Acked-by.

>     That was discussed already with Peter (original author), still waiting
>     for Acked-by though =E2=80=A6

If Peter was okay with license change, I guess we can continue here.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--y0ulUmNC+osPPQO6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX32SJQAKCRAw5/Bqldv6
8ih1AKC89CUSap/s2xV4Q89wc/i22r49KACcDa86v1lffE+ltjBCel8iiRX1DGs=
=H5CR
-----END PGP SIGNATURE-----

--y0ulUmNC+osPPQO6--


--===============2873649107461151198==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============2873649107461151198==--

