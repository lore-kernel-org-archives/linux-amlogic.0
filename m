Return-Path: <SRS0=4PA2=DP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8048C43467
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Oct 2020 10:00:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5963C2168B
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Oct 2020 10:00:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Yz8lUsMB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="QsM38G1e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5963C2168B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rPaGDnqg/N53sS26+dlteQDoGSEBmndrpQbgogIuq2A=; b=Yz8lUsMBmOnXi25NVh9XJllkJ
	9uqNo+UPzXYXZRXho1k9Dq2K9ze5AtYuxn8BaCpatl1tZDVd0VA1nRpgUzGckgbeo88TEft78gI1o
	Y08MuOApeLxM6ZC2uC9C/KvfMlOE1BrNpldd6kQ6mbzNJ2TGKWiVf63Id/brpC+vDgCZkBsH+867i
	2bCeRcWQP8nzePr6eD1LPP/HC1cp0v9d2yinGQJ5KCDbzOpXa4BaBAajiODeQaKQQxIrkNcXjVREx
	rTTt4nBqEajjOOuEuq/nwaXwnZFRDfoBt15An+N+5z6auYzOoRRLEO4cJOn+V2QtEomvtwPDjDTi+
	ukRugr8Pw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQSiu-0005nM-Ue; Thu, 08 Oct 2020 10:00:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQSis-0005mP-LE
 for linux-amlogic@lists.infradead.org; Thu, 08 Oct 2020 10:00:31 +0000
Received: from localhost (p54b33b8c.dip0.t-ipconnect.de [84.179.59.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ED3502083B;
 Thu,  8 Oct 2020 10:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602151229;
 bh=O+NExOukB6rJTsEcD7c6dHp5AxSorYh0KSZfPRbkpso=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QsM38G1enUXW3RKJNm7mxPqlCJm1bDwVv0s+3oagkF42qf7jvuHB3jXQuNwC0HFaO
 LE1/4BW4zQhdgzG2Lum2nawMU45hLaCAsUC7AFP6C3da3zrd5kV9ybiEqT6aNNDC33
 yaekDu1CKn9ffczYxwLfb77ofcRoir4vmW7yZCzg=
Date: Thu, 8 Oct 2020 12:00:25 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 2/3] i2c: meson: keep peripheral clock enabled
Message-ID: <20201008100025.GD76290@ninjato>
References: <20201007080751.1259442-1-jbrunet@baylibre.com>
 <20201007080751.1259442-3-jbrunet@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20201007080751.1259442-3-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201008_060030_796393_ECC0CAB1 
X-CRM114-Status: GOOD (  13.93  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, Nicolas Belin <nbelin@baylibre.com>,
 linux-amlogic@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============4742646787968052187=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============4742646787968052187==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xB0nW4MQa6jZONgY"
Content-Disposition: inline


--xB0nW4MQa6jZONgY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 07, 2020 at 10:07:50AM +0200, Jerome Brunet wrote:
> SCL rate appears to be different than what is expected. For example,
> We get 164kHz on i2c3 of the vim3 when 400kHz is expected. This is
> partially due to the peripheral clock being disabled when the clock is
> set.
>=20
> Let's keep the peripheral clock on after probe to fix the problem. This
> does not affect the SCL output which is still gated when i2c is idle.
>=20
> Fixes: 09af1c2fa490 ("i2c: meson: set clock divider in probe instead of s=
etting it for each transfer")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Applied to for-current, thanks!


--xB0nW4MQa6jZONgY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9+4zkACgkQFA3kzBSg
KbbIyg/9EQZFJDgjjaxVrEUovBqv+sDGCPzDJzH19bCFWHrzhio33cBRQ3PR2YDC
zX+UMPjY3Zf/TPoT2V0FAn2NGwVKzd8Ivb8gVSzfg96NfzAyWHUtxhv8YC1UZfuA
BUoe48zq2gaU6YMkIlMv4Ne6orXt9kezcZkxnIqjtTQtHeYdihf4qSuxQ/N/cRkG
9QsMftsHuCGSX1gKxJBnIHTjbR4hAXlgN6hP/JKfugNl7+UWEAD9PDm038S3GwCd
PCkn+1BZ0jL8MV7S6kjSxI74R4gwj22Aoo6bva9R9zfOrKYHTpG6AQAwFmYaXyLz
o1CpW1iPnvBCYhvk4KJSv2bWnZ0IJHWEMTRDWdAIMYpujllKtO51l3UyLku+yn5H
JCK2w6AyzGaYb48TqES5XCDVpk/MYwCd3Fq3isJrmKIb0V7fNhd8Tt0/9P1SXVFB
APbz3vECxZGtL2DPVXpHUm9ZV89bmB8QFNPZNwuUcApz+BpDvKaBHnq9J0PtTo0M
+tD8BO5lu7CVWFugz5nonbVDM9M8zHRVXcm2gpA0ovRzWCAcm3khtYpR0JL/TVBk
d08SlUo8m6uJGcTl5BTos/Zmr3q1+bnbiRIDuV6n0pRDgBBy+NC7DzgZkDtvpP1i
tIG8L2hKN8ty3u+8uCgbJtfwNO3r2/nqSPFfNNIhtL9WMEYTfxw=
=PNDf
-----END PGP SIGNATURE-----

--xB0nW4MQa6jZONgY--


--===============4742646787968052187==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4742646787968052187==--

