Return-Path: <SRS0=1mM9=QG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C36B0C282C7
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Jan 2019 02:19:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E7852175B
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Jan 2019 02:19:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fikaHJiN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="QaN5qgtI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E7852175B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YDHinCYcDowUZS615MiGjtxwG72CP69y2tdrbVC9uaU=; b=fikaHJiNK3yEnPafDWUCX4a4N
	9k0VlC+RtxC+7kQsnXNH3StookpjB9JIIp2I6zEkK0fmd/FpLuam7wc/ywBuU3dTBK2I76rffTTVV
	keKvHCkO6BM2xgbVqPyndSJvcbadb44R6ZrOUJ2m5TEM2o6PqR2+3ZBo7edU8Vf2o8ZUYXmg6iIfI
	7wYFFVDhtbO/Smz7rVZbcyi82yMgAo/2k/GTv39ppZ0MzTM6s+A1gpL5/q8poRRcLDYvgLRTg21/T
	9Sl5Mc280u+NP/MJumOm9M97cvyDPfd4S3zWiPB8LTXwDWsSPF8r2IMy7TiPNRqbjLOKHFI16XmQv
	NMMpU9YlQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gofTG-0005ys-0K; Wed, 30 Jan 2019 02:19:22 +0000
Received: from mail-yw1-xc41.google.com ([2607:f8b0:4864:20::c41])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gofTD-0005yQ-7c
 for linux-amlogic@lists.infradead.org; Wed, 30 Jan 2019 02:19:20 +0000
Received: by mail-yw1-xc41.google.com with SMTP id j82so900880ywb.2
 for <linux-amlogic@lists.infradead.org>; Tue, 29 Jan 2019 18:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=MGYFBWzW8s036IeOx2ooV5jHirXJnReR+pllX8c2Nd8=;
 b=QaN5qgtIehJ5SvK+ElXUiLlkjphVKCi6HH5xMyIVf/V50e7zOxsZT1egPuLnOH4ULZ
 49ywzZbHAlIevl4mtN9CZbqU5ltHAI+KHmxoJ99MWKicmWXMGKRiSTmEHorxlyJCJZ7f
 667jSrhfmaVXvSqqpIInBHXWzFNS492ifZZYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=MGYFBWzW8s036IeOx2ooV5jHirXJnReR+pllX8c2Nd8=;
 b=C381cLlpQKA5d9BJMgG+DXsaSkoox72fBBk36CJ/87iGk8DPoOsYuQC6R+sZPEEP/l
 6VLgfy4fDWrF3XCGZZyW6IoP5/fBhToZgApJzaNjamjlzgcbNqt4XRrfeECj87t+9TCR
 pYtZow2wv1mctuhTnld5CbvWYp4+OfcxVCjP8xLU50RoGlIl7968k5AuGwpZk2edZmZM
 YHnOYgdzRF4w7imUj81ToEyAUd7Sd+ETfTbuQ+fR1DixivXE1Nq5wAwT5rvDXcb1fXHN
 YqiF9uXFwvoY9YFXUWSOVVXGuaJhNvrDKhz7g3cuFGXFmmasff+l9Mc62z31s9sokYCN
 +wAA==
X-Gm-Message-State: AJcUukfYtz+lprfHIKPlV3DEMTry0oPfc5Amy4XKXqdBj6ZaD+7Z2KQ+
 PsCjv7xPBfFP61M7OmY83ZoXkXcXMOU=
X-Google-Smtp-Source: ALg8bN6Jvok/QUnRSr57WNn/CDYdN3lY04vGWx+GgARZV/4DBrqKvr86Nj+JcRQ5Zq2o457sYF9wkQ==
X-Received: by 2002:a81:1693:: with SMTP id 141mr26997469yww.133.1548814757221; 
 Tue, 29 Jan 2019 18:19:17 -0800 (PST)
