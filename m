Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FBD8C48297
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Feb 2024 10:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fBZZooWuvD4ozRBCwX6YhmxhA8g+VDw9oSYvsiQOW7Q=; b=UQtZ1CVaZj7JeiCpUxiZPa4br0
	0Frc1hmbPH0ByDit4lmHGhdSTj5b3P4V3SUMAdZFzrPaDMN+bgKLDPbPr76ITDq0eYqlPcbdeiGb+
	ZEj5XY95FQvhaxBBdX+ZfxCjClIjp9ByLmuqBZtcBpWVtm/FBuMseyf/BHyMGmahCTTwzZ6ZkjdoA
	ZpbKEpEIpd2y1WALeCxDC5LRv6wSfliB3QQhQSkDHMF4AZGHwII73+61gTi3u09mvlugybVqLTXHW
	ItDUwFeq1pnY1YlgYlr8gvFTV78ifkweUxXpqe8U2WVJ644VyB5YbF3Y65kj8HwTkOI/isssLNFv4
	C67sBYdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXJAX-00000007BMG-0TL0;
	Tue, 06 Feb 2024 10:59:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXJAU-00000007BLP-1bVL;
	Tue, 06 Feb 2024 10:59:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9226C60FDA;
	Tue,  6 Feb 2024 10:59:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84048C433C7;
	Tue,  6 Feb 2024 10:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707217149;
	bh=m1COPvgI8DAgpxWvHI1P0CLUstxG49tEkR1RqUd5cuE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HLYe5xSd1BGjdt9JytXSQ0iJHMFYUejuUzmpBDu+9ZMUDUoClQyZUKCSENVA5kT9m
	 vgDc4b00j+NSnir3Glqca86K00a/o06TGHh1fnwCNkpUK6oWv8r0FqDkSO0NyJu0cZ
	 rLFrF/CPpFp2oau3Py417CL7J0e9MbRZtJbWUM6VLnee8KwgN1HLnJbByom/tOK8Be
	 Xk7aY8V3dII2cBKDeyVAEDbl+Lh5I3cJMobvDIsrE6XoBssIvvw0DkI5tDnIcGq67a
	 AADmjAgVVue9m299igFPDFXSqzoIMywCIm2wuI/XFXnlIfAOSPv1rjiflwMEtKhD1l
	 46W6CJKCQDr8Q==
Date: Tue, 6 Feb 2024 10:59:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Bo Liu <liubo03@inspur.com>, lee@kernel.org, wens@csie.org,
	marek.vasut+renesas@gmail.com, support.opensource@diasemi.com,
	neil.armstrong@linaro.org, ckeepax@opensource.cirrus.com,
	rf@opensource.cirrus.com, mazziesaccount@gmail.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-amlogic@lists.infradead.org, patches@opensource.cirrus.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 00/18] mfd: convert to use maple tree register cache
Message-ID: <ZcIQ+f3F/hSU1Jcx@finisterre.sirena.org.uk>
References: <20240206071314.8721-1-liubo03@inspur.com>
 <CAMuHMdU7fYCsNT9ditqJ-saUsRm9J2zLh=-q-zmExhBRJeE8NQ@mail.gmail.com>
 <ZcIE/RMTq34TgpQt@finisterre.sirena.org.uk>
 <CAMuHMdVj1bS9s69ASrd5xULc8oELoBbnb8HEX9MEmA43853_EQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVj1bS9s69ASrd5xULc8oELoBbnb8HEX9MEmA43853_EQ@mail.gmail.com>
X-Cookie: You might have mail.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_025910_484006_D627157C 
X-CRM114-Status: GOOD (  13.38  )
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
Content-Type: multipart/mixed; boundary="===============8353234929699468354=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============8353234929699468354==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wohqWBqzA9LyPZP8"
Content-Disposition: inline


--wohqWBqzA9LyPZP8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 06, 2024 at 11:14:11AM +0100, Geert Uytterhoeven wrote:
> On Tue, Feb 6, 2024 at 11:09=E2=80=AFAM Mark Brown <broonie@kernel.org> w=
rote:

> > There is a very small niche for devices where cache syncs are a
> > particularly important part of the workload where rbtree's choices might
> > give better performance, especially on systems with low end CPUs.

> The REGCACHE_* value is specified by the device, not by the CPU?

The device is going to dominate here, the main thing is how much of the
workload consists of syncs.

> While some of these MFD devices are on-SoC, and thus there is some
> relation between device and CPU, several others (e.g. PMICs) are
> external, and thus might be present on systems with a variety of CPU
> performance.

> Perhaps the value should depend on some CPU heuristic instead?

No.

--wohqWBqzA9LyPZP8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXCEPgACgkQJNaLcl1U
h9CLEQf/Q8Y34eZ58gNTCjgBWHllS9BWTNNoJRfggd2UXR/TK6Wux1Oco73AD+sp
j/x/FfZT9XT7iXbarZ87ZUfIEOS0Av7GhvLufUzoxtgfwbGkm+8sR96avkCzf8sX
WpZ5sICL8fs2NykKkJt76AWsgWaBOYnRgyZrIZ+0a1w+ZUiE5UYEb6TQ7IZZtKrE
EehYa/mJg3yWROqkiRtnEvouDAmIAgVH7rM2Vfj9G79uLyG4fsvvsuOEjQ5KMGMU
IQAfWU0Vik+XfvR3VhaP11Bd3wjt8noEbyksgDXNSHwDDNH1zytr6GrQJGJkkVh0
JB5leaIP9fDnAmofgyqoOqG6uUokNQ==
=UNpd
-----END PGP SIGNATURE-----

--wohqWBqzA9LyPZP8--


--===============8353234929699468354==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============8353234929699468354==--

