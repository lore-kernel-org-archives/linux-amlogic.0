Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 743E0C87FCB
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 Aug 2025 13:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=45EhNdwmbiaWZAOeMAfawsbNbTMJVANKr7cdn9xhze0=; b=i6Q3AlogadrMkiE5k3vQfNSY2S
	DSYOQVblesvVmENdOSemgQvQ+aG0tDXiToxdKeJOIIxSuzxkG6LK8u85fGYOKcl1aR5oLkbZd+i3t
	0m+AF/RBfUeH3LnvElW/dCc0fro7vZUmYcw+IbcUJxMS6g7GnHfczxeoJl+SKuK2O32WxQX7H0+Lg
	JNNJpNWEnqs57jVPNpJEyvY5AyzTJyUj317UTpNtOPMPyCllgMAX6PWs9iSN805QmrCXFV3i8MlEt
	FRDPrg3KozmVr566BQYlv/dVu37tYXf4manB2RmF8rblvjsujP7zzg6O7ogsElhd0UwAX96fFEijt
	6kCP6wgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujHq8-0000000Crbs-0Y4c;
	Tue, 05 Aug 2025 13:36:28 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujHdM-0000000CpeR-3En6;
	Tue, 05 Aug 2025 13:23:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AE213A4DA06;
	Tue,  5 Aug 2025 13:23:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3BF7C4CEF0;
	Tue,  5 Aug 2025 13:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754400195;
	bh=4XpKY+hrV//JqY5IB0jEGLiEF04z3a1ypjzN/Ip/ON0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MppPOKAETMD/BqZRdpVGHGh0jhnuJMh9KObQqr9IRR1G0wYcPe5YUe9bHfzOlG4po
	 0SC44ly+aXPz/iMhRAM5yj4RkanAgvRO5IZ7sgNigcRJPM4OQ/ESdBLOs4DAbhmL4g
	 nUVo8lRu4XRj+P19miwzQjWyepxUCuvk3y8h80yJz65ZWG8Mm7sZ+X1+hJV6gOgLWC
	 XNLxrSVOcVAPGnQvDiAOOcB9UoLHf32eYEwBwriug0ierfD3VZolCZi3bwghbnfj6d
	 fNdpad2Brd5jze6/lOtyc/y/7NyN+WXKvz1UzmkWGSOGIbB/Ay1LC9Krj1GH20Nq6d
	 8udjMyFgWLOCw==
Date: Tue, 5 Aug 2025 15:23:12 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Waqar Hameed <waqar.hameed@axis.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, kernel@axis.com, linux-pwm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] pwm: meson: Remove error print for
 devm_add_action_or_reset()
Message-ID: <sveurgnigarzdjreweoibcxkkl7rekcpufuwqr7bxcrdx7zdrd@kz4ohstmfyjh>
References: <pndwm7ikt8v.a.out@axis.com>
MIME-Version: 1.0
In-Reply-To: <pndwm7ikt8v.a.out@axis.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_062316_944870_47A4AB31 
X-CRM114-Status: GOOD (  26.09  )
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
Content-Type: multipart/mixed; boundary="===============7750886788185490153=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============7750886788185490153==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qpe4lsz3c3n5r2b5"
Content-Disposition: inline


--qpe4lsz3c3n5r2b5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] pwm: meson: Remove error print for
 devm_add_action_or_reset()
MIME-Version: 1.0

Hello Waqar,

On Tue, Aug 05, 2025 at 11:33:36AM +0200, Waqar Hameed wrote:
> When `devm_add_action_or_reset()` fails, it is due to a failed memory
> allocation and will thus return `-ENOMEM`. `dev_err_probe()` doesn't do
> anything when error is `-ENOMEM`. Therefore, remove the useless call to
> `dev_err_probe()` when `devm_add_action_or_reset()` fails, and just
> return the value instead.
>=20
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---
> Changes in v2:
>=20
> * Split the patch to one seperate patch for each sub-system.
>=20
> Link to v1: https://lore.kernel.org/all/pnd7c0s6ji2.fsf@axis.com/
>=20
>  drivers/pwm/pwm-meson.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
> index 8c6bf3d49753..e90d37d4f956 100644
> --- a/drivers/pwm/pwm-meson.c
> +++ b/drivers/pwm/pwm-meson.c
> @@ -520,8 +520,7 @@ static int meson_pwm_init_channels_s4(struct pwm_chip=
 *chip)
>  		ret =3D devm_add_action_or_reset(dev, meson_pwm_s4_put_clk,
>  					       meson->channels[i].clk);
>  		if (ret)
> -			return dev_err_probe(dev, ret,
> -					     "Failed to add clk_put action\n");
> +			return ret;

On the other hand the call to dev_err_probe() also doesn't hurt, right?
And when we keep it, it is clear that this error path is correctly
handled without having to know that devm_add_action_or_reset() can only
return success or -ENOMEM and we don't have to watch
devm_add_action_or_reset() to not grow something like

diff --git a/include/linux/device/devres.h b/include/linux/device/devres.h
index ae696d10faff..0876cce68776 100644
--- a/include/linux/device/devres.h
+++ b/include/linux/device/devres.h
@@ -156,6 +156,9 @@ static inline int __devm_add_action_or_reset(struct dev=
ice *dev, void (*action)(
 {
 	int ret;
=20
+	if (IS_ERR_OR_NULL(dev))
+		return -EINVAL;
+
 	ret =3D __devm_add_action(dev, action, data, name);
 	if (ret)
 		action(data);

=46rom a subsystem maintainer's POV it would be great if it was easy to
notice if a given function needs an error message or not. One excellent
way to cover functions that can only return -ENOMEM on failure is to
optimize out the small overhead of the devm_add_action_or_reset() call.

See
https://lore.kernel.org/all/ylr7cuxldwb24ccenen4khtyddzq3owgzzfblbohkdxb7p7=
eeo@qpuddn6wrz3x/
for a prototype of what I imagine. Oh, you were the addressee of that
mail, so you already know.

To make my position here explicit: This is a nack.

Best regards
Uwe

--qpe4lsz3c3n5r2b5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmiSBb0ACgkQj4D7WH0S
/k7uTAf+IV4xlBSvJged2+TaatRIHPURN3SCK5I88TP02Cl5uM6b7hApBTqA8Ypd
g3faAO9lFQSRxGgQ7s8VAOsXAMJbmYzc0yFsAANBo1Nx587Q9QA/sVHFNhWPF/hs
v0wUECR915RNR3BgakctzGvtF4aS99tCgkVS8DszU4ngP9ZYtqqHi6vztBHrZgA4
61kveQRsL2xsBv//xmoN5cDtmcns2Gr7nAC3G+8lgq/kkSWiJ6BKMhpi1Tvz/2T0
XagBlQK6u66Aa6letKYpYuDGCAoBxre4ecvDcTHTOCiwLBaCO7/cQKBWDPMUpnYl
lgExQoYJuwfH3aw6jq1LbSFplv2QYQ==
=NaYJ
-----END PGP SIGNATURE-----

--qpe4lsz3c3n5r2b5--


--===============7750886788185490153==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7750886788185490153==--

