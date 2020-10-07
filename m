Return-Path: <SRS0=JUPl=DO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 763CDC4727F
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Oct 2020 10:03:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 133A92076C
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Oct 2020 10:03:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NpRNIOAB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 133A92076C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ucw.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mxb3yb2ElVOIn8h5ZbXDQDrXY1lXZNygcy9OysKAZ9o=; b=NpRNIOAB/mJz0MUyQ3X4mEboA
	vVEIwNfjA448HxWALz7CGO7DznHhNkWe0wY+YqslHQoOl2FAg6lCffQ7yea3I637ofK7/CY4LevFz
	JHKFWo9KEgZClMinvN48r1YTtQIkTtcJOIHthxdNucQu00JYKp8gA0MsLHexEKChilV/aYxz1SUdI
	tHFmuDdesK5dWQ36Vn/V1l/L8Ku/amA7kbGIg7+4ZMCT/2vrl/QjBhlwk5bRYy+mmbEqHC4vWH24L
	YrbH3ZwNah1+4tM+k2MN0d5mdiHhOmrsZh16XoVqi9UyRhywye8gKCI/YhvIxCwp1jXF7cRD29xaJ
	5ut2lY/cg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQ6I5-0007NL-0D; Wed, 07 Oct 2020 10:03:21 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQ6I2-0007Mc-Rq; Wed, 07 Oct 2020 10:03:19 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id E31CE1C0BAA; Wed,  7 Oct 2020 12:03:17 +0200 (CEST)
Date: Wed, 7 Oct 2020 12:03:17 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Alexander Dahl <post@lespocky.de>
Subject: Re: [PATCH v7 01/12] leds: pwm: Remove platform_data support
Message-ID: <20201007100317.GB12224@duo.ucw.cz>
References: <20201005203451.9985-1-post@lespocky.de>
 <20201005203451.9985-2-post@lespocky.de>
MIME-Version: 1.0
In-Reply-To: <20201005203451.9985-2-post@lespocky.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201007_060319_018756_CFA5C946 
X-CRM114-Status: GOOD (  12.94  )
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
 linux-samsung-soc@vger.kernel.org,
 Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>,
 Alexander Dahl <ada@thorsis.com>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Denis Osterland-Heim <denis.osterland@diehl.com>,
 Rob Herring <robh+dt@kernel.org>, Dan Murphy <dmurphy@ti.com>,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>
Content-Type: multipart/mixed; boundary="===============4743493972991450096=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============4743493972991450096==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="H1spWtNR+x+ondvy"
Content-Disposition: inline


--H1spWtNR+x+ondvy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2020-10-05 22:34:40, Alexander Dahl wrote:
> Since commit 141f15c66d94 ("leds: pwm: remove header") that platform
> interface is not usable from outside and there seems to be no in tree
> user anymore.  All in-tree users of the leds-pwm driver seem to use DT
> currently.  Getting rid of the old platform interface allows the
> leds-pwm driver to switch over from 'devm_led_classdev_register()' to
> 'devm_led_classdev_register_ext()'.
>=20
> Signed-off-by: Alexander Dahl <post@lespocky.de>
> Cc: Denis Osterland-Heim <denis.osterland@diehl.com>
> Reviewed-by: Marek Beh=FAn <marek.behun@nic.cz>

Thanks, applied.

									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--H1spWtNR+x+ondvy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX32SZQAKCRAw5/Bqldv6
8mQ3AJ46WIxuzaEV6SZFdJADbrrWIacz1ACgqTcjyUBA1BTFDmThLaIOxfLcv8Q=
=UNVv
-----END PGP SIGNATURE-----

--H1spWtNR+x+ondvy--


--===============4743493972991450096==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4743493972991450096==--

