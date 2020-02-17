Return-Path: <SRS0=uJma=4F=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18CBCC3402B
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Feb 2020 21:08:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E17CF20725
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Feb 2020 21:08:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NWpSkJ0E";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="SjGC7LXO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E17CF20725
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hJ/rVwXqXygw2R3x6Z9mCFYwLaiU2jrOGE3P3gCeDUw=; b=NWpSkJ0EFSOY7avlY6izv23dg
	moYnZFSlTfGMDysEi2wQfTW2ytzAVU8MoQHW+swoW04sPxhDDH/u06GcKQPf2nedlRR8RpAu0FQqA
	U8e82SxbGbEoxyq/pmOQXAO+rUlg4rZY0ZAgHj3JGtQh/08eIBcpej8YNZAZA5kiWvapIyJTIoHVV
	B3sL5hLGTGeIcZQhC9JMEWweBRt0U5YBvki8WZ/Ry8YfeoVbAfpcNZ5jbkAj+dzBTQVuWilaT8zDK
	mUXaCYaDNwNbzjspgfej9UTAWbo2a5FKzcinxpdIScNHVyzpYf6CAMzi+x1tP/ewsFs6SB4O6+/n3
	Ad1lbRQJw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3ncT-00015y-H2; Mon, 17 Feb 2020 21:07:57 +0000
Received: from bilbo.ozlabs.org ([203.11.71.1] helo=ozlabs.org)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3ncQ-00014h-7v; Mon, 17 Feb 2020 21:07:55 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48LxQX2r8Sz9sPK;
 Tue, 18 Feb 2020 08:07:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1581973670;
 bh=nxdEeK3aKrGZjzXa1VSBkCfAzQbvnzVXLQPM5aG4gSs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SjGC7LXOH47DzIYa/wTx9kck7ihEqEtd35QbvysyleLDJEjQ5TjidZYlw4EvotXPT
 CNdW/Ie+nISOjpVQNkI/tAX84t1nI3NLRA87JI2qdzjhr/wqKoazjF/aZDzBdoFHJ/
 VKiMfeoHd21dajc8qvIXzamrO96hG4HVMc0cB+y1K2ZNaauNI5b4V8fczSfEFssmom
 bcxJ8tjrXKbUDNK3b4mJe6iMy1s4xLX80MhbQkSmuBoirvX2wJ5CXGnIT7SwXB6bhW
 Fk+hqPBEet1lc8QjqYiICsTwtN/z5HT49IFmL0HxvrL1iF1yUiIqKGhg72zcBccGxi
 ehRzhNhxUdaFw==
Date: Tue, 18 Feb 2020 08:07:43 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jianxin Pan <jianxin.pan@amlogic.com>
Subject: Re: [PATCH] soc: amlogic: fix compile failure with
 MESON_SECURE_PM_DOMAINS & !MESON_SM
Message-ID: <20200218080743.07e58c6e@canb.auug.org.au>
In-Reply-To: <1581955933-69832-1-git-send-email-jianxin.pan@amlogic.com>
References: <1581955933-69832-1-git-send-email-jianxin.pan@amlogic.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200217_130754_480789_0B913356 
X-CRM114-Status: GOOD (  10.59  )
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
Cc: devicetree@vger.kernel.org, Hanjie Lin <hanjie.lin@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jian Hu <jian.hu@amlogic.com>, Xingyu Chen <xingyu.chen@amlogic.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: multipart/mixed; boundary="===============5644738882542031721=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

--===============5644738882542031721==
Content-Type: multipart/signed; boundary="Sig_/PmPWq+6iWpnXtLvAov9NhcT";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/PmPWq+6iWpnXtLvAov9NhcT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jianxin,

On Tue, 18 Feb 2020 00:12:13 +0800 Jianxin Pan <jianxin.pan@amlogic.com> wr=
ote:
>
> When MESON_SECURE_PM_DOMAINS & !MESON_SM, there will be compile failure:
> .../meson-secure-pwrc.o: In function `meson_secure_pwrc_on':
> .../meson-secure-pwrc.c:76: undefined reference to `meson_sm_call'
>=20
> Fix this by adding depends on MESON_SM for MESON_SECURE_PM_DOMAINS.
>=20
> Fixes: b3dde5013e13 ("soc: amlogic: Add support for Secure power domains =
controller")
>=20
> Reported-by: kbuild test robot <lkp@intel.com>
> Reported-by: patchwork-bot+linux-amlogic<patchwork-bot+linux-amlogic@kern=
el.org>
> Reported-by: Stephen Rothwell<sfr@canb.auug.org.au>
> Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
> ---
>  drivers/soc/amlogic/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I will apply that patch to linux-next today.

--=20
Cheers,
Stephen Rothwell

--Sig_/PmPWq+6iWpnXtLvAov9NhcT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5LAJ8ACgkQAVBC80lX
0Gzg7Af/boLJ+i4JAZ3psBMn+NTk5UrWqeD9jIY6ZyGmw/9xma882M/tR21D0KEI
S+5mkEFT7PKNvhjUlHhshMB/nYmrPpW/EhlHou1cuNmIGDx9zotA9PJyVGAQ8LW6
J7ajzSnF/aB77dQY4r99qm+FxFZARbrqMC41P+1raM/cz2LjoK+dVW62P9qh7tce
OajY/Qs83loC/fMzdibvV4RAXHAqMThSsEKF5GOswo/d+ySN9LFn0ekSExOklBzE
K/QiBlqMU1leEM2nSgbOXdLjQzsJ87ZOLb9J0PUbP15VKgJ9IX+mTyaYwZblEsDY
k4roNmnelsEhMiyNoFhrdO0rqFWV1Q==
=2huF
-----END PGP SIGNATURE-----

--Sig_/PmPWq+6iWpnXtLvAov9NhcT--


--===============5644738882542031721==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============5644738882542031721==--

