Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80259EB64DC
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Jul 2023 18:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=maQoPlqXv2XB+TlsaJSRTKszv6LDAKBHRVdIxob7i6Y=; b=WG2LzUK53w2G8KstDQYD0Qjq31
	pA1CCbnWf9Ezhrg8j7aGyV2cyuwAwshJCCkC/Weg07J/E1ERQ+yq2ZHdSgTNWVCgsOyRLmXUR/Xz3
	taN1O3guI5iYXlAVwD5JA5fHEgEak1J1bAU3Dc8UmF1bkoXuVbHHeI8HEskgR6prthcgcLZYJZzG2
	WgVYWXI7hsWRFLtBp1LuAsjug8kVEsp9GSkAt069mmxCMo1Hu7xh+IgZ+NVobDP2YuGTfDBtKhPL/
	YM1Ty7ABMjD2w7Gyojffxa/BaUAkAby5S+H6A1Zuafqygxj9GgYtcHq9igyOY1NnIMU74Sfn/deSX
	Oclt+q8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJHkM-00FcMB-1l;
	Tue, 11 Jul 2023 18:05:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJHkK-00FcLS-0E;
	Tue, 11 Jul 2023 18:05:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6001861591;
	Tue, 11 Jul 2023 18:05:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE81EC433C8;
	Tue, 11 Jul 2023 18:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689098754;
	bh=xIq4UPJc5cJM6QesWCRibpmblqZYNDtcrH7yYHl3oK8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mWaDSgMdD4UzMmzKqW6Lxv4GAHzx73ct8iijKJbB5W+gmcZcf1g4mTyEDxU/WBCFx
	 +3cqk+Xk6nCGHIj7hPMbJUxa8tfoGcg3xZFAJge3mW7Lo1N2kHmbPm74BHmTapWjNs
	 R5XXG4mwhC4C5ANrfJAmAFGEM3LVVGldL8dhjsbYnCY9FsHLoO9YO42nnzmI6QwrNf
	 CbOqf2IDC9lRytEtWxsvGP7/qhOCKvtB1Tp9c4svbUctXaYy8lf6xtzqYjSeF6BVr6
	 0gcweyNJH3KuERy2BcMiB93WaQycOJiT80L9nBBl9/ZsbU+AUw//GzBg9lgaeHVl/5
	 l2r+UBmUfbppw==
Date: Tue, 11 Jul 2023 19:05:49 +0100
From: Conor Dooley <conor@kernel.org>
To: Huqiang Qin <huqiang.qin@amlogic.com>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	neil.armstrong@linaro.org, khilman@baylibre.com,
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
	brgl@bgdev.pl, andy@kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 1/2] dt-bindings: gpio: Add a header file for Amlogic
 C3 SoCs
Message-ID: <20230711-monthly-return-8792ce346c26@spud>
References: <20230710042812.2007928-1-huqiang.qin@amlogic.com>
 <20230710042812.2007928-2-huqiang.qin@amlogic.com>
 <20230710-maybe-mantis-e647d94fd13a@spud>
 <424cb61a-9102-9a43-c999-36939e8d6cc0@amlogic.com>
MIME-Version: 1.0
In-Reply-To: <424cb61a-9102-9a43-c999-36939e8d6cc0@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_110556_197798_CC00C8C6 
X-CRM114-Status: GOOD (  18.22  )
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
Content-Type: multipart/mixed; boundary="===============3626364457783636415=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============3626364457783636415==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BB6EK5uDa3jar4Xq"
Content-Disposition: inline


--BB6EK5uDa3jar4Xq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 11, 2023 at 10:55:40AM +0800, Huqiang Qin wrote:
> Hi Conor,
>=20
> On 2023/7/11 0:38, Conor Dooley wrote:
> >> diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-p=
inctrl-a1.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pi=
nctrl-a1.yaml
> >> index 99080c9eaac3..e019b6aa6ca3 100644
> >> --- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-=
a1.yaml
> >> +++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-=
a1.yaml
> >> @@ -17,6 +17,7 @@ properties:
> >>      enum:
> >>        - amlogic,meson-a1-periphs-pinctrl
> >>        - amlogic,meson-s4-periphs-pinctrl
> >> +      - amlogic,c3-periphs-pinctrl
> > Alphanumerical order here perhaps?
>=20
> Okay
>=20
> >=20
> >> +++ b/include/dt-bindings/gpio/amlogic-c3-gpio.h
> >> @@ -0,0 +1,72 @@
> >> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> > Any reason to deviate from the usual license terms for bindings, which =
is
> > "GPL-2.0-only OR BSD-2-Clause"?
>=20
> I initially used the license commonly used by Amlogic (reference: meson-s=
4-gpio.h):
> ```
> /* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
> ```
>=20
> But when I checked the patch, some warnings appeared:
> ```
> WARNING: DT binding headers should be licensed (GPL-2.0-only OR .*)
> #37: FILE: include/dt-bindings/gpio/amlogic-c3-gpio.h:1:
> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
> ```
> So I followed the prompts and changed the license.
>=20
> Can I ignore this warning and use the (GPL-2.0+ OR MIT) license?

If the tools are happy then I suppose you are okay.. I'll leave that to
Rob or Krzysztof, but if you have a reason for diverging that seems fine
to me.

Thanks,
Conor.

--BB6EK5uDa3jar4Xq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZK2Z/QAKCRB4tDGHoIJi
0gtfAP9/EXCGxkNjEP4so+mvz8Kfk7PRNhgkTxX9QnngeOPp1AD/XndZ8ks4QCwV
IXXaGza3r7f0IgKHFv0erzhbfM1q7gY=
=JIPw
-----END PGP SIGNATURE-----

--BB6EK5uDa3jar4Xq--


--===============3626364457783636415==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============3626364457783636415==--

