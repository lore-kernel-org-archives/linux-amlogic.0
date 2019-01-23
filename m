Return-Path: <SRS0=kAbd=P7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA15DC282C0
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Jan 2019 16:04:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A58020663
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Jan 2019 16:04:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ztm1OdLG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="t2Xhrn1U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A58020663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WxoJXEu/1ZlMeeRdCFOUivkYNiGfaHTMCS5JhJU56NM=; b=Ztm1OdLGx2x8Th9Gj4gHNF5Fl
	OV2mhvcnVn7r5ua3fW/ueHimSTxGCdwnSegpVF3TYdUmAn3NupfbX9Q8ycFj4JZ4pMkILp1iedpWX
	T6g61LEP/P/F/LV2Pr1K7TelToNjvKd7xcIPibWglEfcfZ1i983JBFfNoswN5xeEw5PEvyR3cm/H3
	5XI7y33shJ2KVNECaW1TRwqLjGpFuujMOeY8yT1ObAc+3W/AiPZnWIdSYYaapA0uzEVicCNPpv3zq
	XaIzXL1u7s6rLMGZfIMar7iDZsSOF8VOeYYlsBtUhdz10OgCsKcQn3ts3cCyJATfzmTD2Bgix1rX2
	3XfclR2ow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmL0g-0001Va-9E; Wed, 23 Jan 2019 16:04:14 +0000
Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmL0c-0001VE-GW
 for linux-amlogic@lists.infradead.org; Wed, 23 Jan 2019 16:04:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MmLLebF7f+XqdN31MMnvjZtqd3xYLYIpg/89UUtXhxY=; b=t2Xhrn1UbPNf6pdU93U2VhkWy
 qvBA4SF/vG0cDD4ze2P/ClNjTyRtV8uSDtpE/9KXJMxN1+dqsHx0S0xPO0i0tflkcJsxaG0+Hf8tw
 bpjySp0ReDM4eHvoQS9Sllz+71mZEt9JawuYksYtBgSe+P4cQzzW56Ciox3FjEq+kwXaA=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1gmL0X-0005vg-T6; Wed, 23 Jan 2019 16:04:05 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id 6C2B41127ABA; Wed, 23 Jan 2019 16:04:05 +0000 (GMT)
Date: Wed, 23 Jan 2019 16:04:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 1/1] regulator: pwm: suppress EPROBE_DEFER error message
Message-ID: <20190123160405.GD7503@sirena.org.uk>
References: <20190121183723.25231-1-martin.blumenstingl@googlemail.com>
 <20190121183723.25231-2-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <20190121183723.25231-2-martin.blumenstingl@googlemail.com>
X-Cookie: A couch is as good as a chair.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190123_080410_695265_1D3146F1 
X-CRM114-Status: GOOD (  10.72  )
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
Cc: linux-amlogic@lists.infradead.org, thierry.reding@gmail.com,
 boris.brezillon@free-electrons.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============7509140938044886274=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============7509140938044886274==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YToU2i3Vx8H2dn7O"
Content-Disposition: inline


--YToU2i3Vx8H2dn7O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 21, 2019 at 07:37:23PM +0100, Martin Blumenstingl wrote:
> Suppress the "Failed to get PWM" error output if the actual error code
> is EPROBE_DEFER. This makes the behavior of the pwm-regulator driver
> consistent with what most other drivers do (which is: print all errors
> except EPROBE_DEFER).
>=20
> An example where this cleans up the kernel log are the 32-bit Amlogic
> Meson boards:
> multi_v7_defconfig has CONFIG_REGULATOR_PWM=3Dy and CONFIG_PWM_MESON=3Dm.

This also cleans up the kernel log in the case where you've not got a
driver enabled that you need (or it's not loading for some reason) which
isn't super helpful when you're trying to figure out why the driver
won't probe.  There's not even anything at debug level, that would
probably be fine.

The ideal thing here would be to work on setting up the dependency
information based on DT and using that to try to sort initialization
order so we try things in an order that minimizes the number of failed
tries.

--YToU2i3Vx8H2dn7O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlxIkHQACgkQJNaLcl1U
h9C2iAf+IUK6/NqYrZSnKXKFs5po37vD4k0INFl6laZHOktHTt2izMuRRZ0H6kFE
QjP+XYMJtlB70x+yqBwRW86eIVS515gkn5SK1aZJ4gTlmme72SEAvXf0qaEgr0iC
SjO6kLR5D+0ravK7d6MR0JtZwkpqVQ2XInwiEYyowXLvYjDmVx72IxCrjqUhG20y
9ZgV666cg56ZxNqeqGkjPagKX28ov/ToYbM/HXBnOMl3Q8pk211ZnsrXcimhrXPq
FpCno+7mlRALDucT+gtTRqJByR5zyeChS2+2emJIkp/HGkFE5LkRT/K75bp5/9+F
lV4i5W57zlHyubHWig4IH/jEB3Pplw==
=kBoW
-----END PGP SIGNATURE-----

--YToU2i3Vx8H2dn7O--


--===============7509140938044886274==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7509140938044886274==--

