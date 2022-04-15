Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15EA3C433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Apr 2022 21:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TDPUR6pYFUKr5gyJwAwi8SZyiX/yq5S0KaIHWq9bjTM=; b=xsiN+5aHMaORzBhvHxkfFVtvCn
	vAxLZ/OjPA0RDk8JZuns1pskBoyopOy2SiJCRCBDYmuyO5wsaq+hEiJ9c9BM5eFbRsBiYkq1bFghX
	wLZjKt+LlFw9YYTvPcwGJqLobf8Lv3YhhGKCB9mS5aaaI3OeECKE5G+R5TBy3/9TXiYc7BMDbvkn/
	bqKfFmxLpd7fkIC8sC0zUJAY/Jl9Kn5XKresEWTBcq20ZnEbON2i9kICRgaGxVdVQjiDgbxd19j1r
	jU54tmbu71ac9cMVhzYHBNHn+ncfxi8NYKzX3ImpNPUvroB1QRjtCWm1iMMu9De270PeXYntoBCl0
	kvNqpLbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfTkw-00BQ3b-G8; Fri, 15 Apr 2022 21:45:30 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfTku-00BQ2b-6C; Fri, 15 Apr 2022 21:45:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id E7B1CCE311D;
 Fri, 15 Apr 2022 21:45:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AA9DC385A4;
 Fri, 15 Apr 2022 21:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650059124;
 bh=V5KT44zPHxdCxuNBGuMKnFW9ZbwhdDrnA6iBRSGQ7vQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DS7sMqDhP6BN4P+4XoZIfUGbu/o3sR3fZ+6iL0ZMl+Im6dYDzvRdBGCiiuO9RNylS
 +eLZYgVvsuSpgPob6xXc+N0gQrD9YuIzUpWd56w9kCU9ojhPBWdFzHUFDTCrZEmTxx
 BtqW1viPUPx8drlUAJGe5Y0w/gtzk/rTpD2zzT7aX/7i/MEsjNq68GDhHIbTVnZOMk
 VYEf6Ii9ejLP4+K8Soth9DGY8Zvdee3vVmWL6zkmRLV5Fzr3lppRo/cjdIxdzu8NVW
 +yxWQWqG0ipsAt5Qil34ObZLuEfJr426IZwaCCrZy8+ctQYMJCY7SrPYmBFE2BTnHh
 EHREuVLdHy/ag==
Date: Fri, 15 Apr 2022 23:45:20 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Lucas Tanure <tanure@linux.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] i2c: meson: Use 50% duty cycle for I2C clock
Message-ID: <YlnncKoQwr8iW9Ji@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Lucas Tanure <tanure@linux.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220409164334.157664-1-tanure@linux.com>
 <20220409164334.157664-3-tanure@linux.com>
MIME-Version: 1.0
In-Reply-To: <20220409164334.157664-3-tanure@linux.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_144528_460436_27FD7705 
X-CRM114-Status: GOOD (  10.96  )
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
Content-Type: multipart/mixed; boundary="===============0390385255887620649=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============0390385255887620649==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f8SdR9ouA5qGgT1k"
Content-Disposition: inline


--f8SdR9ouA5qGgT1k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 09, 2022 at 05:43:34PM +0100, Lucas Tanure wrote:
> The duty cycle of 33% is less than the required
> by the I2C specs for the LOW period of the SCL
> clock.
>=20
> Move the duty cyle to 50% for 100Khz or lower
> clocks, and (40% High SCL / 60% Low SCL) duty
> cycle for clocks above 100Khz.
>=20
> Signed-off-by: Lucas Tanure <tanure@linux.com>

Applied to for-next, thanks!


--f8SdR9ouA5qGgT1k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJZ53AACgkQFA3kzBSg
KbYB8w//TfKL6kiAHSRUAnceU4+7jlUM7PgdROR9z3QJ0PWVi+1QMa1Hf8MoPJk9
UeU2k0S9tqR8Ax6NvO9mGaWcMv5sU9pw8q3tOuz2YEyQm4AEpS/duZAU36ZW7enx
cnoeYaRMZe5S5tmfrselpZGOfO6UbYWUyZdolfT6CV0rTu0ntRtwKPpsd0QtuzqL
cOO8qJiIThFlg6dApp7TfWSkzBwu2MjuvaafK3TsGOy5x5r8IrHGss40S4w+Ztm4
f/iOUSLBTn72UBK/qCInPAii3mzESaY2IF73WLjTm+WLP1uEVIBab5/3QRDn3GHL
k7dekQirjv2DQ/g8uDODRls/xQ1jNQtGhZR1hj9mb21EjWCl7HjOCJYgCu9eO8LO
/wQLBGRc2YYlk/msXKVjLHjkZ3dvpXd3xMQVT6z9YDT4EUjI+Ev7B5jYVCZAqoDs
voAtULPzZlE542xXnoz7RQestfpyteDuTpon+bFGALWkKd21jpx3SqalPbgMiLfK
yxi8P9FPU5noCd8vjzjcqla9sAQDDL/YbHoIArst/9hrc4bEBGlLfKuJfnmbsLwN
bUkK32ZiekTg1r1ob05AaLQkinDRNb+vtIzgUdKFDGzzVXzKgeX/Jlxf+wUI7mkh
+LKs98hoaOsAcUhYI6Xxbhl7vloO1edXZLkS9y1zOWqzfRZ64Xw=
=gtuO
-----END PGP SIGNATURE-----

--f8SdR9ouA5qGgT1k--


--===============0390385255887620649==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============0390385255887620649==--

