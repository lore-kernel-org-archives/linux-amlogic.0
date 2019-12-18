Return-Path: <SRS0=A4ao=2I=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B529C43603
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Dec 2019 09:48:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3DE7227BF
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Dec 2019 09:48:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IK7f8DKu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3DE7227BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ivMl6SdJJaFnyA78hOApuwGAkMvR6ppPQzWnehHkmlw=; b=IK7f8DKuOEZ+1FBO8YKLaF1Yw
	cb2Un52fIq+WS5TeYYcIes+nrJ3PWe8LX0RSKBahobo7Pk/uw0ShbtgwhQuKh5J4xzTryI5tkFu4H
	IarKvqZ4At03XWQWb2Taq8QYHvUvRBJAwLX85IRTxOyGcBi2/hZnyuw838JDgQOKXnmMdOE3nfTHC
	3jt4xYYssViIu68eFPuqyyG2jD0tnIxKQIklVm5AQwojI75va0J8pJfKVANIWgIGQhuVogemrMq0U
	u2XzOwfuACJZRsQXWcubylesTP5epIjLRmBC93T8Uka00PfSs1CA2CkMf1meTHJt9WUKfUyUpIW/b
	yrJreQSdw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihVw7-0000lr-V3; Wed, 18 Dec 2019 09:48:07 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihVw4-0000ki-Rc; Wed, 18 Dec 2019 09:48:06 +0000
Received: from localhost (p54B33260.dip0.t-ipconnect.de [84.179.50.96])
 by pokefinder.org (Postfix) with ESMTPSA id 192732C06A9;
 Wed, 18 Dec 2019 10:48:01 +0100 (CET)
Date: Wed, 18 Dec 2019 10:47:57 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Yangtao Li <tiny.windzz@gmail.com>
Subject: Re: [PATCH 02/13] mmc: tmio: convert to devm_platform_ioremap_resource
Message-ID: <20191218094757.GA1054@ninjato>
References: <20191215175120.3290-1-tiny.windzz@gmail.com>
 <20191215175120.3290-2-tiny.windzz@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20191215175120.3290-2-tiny.windzz@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191218_014805_041706_C633BF6F 
X-CRM114-Status: UNSURE (   5.89  )
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
Cc: kstewart@linuxfoundation.org, ulf.hansson@linaro.org,
 geert+renesas@glider.be, linus.walleij@linaro.org, bjorn.andersson@linaro.org,
 yamada.masahiro@socionext.com, khilman@baylibre.com, jh80.chung@samsung.com,
 wens@csie.org, agross@kernel.org, chaotian.jing@mediatek.com,
 linux-arm-msm@vger.kernel.org, wsa+renesas@sang-engineering.com,
 mripard@kernel.org, linux-mediatek@lists.infradead.org, ben-linux@fluff.org,
 matthias.bgg@gmail.com, linux-amlogic@lists.infradead.org, tglx@linutronix.de,
 allison@lohutok.net, linux-arm-kernel@lists.infradead.org, nico@fluxnic.net,
 gregkh@linuxfoundation.org, yoshihiro.shimoda.uh@renesas.com,
 linux-mmc@vger.kernel.org, adrian.hunter@intel.com,
 linux-kernel@vger.kernel.org, vireshk@kernel.org, manuel.lauss@gmail.com
Content-Type: multipart/mixed; boundary="===============4036794317092438414=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============4036794317092438414==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1yeeQ81UyVL57Vl7"
Content-Disposition: inline


--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 15, 2019 at 05:51:09PM +0000, Yangtao Li wrote:
> Use devm_platform_ioremap_resource() to simplify code.
>=20
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>

I am not a big fan of this new function, but oh well...

Tested on a Lager board (R-Car H2), SDHI gets recognized and SD cards
are detected.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl359cgACgkQFA3kzBSg
KbaFBw/+Np52ahaH5+TRKI/drXlFCXUL5HuWieFoxsd85DJHgxSXOTku4oSCDjSy
tQ305gyE97P963NpUtrU9V2uovdl27ko/jA8kC9z0fxx7+DoDdTqw13JjTTBLOW9
s3dELTr7BVx5j+UEWfFBGP0VbiM57oOm+qAiNMhjoY64Fkmkn/3oroDk9M7LY+kz
GjvwgLpiDXeOylLKpHQzk4+pO1X0aGqtTncveQ8Oa/CKytN9UCDfUH7gI1HgXLeM
FDqu3HGucRHbL52bLxnz71PrJWQ3Z6Cxm46Z8mKbWDFvnLJoCIegymSGdzawqzf0
wWmBUh+LocMl6reuTeD4s5I0HDyt+LAU1Kx1R0LQMflXe9KIVukga9W20B1eh6dH
r1PDsfj9Y0GQwyY9X7PEhV90B3t/rGHhmw/XMZAMqf2xkgkrD2rlLr1aO+xLv84D
asn6q8ZYfgKF9tmN6lUnJTpP8hXKG017MOk1jS5R+2iaXi5Fp3rSmX0DpQTHye+x
/wWU9IpJ1HBKTdGWZFnJwd1SCOVzYR4mlLwvOpjiw66ZbX00y5obr773NkgjG/iA
p1mbF7OO/5MFOAZgpyM0zzCTSaWjh/GfbGEOfEVhcXErCZhS4WmQjJ3k+rg8JBn8
Pwu2Sgz+1rwyeqOiHZJtY3QkffH3x1IsskLYbK2kSHs06L2t7O4=
=XhTS
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--


--===============4036794317092438414==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4036794317092438414==--

