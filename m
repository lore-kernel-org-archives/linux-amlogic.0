Return-Path: <SRS0=kAbd=P7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4CAAC282C0
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Jan 2019 17:29:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B43B420870
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Jan 2019 17:29:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hEfy2Jum";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="SPVjXKEq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B43B420870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=E4ejw2EOnJtJPM0WDlwdwqeqmcI8w/VBzVvksYwSww0=; b=hEfy2JumIyVpx/Tu+9Vs0Bylg
	oPa0K/F2gPqUx+3Cal8XLvUH5JPHTBYcJu/36BK5LWcSQkEujKTyY+mIdVkHA8gDkIcPPAJDsxA8r
	iqvlqEkPr6ujR/YoZtawCQKEQd/m6tqRidbLGI4M2bsb2lLSQi2jJ3B57NgedMFYbn1TL0drSOrjp
	GfckjwXkZ35KGY+ASdKkn2E/uCH/kHlNLnaEiilTpXPXttZkwACJxfBU4eDaIm60Z9pXIMJJNJ3WF
	EGm1nNcALQdIWPiZmhwZ/u93a56Gpoj5g0PrFC03LRw5YbDBJSEkBmye/5Bj/M5UGsenyTWGm4suS
	yn+adhX2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmML2-0006Xn-Sn; Wed, 23 Jan 2019 17:29:20 +0000
Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmMKz-0006XM-AM
 for linux-amlogic@lists.infradead.org; Wed, 23 Jan 2019 17:29:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ucniJVHoVXntYH7Faf+Kz0hGhM5tUmJN7wC1AND91CI=; b=SPVjXKEqMI0+7m1tWfbbR2fcE
 s3i+m4IaASJQUxVmEteiOSRdKgks+Dlqi/5afcL2KxYbDurcgjqrWrs+4EOInqvvDlb09DcR56jjy
 xgoq3flTRyFO0dEfEP/1FbCfoe1Qtz5XY/yZFgIh6mO+JuQtlxBoWLZJd2+sKNfRXCKJQ=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1gmMKv-0006e6-59; Wed, 23 Jan 2019 17:29:13 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id 885AB1127ABA; Wed, 23 Jan 2019 17:29:12 +0000 (GMT)
Date: Wed, 23 Jan 2019 17:29:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH 1/1] regulator: pwm: suppress EPROBE_DEFER error message
Message-ID: <20190123172912.GF7503@sirena.org.uk>
References: <20190121183723.25231-1-martin.blumenstingl@googlemail.com>
 <20190121183723.25231-2-martin.blumenstingl@googlemail.com>
 <20190123160405.GD7503@sirena.org.uk>
 <afa9ed378b7fa62e81662363fdaf7543@codethink.co.uk>
MIME-Version: 1.0
In-Reply-To: <afa9ed378b7fa62e81662363fdaf7543@codethink.co.uk>
X-Cookie: A couch is as good as a chair.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190123_092917_509958_8CBF8006 
X-CRM114-Status: GOOD (  13.15  )
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
Cc: boris.brezillon@free-electrons.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
 linux-amlogic@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0905427923382259458=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============0905427923382259458==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="L2Brqb15TUChFOBK"
Content-Disposition: inline


--L2Brqb15TUChFOBK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 23, 2019 at 04:14:49PM +0000, Ben Dooks wrote:
> On 2019-01-23 16:04, Mark Brown wrote:

> > This also cleans up the kernel log in the case where you've not got a
> > driver enabled that you need (or it's not loading for some reason) which
> > isn't super helpful when you're trying to figure out why the driver
> > won't probe.  There's not even anything at debug level, that would
> > probably be fine.

> > The ideal thing here would be to work on setting up the dependency
> > information based on DT and using that to try to sort initialization
> > order so we try things in an order that minimizes the number of failed
> > tries.

> Hmm, would it be useful to have a devfs file which holds the last probe
> code?

You really also want the bit that says why it's deferring - "failed to
get clock X" or whatever.

--L2Brqb15TUChFOBK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlxIpGcACgkQJNaLcl1U
h9Bd9Af+PkGTbTa3YfJpdWimXdj/2tU2uqKtxKx9uIg6/6IKCqZktIeGacUi7FWO
zm/kLm+KThwOUBGde6/gGe+xgR0dIs7CgGFowdkKgt82mVYXeUrz9RlLL0fjA7VL
ZJuH5KVzppqZ/AzwIYmondQLRa78wm4n1XQ15kvckDd+QLVigUAR+TSU3zaQ6EdU
ocv/NZz4AzJZakil6qm2QGjjssNDdbl3J72eJCRGfq0fl8+lA4YT0jgMg4nUnvEo
Y1X8REscqdePK20vL0qYOUl6xp/WbwrSWNFHa15c3skhjhMsdn9d+9/OMkaiAZdB
RhIJURJar5C3Idww05p3lr9J/L+dWQ==
=4QIo
-----END PGP SIGNATURE-----

--L2Brqb15TUChFOBK--


--===============0905427923382259458==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============0905427923382259458==--

