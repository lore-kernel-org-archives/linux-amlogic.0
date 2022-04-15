Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EFFAC433EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Apr 2022 21:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dLLz6DWA/WapJdu6GaCwDLwldwc4T/Xk9xdwYzTAVio=; b=ULcazevOsSzVe9+gkpEIBvMVqZ
	YMmN7zEVxDpVZ57RTcDIWWSRjKzMEL01m/CQTcly7NMMynkha/+Jky3Hj7KCkZL14Fs7QajfREU+D
	YXRvzVezXz2ZELhVFj1QG77zzlfb9WrjhvmJ4w5ys7x4TNQcCdEUsBweHtnu6RkDQKIKK/xcyZCMN
	cNwbQwLRt/tT/qOnWFPWAq4mSqumuq5fZZbMWT0M3WP/RA81PzBrmsl2oAJXWqEP+Hr78XU7C9L42
	k7zMImFMeWRNS2yQybJwZb00YgPMXoi8Y6YpGFvyvhhP2iUeJayhX7B4GDuL/EtshWa0xcNCFUKYp
	7Tp86Euw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfTkf-00BQ0F-E7; Fri, 15 Apr 2022 21:45:13 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfTkc-00BPzi-DV; Fri, 15 Apr 2022 21:45:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D2752B82984;
 Fri, 15 Apr 2022 21:45:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3C39C385A4;
 Fri, 15 Apr 2022 21:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650059107;
 bh=ZC+7rqZ0WgJdhnVTkfnQsLj7Dq2lp+QzIX3emi0KtK4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tw2sTFb2+s3S2OMkknsciUh6ECOOjs1MTVDhU3GYQWxMthoU+FSSa1Va9gLyuds0Z
 nduZgO6b/muLj70219dGTN1kIeJ5on1YGWeGzRjSgzhGP525FPxctH4+a+kHLXVHyv
 d+3+PxLDOitBklXbnG1X027lRl0Ff0xt5d+lJc+6pDebloVpo8sqJ2zr/HaX3vk28x
 zv7WBP/ppuyOrMgTZpEPM0YK7BYWC0CJG3H9FNr9gRRtm7UPlsj4enZzBE8xHjvZUk
 MTWqNGT5S0ay1H3b6VXWsI19ah4VIf8MyNQy2nenSvM17jQmEvsqxiE+JESWVCjyJb
 NipJQsnLAysBQ==
Date: Fri, 15 Apr 2022 23:45:03 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Lucas Tanure <tanure@linux.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] i2c: meson: Use _SHIFT and _MASK for register
 definitions
Message-ID: <YlnnX+zUonH86W6T@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Lucas Tanure <tanure@linux.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220409164334.157664-1-tanure@linux.com>
 <20220409164334.157664-2-tanure@linux.com>
MIME-Version: 1.0
In-Reply-To: <20220409164334.157664-2-tanure@linux.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_144510_641285_B80A0116 
X-CRM114-Status: UNSURE (   9.52  )
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
Content-Type: multipart/mixed; boundary="===============4990089609416410274=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============4990089609416410274==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sk4ebDzxWw1Hqa7G"
Content-Disposition: inline


--sk4ebDzxWw1Hqa7G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 09, 2022 at 05:43:33PM +0100, Lucas Tanure wrote:
> Differentiate between masks and shifts
>=20
> Signed-off-by: Lucas Tanure <tanure@linux.com>

Applied to for-next, thanks!


--sk4ebDzxWw1Hqa7G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJZ51oACgkQFA3kzBSg
KbYw3w/4jp7YI9RnvStF9nA8HnM6PJDHhMUyeuCbA/zv3nc9R889Y6V0ji64/eut
paK/Gk7NcRk0bZifAFZkMDZVhyYLkBB84U8BMoHgC6IYnKcmIpLDQZCa5nxDDD+/
u8qwUC0bLXtThvU7jkqTmwhpvzK/8YHyEsGBHukiRq8Ka93xR5A0u7cCF0HyWu5j
yaucFX9I9d5E2GTuybJRCweOKiLk5Kp77VnFuLfX5Nr31iQC1CrLvkyokJGovEeP
/1nd0dqCF/D9bq83DY6/dKTYfaGImlYgIVXqA7N141PayIZQBYmRRLFdTtPyYA7H
RecTD1TyprJT9LUeiAq/80Fx8g3arNSl8pE8VvICuv5D2WfhVgel9QpGGEeSDrPi
pFBs4IgYBFjVQGmgq1jZ6a4iW0yJ6EMzLeVVOU2QZD3CjKoWkld3MYC+yBTUkrlt
Z4xZcEMPahYeTtj5T7d8lObHgHCaSe/BBwxl6alPcZIg4XaO5ywIdZiHiJZXNGiT
G5nW4v0M/fu0TP+boD/hg2xYFsDUZEkqO3YOMHc4XFeWONUJehupXQSgyemJENjB
IbhWTaPxGCiuBypbpE5hlArpsToZb56ki+V804Ck/x7VWb3/CI7Gl/WylAoGMF4Y
4GoBWcefkdQB4U1Qs/Pz8e+reUaBlhBebqdBA5H+5Jl5rHfrYg==
=w3QQ
-----END PGP SIGNATURE-----

--sk4ebDzxWw1Hqa7G--


--===============4990089609416410274==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4990089609416410274==--

