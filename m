Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE8FC54E94
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Jan 2023 07:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uP+2CfMpVnfyk8udxT2XRO827a4pUviq6aE1QOWNeWw=; b=E1+HFuOQJWOvJrYndO2QTR6FmQ
	YzRxCeJKMhCrpH2g1Trnw/bcai4pcSywzEbYBXpAJ1nYr04cAbzBDsj/fmqyHlrXlF4Au4qPUes3C
	3GaMWeMpH9VC7aeMqOy7s19IHtiTumjmi0RGKZZbyFjOKDilidBfTx8mJkb/mpoK5VDUlg1Yy+4ki
	oPF8XO0TvmDNX3y2H6laOzzUlp3u49UENBz1E0+GiL/Kqex0WditoUD12Ni0ZBZgpuJvtPK9WVX3d
	JIzAHonVr00OZP4MicyuvxmttOcLLDTmfwDuUZTD3qU/TtJjjaNm9UHaEn1Z7A2uQZUeTdvAflkMD
	ilqPjszw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKwt4-009rLy-3z; Thu, 26 Jan 2023 07:41:34 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKwss-009rIk-51
	for linux-amlogic@lists.infradead.org; Thu, 26 Jan 2023 07:41:23 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pKwsX-0006uE-DD; Thu, 26 Jan 2023 08:41:01 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pKwsV-000Vax-LD; Thu, 26 Jan 2023 08:40:58 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pKwsU-00Fy4h-2i; Thu, 26 Jan 2023 08:40:58 +0100
Date: Thu, 26 Jan 2023 08:40:55 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
	linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 0/8] soc: amlogic: switch bindings to yaml and adjust
 some dtbs's
Message-ID: <20230126074055.7za4nfu6n5kgnqlz@pengutronix.de>
References: <cb62dfc0-cb3d-beba-6d0b-8db18583dda0@gmail.com>
 <0e48405a-d4e7-92a8-339f-4be2f4ec1378@linaro.org>
MIME-Version: 1.0
In-Reply-To: <0e48405a-d4e7-92a8-339f-4be2f4ec1378@linaro.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_234122_221793_409756BD 
X-CRM114-Status: GOOD (  28.03  )
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
Content-Type: multipart/mixed; boundary="===============3420109054558723638=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============3420109054558723638==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m3isnjrac4mftej2"
Content-Disposition: inline


--m3isnjrac4mftej2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Jan 24, 2023 at 08:16:45AM +0100, Neil Armstrong wrote:
> Le 23/01/2023 =E0 22:22, Heiner Kallweit a =E9crit=A0:
> > At first adjust some existing dtbs's so that they pass dtbs_check
> > after switching bindings to yaml.
>=20
> Thanks for this patchset, but please drop patches 1, 3 & 4, and take
> in account the existing compatible usage in your new bindings like
> I did in my conversion patchset.
>=20
> While we did remove some bad compatibles we introduced a few years ago,
> now the GXBB, GXL & GXM are now stable a aew LTS releases now and
> a few other projects uses them as-is (U-Boot, BSDs, ...) so changing
> the compatibles isn't an option anymore... and we can't know which
> one they use and how the implementation behaves we must document
> the existing usage without breaking any potential users (including linux).

I only looked into patch #1, and I support dropping it for stronger
reasons than not breaking things which maybe started to rely on the
existing contents.

In patch #1 you write:

| amlogic,meson-gx-pwm isn't a valid compatible string, so remove it.
| See drivers/pwm/pwm-meson.c.
|=20
| Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
| ---
|  arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 8 ++++----
|  1 file changed, 4 insertions(+), 4 deletions(-)
|=20
| diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/=
dts/amlogic/meson-gx.dtsi
| index a79a35e84..75d35dcfe 100644
| --- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
| +++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
| @@ -328,14 +328,14 @@ i2c_A: i2c@8500 {
|                         };
|=20
|                         pwm_ab: pwm@8550 {
| -                               compatible =3D "amlogic,meson-gx-pwm", "a=
mlogic,meson-gxbb-pwm";
| +                               compatible =3D "amlogic,meson-gxbb-pwm";

There are two issues:

a) drivers/pwm/pwm-meson.c isn't the reference. The driver doesn't
   justify which compatibles should be used. You should refer to the
   binding document instead.

b) Having the SoC name as an additional compatible (i.e. the status quo
   before your patch) is an advantage. While it doesn't hurt (apart from
   making the dtb a tad bigger) it makes it possible to adapt the driver
   if in the future someone discovers that the PWM component on GX is a
   tad different from the GXBB one. In that case you can add a check in
   the driver =E0 la=20

   	if (of_device_is_compatible(np, amlogic,meson-gx-pwm))
		do_the_special_gx_handling()

   without having to adapt the device trees then (or use some ugly
   code that somehow detects if it's running on GX).

So the driver not handling amlogic,meson-gx-pwm today is fine. I expect
the fix to be: Include that compatible in the binding.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--m3isnjrac4mftej2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmPSLoQACgkQwfwUeK3K
7Akkowf/emZNlTr/+ucs/fg+qTCWpgwgyYENdpjTH/m4tDB3rg4W1f0KXHt8JgxS
3CnyjJrJfsBBox0FanIwNYfVHrC8KKaRNpanXiEagq2e1zVGy0xFdJkFMuYeDf0X
8FbIarmwyjwOu1zFoA5j1txfeS1/wRl2SCMsb4tzg5aQDXe24XRc/rHCfl12DbKY
g45YU3VopNpinmd7n4UCCbQkH6g+RxOxHd0oErdPW1Ii6bsrAzR1lYaOBJnC1esi
VgHCOvB8bYAq2Oo3aMYj1l98jPlzfb+rv9ZmA4UbrizTvpequKYECnytV+3cd5gl
8LkL8MWmS6yGUHEdObMCLR5mNuEfqw==
=HveX
-----END PGP SIGNATURE-----

--m3isnjrac4mftej2--


--===============3420109054558723638==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============3420109054558723638==--

