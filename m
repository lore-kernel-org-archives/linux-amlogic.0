Return-Path: <SRS0=UU9i=P5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FAECC31680
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Jan 2019 19:18:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD5B72089F
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Jan 2019 19:18:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BKLY0FQM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="NQPzqF3t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD5B72089F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YFcOaW3Mz5U07/3IYWfT4Ml4JMOOnTlZDhlF5L/Yjn4=; b=BKLY0FQM+ubRivU/hV4X12KKU
	pztEjVJ1BNf9+ERuw9JgUQQ4Fk/aSV+nIxFigrTpNUCMWTM4rJl5J8vsOIrM5mrb2T5YiD8UO6Oi2
	Lspx498tbftaSYzQXj8UC6FlhFKVEtcZJP2O/0x3Y0RBfdCgEA6wuk7WL1asZw1SyXrdXHif2m5TS
	mGylAdO6p2BzEmOKnnzrcxrphPFnnxrQ+89ooK4OHNbUpIG0+LWqNyjs6gtFJ39XtFLe+5xv4Rc8L
	J21yXuN9v13PsAKUh0sMC66N2ie32wZgVMC5MhWZSIvPeSmedfw93oKZ3crqFo0iTwtgK/jewAjxj
	/1+/VFxiw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glf5Z-0004f1-7g; Mon, 21 Jan 2019 19:18:29 +0000
Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glf5Q-0004Tl-Qz
 for linux-amlogic@lists.infradead.org; Mon, 21 Jan 2019 19:18:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ahi+dxguvwUuZsF+8UEgo9xEwYr6sdmy1TqWwWNKKrg=; b=NQPzqF3t54TN5eY8xloDb9A5I
 Dr5MlEc6Spj4SFS0MTdZmAyY9AhkCOO6WAMQjuj1soP53DOYcBdY2HDNIs04UpL3PHzRIDCJ3Af6g
 PeQZGxg+2W5gLNEW15CHtfOhsWraxRksNUJf0DuWKTz4v4KwRdLCvZH5NTYDqNtrphk7M=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1glf5N-0004zU-5g; Mon, 21 Jan 2019 19:18:17 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id 9DB561127D00; Mon, 21 Jan 2019 19:18:16 +0000 (GMT)
Date: Mon, 21 Jan 2019 19:18:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 0/1] pwm-regulator: reduce noise on EPROBE_DEFER
Message-ID: <20190121191816.GH12679@sirena.org.uk>
References: <20190121183723.25231-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <20190121183723.25231-1-martin.blumenstingl@googlemail.com>
X-Cookie: Body by Nautilus, Brain by Mattel.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190121_111821_454894_EACC2C12 
X-CRM114-Status: UNSURE (   7.87  )
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
Cc: linux-amlogic@lists.infradead.org, thierry.reding@gmail.com,
 boris.brezillon@free-electrons.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============5090431300204055993=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============5090431300204055993==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4LFBTxd4L5NLO6ly"
Content-Disposition: inline


--4LFBTxd4L5NLO6ly
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 21, 2019 at 07:37:22PM +0100, Martin Blumenstingl wrote:
> pwm-regulator can be a bit noisy during boot.
>=20
> One example are the 32-bit Amlogic SoCs when using
> multi_v7_defconfig (which has CONFIG_REGULATOR_PWM=3Dy and

Please don't send cover letters for single patches, if there is anything
that needs saying put it in the changelog of the patch or after the ---
if it's administrative stuff.  This reduces mail volume and ensures that=20
any important information is recorded in the changelog rather than being
lost.=20

--4LFBTxd4L5NLO6ly
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlxGGvcACgkQJNaLcl1U
h9A5rgf6AtxZSaBfnctsJOk/GS0x/WFOmJUoUIpp7rv7v2vkx/BA45InnEMRVvBY
gcYd/xIOpOPMj/rhYooVuOfPtRjBxh64Wh8hDR7Kjn1EtJv4INM1rr2O4hKATupB
JuR5lNtrnFb20nmN/fsi7aearRB74Pohikt22TI/Bi2yyTxwb1bIE4b/her0/s7u
kWN2U7IhZGsHu3a99e7vJhb0yNT7tSldrb6tyKcJIrWbMY3co6ZdQYzYJgF1m5fV
MVgy7m2rjNuDqAAMrUIEZbBTts41fbNNi+BuSr7XFoXBZML6/Aenc01qk6nRkPRq
aj6eZJp/3Dn9gW1aGpD4VNGpk1eSEQ==
=WlEa
-----END PGP SIGNATURE-----

--4LFBTxd4L5NLO6ly--


--===============5090431300204055993==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============5090431300204055993==--

