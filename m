Return-Path: <SRS0=06Fz=QH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 789A4C282D7
	for <linux-amlogic@archiver.kernel.org>; Thu, 31 Jan 2019 02:42:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4946F20989
	for <linux-amlogic@archiver.kernel.org>; Thu, 31 Jan 2019 02:42:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SP0COSfn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="tSi5RXBJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4946F20989
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gRFzaJ8xnY3hSQhRAWb2pFSxKjuaPdagX62r6TDFu8c=; b=SP0COSfnUbTwN6t0qKZelH+LJ
	X3S+ND38vk1kkOKvnQFRBskX/n1H3ve25MUYbeGcQd1LVQrdVpNweIBy8U2CibuCURgeZ1SKBukFv
	mLwYmUBuWFeIrj92GcJ09MMUt/wrtEp5NXeRWHPv6bxOaGAuHRVqRrMatKLjJqqtbYpBo5OFUn9Wt
	nUuwNZLMeQkJ/TNKxAgvkXkICv6s4cfTgHspGzQXlJumjoq7uc/Was6aQ3Ae+miN/W0YRIwopTSXp
	LSmwKXjldtn6cNsCQ6WE2eV75j0dzga3WrlAPd63UoXHsIGwG71pwJB8RwTAHCIQnVFXENQw8HYrc
	eXk2IMEnQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gp2JI-0003et-RV; Thu, 31 Jan 2019 02:42:36 +0000
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gp2JF-0003eb-DW
 for linux-amlogic@lists.infradead.org; Thu, 31 Jan 2019 02:42:34 +0000
Received: by mail-yb1-xb44.google.com with SMTP id k189so705209yba.11
 for <linux-amlogic@lists.infradead.org>; Wed, 30 Jan 2019 18:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=zqLcobByDQmmVFaPGSekFg3sIFxUTNoGrlwKRFoFTrQ=;
 b=tSi5RXBJYfUKJ3tkWSatJ38dUA6IXKZKqerg4ncyltkoMxtW/mBwYoKIt4iv/jqeGO
 ybEDeYWfnJ8H9wsZTn0WPqOtauQCIkoWWNMGYXtmbJKlyFSyNi8PtCBe4ZN2skTxTYRl
 S2JjAWmddlq98ULAi8cndzKBddfU9Orsd3AbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zqLcobByDQmmVFaPGSekFg3sIFxUTNoGrlwKRFoFTrQ=;
 b=RBhY3alyJLuEKTvejfX75CTtV8JE86Dba2oqXi6IkD2P6jOi0Q7Z5mZR6klnwVUgW6
 ADUZZT7eC2R9b6RFevbI9vdZO7zMk6bFaKNp3wiurEGKi/bU4EBaHb0y+6rMjscjVt7T
 pO1ZP74M8hk63jg3FbjP6dyVCc2kNs5/EGGURlzR5ljhYSTeGQkQ5jBh8rW0ad8FC1Ei
 BN0lZGyREsi0d8HcPieSuoQLfnHFsSScE5dtb4gt2xE26axuTTpB+wr6iE02eU8CyOfV
 wCEmxrARsOMgP2o06gy9SsfrAabOErD/0Ye5xoxTcPKvG2XA2KhkeBzjTr7KymwrS1Lg
 LZXw==
X-Gm-Message-State: AJcUukeC4VhXR6GXzww7ok10iRNwHRm1cWjtWSb6RMb1d1eSMgUFNQaf
 Rev0ngTxu7Wl87+DmXvF6yBGufB/MPk=
X-Google-Smtp-Source: ALg8bN7pl1W3A2KSilOYK+BFr9Z9WHRdd01qJfUYLAPKdUJVEo8qj+sNFkFeivhqyXlhuc2nSIqQuA==
X-Received: by 2002:a25:c0cc:: with SMTP id
 c195mr26128612ybf.166.1548902551931; 
 Wed, 30 Jan 2019 18:42:31 -0800 (PST)
Received: from bill-the-cat
 (cpe-2606-A000-1401-82A1-BACA-3AFF-FE98-1ABB.dyn6.twc.com.
 [2606:a000:1401:82a1:baca:3aff:fe98:1abb])
 by smtp.gmail.com with ESMTPSA id n10sm1139555ywc.48.2019.01.30.18.42.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 30 Jan 2019 18:42:31 -0800 (PST)
Date: Wed, 30 Jan 2019 21:42:29 -0500
From: Tom Rini <trini@konsulko.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [U-Boot,u-boot] MAINTAINERS: Add Amlogic entry
Message-ID: <20190131024229.GT30838@bill-the-cat>
References: <20190130095310.8803-1-narmstrong@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20190130095310.8803-1-narmstrong@baylibre.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190130_184233_520906_06B90484 
X-CRM114-Status: UNSURE (   9.13  )
X-CRM114-Notice: Please train this message.
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
Cc: u-boot@lists.denx.de, u-boot-amlogic@groups.io,
 linux-amlogic@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============7013793517868673813=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============7013793517868673813==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DWnKfPfB2seWFM1r"
Content-Disposition: inline


--DWnKfPfB2seWFM1r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 30, 2019 at 10:53:10AM +0100, Neil Armstrong wrote:

> Add entry for Amlogic SoC maintained files and the freshly
> created mailing-list.
>=20
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Applied to u-boot/master, thanks!

--=20
Tom

--DWnKfPfB2seWFM1r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcUmCUAAoJEIf59jXTHXZSbTQQALpyVStu7UeP1VPiK2otg7Ek
XvKubOzPm1PPYVQ1ClX08u5d4rHAOntKnkl/zedZKEC3/CyK+6/xTQCd3MmcjAjW
Swf+ditl/wEQH8NdCM4feInP7sfZaBgDhuljWRI8dFS78y5aKvMnLDQi/kEvkC5I
T6+Roo/UxwacYZngsm4atlwh/qwwxUVhhcazVyDBKhjT11XpGqC1tOhyZa7KwfHo
C5kP+LWPc9nZxU0r2gKxD754/mRys2vjTWNrsc9XBHwqWCxtk9JBvtxcik4Pg4kP
VodpWc3K08DM42LHEqrS0Gx7XlXc0jbNDEB840MKh7x09uVVCKV0NTNohEJBdp+1
3wj0UYa0gvaVPMU/pHS1+vPhqvkq2PTQ+f6fH6iFkxL98PUhyV3TFDJeBEKiRJB4
YS8hbpaP8ur1RHSklg7wTfl3xMf6cVT5CnoG04DqCANXITZa/+yhlpi2IZCb4dmZ
L0ar5a38Y6clIMx6Hz990N2YIZAA8RH2yjxYdKmDz3GgJ/hHSgGHhQJ8mFm9Hzxl
sstN6q6UYbysjnwpTbitoLzGGX8R5tNukPDf5b++vhdZ0HsFyOdolLgGaILbcnSk
G0NFxe3uSoLSVy930EXqycIrQkov+A5mVoSEjC4PRlb2K7+mMoeKA6tWIFc7U+R9
/PNVs5UY7PPhKUejxuhi
=194f
-----END PGP SIGNATURE-----

--DWnKfPfB2seWFM1r--


--===============7013793517868673813==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7013793517868673813==--

