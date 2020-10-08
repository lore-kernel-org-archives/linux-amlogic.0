Return-Path: <SRS0=4PA2=DP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C07B6C43467
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Oct 2020 10:00:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D9FC2083B
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Oct 2020 10:00:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3hNYki4Q";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="CNGAL6j8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D9FC2083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ei1QpD/8zU7yWfRzae2wZ1qO7ayEsrwmDUUrb0opXGE=; b=3hNYki4QIS7Vg86KzAOr7ZIOn
	msoXCsTKNBFh8qNy2PtBy8/jx/81Wi2ojuJs6Hbe0P3MuhQ18WjT9xetZpf33GbuGJiGXP7NdO0cQ
	Oa1nZcv/gwHqUFYgT1zcaTXqvTTsESUHk4yvrWPS6xwWeQmx1dLoKJcfqpgpuBg+4jySplvIzAkY5
	Tx3DIFlsQxElVncK7NtlMpeQ6FN/cXaIfMdsWIpOO/2TTIWSxD3K3zfUuECiK7wYyHW6SMQUXUMCJ
	dKRY/2pWTYdIbY8Vf8wTdJX/GzvkAfUBWsEsFVdt5a4ufqcou52Oaz+8S2OFroqjO6+9Kaqggli4F
	iAXycd/uA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQSiJ-0005fq-H3; Thu, 08 Oct 2020 09:59:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQSiG-0005f2-It
 for linux-amlogic@lists.infradead.org; Thu, 08 Oct 2020 09:59:53 +0000
Received: from localhost (p54b33b8c.dip0.t-ipconnect.de [84.179.59.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7304D2083B;
 Thu,  8 Oct 2020 09:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602151191;
 bh=jfNXs9KbJzkZ3fc9g3oTXmIXRmuu5c92dx3Jl/2RpgY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CNGAL6j8igMV89bdX5ykmhi6PnoJUrd72/SzoGs7aNAvn8tp89a3Kg1BL0usGmVG4
 j/bCCqctjOT4t1cHVpUH4f2b+n5fqqAXVCN995Sh+ez9TJlzV7DNmWtiUdtAc/DjAQ
 jiFCmwDbUHlejccXiqJDVi8NBw3e7hHFZcTVzvXY=
Date: Thu, 8 Oct 2020 11:59:47 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 1/3] i2c: meson: fix clock setting overwrite
Message-ID: <20201008095947.GC76290@ninjato>
References: <20201007080751.1259442-1-jbrunet@baylibre.com>
 <20201007080751.1259442-2-jbrunet@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20201007080751.1259442-2-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201008_055952_698101_BBF2E3DA 
X-CRM114-Status: GOOD (  12.21  )
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
Content-Type: multipart/mixed; boundary="===============4265745787626393994=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============4265745787626393994==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="R+My9LyyhiUvIEro"
Content-Disposition: inline


--R+My9LyyhiUvIEro
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 07, 2020 at 10:07:49AM +0200, Jerome Brunet wrote:
> When the slave address is written in do_start(), SLAVE_ADDR is written
> completely. This may overwrite some setting related to the clock rate
> or signal filtering.
>=20
> Fix this by writing only the bits related to slave address. To avoid
> causing unexpected changed, explicitly disable filtering or high/low
> clock mode which may have been left over by the bootloader.
>=20
> Fixes: 30021e3707a7 ("i2c: add support for Amlogic Meson I2C controller")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Applied to for-current, thanks!


--R+My9LyyhiUvIEro
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9+4xMACgkQFA3kzBSg
KbaPtBAAkuHWLMNn0jybEmjAKZBIbOlz+CXWeIoCShoBnN4pte2ywTTjm5sgkF3u
Uxkuo8wH1v6eirOOEO3lXuxO8pXuLNZOqKZCzX+7ReRqA4SaXQQioPKhd8drY+Ia
Om8OvYsH236YSV1njL2L4CiQ/WWZlbKo2WiQKeR21qyWrUvAiv3xDf99KkOKzGx+
Lg1KPZdyIHOwi7jZSr2oq84Rch9pm0YAH0kfVYV+v2WhoyQvZyQ7vd9w5lpdTzVM
L3Rdr6ssn2Jf84t91tz0uA1TiSD70G9PYN2skl9zDdJIPNUy9xhC/DbeU4JUGnox
SI09i14u3f5wSEFnQBQs23mMB+oMlQ8dhc+gnNUyq5RUlfNy5ScdwHYkOv+BWSel
Pr30tSS8kosB+JGc1Sz7J367UoTLaHjcKJuCZW9c0Bs5SR9FamtO4N3iEve7JPBN
HHqPx3qJanf12ekXN0DZmt0gg9kwxf5G2hmZq7V2dV537/nAGQIh9e6CJTcsBdiu
V30cL3q764QUjg61J1IbLW1+9L/gCQ6PuA5ND4tcpl/3rjtqJxWqhgKrDQL2+Q+K
WSTyND9YyLFk1cd/QU7AVtOlpNoE0xPVxlRaRE+Yr1TBaS57hsTJX+tum9tzvTEc
pmjsfWCQREYH3Rl7aJ8qoMJmP4MQLcxAmcn7Qn7Tb+BxTGK18Ho=
=dWyY
-----END PGP SIGNATURE-----

--R+My9LyyhiUvIEro--


--===============4265745787626393994==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4265745787626393994==--

