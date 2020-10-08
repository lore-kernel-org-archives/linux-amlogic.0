Return-Path: <SRS0=4PA2=DP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B140C43467
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Oct 2020 10:00:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B99B52083B
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Oct 2020 10:00:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d6/pq9uZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="oU00eeBD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B99B52083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yU+F8A19BnAHvEhoMYOMDttTJz1EQBNeEM4XttwAgiw=; b=d6/pq9uZvRFSgaLHjNlsR1wwy
	TxjHR4bghO96O5Sk9kPQkvaGrfgCGdNb3bArPWcDAkE38rqZKhx/pglbwdxxktpHWoth/Kfd7eURT
	Enrn93Gpd3QXxQjL3Y9jLVwzIw0Mc56vtoS+TwbXl9HWupZW4qfeqHHFHKrfMTw20DQylI+1QXVo+
	FsYvJFUWrDZBn8HevdaRv1SHjiwRo8MzYu3fG6ZDGoXGna6ABnpMzPOlzrm8vDTfE6f5gZlY2iRY+
	5hwpMju0UWREGZxK9DEaASsnW+tx9iyJz+vBN8z09FK5DhcTbqiVLnXW+fk3d77bHMVqi6sMOprr6
	YlQb1+GNg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQSj2-0005pV-7d; Thu, 08 Oct 2020 10:00:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQSiz-0005oX-Kz
 for linux-amlogic@lists.infradead.org; Thu, 08 Oct 2020 10:00:38 +0000
Received: from localhost (p54b33b8c.dip0.t-ipconnect.de [84.179.59.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 53D0D21531;
 Thu,  8 Oct 2020 10:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602151236;
 bh=kwRH1QK6Fs+DfNVNyrY7CHL9LahyFMQ7dMN4dzS0ecQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oU00eeBDHXCALTjkcCwhe7LCaivJgZAa6wuICr8wK6iElAoA9Drel1UEUEvAhOBym
 wgR31pnIfRWN4TXYmH060fD1Q5UqPnCV2vCOHjok6PA0QrVh5A4Kr0s72qDC7/rc16
 x+qFEgrSZkjDtaZMO80hkJkx4l7+HznO3UsfiWF0=
Date: Thu, 8 Oct 2020 12:00:34 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 3/3] i2c: meson: fixup rate calculation with filter delay
Message-ID: <20201008100034.GE76290@ninjato>
References: <20201007080751.1259442-1-jbrunet@baylibre.com>
 <20201007080751.1259442-4-jbrunet@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20201007080751.1259442-4-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201008_060037_856362_C343C79B 
X-CRM114-Status: GOOD (  12.44  )
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
Content-Type: multipart/mixed; boundary="===============5393965013789815693=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============5393965013789815693==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gMR3gsNFwZpnI/Ts"
Content-Disposition: inline


--gMR3gsNFwZpnI/Ts
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 07, 2020 at 10:07:51AM +0200, Jerome Brunet wrote:
> From: Nicolas Belin <nbelin@baylibre.com>
>=20
> Apparently, 15 cycles of the peripheral clock are used by the controller
> for sampling and filtering. Because this was not known before, the rate
> calculation is slightly off.
>=20
> Clean up and fix the calculation taking this filtering delay into account.
>=20
> Fixes: 30021e3707a7 ("i2c: add support for Amlogic Meson I2C controller")
> Signed-off-by: Nicolas Belin <nbelin@baylibre.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Applied to for-current, thanks!


--gMR3gsNFwZpnI/Ts
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9+40IACgkQFA3kzBSg
KbbICg//RfLRRrULQyOC6wMvX6Ywzuc2+08+lufGhqC7qTce94CDoF/k+KCYp/CO
r5VXowQjRhiDFxeEHJ5s3aM32vjqb+/pKrhEXunqfAtJl5xhbVkbEeBbnAPp7LaO
p6vSGleKxintQsCIkJXZD3HZJlzw+8CPBPV30HW7lO9VefwnyiV+LO7DUWM09Zfx
C5FtjGK34YQNmGuTkLYwDuelHTj0l/jR0mwRGInESnKODvVBMCTK4uTgQVM4jRJb
RF/rRQSJV4IkFiNyyk2LFK3phTUnSgeG8RIl0B5u3hkrf1WwDoUAayPSXh0qaKF9
qdpXkUa5twjEOasJLIqorTPTyNNJp0kOFK61CaeISz6S5mNtibrpGggHb9iEfGX8
wGNzcUKLbDTma80XJ1A/1RZ/buOfl8RzAPngG2xxMlxWDLZrFIIkQFcDSeE5P2vL
sLtW6gI8IWAdP8igtdmASm+dvHS4onXBgbc5j8m6xavVTIL5spVXuL79NN0y2ZI1
zPryRpRfMR6bRZSKY97OXYR2g6OHFLbrayz5HfNnk63lZj6K38mHNuZ9IPj1nuPI
aM/hCFtwW5d0j51ZYu2a2hKYbjux19bUz2BSFSM/9g8kfMOZaPXS30e0jbI76E0F
fsbBIGFsRAUlHO41anqbity6+xI9FE7MxovWMdD3JNJ7qNqj5l0=
=fgLn
-----END PGP SIGNATURE-----

--gMR3gsNFwZpnI/Ts--


--===============5393965013789815693==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============5393965013789815693==--

