Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B77CD11C2
	for <linux-amlogic@archiver.kernel.org>; Fri,  5 Apr 2024 08:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mMZFfWqg2C/MopHinC+9U8YI27Yio2slzhb9O+5fxLg=; b=ULy5IUmlTARXdJ0RZmF/gUASq8
	ck/IUPSnFGsQ2gO9yigfGFurgM0tdQZJXSdNkdz0UTS5oHbVZCZQo4kjq3ANkfsqtwCksnCNg7a2r
	5t3fMAfD6zyThAtXssdbAOnjstHEj7lUvhQdoeFmW6AFt4JDbKGCKG3ii5J1qbMYYFCGbE5t/qbnf
	c3o6ViXDfUvHywNSzF3MYVZrwAnA3UI8QDxdwij5V3kOqCuPdFqXe2pHqZYW960KZHPLJIM8X5c4e
	liq20/ZZ11PurzmzUuyElljhNwVLMMIx6V0KoAS9Jc5FfA/Fsdj1IObj2nhr6ZNBouNq6WbRdJKTd
	tBjwb3lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsfFj-000000060zD-1XJC;
	Fri, 05 Apr 2024 08:48:51 +0000
Received: from www.zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsfFg-000000060vk-1BUT
	for linux-amlogic@lists.infradead.org;
	Fri, 05 Apr 2024 08:48:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=D3bA
	ysj0N+3ktsukYn/zGLisNXUDp098hBJ07HyHzKc=; b=R8T/4zsl0Zd0dNbaommC
	kCLTauMRf6yuGZlEbnNrPo+sDuLbN4s8BfD2QtEyqFV73GtOSagiQmnkLEuHWGCQ
	vRejlIPlKU/mYMv+6t8UkEAMEtwYdgwHTAQorcdRr9Ope6KAX7AmqTkxF537SxfY
	hbp2DrU8wtJm0oExDm1ozx0tnjR+RM/n3EJ7Hxedj1A/sxIF9bIEt0Q6uqjDDZO6
	DhN5dSoCZRnlewvb/Wq/ACyPQ8GtSN3yttgw0BjHvy2Oz86yt92QQcC0xPBJXssA
	1OMpCVAZHpK9gwh4XkivjtbsyOTJWxSQAZ6QWGsn2F7XdFdDJmCqNTrRYM5kOmvv
	nA==
Received: (qmail 4044863 invoked from network); 5 Apr 2024 10:48:34 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Apr 2024 10:48:34 +0200
X-UD-Smtp-Session: l3s3148p1@j8VihVUV/oogAwDPXwEGAANOsN0UmmrN
Date: Fri, 5 Apr 2024 10:48:34 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, asahi@lists.linux.dev, 
	chrome-platform@lists.linux.dev, imx@lists.linux.dev, linux-actions@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, linux-omap@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	openbmc@lists.ozlabs.org, virtualization@lists.linux.dev
Subject: Re: [PATCH 00/64] i2c: reword i2c_algorithm according to newest
 specification
Message-ID: <kd2gnsosi5xar3mwc3zz7wqtqkfgicq3wical5ch34sbmlgegk@mb2c2hxzzoi4>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org, asahi@lists.linux.dev, 
	chrome-platform@lists.linux.dev, imx@lists.linux.dev, linux-actions@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, linux-omap@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	openbmc@lists.ozlabs.org, virtualization@lists.linux.dev
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <ug266trshvhhbsln3eoh53fmsuj3l63ziz6gavcl7rv2jhjr5t@3av5givh5n7m>
 <j2l7tu24itjelylrgwe6gdsy3mfrw3dnve4rdofmri3z7xdroc@se56t5ylmdak>
MIME-Version: 1.0
In-Reply-To: <j2l7tu24itjelylrgwe6gdsy3mfrw3dnve4rdofmri3z7xdroc@se56t5ylmdak>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_014848_626067_6006538A 
X-CRM114-Status: UNSURE (   6.90  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============4355882806229009263=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============4355882806229009263==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c5kq2kdwqrnl4eet"
Content-Disposition: inline


--c5kq2kdwqrnl4eet
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andi, hi everyone,

thank you for reviewing and waiting. I had a small personal hiatus over
Easter but now I am back. This series needs another cycle, so no need to
hurry. I will address some of the review comments but not all. The
conversion (and API improvements) are some bigger tasks, so
inconsistencies inbetween can't be avoided AFAICS.

I'll keep you updated.

Happy hacking,

   Wolfram


--c5kq2kdwqrnl4eet
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmYPut4ACgkQFA3kzBSg
KbbwnxAAtFWKOWnU/VyFFeZnqQCgQ76FzO93xERcjysHlgnZv3BnA6UpxFnrHrs4
Cn7RTWa0i9Ct1ns2AkkjOQ5rUIqczF7M2dVS0tqODwyazGPaDHYtsa3urfkCsLT7
Gz0y5V+oHHUNj1hypkKtQ37/7iFSYbo5oryt9MFK6eFfs878jel/4BCGJk3SEa48
ewNnEuM8aYfzlrn7/VbkWqHkCS5J6x8/VFk3PjlxgEW45UtEI3r30K6/jT9HOdx4
6lCofEZKn4Bl0VbfJJ7MXd1Be2/Dk6ZaY09e97iAKt2+fM1OLrBwig2V8PAdV7ei
LlHolA153CWJAAkzXE2bJsr252IuCLpVpZobTSQRfr+u5vVV354dfo2ek11R8iff
DSr94kqdKVvOvegpxt4vyHUxQrfy70R9vlkgVhkdvdGbi3JfLeiCK+C+IcBZlbXr
uTaPlNvOt6p+VJNAlucnKQF3mK0FvVMK7bTwqjbKR8ZzB8J20qj5pqxqtBZDjfOl
fpTR9f9+kHWdmBuCLBq35aes6Lxq4JtNRH+czt8F8wIAfx/xcgTf2uPThVoFPO9s
jyO4fy773Wsfo8PGo9SqSKr7K6gQW3dIDoFTk489lp3e9Y/DYJ+ZV2ixvCQKATjO
3K0umrWHYd25+mhripLMPzaz3h1GPtmAiQq/dq2GUviAFUPoZas=
=RWT2
-----END PGP SIGNATURE-----

--c5kq2kdwqrnl4eet--


--===============4355882806229009263==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4355882806229009263==--

