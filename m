Return-Path: <SRS0=tINo=PA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC188C43387
	for <linux-amlogic@archiver.kernel.org>; Sun, 23 Dec 2018 17:32:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A149D217F5
	for <linux-amlogic@archiver.kernel.org>; Sun, 23 Dec 2018 17:32:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k1/EhRTy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="fswjWfZQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A149D217F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1z36R84pRt4b1IZYZBFdkKTciA8c63UQEFKrdMcASys=; b=k1/EhRTybsYMtflyCYfP84IB3
	hRQiVrUpfQgWAfHYMuicnQx776mIo7t+z+wfZuWNDUdtIXSQWrj5xJ+ZDFb+rDKhsgKwcCyp6J3Mo
	35RBJSMUAA3UBtd/TlZW/Qw+2Dx8T8Yl1FvmMXN5ZQPg+LeAveNLyQzSpWvrB1aDGepC5mHMVsjwN
	wRJxOBs8zcEXt2krd4K2m58J2SE8xJvg8LrpWPdWg83pq2zYcjpGQcOEZHlTcahTzyqAs2wt/tMNc
	18EB15lyQKDAsa04ucBFErUFPjPRa4NE1lAFkiEverYDThQEHRfjknMTgmDS61e3e1vnHA15EFjDB
	AuMP4VHxg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gb7bc-0003pZ-NB; Sun, 23 Dec 2018 17:32:00 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gb7bZ-0003oX-Or
 for linux-amlogic@lists.infradead.org; Sun, 23 Dec 2018 17:31:59 +0000
Received: by mail-qt1-x82c.google.com with SMTP id t33so11259026qtt.4
 for <linux-amlogic@lists.infradead.org>; Sun, 23 Dec 2018 09:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=C7GW9g+Ygo3bPmPXnzqIJfqFibGqXl04IK1d0drKyCw=;
 b=fswjWfZQSLE7m3O98tmyYWMdm0w3q67PZry11VLeY6TJxt/Ptn/vFdVTzdW2vj10TH
 oYcl3/6Lyd94gTtyBXqxYRWSxufesr8AzslWSXW1OGXKi8H3s9gafgmf4qRPS6uP47Vn
 L3nCvdXDKyMnqXagcM9Hvyk+Nj4XfVybhmWQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=C7GW9g+Ygo3bPmPXnzqIJfqFibGqXl04IK1d0drKyCw=;
 b=YSmEPvRy05H9upy4i63tfsm6eYklK+COdC+ShBJZvDMPqXdz2pAW1/dcLDMQpqSqgT
 ume/tMTJV+NcZy/QzABVUREgoB07iuyz6fS/28M7tIUlh+HVGjYvqFtTuhvolHctH6eg
 7siEodmhMB6MJ6nQdGAxcVsa3iyezCYMVmiU6vTe/r+hi3zJNa8p6163Lv210+HY35e6
 jsZqkk+dTFyYiqSba30AJc9mXV3YvL/JAMF6lJCAOB7hbuO//UQUB9rLYbTwQ8WEurxp
 rTxlgnKNVkZ3GU3iaAmZy2YsMMpSIuUvqdKU4KgFUHFaCtVUJc5nMYjW0t8TbCHZpbZa
 D24w==
X-Gm-Message-State: AJcUukev7wWBgT0sHv5W/R8jz4ufDuI6ZrDGQ0BmS7Xye+ekPjE0nndw
 gC9OGBm75xOE8g3+lkAt63s2ZQ==
X-Google-Smtp-Source: AFSGD/UnF3jyesSyFbk77VZnfSJp5L2aUdhdmgyGL3Nqkok2fa62IlRGtbRcqooDvJaJah/gint9MA==
X-Received: by 2002:ac8:35eb:: with SMTP id l40mr9865104qtb.165.1545586304532; 
 Sun, 23 Dec 2018 09:31:44 -0800 (PST)
