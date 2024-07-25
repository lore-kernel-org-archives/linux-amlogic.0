Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ECE2C3DA49
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jul 2024 14:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=27cwN2aRv0j7DpBj1aaYyDiYeaCHOfMMl1+kpPFzhIs=; b=FltH6suOV/MRwq/XFZsGkco9sf
	gIVJFti7ivwr81zSstbVrEPWTA6BZ6sr+6nbWYIYCguE1Y/Bcu0WgLV56V/pWYJAMu2fp484faQmz
	ku6UAdjEPJfzlhoiEMKZ3xKzJNvR6jRY0DaQKZ1d3a5q8NJvSTaaQn0Admqw8L8a/JugPH9AqHWIq
	8H80XHVkTwfWI3e5LlyuX+M1cARMH2IgTaf8E2jOpNhNgGpo3YSfA4Mm/koVQY6IUzmVmhly+FHgt
	dgAxvQgA+gJgUTEkpAuQRHEvnj0ZWYsvJ1k+d2h4rq5v5FFlezN+To0JgbTWB5EznnJCbqPfB/HWK
	cjXxMeeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWz9e-00000001CId-31Rx;
	Thu, 25 Jul 2024 14:09:14 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWz9R-00000001CEp-2iV7;
	Thu, 25 Jul 2024 14:09:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AC44FCE0F93;
	Thu, 25 Jul 2024 14:08:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 879A0C116B1;
	Thu, 25 Jul 2024 14:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721916538;
	bh=lCkNGP6BwpG3qp3Mm4CGq2Fx3/FD3ZVT8U9NcNF2ZJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HRIDgccQOj8PnzY095nsGqPT+mr4nIFriPRvqY82nshh1uLiOZYK3veF4IiVsrtwN
	 hoWDA5r3xn6rracah49kemGE3ZJZ5EZipJzl5jgLiMn7GsbuguSU4lKZ7XEXzE4h1q
	 MqaeDW5wP6d7/oYkg9PiS8yS5TVBWLxNsHAFybO1ikJ595vi9KDoiix7RCWqXqa8vh
	 p9HyatcVePjVfsXhEIqrJspJBlQ5jo7Ete2I87+BVR+2l4kkLRKnJ3w+viPwv1FT0B
	 8pMsWk0Uo9R+HR689xsCD0gzk0iYJSgrz9FoYiOoAKwX72V9Od615xYGTOLw30++Wp
	 2TDlIUWQrfRzA==
Date: Thu, 25 Jul 2024 15:08:53 +0100
From: Conor Dooley <conor@kernel.org>
To: George Stark <gnstark@salutedevices.com>
Cc: Rob Herring <robh@kernel.org>, conor+dt@kernel.org, ukleinek@kernel.org,
	krzk+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com,
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
	hkallweit1@gmail.com, linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@salutedevices.com,
	Dmitry Rokosov <ddrokosov@salutedevices.com>
Subject: Re: [PATCH v4 2/3] dt-bindings: pwm: amlogic: Add new bindings for
 meson A1 PWM
Message-ID: <20240725-excursion-waving-0e0ad54006d4@spud>
References: <20240710234116.2370655-1-gnstark@salutedevices.com>
 <20240710234116.2370655-3-gnstark@salutedevices.com>
 <20240712125219.GA472311-robh@kernel.org>
 <55f73e79-2d21-48ba-8486-26ee168c7bc3@salutedevices.com>
MIME-Version: 1.0
In-Reply-To: <55f73e79-2d21-48ba-8486-26ee168c7bc3@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_070901_885520_3F111570 
X-CRM114-Status: GOOD (  16.14  )
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
Content-Type: multipart/mixed; boundary="===============1200964452181371401=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============1200964452181371401==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AEa+sma8hE8p4pQ+"
Content-Disposition: inline


--AEa+sma8hE8p4pQ+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 12, 2024 at 06:12:26PM +0300, George Stark wrote:
> Hello Rob, Conor
>=20
> On 7/12/24 15:52, Rob Herring wrote:
> > On Thu, Jul 11, 2024 at 02:41:15AM +0300, George Stark wrote:
> > > The chip has 3 dual-channel PWM modules PWM_AB, PWM_CD, PWM_EF.
> > >=20
> > > Signed-off-by: George Stark <gnstark@salutedevices.com>
> > > Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> >=20
> > Missing ack from Conor. When you submit new versions, it is your
> > responsibility to add tags.
>=20
> I had Conor's ack in my mind but his response was related to the
> squashed patch (a1 compatible + power domains) and the current patch was
> a bit different that's why I didn't dare to add the ack.
>=20
> Conor, do you mind if I resend this patch (and may be [PATCH v4 1/3])
> with your ack?

Ye, both are fine :+1:

--AEa+sma8hE8p4pQ+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZqJccgAKCRB4tDGHoIJi
0sHPAQDeOLhDsX5+jGRVXKBfRLGLispOYdy49zQvALwWzLRdLAEAi40OY1ZWJZ9t
kiSLOzkb9TUhQHF/25tOvwTZdfuUbgM=
=Hrx7
-----END PGP SIGNATURE-----

--AEa+sma8hE8p4pQ+--


--===============1200964452181371401==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============1200964452181371401==--

