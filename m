Return-Path: <SRS0=QVii=OR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9A71C04EB8
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Dec 2018 13:50:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B755220837
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Dec 2018 13:50:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bM55Byzp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="YFfW/L+R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B755220837
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mNTXdRQhCv/Md7Ms8PjgHH6n/G6ole490W/YvCCWEtM=; b=bM55ByzpNagUl6icOxa62woBH
	0i5JKta3veib97Nk5HIImoCXfp6/0ICQ37HSczzA4lhdqbwhfMg6Iy8CWK1kmlcDniLGqQiQRAQE8
	K6wzSvgr70qCRQbYzXxpNCHXsQdpqFpETKF2j4jtgZPZEW64MApid/2ySn3xyw8nWxgz7hlC3RMZk
	+LHgtqH77pFARYQEmsmZPTnmQetot5FKb6H6zSE8BBnkxN0V9uOj5eEUDk1kE1IPwse1FSxqYNxMW
	ZuKh/pd8cBNBecfu5QGhzJWNsBVVKjD5XjAt/clZzO20+t6r8l1d/DBXtVATPycCMUVrcj61TCkX8
	yWx09hmiQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gVczc-0000Q8-Ja; Sat, 08 Dec 2018 13:50:04 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVczZ-0008TQ-Ic
 for linux-amlogic@lists.infradead.org; Sat, 08 Dec 2018 13:50:03 +0000
Received: by mail-yb1-xb34.google.com with SMTP id x144so3463698ybg.10
 for <linux-amlogic@lists.infradead.org>; Sat, 08 Dec 2018 05:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=+42duXE/BCyuRy9sYqz5gFfdpl8EAfyqTy4oMxO8qTY=;
 b=YFfW/L+RRudCatgeQGAMvrmjBspNUP0C8eu3gIqQnnsiHqqS76+E9KimvcIlg4qtXL
 JvS4rCugioxQ2ooRw0Pvtb5v1cR33Bxi7BS8OQQZ2MWOM4aN1Ug9X3lv3Dr91ezd+qLZ
 X/gyE/lwDcPl/qgG0e1Ow4VJhlh9WUmloLwBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+42duXE/BCyuRy9sYqz5gFfdpl8EAfyqTy4oMxO8qTY=;
 b=INAS4e/JQzGisVwTUMJvWC2klNGnVlxF2X/vWO8lo6CXXt0cLe1u8iWujRkiReiGrh
 UXDaTImPFs8ZYqP9KvgC6Pe12mHrGNlOREXy0dX4JmFjuMmJQrwqQ0ZTYiKa0LOHbK+P
 AzqLydoRlWsKxXCdBYx31nBc1q5rfoEzYIRLhXIlxSL9bPXzx2r21/AaaKXsfUOc4fwS
 Da0g7Y3ty6IA73rxH6OckDRW+N7rbxvBh00sS0pl65yuewaWjrPf0qi6euzyxjDvodp/
 VfBc6Y2Ho7t680/p2uNE/t4fk7wHc1GojnP4ccs18udGh0RXFfTF0sCml3yzQ5HjxRzu
 ZOgw==
X-Gm-Message-State: AA+aEWYTZQ1J1tmAZ4LvjUuz/G27gn+1PHcBwZ1GoPVJSdoBI0Xtp0BB
 rfdIglw+Fl2adVMVBOEK14653g==
X-Google-Smtp-Source: AFSGD/UyWQvB6ipnGFq6tOcbqUzxsmzOp8FaX6UQfPRBg72KDipuVbWUmqAeTKZPdnxxnSiG0Xf/HQ==
X-Received: by 2002:a25:97c4:: with SMTP id
 j4-v6mr5545566ybo.448.1544276989716; 
 Sat, 08 Dec 2018 05:49:49 -0800 (PST)
Received: from bill-the-cat (cpe-65-184-133-47.ec.res.rr.com. [65.184.133.47])
 by smtp.gmail.com with ESMTPSA id
 q24sm1862012ywa.95.2018.12.08.05.49.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 08 Dec 2018 05:49:48 -0800 (PST)
Date: Sat, 8 Dec 2018 08:49:40 -0500
From: Tom Rini <trini@konsulko.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PULL u-boot] Please pull u-boot-amlogic-20181207
Message-ID: <20181208134940.GF14374@bill-the-cat>
References: <e0806f82-a792-a875-87d7-7c11255b869a@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <e0806f82-a792-a875-87d7-7c11255b869a@baylibre.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181208_055001_667406_A64E89D7 
X-CRM114-Status: GOOD (  12.37  )
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
Cc: linux-amlogic@lists.infradead.org,
 U-Boot Mailing List <u-boot@lists.denx.de>
Content-Type: multipart/mixed; boundary="===============3269790361604114753=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============3269790361604114753==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="llJsCJM40947MYJX"
Content-Disposition: inline


--llJsCJM40947MYJX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 07, 2018 at 11:02:03AM +0100, Neil Armstrong wrote:

> Hi Tom,
>=20
> Two simple fixes for the pinctrl driver.
>=20
> Thanks,
> Neil
>=20
> The following changes since commit d452f27b3ea806fd99aee4b73a723318032c1d=
5c:
>=20
>   Prepare v2019.01-rc1 (2018-12-03 23:50:13 -0500)
>=20
> are available in the Git repository at:
>=20
>   git://git.denx.de/u-boot-amlogic.git tags/u-boot-amlogic-20181207
>=20
> for you to fetch changes up to 139ebe9eb9dac96ab72680e7e8ba77ef9b4cc88b:
>=20
>   pinctrl: meson: axg: Fix GPIO pin offsets (2018-12-07 11:01:09 +0100)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--llJsCJM40947MYJX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcC8vzAAoJEIf59jXTHXZSRYIP/0TWAFel/THkHPkmrqsgUrZf
WGY08IOW1P7hYnj+DkIckFivia/659VbjheKXOl6lRqI6D90dUcMGRAoUJM7AyHP
DyNr3M8qJVoKReLSJ6/4AqYNbSNKDqm8zxZOy69n7Y+a+mBufWbjhQ87azqAudv8
wFcoLeuGBWo7lbpOHhcCuMSvr0ZXv4/MJU4arupt3CaMkHt1eK4jwPGRNmRjmIn+
D8ss5pFwRTBdY5FdmymYw0Hp/U717Of1YHNAC+NcSNLY9NQkTlda3kCweWuRolhq
tasADMjoeFjCm7nUbwusJTa4TCbf4WlKyAJKiBopHFYI14cE/5s98ky8niwo0H4g
BznMi5qSof7yXxQiiJBvzIUgL002zAixaZWsqApLiVknN3DtfL8SXTLJ/jmkhiLe
abAc0ONb1d9Vt2k1c9lSraLnPeD7AE5Ri1tktQcseBpJDTvVa0zVPXGBh+kUlcIZ
+LU135OWlKANNlG4IQtPj/Q9SyaDnOsMw3FWfIJTPizyPYVzcfffoSbUJZ1fP486
dBuyteKof6iEli73z8qEUAEwAZRbCUtsUEb8KeEhqzTYkKbZ6F7R3kS99ITW8oSO
PAzWoLBLBO+LagzHa2H3+8CyQ9GjE2le1OteM7bYWp5jQY1T61+qqBoA+rzcZy0Q
koAS8CY12JmqHk6FBXMk
=aji6
-----END PGP SIGNATURE-----

--llJsCJM40947MYJX--


--===============3269790361604114753==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============3269790361604114753==--

