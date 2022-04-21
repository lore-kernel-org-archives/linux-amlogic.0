Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B424FC433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Apr 2022 16:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oyb88aDrpRkPvE5uNsRYgQ/WfRbMNCom0hsoDeotyT8=; b=O+lcMTWIhFOIjJMB3YRpgUSNKb
	eNhPt9Si3Lq0/i/76wIwEZ43GHeWc0GiI5SQeqkFHiKFeShJegrYKhiQ+A1FsxiyYozJsTkmz9rn0
	I1O0zP3XCEX937b/tPD4cMxqe/qmjaijkIPNxl9Ulr0Dwus/i9+gkGRXbqb2CUL8HJ4lfaMUpyQWx
	1kwv9W8HAxdk1fDlrczvFU/A18zi5Li/bfJL+o1LC5Gz+LFoHksupZrMuyJ596Ufp3vNEsusbvlKH
	bHjSLMtKFd5TcSVMbrjjy5jUjjHLbIJ7iYP1Te0CzJJJoWFnprnNbJQv0ObdV5LsplcIBxXQl0Nt1
	P8H+uT7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nha95-00EMdS-3B; Thu, 21 Apr 2022 16:59:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nha92-00EMcQ-E2; Thu, 21 Apr 2022 16:59:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C8CE561D99;
 Thu, 21 Apr 2022 16:59:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1578C385A1;
 Thu, 21 Apr 2022 16:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650560343;
 bh=+kLX02+pvp0VAy7mZikCPZm3m+jcmFNycfkdqROEoG4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W3SHqRLXFzShZFzr3y8krzbijHOnldDnMtuCLa00QdChMiuy1i4ZxmDQHLDToEZVs
 uLkKjUbQDKEo9gAWBIOSxVduMi9GFtbXCF9K0GyP8lyf8tjYtQtk1C7RA4V2VkmwnA
 iDlpWplntXOBBAvmzpsCiHsDb1f+qzCENxUUzez79+R71kn8SQAZoia12LIWfLkUQG
 Lf5zODhiJF6dc6Sh4cL7tKS/saLhylN5FBGNauYIXEY6LpEvrZODapz8vmT4nwwyJq
 sWhwTBF+RWkTpg4TPDgyi2uOMSBbByyYJmWvk5dmYz180M2wMXxvltygk4xCg4yhIP
 DIZzbg9ZbzyqA==
Date: Thu, 21 Apr 2022 17:58:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: jbrunet@baylibre.com, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Dmitry Shmidt <dimitrysh@google.com>
Subject: Re: [PATCH 1/2] Revert "ASoC: meson: axg-tdm-interface: manage
 formatters in trigger"
Message-ID: <YmGNUoOIHMDkciR8@sirena.org.uk>
References: <20220421155725.2589089-1-narmstrong@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20220421155725.2589089-1-narmstrong@baylibre.com>
X-Cookie: Two percent of zero is almost nothing.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_095904_530424_16F1C12E 
X-CRM114-Status: GOOD (  11.75  )
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
Content-Type: multipart/mixed; boundary="===============0598667230375614122=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============0598667230375614122==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3eyDRwkM/Maj7Zsh"
Content-Disposition: inline


--3eyDRwkM/Maj7Zsh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 21, 2022 at 05:57:24PM +0200, Neil Armstrong wrote:
> This reverts commit bf5e4887eeddb48480568466536aa08ec7f179a5 because
> the following and required commit e138233e56e9829e65b6293887063a1a3ccb2d68
> causes the following system crash when using audio:

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--3eyDRwkM/Maj7Zsh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJhjVEACgkQJNaLcl1U
h9AZOAf+OjEB0rx20UWIL90pvczAy+XNaaircBEQ0cphHGKM9TrfcEbYFOlQm3qV
o6k6orFrbhYlVELViEbuHsjPrZVY3/NEowdMEK5eBwG1V3OdrLFDgSqKjpmRiWrX
eODgqxRNJ2U+7gBaBwJumlBUi2X0p5u5nVFlgvwmL87yKOl+Uom45nqL/ib7WMnM
VtrFfTZPgATIq/S98eN1SuswUtyYrtN7i7C+5Q7qGiIKKr067Vium6gBIliiLY19
pAT7lVyUEdDHWvNOrQdGveWoxe9Ospr+uvruoR8dGdp2BqC1tFXlrUHn9bm4S0Ai
AgQu/b0xjh2BW63QSFeG7clYApQUOg==
=5BRg
-----END PGP SIGNATURE-----

--3eyDRwkM/Maj7Zsh--


--===============0598667230375614122==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============0598667230375614122==--

