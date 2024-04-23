Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6DA0C4345F
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2024 16:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZXh6TpLsk5jeFfP8vrZj1LX24Y8KnTCufel/kUILPyY=; b=I5AJsV/xMNASqa9O4avq0eWLjP
	FTB2RYBcmWqAAH0HN4fPz3NRvfeRfaQpmSjKQouz2HIMWvQ671wewEKdhoI0nRcXn/j9O8m49HoBC
	7N8drQra5h+rF1VpMQgqTrPon+Ht24IzaQaix9+pynPeNzdgZVWrg6bC3fhOzxUoQQTV8v+65R250
	mp3czdEv19qMM4vJv2u0Vp1McXWCdobt7BpMZKGiyrrsaxyvtoEXVUTNjAfkzlB+J4Lb6I5sfxCgA
	iEuwkERKN6+fQZzrl0HH6yQDyIGHAbS8i1ONnLTC0BwGlB+lZhYKk04FrmekjnQJCelmkPlKjXZJo
	v9Mfb2AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzJRM-00000000pzN-0Nxt;
	Tue, 23 Apr 2024 16:56:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzJRJ-00000000pyZ-0J4h;
	Tue, 23 Apr 2024 16:56:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1A2ED61625;
	Tue, 23 Apr 2024 16:56:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39EB5C116B1;
	Tue, 23 Apr 2024 16:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713891375;
	bh=9jKImSKJH//yp89TtUBPLUkHY2ItM8gvJTkZo98APIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h7pqCXnC0c+AKjGt7ps4NLqvG1MZr+CIoURfC46QPTZXNrPI+8bc8ubOSgl5YWzxd
	 uOBz2QvIj3WTd+yoNcDW4MMVzP8vNIe4WTudrmYtXAL8oG8gfMIg/v3FL21WqqJhZZ
	 WflEsdgNVsOfXcauiWWXmo3bxoCInTxrPrqJ7byHc8AYM13g9kVzRr7CgtH9+1kexe
	 0HdFKuODKdnNG2qPHQecDVjRTqc5srs8LYv4I3/CRv4Q7JsN2NnMUTEb/lLg6UGIMZ
	 3Md1MBvmSQfzFhCcnX5Kap2+znFipX5HDII2S4djNtKhNZW5CenSshViBS1/KPhUX0
	 hxWVUQdOQjkJw==
Date: Tue, 23 Apr 2024 17:56:10 +0100
From: Conor Dooley <conor@kernel.org>
To: George Stark <gnstark@salutedevices.com>
Cc: u.kleine-koenig@pengutronix.de, neil.armstrong@linaro.org,
	khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, thierry.reding@gmail.com,
	hkallweit1@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@salutedevices.com,
	Dmitry Rokosov <ddrokosov@salutedevices.com>
Subject: Re: [PATCH 1/2] dt-bindings: pwm: amlogic: Add new bindings for
 meson A1 pwm
Message-ID: <20240423-wildcard-smoking-90b50f00da50@spud>
References: <20240423161006.2522351-1-gnstark@salutedevices.com>
 <20240423161006.2522351-2-gnstark@salutedevices.com>
MIME-Version: 1.0
In-Reply-To: <20240423161006.2522351-2-gnstark@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_095617_206887_9A1E873F 
X-CRM114-Status: GOOD (  13.01  )
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
Content-Type: multipart/mixed; boundary="===============1620570253168433685=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============1620570253168433685==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kfOnWG+PV/EmHtbK"
Content-Disposition: inline


--kfOnWG+PV/EmHtbK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2024 at 07:10:05PM +0300, George Stark wrote:
> The chip has 3 dual channel PWM modules AB, CD, EF.
>=20
> Signed-off-by: George Stark <gnstark@salutedevices.com>
> Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>

a would sort before s.

With the re-order,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml b/Doc=
umentation/devicetree/bindings/pwm/pwm-amlogic.yaml
> index 1d71d4f8f328..ef6daf1760ff 100644
> --- a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
> +++ b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
> @@ -37,6 +37,7 @@ properties:
>        - enum:
>            - amlogic,meson8-pwm-v2
>            - amlogic,meson-s4-pwm
> +          - amlogic,meson-a1-pwm
>        - items:
>            - enum:
>                - amlogic,meson8b-pwm-v2
> @@ -126,6 +127,7 @@ allOf:
>            contains:
>              enum:
>                - amlogic,meson-s4-pwm
> +              - amlogic,meson-a1-pwm
>      then:
>        properties:
>          clocks:
> --=20
> 2.25.1
>=20

--kfOnWG+PV/EmHtbK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZifoKgAKCRB4tDGHoIJi
0pMNAQCxYf8hqWwkb4mI3niPQvLerhHnsj4GAXUEra2Y5SFWyAD+O8aq8lBtJQo7
Ia++PthnUZ+ozioT++tgnXb3SPOeQQ8=
=hN7Z
-----END PGP SIGNATURE-----

--kfOnWG+PV/EmHtbK--


--===============1620570253168433685==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============1620570253168433685==--

