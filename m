Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BAF4C3DA4B
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Jul 2024 16:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ES4BUYjI/FH/WuZ/pg8hQrIoIax9WoJNXaCp+IAUaIg=; b=nylfGIoCURrFPYfingfWtQfx37
	0DdRMDiZl9Y8yzpeXMbinFN/UqprOe3GUqTyHFOVhFOQjdsq2mVaS4lRLfOz3Bv7np/IGIfATHVDm
	+/7PGnxOJ9WDYFaElH2jztkDi+hvYOUWZJhhkMcwEvMPh04Cd7M5eKuXUO0KHtcFLEDqyB0EuIMEo
	M/EP1khaUvbzgD5qLE8jcf4+ZjAnhB3tEGwnDhqnmvPYx24ZIHKc0ZolYTuMbC9oOpeu6YmTsdk5z
	YPY04vzvnSyUilhZevKbBQfbSAxO0QDZ6p8F8SPjaPD8tF3lKoq+Kx2+fQ1e10iCkA/2/UQXkEJVz
	3LVOn1YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTOKj-00000007hOY-3MaI;
	Mon, 15 Jul 2024 16:13:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTOKL-00000007hBv-3E0F;
	Mon, 15 Jul 2024 16:13:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F1528611DD;
	Mon, 15 Jul 2024 16:13:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C188C32782;
	Mon, 15 Jul 2024 16:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721060004;
	bh=dvBwbe6MPDMfh5k2bT4Qej0uPTJ6wp7QSXUAmI42I0c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RVe+PWq1Kci1ereIuw3C41BQcjO20zKmJiiWg0e7V8bKmSs3gs5rX/tLjaNiiVB9v
	 OzF7d2Kry7BnebXfPwPg+J1RGr88zE/XqJPPkQSy1uXKy7I51ZFPrRxCsL8MkFIITt
	 lFzLZHeswYY3TvPUXvULIkh0VixoSjWuznH2nfFf4wBK2KFvPEu8OHpv+j0rGQ3n4C
	 Nrz372qZzP23knwGGPWXu7Tct/hT4uDMiSk424TThdQfuFd0XHNt/twNAYEPjvca0S
	 NuyT2Cmn6YhOCqN/6rtkEWvi7MLBjiYI07YmWG03fifLP45NsbdZPFaiRSMN9Be7Ht
	 g8rFYrW0thk4Q==
Date: Mon, 15 Jul 2024 17:13:20 +0100
From: Conor Dooley <conor@kernel.org>
To: zelong dong <zelong.dong@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	kelvin.zhang@amlogic.com
Subject: Re: [PATCH v2 1/3] dt-bindings: reset: Add compatible for Amlogic
 A4/A5 Reset Controller
Message-ID: <20240715-crucial-disarm-8907b896dddc@spud>
References: <20240715051217.5286-1-zelong.dong@amlogic.com>
 <20240715051217.5286-2-zelong.dong@amlogic.com>
MIME-Version: 1.0
In-Reply-To: <20240715051217.5286-2-zelong.dong@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240715_091326_052146_F5FC286F 
X-CRM114-Status: UNSURE (   8.03  )
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
Content-Type: multipart/mixed; boundary="===============4750428946319825652=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============4750428946319825652==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="W6+4hMDlu8VoAtzt"
Content-Disposition: inline


--W6+4hMDlu8VoAtzt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 15, 2024 at 01:12:15PM +0800, zelong dong wrote:
> From: Zelong Dong <zelong.dong@amlogic.com>
>=20
> Add new compatible for Amlogic A4/A5 Reset Controller
>=20
> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--W6+4hMDlu8VoAtzt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZpVKnwAKCRB4tDGHoIJi
0q9jAPsEXScXXZVCt1gtEui9+60JKkeZKU7UR7A5D6k4BBB6LQD/dGcKkYIYmwCq
ZAP/73A1jA3CD5a4CXj4knZapruK7wA=
=Uoh7
-----END PGP SIGNATURE-----

--W6+4hMDlu8VoAtzt--


--===============4750428946319825652==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4750428946319825652==--

