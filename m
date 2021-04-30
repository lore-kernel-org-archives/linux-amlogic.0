Return-Path: <SRS0=khaH=J3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72340C433ED
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Apr 2021 10:59:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E01C961400
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Apr 2021 10:59:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E01C961400
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1unZtGXcqsOfGS1prD0ztU5ge+8owJCnpioRFFHIsE4=; b=kjbnamYr0XognNTFIgPk4ti60
	hE70e3kFaZ/j1NmBmvDPClzDu16ByU2CzECErvf9h4ciLppm60AtCsVAl0GvgQ03FrIN4xRwc5euO
	43KkMkMCwBDsuQELDaJh1bItNKLT+8cA469yBVTzrVCbMc5abep6n4KNZHBtm1VZAUY9PRR04KvyL
	gLzK5LtyCM5laEHv5geQXv+v+XyHAsKsBm3nUz9tes0U9zROpBFHUWHisgkILDipICyNBN3Ago+7J
	1Am1BB1OmxqiZfhXEo4p6QtiP11NRwmRWnc47izvODWJCCLRPKSX37nX+CpsHrR7Gr4EJdb3qXAoJ
	fgCdD+oaw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcQs8-007iWz-Su; Fri, 30 Apr 2021 10:59:49 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcQs6-007iWa-5x; Fri, 30 Apr 2021 10:59:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=lpZ0LMIaRVXUuCTnqOTksF5SBwWvKGsoNnKiDD2HYfs=; b=2PPF1NGUyuyw4QExjU9NifWLjH
 NCg+5Lx1goeaoCTOr/WyyPIm9XtqmO4k+JftNpoT6kU5q5usbuVknyuOECufLrWHdicBM/eB4RKmL
 Hz6YNz1PPwdR1rzyoR4z7Esq2559gQK/3cG/yALk/Re6xKeW46YbiTUFqdbyC54DXeZjqiaSRaKPr
 kninf/fXmBHJ6AVRfPk5nDiPGsTJ3ozLgySUgBZ5+rNFejUPg+1VPk23CbvLFzPMkz5iyygDSPZQu
 /TkKY3M+o5WdABcLOH0fhCQ7KexUgUvRrkp2WNdQKl6AnXZ/DZ2c0jkhQy0n33y/LZppz9VTJlAt/
 nZvWkAWg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcQs3-001JYS-O7; Fri, 30 Apr 2021 10:59:44 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2D8AE61418;
 Fri, 30 Apr 2021 10:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619780382;
 bh=tBELwnH1I1kwn2Zj7bFGqXscPmPp5QXvntbnnDhS2kU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mAjGvjkP7U5JZxnCcAnzTz6gYNVoauPkUYtlO6jCLPmvB/XCTb5HM5Csvs7xqAbZ9
 DI2l37T0/wDXaciIpsojFGMaotMQHwmRpB2x14wjjV499SDoaF/G2fDkO6vjTDRjZP
 MBkK3drVMkZrNnhrgB42LNO4vAmuN8QPk3M5iWNPLiII3fXFuXC8UdEN2FILIU/0qN
 x+fLL/fjPdlpMLlBAxA5JvfVUTHEJVO8cETnaauLuXOKxAL125iL0nuG86OTtUD8Mz
 YsKZraR9C/IO0WFKmlwqpOHQaOncBwcy3cnaKbSkTpEY+W9bptSFdKu+RiF1wc46pS
 wDjWJYecn922Q==
Date: Fri, 30 Apr 2021 11:59:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Art Nikpal <email2tema@gmail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, jbrunet@baylibre.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Christian Hewitt <christianshewitt@gmail.com>,
 Artem Lapkin <art@khadas.com>, nick@khadas.com,
 Gouwa Wang <gouwa@khadas.com>
Subject: Re: [PATCH] SPI: meson-spifc add missed calls to remove function
Message-ID: <20210430105910.GA5981@sirena.org.uk>
References: <20210423034247.992052-1-art@khadas.com>
 <20210423114735.GA5507@sirena.org.uk>
 <CAKaHn9+d5crmmG-aKyLuvyxk+A7aC9qqfX_3wuMXm50pg+pZ4w@mail.gmail.com>
 <20210426115645.GB4590@sirena.org.uk>
 <CAKaHn9JM-KEiz3_Btsz8_fr7hcZ2Sm8B64VyLvgpvKK-NKco3w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKaHn9JM-KEiz3_Btsz8_fr7hcZ2Sm8B64VyLvgpvKK-NKco3w@mail.gmail.com>
X-Cookie: QOTD:
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_035943_835293_19BB7A73 
X-CRM114-Status: GOOD (  11.38  )
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
Content-Type: multipart/mixed; boundary="===============7534436491204014037=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============7534436491204014037==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5mCyUwZo2JvN/JJP"
Content-Disposition: inline


--5mCyUwZo2JvN/JJP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 30, 2021 at 04:49:35PM +0800, Art Nikpal wrote:

> Yep! but

Please don't top post, reply in line with needed context.  This allows
readers to readily follow the flow of conversation and understand what
you are talking about and also helps ensure that everything in the
discussion is being addressed.

> if i try call spi_master_put(master) or spi_unregister_controller(master);
> it's made Segmentation fault for me
>=20
> what's wrong - may be somebody can help me

Probably something is referencing the controller afer it was freed, I do
notice that the current version of the driver uses devm_ to register the
controller so you'd end up with a double free unless you either use devm_
when freeing or change to a normal registration.

--5mCyUwZo2JvN/JJP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCL4v0ACgkQJNaLcl1U
h9C+ygf/aSVidn4I4EOCKFzVvuP8YtVO/LlZ673fdMyXlahIvobO2X+Q+kJBMo2J
s7Lj6lM7SL6CA4AKXi5oiGD/nDKxNzlPzm4YsCiqmmtXov0lJlvIPI9WP5eCI4vh
4tFrzc86tskjj1elOlGLTDgYDoEoxF11+Qmo34pOBNlPiDQcGzoN2u0IHPgmEZIr
8PaJ0kFyD0svdptByZp5auKmNWSaOfUYSCqTD6NLqXgO/7kiS9gt40a3X2zlcSNB
fhU5us6mx5hC0snp0O1rzjQDaHZBfi5WYk431gzG3ZG81uyJdKQ7iFjuz71Vo+nJ
cG5VuDJ8NoOV25w4rCnh/b2IscFWPA==
=YmgC
-----END PGP SIGNATURE-----

--5mCyUwZo2JvN/JJP--


--===============7534436491204014037==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7534436491204014037==--

