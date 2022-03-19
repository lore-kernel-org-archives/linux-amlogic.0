Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 183C5C433EF
	for <linux-amlogic@archiver.kernel.org>; Sat, 19 Mar 2022 23:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5rXdNf1dG090b8vkrqknbxw6FzhXjq2kp4LNUhSIPGU=; b=uQTMN/4KL/nQBeg+bI33pB59j7
	xlKdNDcJuF0lDuZ/+1jcu/AYMQ0HNfirV/JxtugsgfqPZLoQuQ32C7XIYGHIz/MpEc0HzpE5OqRsz
	jfloc5pVm/dNMsMikDPZ2mwsidUWkXZiJzKXpHdykEuL2fUVopsHgF7L+VWUjsGiLOEwKW5vsgSsw
	MHxLoQpScr+dmy9AtMuPJeE4KVzFU8GIbvLs4+5eFYHurjWtXAaK/HyHB36xjPLN/qqfitAa1ntO5
	18pGLizneNBfvF0Xg9PDxncPN1zRMFFuvveWRzU8buIFGZLNdtkPQV9pNvx7QxofqjS9JKlOwuyR0
	fJTkA6ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nViOY-004V1o-Tl; Sat, 19 Mar 2022 23:22:02 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nViOW-004V1I-AF; Sat, 19 Mar 2022 23:22:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 48740B80D71;
 Sat, 19 Mar 2022 23:21:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40892C340EC;
 Sat, 19 Mar 2022 23:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647732116;
 bh=7rNCrigihKYFJsz9mQGJnD95OoZCiJnpX8Y/WhFL9sA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K9vIasWY030kTGiFRsRkRw4eze+GOnjq3FST37B19P7HkJJJCB0v8Kjc73NIIS9ZV
 dmfdScdCAGGogjXCOWhp0AHhS8XiwSPTP1/pS6YY3iOGpiizn4Uzycn1g7VHGA1yN1
 RKRSBp7uFk6O8C41fL6vOCll8lAHv/FGMpOjC4LmqWdlKXQiYXbZLzSV4LR44RMMWr
 QyRSa8nWJOhIIH4wVe9zEHeIkSRMHtN/TfoJQ7hqq4Z6AywL0wPL8GYsD7POo6rTaO
 pTozNIfl9JM+kZsu4z7irfwL6Ai+9cn5Kbxou4pohaWfA/3XOiZTIEy8fGYhcpmMtR
 ORIzS8OWT6NJA==
Date: Sun, 20 Mar 2022 00:21:53 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Lucas Tanure <tanure@linux.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: meson: Fix wrong speed use from probe
Message-ID: <YjZlkRHWsQRVuj4j@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Lucas Tanure <tanure@linux.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220301072600.12352-1-tanure@linux.com>
MIME-Version: 1.0
In-Reply-To: <20220301072600.12352-1-tanure@linux.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220319_162200_547204_6AB97DFC 
X-CRM114-Status: GOOD (  12.84  )
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
Content-Type: multipart/mixed; boundary="===============9113552690055262782=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============9113552690055262782==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="M1jqmkmfi3QEXijd"
Content-Disposition: inline


--M1jqmkmfi3QEXijd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 01, 2022 at 07:26:00AM +0000, Lucas Tanure wrote:
> Having meson_i2c_set_clk_div after i2c_add_adapter
> causes issues for client drivers that try to use
> the bus before the requested speed is applied.
>=20
> The bus can be used just after i2c_add_adapter, so
> move i2c_add_adapter to the final step as
> meson_i2c_set_clk_div needs to be called before
> the bus is used.
>=20
> Signed-off-by: Lucas Tanure <tanure@linux.com>

Applied to for-next with a Fixes tag added, thanks!


--M1jqmkmfi3QEXijd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmI2ZZEACgkQFA3kzBSg
KbYFPA/7BD/tp4i2gYsqEpAqGKr1iM9kvlzI8IWgsLobfM4DUGr3pLs/ftcJJNWV
XxlgAWGqjG9YKVNh+o8CWunvGDvxoCZIZoMldP+wiBlLlTmMMXy4mhYMJ9So1Im5
FFX8zbS0bBNPXQXfwI7v523ibOB/fpue0cmM4nVVIY0IGh1/FxKgvpNcTDlLl1e0
4IuVNa0WL3PSdaKpkbZC5bvWUaAFZOoUhDGu0UbfTlyNtsH3DcAxYYPi6xq7xYRA
WHPhfwfKhMf8tvIK4IUSw7LY1fPa6p69TvUOtWT4/tXjGDASgwRPzcPAlpLty6wb
G3T0lun5sSFegy0wyBem98avUfulHU+8KP5MG/lWW5NUOSUL2gL9UQMuFwMj2tbW
OxgUbj7bt94EXfbMVyTaIWLfHduxPAUij2/rWMnc767bbb4vKuV/bMJltnAwpA4C
/WdSUysadIRlvsR3ttPimKE3U1nHxrHG/gvOR+HUkOJaB6wAW0nawotK//jHFftw
rk+16AemIhRy71h/qt+JPYdVpdJbyzMTloUSeaiywmusZl4eNuxRHHEHQaaVPWh8
DqjmVDOyn8DYJIT+vJ4ZnMJnnrpM7RU1d5kWIZYXVDZnlsUSzWhHiSMAZORo43hX
TQIFqIoiAfff05ic3+LIpWp/nIN3yuMf76adaIpdhygCMYJx+i4=
=eJIv
-----END PGP SIGNATURE-----

--M1jqmkmfi3QEXijd--


--===============9113552690055262782==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============9113552690055262782==--

