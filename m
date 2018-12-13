Return-Path: <SRS0=UlVA=OW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F26FDC65BAE
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Dec 2018 11:54:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBADF2086D
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Dec 2018 11:54:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P9ebNG/H";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="wnlOm/lG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBADF2086D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8YqwMBGmpYIzIPkMbcy43xipcbHYtVD97DsZt02bQYE=; b=P9ebNG/HGz2TKQyasrMf3DZzc
	5XkEoxrfOBbaLh2IAx0L/woYdyJk4/jgMSQ8FgFhfvpUp0bej08CvXfyargO5nGGUac8cu0FAsyHW
	acneEgC8gDkMGNzioUEaNILrdojE5iiWatEaAEseNmh643FKCyIbMtVDpcU2LN5mRTKjmGsifDPCq
	UrCpKMNhoDixSF36YH6HjlZjda7ryRpgQyXXfaTcbtnA5di2WhZMDuJNYpnzEOkXyzh21+iQQeDia
	TmKWGwZq3pGHDEOLxFg/UnknzZdhFWLwMtY68z40b6eXZa3HCKmEo9ozP1uxJPTxMhbX8rnOXNzp0
	C9/nb6ojw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gXPZA-0006tM-FX; Thu, 13 Dec 2018 11:54:08 +0000
Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXPZ7-0006sq-00; Thu, 13 Dec 2018 11:54:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OmHTCqfoyO9+watM0IFjxiGdHi/Bg5TdaP0AHUfJAFA=; b=wnlOm/lGhouxwLcAu7EnNVOKe
 aOZwsZuiMEvKoCzzfgZU2BsePFiyIrXqzsq4LjysDhSWM4ZIuXMnOPrmfGTWzWyoTlr2bEKMXNEym
 qhor9xA/qZbDPeBylD965G6QPMTJByxwjPU0mm3wh73BITiPH5Y7POsUgZAKUP599r8S0=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1gXPYo-0000vZ-7r; Thu, 13 Dec 2018 11:53:46 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id CD13711254D1; Thu, 13 Dec 2018 11:53:45 +0000 (GMT)
Date: Thu, 13 Dec 2018 11:53:45 +0000
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v2 2/3] spi: meson-axg: enhance output enable feature
Message-ID: <20181213115345.GC10669@sirena.org.uk>
References: <1544690354-16409-1-git-send-email-sunny.luo@amlogic.com>
 <1544690354-16409-3-git-send-email-sunny.luo@amlogic.com>
 <af721e7a752ca468046de0a4ad1ac4a0c220360c.camel@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <af721e7a752ca468046de0a4ad1ac4a0c220360c.camel@baylibre.com>
X-Cookie: Some optional equipment shown.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181213_035405_194001_C0EEDC5D 
X-CRM114-Status: UNSURE (   9.35  )
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
Cc: Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Yixun Lan <yixun.lan@amlogic.com>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org,
 Sunny Luo <sunny.luo@amlogic.com>, Xingyu Chen <xingyu.chen@amlogic.com>
Content-Type: multipart/mixed; boundary="===============7589120110374972574=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============7589120110374972574==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s9fJI615cBHmzTOP"
Content-Disposition: inline


--s9fJI615cBHmzTOP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 13, 2018 at 10:04:56AM +0100, Jerome Brunet wrote:
> On Thu, 2018-12-13 at 16:39 +0800, Sunny Luo wrote:

> > =20
> >  	writel_bits_relaxed(BIT(24), BIT(24), spicc->base + SPICC_TESTREG);
> > =20
> > +	meson_spicc_oen_enable(spicc);
> > +

> Any specific reason for doing this in prepare_message() ? It looks like
> something that could/should be done during the probe ?

If it's for power management then there should be a matching disable in
unprepare_message() (or this should just be in the runtime PM code,
though it's possible there's stuff that's only needed while actually
doing transfers in which case this could make sense).

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--s9fJI615cBHmzTOP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlwSSEkACgkQJNaLcl1U
h9CHGwf8CNMeR7WV+TrBE53uFRRrhrKajnV4JWbLuA67Kua7X2ESoTqkgJ8tc9T/
8RQ7EfxtVkGspy1ZkjpiGBrWgY0YGk6/R+N/OkMmuCDJmk5cQNdZtRy5WGIEm1ZI
I751ssIVt3EZCSE/GcpV4bJ8O7x2fGTWRbnjczwnypYeWwBqfnCxta5+N2DS7T8V
jis/mZjM8VmLv+qtryIqyfrRGlDaXB47AgQeXBCZcQh68/ab8QoUIdh4Dn/Zecl1
OBpuTheeAmfkjbLiHQNFi/XWclWK7RGACX/Xlmr+9BVmcl6CAFekXKImBoNMj8jv
kTkvW7/4I1wvzOJIkaRS0DGZFqF7Yg==
=Aegn
-----END PGP SIGNATURE-----

--s9fJI615cBHmzTOP--


--===============7589120110374972574==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7589120110374972574==--