Received: from bill-the-cat
 (cpe-2606-A000-1401-82A1-9431-EDE8-CD24-6BBE.dyn6.twc.com.
 [2606:a000:1401:82a1:9431:ede8:cd24:6bbe])
 by smtp.gmail.com with ESMTPSA id u45sm9527882qtk.33.2018.12.23.09.31.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 23 Dec 2018 09:31:43 -0800 (PST)
Date: Sun, 23 Dec 2018 12:31:41 -0500
From: Tom Rini <trini@konsulko.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PULL u-boot] Please pull u-boot-amlogic-20181219
Message-ID: <20181223173141.GK8702@bill-the-cat>
References: <83c46e56-a2a0-b017-2b24-3fb4f4485e2b@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <83c46e56-a2a0-b017-2b24-3fb4f4485e2b@baylibre.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181223_093157_872266_B4D499E6 
X-CRM114-Status: GOOD (  11.21  )
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
Content-Type: multipart/mixed; boundary="===============8535024378443728601=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============8535024378443728601==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5D+Tf16H6n1q6I+V"
Content-Disposition: inline


--5D+Tf16H6n1q6I+V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 19, 2018 at 04:26:24PM +0100, Neil Armstrong wrote:

> Hi Tom,
>=20
> Here is single U-Boot DT fixup for the S400 board.
>=20
> Thanks,
> Neil
>=20
> The following changes since commit 1f2e948d6d53f77a2ddb2dde3531b0d5bc2815=
ad:
>=20
>   Prepare v2019.01-rc2 (2018-12-17 20:25:24 -0500)
>=20
> are available in the Git repository at:
>=20
>   git://git.denx.de/u-boot-amlogic.git tags/u-boot-amlogic-20181219
>=20
> for you to fetch changes up to 53904dc7c13841497835090a8057930d4a84c4de:
>=20
>   arm: dts: s400: Fix status for eMMC and SDIO ports (2018-12-19 16:20:50=
 +0100)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--5D+Tf16H6n1q6I+V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcH8Z9AAoJEIf59jXTHXZS6LIP/0oq2fZMVnwRe+x3SncgIhOr
P4HDPGt4vr+HVQLm0io1e/Upi8+NdBB2MgNaS4oTaVorj1hjorJsqDFlX2OnR389
yoj241xEy6JAmYng8K3enSh2NpZRo4r8iATH9bKZ+I5RgMRUX019BrU/F62OcFv9
+u7tUFahCAl++IY/OvTTX97Eud8ZSALUrxs8oUaQmCVVv3e7yCNWQDJlkNRcb6/g
ofagLwsDBnPQYjduOb62b0PPabudlYtA3j7w4uw08C1xwHQBIOLKMfi9kgGyDXaD
Zo7+2kCvBIHe1ZKgpUxkYN0HOsPIjtPp5Q3qdPKBSAWCrf5HY8RBH3bffhK6G7ww
vZFU6Ziw/EdnyUj+IYtCIPhjcvrl2JXiWwk6Z4p+BEVEikIiZCNUMKnUZ2Loj3gL
cJxOCWNLwoOc2TeMDweJ7Gcd6SqrGviqc5GX9elaTs4EqqI1HDm1vitDdvlMC3wz
B1tHWCnTSdSSgtuUp8zx1qIIecJvvMF7TYTmjzjf1S0vGkrM8IdBlzyZg5l88e2e
vyNFbZ8C1oikMsM0szKNH6Sp1PWlYIfcbXFOqACP8VI/F6wAWQuNrnktbT0j1KAj
GaJ1QkrLRQAgSLob3L8/cpbmcgbbJ3wOguFYkJ0hA+QL4Iq05eBHrx7AbGlnVkxR
LrokTofDHENh1YdIuUI2
=Ogn0
-----END PGP SIGNATURE-----

--5D+Tf16H6n1q6I+V--


--===============8535024378443728601==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============8535024378443728601==--

