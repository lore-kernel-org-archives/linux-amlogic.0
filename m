Return-Path: <SRS0=Jj0Y=VW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F739C7618B
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jul 2019 12:55:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04C8121951
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jul 2019 12:55:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MTtq7MjW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="FFdsSjhR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04C8121951
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qDHq878uD7snHN/kj3MiT7Nh2ZN5PFFtyV391Rb/QjA=; b=MTtq7MjWjljkZhm6ZOzWgrxeX
	eXR623CuDLkZdF+iMveVztHTkM1Szony9DQMpsOKSjgNHuIGwMIHaCPiMEMr1Hw/qAfniOgCEXcWl
	I19uju2Kikb6TToxSPBAzeJTfRlrGpChRf9anrfoftqFxdlVNq8eVpbDypvewd2PYyLY0epVyKsHB
	9+k/PcgAp5Ul7hsWM7L99orXfdLpKx5AHeZHYJHc9DX7Jur7bOhyYfvZiVj9beXMm2ho9FAlNHPbj
	qUw2T+ctD4fjuAPGuznd3sBldzrr2gDdGaN+R5JT84k0fhLGCFca8QCM2UX+lyBUsq/ypEk1n8fn/
	uTnid6GBA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqdHa-0004MA-Fy; Thu, 25 Jul 2019 12:55:42 +0000
Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqdHX-0004Ld-Nl
 for linux-amlogic@lists.infradead.org; Thu, 25 Jul 2019 12:55:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T6VBY4zfiy3MSxSKbCuz8zMQX5tnpNzxcWkHlxGBC1w=; b=FFdsSjhRbkNH5xwbBGATMKGW4
 HVVY+8OydWs93YxTv3Cm32qq9W92+AZZynxhgJNA1HFLYmdzdoqkKtRnUw+vTYGncKTgKNAn+biXT
 5O7xXBeHXNy7D5iNtkRunzSBAtQhxk5KkduTa+RStmcbbSn1u13jq3C8qZxkpPqDXfFgE=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hqdHT-0002oT-Ky; Thu, 25 Jul 2019 12:55:35 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id A616F2742B52; Thu, 25 Jul 2019 13:55:34 +0100 (BST)
Date: Thu, 25 Jul 2019 13:55:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 3/6] ASoC: codec2codec: deal with params when necessary
Message-ID: <20190725125534.GB4213@sirena.org.uk>
References: <20190724162405.6574-1-jbrunet@baylibre.com>
 <20190724162405.6574-4-jbrunet@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20190724162405.6574-4-jbrunet@baylibre.com>
X-Cookie: Jenkinson's Law:
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190725_055539_801637_3D829DE8 
X-CRM114-Status: UNSURE (   7.96  )
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============7106409247590448961=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============7106409247590448961==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SkvwRMAIpAhPCcCJ"
Content-Disposition: inline


--SkvwRMAIpAhPCcCJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 24, 2019 at 06:24:02PM +0200, Jerome Brunet wrote:

> Also, params does not need to be dynamically allocated as it does not
> need to survive the event.

It's dynamically allocated because it's a pretty large structure and so
the limited stack sizes the kernel has make it a bit uncomfortable to
put it on the stack.

--SkvwRMAIpAhPCcCJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl05psUACgkQJNaLcl1U
h9BPRQf/TWxfdv1adKppGIBtuqwmpBS+DoFYnHcZDpi77bESSWpws7sxnJQocVHi
R4/NkWuIBihp5crQr4F1z7G68tmtVTxFRDni9rutYtQxaVloBZ9OFkesJLaaLG5Y
7e/uDcl2Q7Dlw7jo7NsboC1WTLq3vCDRpioZja9GjL6X/YNxLAmcoQEA3EeWvwtp
2cvDAI/Ah34hsYvfQwyaIFKPzS5UNcPdkb3MN03010mqR3xmVTnJTvWQp7A0l2sd
tliUrBzMtpqW3gTD5ZCjI6dHOp6eeI7BZ26v49WUJtOpawsibdFpkGI4PdZeeuf0
1wJevZvP7lpr4zNMaCWpLwA5LkAY3A==
=XabL
-----END PGP SIGNATURE-----

--SkvwRMAIpAhPCcCJ--


--===============7106409247590448961==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7106409247590448961==--

