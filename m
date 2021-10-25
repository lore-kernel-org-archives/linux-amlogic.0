Return-Path: <SRS0=wai9=PN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B87BEC433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Oct 2021 09:44:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8093B61029
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Oct 2021 09:44:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8093B61029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J66OelRKakGsQhm9TGsbN0Hs+E6n8N/FrBk9VQbM5xw=; b=ak1ZEb3i7Zi0aipA4R+XQGIzJ2
	yCPiXGLWgpBvdkiqKR3RSIgtG+FVfEXLhhBL8v9xOEJ4Y1wnv9cz9nZAQtjljWMWs4TXknhiMOgjw
	tQxrDX+uLuBv0m79by2jlbWfizT3A2JntgpjBts9Rj91kdJrsiGkILoXWtydgLYqGpNvuc0DMKkXF
	E1TlmUtWkqwr01EqzE07wlSgweAgcDC8kXtj186PDvbUC0IiLJXTv77d2pNpwsByOU1GVmHztZX81
	9QTsGSr4F6aZAJt9C3ENEVACZSOUdur4nNmQVMAbFqb4b2YDgRUilu/kX3TuhUK1sGS8zshYuqeht
	1KkC1g8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mewWZ-00G0Xu-8C; Mon, 25 Oct 2021 09:44:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mewWW-00G0Wc-ML; Mon, 25 Oct 2021 09:44:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 493F060EFF;
 Mon, 25 Oct 2021 09:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635155047;
 bh=5HtCo0/UJttBQs5MtQSjJ/UGL8Uud9O/+4gZVB2kT2o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fkiPFNWckVoYiTX0J2JM++IriFcBEEdoOaGfIP/T11GYqw2cAHhIllDHfvKBfyDhM
 V03WZSzKMm0wQy5MKDQ+8eaGADTGtx803enuAmI7V/f+RsX8Sv1Dk0DgXtu97j/b4a
 xaQGlYkRdftWdRHZTqh1G2pI7vo4rwjb+7umRZYLIrJnihXJOebqoeI3QyP4EE6ykA
 8hy0KtknG2N1ZpwlNOC/W1MspugTr7Ha/n9tzwQVPn2WkHIjb4ci18X30HtZwSAkd1
 yxbdScNc+e3uzcqkiRU78bwz8TZdWPIW11+lvapjlV/JLx2ifmNSrzdB5QrAhHhwAz
 Bt8NCeStuBKaw==
Date: Mon, 25 Oct 2021 10:44:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Alexander Stein <alexander.stein@mailbox.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: sound: amlogic: t9015: Add missing
 AVDD-supply property
Message-ID: <YXZ8Zefl4SIzz0zJ@sirena.org.uk>
References: <20211023214856.30097-1-alexander.stein@mailbox.org>
MIME-Version: 1.0
In-Reply-To: <20211023214856.30097-1-alexander.stein@mailbox.org>
X-Cookie: From concentrate.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_024408_813692_1D708797 
X-CRM114-Status: UNSURE (   9.79  )
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
Content-Type: multipart/mixed; boundary="===============6577639531590852391=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============6577639531590852391==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g2USKoGlaHE/dm4O"
Content-Disposition: inline


--g2USKoGlaHE/dm4O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 23, 2021 at 11:48:53PM +0200, Alexander Stein wrote:
> Fixes the schema check warning "audio-controller@32000: 'AVDD-supply'
> do not match any of the regexes: 'pinctrl-[0-9]+'"

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--g2USKoGlaHE/dm4O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmF2fGQACgkQJNaLcl1U
h9BqRQf/bK8bavnWPSqbeyhE6HDi6A/v3s7mGb/Nf1YnoG6RdTjFKgfLV7KxgN7m
Wf8+Fu6FoWGv1vTVbsa08C8xYOF3Dr1AWcPG5gOdyItVvyDXuyW6xDiS1hXIsJzK
0SBvb0wHWq5P3bvm3qLOu9gs8Oo57FeB8Fp6Ymb1gJ9mpngjL246UL1XlmWM3Be2
gHfAHUal0CzYQsKVrpAHeOFWT7ddVWizZ/wunGs9kbtcYdEGuyuw+OVhtx1ugKpx
1YxdoOimwpQbpNkmMpOvK4hJKFQVtQDZJvTC9Gmp6FYDwB0S2VdJeI4eYLJJmS4q
ZB9E9KRMQp3voiu8atOvkdru2xhTBA==
=XjmJ
-----END PGP SIGNATURE-----

--g2USKoGlaHE/dm4O--


--===============6577639531590852391==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============6577639531590852391==--