Received: from bill-the-cat
 (cpe-2606-A000-1401-82A1-65F7-71A-2422-73B.dyn6.twc.com.
 [2606:a000:1401:82a1:65f7:71a:2422:73b])
 by smtp.gmail.com with ESMTPSA id n65sm60591ywf.15.2019.01.29.18.19.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 29 Jan 2019 18:19:15 -0800 (PST)
Date: Tue, 29 Jan 2019 21:19:13 -0500
From: Tom Rini <trini@konsulko.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PULL u-boot] Please pull u-boot-amlogic-20190129
Message-ID: <20190130021913.GS30838@bill-the-cat>
References: <65195f2f-1a96-babe-a08d-aa9f2899de33@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <65195f2f-1a96-babe-a08d-aa9f2899de33@baylibre.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190129_181919_339201_D861ACEC 
X-CRM114-Status: GOOD (  13.00  )
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
Content-Type: multipart/mixed; boundary="===============6405304838038635883=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============6405304838038635883==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0lx/R+CYDdR/AN/7"
Content-Disposition: inline


--0lx/R+CYDdR/AN/7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 29, 2019 at 11:22:15AM +0100, Neil Armstrong wrote:

> Hi Tom,
>=20
> Here is single patch adding support for pinconf on the amlogic pinctrl dr=
iver,
> fixed after a build failure report from Anatolij.
> This PR replaces u-boot-amlogic-20190128.
>=20
> Thanks,
> Neil
>=20
> The following changes since commit 0da90255083681a02b24528f80da9d4062ff63=
4a:
>=20
>   Merge branch '2019-01-25-master-imports' (2019-01-26 22:47:55 -0500)
>=20
> are available in the Git repository at:
>=20
>   git://git.denx.de/u-boot-amlogic.git tags/u-boot-amlogic-20190129
>=20
> for you to fetch changes up to c4c726c26bdc09a2c907e230fdf6c75adcc2b674:
>=20
>   pinctrl: meson: add pinconf support (2019-01-29 11:19:15 +0100)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--0lx/R+CYDdR/AN/7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcUQmhAAoJEIf59jXTHXZSYnYP/3ekFQIWdSTaTRmMEXWqdf5M
6ZDNXb7+NliQzQiBvUl845PuPsMXGGjEdT+MfX6EbkmX1KSMwWVP9x6USXgsgQsh
dxDtOwkM3vmzAPHS768jVF0frB8xW4X5gKRRFDBw4eP4XzbglLUVW44CWBJqoFo+
pniVqG2tfqEO/ML2WLgxsRXum/nnySHVPynySadFjLDU2Dy6HzIIX2ehIzC5BSjh
4UDY6lQlQQTXWCRCvssDvmQS72/A6BXMdgXEmrLMHWL4jl7Is3XxFAkBiAvIJe2k
WJZAICVYTAFLuGQ9pqsF94L4BZl3dfwcrk86lzQrAl4cYIv7nwpG+PB5AuOIO1Fr
XX3KRiMTyQIdfFvVv5Hb72tHzLNi8Xdwit7VcL6vSy+lxc5+WoGxsu64cwN3T+9/
joH4JICaiDyh7HRwU/XQUprOTpusyksA5KonybyoM05QtDTWjdmisVfFoV4pDkkt
TRRIkKUE5tbPP5gNjE1OduwXJdlGib1eahvvMb5tFynrHRqocCRWAvljqQDd1QLg
Ie3O/8QNYuhRaJVRyrKR/f0lYDBfl5CpUNhgmxt0aMkaU5HmCfWxIfrZIteIV6Xo
KX7gc2BR5M9cEy4PEvWrSRv4jk5/sY73sA6KIERG9NMEF4Zl/vwZ3uPe9hkA5pYT
o/Ij7R0RgooGKZESyi4X
=D4/R
-----END PGP SIGNATURE-----

--0lx/R+CYDdR/AN/7--


--===============6405304838038635883==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============6405304838038635883==--

