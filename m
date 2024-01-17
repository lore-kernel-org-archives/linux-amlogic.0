Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8498C47DA7
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Jan 2024 10:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dLFmfzNheeherq52ZfN1DbcpA+tNKQbPzu1kZdP5gJg=; b=XbTnKzmYcoomJsrFQsn79iH92c
	uvjzr1QTOenYx0Uubmv5rH2EeEpBlR3csVjEJC59ojfholQkUwWdkGOtW9flzGOMVjhIqsduoPwML
	c00we8F/OjzQ7jqlHlIJ+w8upjthz3xOhvfXaZ4pkY0xmB2dy6WrdVoAj46hMKiJL854qKjSplb0t
	uCfsUkbn9QsCXE3Z8GCI1/aeh2Yw5Cfgy/eyeiqRxK2Z0K3spBrsFNDOD1fxohdzHDa7M5amKjNgf
	HGyiXzCwIJL3WLE/Sh+ynQqkh7ELLDADUlXNYL+/+rTvNWvb1CLurS6L4uvN0b9+WBSEmGoZfCPUn
	7JRYTGiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ2lX-00FCQm-0n;
	Wed, 17 Jan 2024 10:03:23 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ2lU-00FCPv-1T
	for linux-amlogic@lists.infradead.org;
	Wed, 17 Jan 2024 10:03:22 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rQ2lR-000651-VN; Wed, 17 Jan 2024 11:03:17 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rQ2lQ-000RMX-RA; Wed, 17 Jan 2024 11:03:16 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rQ2lQ-001aYu-2O;
	Wed, 17 Jan 2024 11:03:16 +0100
Date: Wed, 17 Jan 2024 11:03:16 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-pwm@vger.kernel.org, JunYi Zhao <junyi.zhao@amlogic.com>, 
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/6] dt-bindings: pwm: amlogic: fix s4 bindings
Message-ID: <awxboh3nv4r5p7v7vcgwttu2m74fws47johb73c5f7econ2qqu@zl5xbnoeyclq>
References: <20231222111658.832167-1-jbrunet@baylibre.com>
 <20231222111658.832167-2-jbrunet@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20231222111658.832167-2-jbrunet@baylibre.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_020320_492506_E065B2B6 
X-CRM114-Status: GOOD (  35.97  )
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
Content-Type: multipart/mixed; boundary="===============7880757266259110563=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============7880757266259110563==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bbfbzv6eijurrhvz"
Content-Disposition: inline


--bbfbzv6eijurrhvz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 22, 2023 at 12:16:49PM +0100, Jerome Brunet wrote:
> s4 has been added to the compatible list while converting the Amlogic PWM
> binding documentation from txt to yaml.
>=20
> However, on the s4, the clock bindings have different meaning compared to
> the previous SoCs.
>=20
> On the previous SoCs the clock bindings used to describe which input the
> PWM channel multiplexer should pick among its possible parents.
>=20
> This is very much tied to the driver implementation, instead of describing
> the HW for what it is. When support for the Amlogic PWM was first added,
> how to deal with clocks through DT was not as clear as it nowadays.
> The Linux driver now ignores this DT setting, but still relies on the
> hard-coded list of clock sources.
>=20
> On the s4, the input multiplexer is gone. The clock bindings actually
> describe the clock as it exists, not a setting. The property has a
> different meaning, even if it is still 2 clocks and it would pass the che=
ck
> when support is actually added.
>=20
> Also the s4 cannot work if the clocks are not provided, so the property no
> longer optional.

s/no/is no/

> Finally, for once it makes sense to see the input as being numbered
> somehow. No need to bother with clock-names on the s4 type of PWM.
>=20
> Fixes: 43a1c4ff3977 ("dt-bindings: pwm: Convert Amlogic Meson PWM binding=
")
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../devicetree/bindings/pwm/pwm-amlogic.yaml  | 67 ++++++++++++++++---
>  1 file changed, 58 insertions(+), 9 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml b/Doc=
umentation/devicetree/bindings/pwm/pwm-amlogic.yaml
> index 527864a4d855..a1d382aacb82 100644
> --- a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
> +++ b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
> @@ -9,9 +9,6 @@ title: Amlogic PWM
>  maintainers:
>    - Heiner Kallweit <hkallweit1@gmail.com>
> =20
> -allOf:
> -  - $ref: pwm.yaml#
> -
>  properties:
>    compatible:
>      oneOf:
> @@ -43,12 +40,8 @@ properties:
>      maxItems: 2
> =20
>    clock-names:
> -    oneOf:
> -      - items:
> -          - enum: [clkin0, clkin1]
> -      - items:
> -          - const: clkin0
> -          - const: clkin1
> +    minItems: 1
> +    maxItems: 2
> =20
>    "#pwm-cells":
>      const: 3
> @@ -57,6 +50,55 @@ required:
>    - compatible
>    - reg
> =20
> +allOf:
> +  - $ref: pwm.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - amlogic,meson8-pwm
> +              - amlogic,meson8b-pwm
> +              - amlogic,meson-gxbb-pwm
> +              - amlogic,meson-gxbb-ao-pwm
> +              - amlogic,meson-axg-ee-pwm
> +              - amlogic,meson-axg-ao-pwm
> +              - amlogic,meson-g12a-ee-pwm
> +              - amlogic,meson-g12a-ao-pwm-ab
> +              - amlogic,meson-g12a-ao-pwm-cd
> +    then:
> +      # Historic bindings tied to the driver implementation
> +      # The clocks provided here are meant to be matched with the input
> +      # known (hard-coded) in the driver and used to select pwm clock
> +      # source. Currently, the linux driver ignores this.

I admit I didn't understand the relevant difference between the old and
the new binding yet. (The driver currently doesn't support the s4,
right?) Is it possible to detect if the dt uses the old or the new
binding? If yes, I suggest to drop the old one from the binding and only
keep it in the driver for legacy systems.

> +      properties:
> +        clock-names:
> +          oneOf:
> +            - items:
> +                - enum: [clkin0, clkin1]
> +            - items:
> +                - const: clkin0
> +                - const: clkin1
> +
> +  # Newer IP block take a single input per channel, instead of 4 inputs
> +  # for both channels
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - amlogic,meson-s4-pwm

The expectation is that this list contains all compatibles that are not
included in the "historic" list above, right? Then maybe use "else:"
instead of another explicit list?

> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: input clock of PWM channel A
> +            - description: input clock of PWM channel B
> +        clock-names: false
> +      required:
> +        - clocks
> +
>  additionalProperties: false

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--bbfbzv6eijurrhvz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmWnpeMACgkQj4D7WH0S
/k7D8ggArnaDEUYvcg/pgZL5jLaqhKI+CoViERryuLi+QxBL1eWhFvl6XyVCjS7N
FV4h2WdLIV3wdMGKYdCdv9hzleWVaVx1hJDLmOPunTO9QZUmMu6vRYVpsZcpuSpg
T1LNgkK3uEcHBSt6YXynKssZK72/ydv0dDIZ6WZy5+dkdJfWxxCaXubS7Pd6lF8Y
bnOKgErPh/7F0d17TOgIcrwUViGdVt6+d4NbgymqWCueJt/sqX5e81lTn+V3/knM
NypPZ7UqCNgJ/zL9vJpJZsKQYNNM4yA5n0HlHgDZBlzLeYttXHUKhHqnArC4/PWF
CTJ4QZ5qA38yQXWFHypZkl5dLHlniA==
=ZKMp
-----END PGP SIGNATURE-----

--bbfbzv6eijurrhvz--


--===============7880757266259110563==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7880757266259110563==--

