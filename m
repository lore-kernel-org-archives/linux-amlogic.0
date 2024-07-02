Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A25C3064D
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Jul 2024 14:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nFEKjeN3tOjwbJHr79YntItmH1sYi2ozbrHsWM2HKEg=; b=y+QpHkRFRd2nm52KioY11NvJ6D
	/36B3thzWabaadNPF6FeaplE/3nql+gAKKex8pbUXbbAju+nUigu/cGrEfnLSGIQzXPZZG+s2JSof
	e14fjZoc47dM+3qAzJ5pvV1gE2nAMlSmZwaL6kwKJpmstAgp9ABB33U9puwAXGtYbd9LxWa4TYFPT
	AX4lqVgyPs52c1hyXwXHq44EoESfZpE2zPzGYxk7LUGq0mXMCDLLIN2hXdAky2CbxvdMnQnPmAHAh
	PBaKmh5ERZ1v3bvGNcGlnxyBSgxd2ePlY3yV4MJxA1LroKqXMsCWGBBKauT+B4q/V/TL3fi3PBQXa
	ptv1M8NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOeoL-000000074wY-3zS8;
	Tue, 02 Jul 2024 14:48:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOeoI-000000074vy-3sxI;
	Tue, 02 Jul 2024 14:48:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 11D7161B9D;
	Tue,  2 Jul 2024 14:48:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7645DC116B1;
	Tue,  2 Jul 2024 14:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719931725;
	bh=1MV2LBIpYnHur1473Z/6SWuY34VimUF3ZyaNYTHCq90=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nyoc9E8yZ4DLHNiJA6xVw4vmFe9ZGX35IGDW/BMgniFE6IdcXplffmc1OfY955AcO
	 Kj6yEmm6Hs/NMVjWA3iaDC2pNjhsPj1KHK8Ogp5swy4r9YVfvfX3th/PHs+6n2LCcP
	 xnxay2Ywo+48FpEofYf6arKUH3e5Ot15MqiLuNUHBgSenEF4IByRivZqedmLLv9SbG
	 A1C8+CC4gXldRGjjKYWwUJzKbREZRUUrm/iQz/EUh+lqA8elgvkIaGsU8R5Rnt2xYG
	 mu0dEYIbLW1R8GMvt6gWxiPIq9R9De5HP3mo2J0Y4+Sei2TW8v3QCilqvVnppeOwiA
	 iGes98dx/pgYA==
Date: Tue, 2 Jul 2024 15:48:40 +0100
From: Conor Dooley <conor@kernel.org>
To: George Stark <gnstark@salutedevices.com>
Cc: ukleinek@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, neil.armstrong@linaro.org,
	khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, hkallweit1@gmail.com,
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@salutedevices.com,
	Dmitry Rokosov <ddrokosov@salutedevices.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: pwm: amlogic: Add new bindings for
 meson A1 PWM
Message-ID: <20240702-buffer-ambiance-0f67d200870e@spud>
References: <20240702123425.584610-1-gnstark@salutedevices.com>
 <20240702123425.584610-2-gnstark@salutedevices.com>
MIME-Version: 1.0
In-Reply-To: <20240702123425.584610-2-gnstark@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_074847_049291_B21E72B0 
X-CRM114-Status: UNSURE (   8.46  )
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
Content-Type: multipart/mixed; boundary="===============1346964600009893762=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============1346964600009893762==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nRr6YWAxpDJ00vSZ"
Content-Disposition: inline


--nRr6YWAxpDJ00vSZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 02, 2024 at 03:34:24PM +0300, George Stark wrote:
> The chip has 3 dual-channel PWM modules PWM_AB, PWM_CD, PWM_EF.
>=20
> Signed-off-by: George Stark <gnstark@salutedevices.com>
> Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--nRr6YWAxpDJ00vSZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoQTSAAKCRB4tDGHoIJi
0r7SAQC5Hma9PkKbFzlUlSYfiHnSmtZwMhClanjoia/DInk/hgEA18h+uTkmnfxy
j7fsr5rJ4broGzTxfe/+CCznWlCZiAY=
=iaWS
-----END PGP SIGNATURE-----

--nRr6YWAxpDJ00vSZ--


--===============1346964600009893762==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============1346964600009893762==--

