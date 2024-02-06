Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33587C4828D
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Feb 2024 10:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aekT2oDCOsegzKQvCxeXr0azWR/2d6IDKrbRH5Xb6X0=; b=n2VY4DBk6xe3BTvlRvPHcYF3vD
	VFJJfW4Zo8CZA2pq6go4xWT9MOZrM4FOdNwB17dkGFTpXXkl0JpftYoAxNof7SB3AbrlmEa4UbP2n
	xG5TSWe+CU+Q+QLw8B8N1IkOQV7ppSJMhvWSh7jxD3a/bscf1n2BkKnJigyGQWdtmZ2I3k4+KXLAG
	0CfduudtuWcbe8YHjVWLl1I07q+Tti4Hk9WbahffWk4uiiqPYLU7adAwdX7/dh7VWNaTlYMMCRoQa
	TbiyQ4zj5eBbBb1A6SFLmYZ0/yCXJCbEUpjuYPT3nTJBTR3rPzH1lrYQcFeeoWNDKOwNqcQ9ZVCYA
	nOaAuT0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXIO4-00000006vHg-0Ohi;
	Tue, 06 Feb 2024 10:09:08 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXIO0-00000006vG9-2PFU;
	Tue, 06 Feb 2024 10:09:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AB4F0CE0E1E;
	Tue,  6 Feb 2024 10:09:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 491BEC433F1;
	Tue,  6 Feb 2024 10:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707214141;
	bh=6eh7rugcdTI/j4n4bbvxX9jPn6+zlru65TEB6aU9mAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B6GlnIVkN55eTnQsnXVV1Si9JIdYeZaBygDWpnXhaezs6c7BhJwZwHqcjdzHvuocJ
	 X1FnvRTTBZX6c6ttOzlVw4itRhxFNPOCpQUmN0QNaiLeH4vQQvGX5nG5AU/LyBSend
	 TViEnaFWX/KpNu7lERTnW/qbWoacNCoLcrNd8RD7g31DXTpAHbJ3VLGlWodRdbnJAS
	 z3eAv9N4JX5MkvD1SHm0z/+1tLxXXHyc/a54hzirjx3iPiq7uP29rhC6F62uwbU9QL
	 s7dksCpA1frqw8e+hDrOd1nquIxZ+D91Cpe3oSfkvHoloeEKy/Pq2KyVitDrezj+bt
	 yjPw0QYmMG5cQ==
Date: Tue, 6 Feb 2024 10:07:57 +0000
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
Message-ID: <ZcIE/RMTq34TgpQt@finisterre.sirena.org.uk>
References: <20240206071314.8721-1-liubo03@inspur.com>
 <CAMuHMdU7fYCsNT9ditqJ-saUsRm9J2zLh=-q-zmExhBRJeE8NQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdU7fYCsNT9ditqJ-saUsRm9J2zLh=-q-zmExhBRJeE8NQ@mail.gmail.com>
X-Cookie: You might have mail.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_020904_815123_33B55403 
X-CRM114-Status: GOOD (  11.21  )
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
Content-Type: multipart/mixed; boundary="===============0655563076671144764=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============0655563076671144764==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3tKV0MZVgabPsZSl"
Content-Disposition: inline


--3tKV0MZVgabPsZSl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 06, 2024 at 10:33:22AM +0100, Geert Uytterhoeven wrote:

> If all of this is true, is there any reason to keep REGCACHE_RBTREE
> around?  If not, perhaps REGCACHE_RBTREE should be treated as
> REGCACHE_MAPLE in the regmap core code first, followed by a single
> tree-wide patch to replace REGCACHE_RBTREE?

There is a very small niche for devices where cache syncs are a
particularly important part of the workload where rbtree's choices might
give better performance, especially on systems with low end CPUs.

--3tKV0MZVgabPsZSl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXCBPwACgkQJNaLcl1U
h9AzsQf/fvluGCbAx/aIe1RLZpmbVAXZdaP3edZ9jN+FzV+ub/6qY0iiPxN0esI5
jpGS40Z27yNHgk1JIpJR/ZoCUrjeuLDekUhJmu87yhqnK3p+DsT/zfnbqbeSdKXz
FuOUu8Kh+hH4bdbyjTMNvTAzzuPUwgE7DRFGAlu3tPkZXEFtMzpSCImrqxIrsKao
Z7quNE+m6pc4MyiQ09p0cOAK8fjnSHuFNn2wjZX2GgAGnLEYkKrpQwYgkrDRlHqc
C7Cb1gOefwAx/I8mYuP+2TJNV/XVUKWJ0Od8KZ+MVbxaEslqAJaCvMSXzgkj/dqU
ssEshBmXp9EzMJKlUQ967sIEsiM4OQ==
=DPIT
-----END PGP SIGNATURE-----

--3tKV0MZVgabPsZSl--


--===============0655563076671144764==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============0655563076671144764==--

