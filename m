Return-Path: <SRS0=94bh=OM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F130DC04EB9
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Dec 2018 15:33:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C284D20834
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Dec 2018 15:33:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s2o52mdK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="W5wdPl3Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C284D20834
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bSeL+Bo78VN6rVX6zNYwzCH80RmUZeF4T1XkF9mXbQM=; b=s2o52mdKq5IgXnVVRbK65QJz/
	dZAueyfQs1rpV4BzsiqSGOruXhfrvfGQccbJoL3m1B4itQ1SFBzuOs5MqtLbwSLEiWN1ihXaHqa5P
	vrVSvXW5iAhuCpPq+KwB0H3lqXdiZwIc6LdvsaJ48kg13wxEPZYYmdEjago/8X8HSYR1c8bHGyoGo
	gN1GuN24oDOoCMB6mR0ucL5j0usSP2T1162ZySG3LEe/QL2dN4XqrFI134mFdRv/yFFbuZaAf/B/9
	QcDHDLAqm7ckYLhro7gD19YrsDgI8cLVPF4xgxUXeBJTp5W3Ck67YBySIkg2h6KTp863AJ15zNmxg
	XHjrEwL8g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gTqDv-00007c-SP; Mon, 03 Dec 2018 15:33:27 +0000
Received: from mail-yb1-xb41.google.com ([2607:f8b0:4864:20::b41])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTqDq-0008Ub-OF
 for linux-amlogic@lists.infradead.org; Mon, 03 Dec 2018 15:33:25 +0000
Received: by mail-yb1-xb41.google.com with SMTP id s8so3270089ybe.9
 for <linux-amlogic@lists.infradead.org>; Mon, 03 Dec 2018 07:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=9q+ur5MgTEAWYVff9wgMkDirClxqCUlnwMuzLFdmCrw=;
 b=W5wdPl3Y4gfQjOdmZf/aD7rYznFSy851NZhP0vm5ZS2aOZVXf4CmK8QhE72kXjV+wX
 1l9BRrRosggXdQxKSUcQt7MnJ45DwXbz7FoKk8FdieZ+q3DoVKkqcF6Pu+x3qaxUK1TF
 KHqYQ5+PD8PeSjaS4H1LgoxofSn2UzMCpskCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9q+ur5MgTEAWYVff9wgMkDirClxqCUlnwMuzLFdmCrw=;
 b=IazVEEIAYMKEZXygIs5ji2WqbymcNaJ/X50a/Y4c3/n3i7+SFWkudUmFUrdQzUpMZC
 VZUgRcXYKsCGfxKJX7pZV2B8btRtxbysekb9WPs1z2+zhFmWXpvyT9D/QYULWnMJQveA
 boQ9y4hv6X0sZPSUW88vY/CJ8LRRLf8VSIKutYPoQYz3tsjHjkqXZkcsB9mkckQTBzqv
 3tTcNwt0BVN8FkqlmPY6oFZ2lhW66gFQkCgelJqNL3Scdz4EuhAQFGYjI7xzB5G8eSvR
 LdNqZpuQq0Dz47+hRL18JJkEcuLno1gXWhzuQMxzawLH3BIlnwRhen4KjONTAmK8ky5K
 zJfQ==
X-Gm-Message-State: AA+aEWZLVWECdT9nRnfCWn6dElc8hhYAUMKp/vn/J8SbI/2KimVrOL9D
 vn2xltMipMfeWokpbfZX+/MSmmTl7U0=
X-Google-Smtp-Source: AFSGD/UX9fv1dPuNm+jD5BBQN8q/WBd6HvjtXqA45Iulm8G78q8XJ0JUT8aT/EYrjPIowE8rQI3pdA==
X-Received: by 2002:a5b:2cd:: with SMTP id
 h13-v6mr15469369ybp.258.1543851191080; 
 Mon, 03 Dec 2018 07:33:11 -0800 (PST)
Received: from bill-the-cat (cpe-65-184-133-47.ec.res.rr.com. [65.184.133.47])
 by smtp.gmail.com with ESMTPSA id
 u127sm3011431ywa.109.2018.12.03.07.33.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Dec 2018 07:33:10 -0800 (PST)
Date: Mon, 3 Dec 2018 10:33:08 -0500
From: Tom Rini <trini@konsulko.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PULL u-boot] Please pull u-boot-amlogic-20181203
Message-ID: <20181203153308.GQ5048@bill-the-cat>
References: <7769afc3-d778-7501-eb5a-dbf30934c93f@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <7769afc3-d778-7501-eb5a-dbf30934c93f@baylibre.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181203_073322_793099_7318B678 
X-CRM114-Status: GOOD (  13.59  )
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
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 U-Boot Mailing List <u-boot@lists.denx.de>
Content-Type: multipart/mixed; boundary="===============7642879087582875963=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============7642879087582875963==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mHNxlnn48ELheE/j"
Content-Disposition: inline


--mHNxlnn48ELheE/j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 03, 2018 at 01:38:18PM +0100, Neil Armstrong wrote:

> Hi Tom,
>=20
> I hope it's not too late, It's a single patch from Loic he reposted last =
week.
>=20
> Thanks,
> Neil
>=20
> The following changes since commit 952061352acfd24034e6990b6b7d32cded020c=
0a:
>=20
>   drivers: rtc: correctly convert seconds to time structure (2018-12-01 1=
8:03:14 -0500)
>=20
> are available in the Git repository at:
>=20
>   git://git.denx.de/u-boot-amlogic.git tags/u-boot-amlogic-20181203
>=20
> for you to fetch changes up to 8973d816588a8479eeb0e3a9f1e730922d3efc07:
>=20
>   ARM: meson: Add regmap support for clock driver (2018-12-03 13:34:21 +0=
100)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--mHNxlnn48ELheE/j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcBUy0AAoJEIf59jXTHXZSpa4P/2U8O1df2ZLi9ivuVBy91jRN
99XM022tLeQcDU+p6uoNWf2GkmNmtQpewT0b+9kaqvXKRefNWJPE2vEAB1qG6QU+
LW9IB9fhUdqmbjWrXIxU42txFcUetb8vaRIZ1kC2tYHa7x/jfTrM+puaXmvYJI3j
aFEHLOQyK1EYN0eI8UHJt7pLaS5dEGWCn6wn14Oed2TQeABMAHZQ+IIYoCP0E02o
u2EtcNy7yVdqm/FQo5Ln0GHdjr0lHTQ/oaxlOfYl46MT2AElVuxvWW7szXYFW/BG
BUO6yksKe5gWfpuvSP85KgJm82rvOwwnEZkuABa0vw7pB+hQqRl5k5Jc9XYRPrNf
OXaD0nTTWyylwpp+SdUQngvdYuyZRJu0zghNjkSD6Pis6pWc5uK4CsbVik0CqaV6
V3ymfdnJnKMAdpOZW6tSW4YlGzCZy9W9UnSw/e+nCJs965ScLR62nrBMNpjRoUKR
BhsC6bePyHfPGmiROFeDMAnZ8aP5P2MYYNPM8pB6cwo5GSrOWh5SZp7QVhwM7I9O
HEga3VLLo3njWy0usu282X+kH7hK2COM/Xpy4Wlo7lMlKruj9wVAU9tETaMW3Cp7
4Tphnn8/Lh0yHDN/mMaqCHinVEm1cauhK+QpDK4VJD5NWwEX+Sy8l4aO+EGt1Qnw
Zgf9+47ZS0PolK7ibpYA
=hMDD
-----END PGP SIGNATURE-----

--mHNxlnn48ELheE/j--


--===============7642879087582875963==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7642879087582875963==--

