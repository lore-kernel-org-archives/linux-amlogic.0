Return-Path: <SRS0=GSYe=ZD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D28AC43331
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Nov 2019 19:38:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06064214E0
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Nov 2019 19:38:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fm7Qi7FI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06064214E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=O52w2HB0ZM3mQ2QdBPq1+lqJQ5GHXU7PXcuBj6Uqmt0=; b=fm7Qi7FI6rQqeSJlYrtFtyJ0R
	SzkjkbGu1xmZXu5+rO0A/iMe+nYMz3pzMohpOYULH0coICgHUKrlKGfSgtaZnLolFM9EsqRGwNqL4
	VNNezZVv8YhdOiY17uLJFL3P1AW8Tzs7ZntTAIS6Egk39M7xfkLkyHKo/0AsWbWBeJIntiXowyOtF
	fORLRwet6kJkfAGP9Vkr/BKkAH38qa3cki1a/olJs3m9sebGN/QA3+ZHzy/uulFTwOysMe/20SkGP
	xMnhzryLaqcVmB3H+6iDq9D30QYpNqO/dzM/Eb/ahdJqh22mAHzD+moFGR1bket+IDwMGVs7/UHW9
	GCZFoUNDQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUFVi-00047V-Hl; Mon, 11 Nov 2019 19:38:02 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUFVf-00046T-K7; Mon, 11 Nov 2019 19:38:01 +0000
Received: from localhost (x4db75ae4.dyn.telefonica.de [77.183.90.228])
 by pokefinder.org (Postfix) with ESMTPSA id 685522C0428;
 Mon, 11 Nov 2019 20:37:54 +0100 (CET)
Date: Mon, 11 Nov 2019 20:37:54 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] dt-bindings: i2c: meson: convert to yaml
Message-ID: <20191111193753.GC1608@kunai>
References: <20191021140053.9525-1-narmstrong@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20191021140053.9525-1-narmstrong@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_113759_806617_E297B24A 
X-CRM114-Status: UNSURE (   7.19  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Beniamino Galvani <b.galvani@gmail.com>, robh+dt@kernel.org,
 linux-i2c@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============4202465501133504902=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============4202465501133504902==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1SQmhf2mF2YjsYvc"
Content-Disposition: inline


--1SQmhf2mF2YjsYvc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 21, 2019 at 04:00:53PM +0200, Neil Armstrong wrote:
> Now that we have the DT validation in place, let's convert the device tree
> bindings for the Amlogic I2C Controller over to YAML schemas.
>=20
> Cc: Beniamino Galvani <b.galvani@gmail.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Applied to for-next, thanks!


--1SQmhf2mF2YjsYvc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl3JuJEACgkQFA3kzBSg
KbYj7Q//TuutjZs/aYraDB/ReEVZnqZHRljwGBj13He80LQ7/a51QrsqPtpUiC66
VjqFNwHsFJ2eaEco1ehZBrqAqTRcqemg8N9SljOMEN/RSTlsoOIWwgkOgQRHiVyz
HlhJCTg+Hd+1z+gnrx5PbabR1JRgc3Fg+NBPTklP0UEbd0M30519TjaJyJc1K/cn
aZJy8GEIGRlcMT6pksS8ul6OmpnID1UIQ/vceNVB0rX3ECPoZYWWJQqcdfCw7RZW
MzoJkxU5QC8/QsbnT8Q0rpmrgCzWf7R19FUBjlCtAOPkYmdh2i8psHvdCd56L+b4
RXgfQjuQM43kG5xlQhVB0SDnURTm4hNDkdjVTQYzc/GabY01pkNiDRvHWHx0n7Lu
pP/F/0gj/tcu9U4Euohq8/yGpKbdl8/E46SeG57squt/Sczd34gkObBtxtCzUt1N
XzUk/PKvcH3Dd5KwU+MuHe3AJtblaaLR7ux0CpEFm9tOH7rBfd7lO5g5ThpH2Wg+
JwC1zUsm5ufcArkpDX5LBGw+deR1hDs5lAeyQrX0f9UiJmHM+VHIcEr+laCOJlYj
cc32DEktiKMXj/BOxLdoUCWyMnoAmCXC+s3xp50H69Sy/bAMjqeZkx/B8Jpnh8Gl
hvkjmZjECULGcyXiwlzuDrsaO4VVaXs9I0uqNfdiaBxExyiTz5s=
=8zQO
-----END PGP SIGNATURE-----

--1SQmhf2mF2YjsYvc--


--===============4202465501133504902==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4202465501133504902==--

