Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C632C44501
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Jul 2026 14:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4bKaJ0aTGNlHsKPODVJxOyYtgUMICjj/CLsgDT+M2cc=; b=MFLnc+aVejaf0T5IsmCbEBgLOs
	E0qLkolsNIx4wWMxs0RrIXKI+R5rkTKOjCzNXvVYboXvA9f/bOqM/Dej/m8wEBCLSLUxggKP1Ra8c
	71jx6eQdqQfIZ/JGRbYSVy4Gib9i54xaqZ7WYIRfwBTo3Muj6JhBUvl4QldnaFQQNXymKX23Ztwl9
	awgJ1wGtqLZ83+Fc5R65r4kWQKbwjisVbeBrMBkyW3hQnHZpZHEf6/EnO0jJCfroUDkvT+lIp68Vt
	KgWoteffz0vstl8rq2tklWNVFhRNGXxkyDo3QFyPh+Lpc49onwA3jUbB5hZAh7+1UdD9wSm231ZxS
	KCRugwFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wje83-0000000CNr7-2STr;
	Tue, 14 Jul 2026 14:28:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wje81-0000000CNqs-2G9c
	for linux-amlogic@bombadil.infradead.org;
	Tue, 14 Jul 2026 14:28:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=L25chsznU2xViBCoDsOOuGB4w/iTxvj+zhnZXq2fDI4=; b=OdyFrAYf7bomwaZz9d98Dkupod
	elCUdV3g1ij290dgyyIpe5mc3mjylVOhFzgqFCa0Gw+lq688IVn7hDmeHpVR6zxfuOuMHjWtDEz3I
	gO3z+f35MDED0gcTp6XSfAzJ7dykHIjAku5N/hn5PwpNRhjfe9o4L53C5HBtadgA58Gr0y5SF/qd7
	seLbnc+D0lc27HP0a4UHyoeYGCIOg82Tflt3giUVcMmGwm6NI8EmD90L0D0ci0IkEiEChmKhA3/kg
	uSuCMQE2iyg85mCcQt5GjQmCQ5xn/JXVVVT4mVl+aadg8pGA9T4bkRIqeqQ/UaSjAlTKfCLqE2LYX
	17uM9l7g==;
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wje7y-0000000CawC-1quw
	for linux-amlogic@lists.infradead.org;
	Tue, 14 Jul 2026 14:28:56 +0000
Received: by mail-ua1-x931.google.com with SMTP id a1e0cc1a2514c-96387efc30aso89812241.3
        for <linux-amlogic@lists.infradead.org>; Tue, 14 Jul 2026 07:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1784039331; x=1784644131; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L25chsznU2xViBCoDsOOuGB4w/iTxvj+zhnZXq2fDI4=;
        b=AGO4/mA1LYZabo8t6pba6yFQiVHezwgsf/SCDDhp5iO6V4PHIfehyKsQw3XAoQVkdf
         +OXCRZIcu7rS69tuZei3nMB6fE4YOPQPVjRJfmOxTHudaucztoqBb9moXBxA3rBLANjH
         rTJ90s9sSOkyvzRd2LO5NyjVqMIelbUiba0AzAh5D0YZo2p0//zB4y3DirBS4S/iFQPC
         ujewP/Yah6vOdhddG0wXdCPtcgOpGhqZ2k6yhXGQe3xuWi7kST3Tnofv2tJB2egHpQPE
         PNdIvBuXvnpKwipCzngEeN1+fGsiAFdscDj5ClCjeYbjqFAkoSw8qaLXGCiAezMSuPVT
         6gqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784039331; x=1784644131;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L25chsznU2xViBCoDsOOuGB4w/iTxvj+zhnZXq2fDI4=;
        b=q+WUCpGImxPJuH5v6WPMaF0+rRTsLNKw6rq32J3XQSHQe37lVcQkD8ANlf1RDeHYhc
         dHVp67eyYW9pvVLncTku0iP0nvMldvr1Tbv7TmXxgO+E1YlANvsIgIe2xXGWK2OYZ1ld
         lX4kJkqvnoceoZT5WxDrhpra9u6R/hda/S4C5+VS9bGG3JbVWm9J7yN1V/XvSmY4w0mH
         LcN+UWOW+b4E6PfPVQEVsjPtpji5Yt/iZye2YJg2v8ahy1fzhtPgw6+XQ4gRvOU+bYSB
         aoDjyXSHI4CcDFN5RRRQY7pmIIdD6baLs7/9wxUmJV2FBFEQ+l7NnVPuVE0LT6oegmUy
         Yibw==
X-Forwarded-Encrypted: i=1; AHgh+RqM71igjmKRey1ifYRG0BRdMffP79olD7U2/vYjXPAJpZo+TebBLIkayd+UKTt54YzOUt5zv8xLE3qHn+mA@lists.infradead.org
X-Gm-Message-State: AOJu0YysDSqQmQvnOlDgsGlUPzJNiBUSUaSpnd2L6e8Z6RFeuCVLGqet
	vTk3xB0l+8umnYyItifHmXr9nv5+ZD7/Oyr+J8YJzeABu4gLpH/JwlDJyBlB4KcagVo=
X-Gm-Gg: AfdE7cl6Ei77P2dih+Xyp9GACLHp3r66xKso450/uDS9Fl5P2Ez/tw3v7Y5mhEhFefV
	LeyQZaAR1ZvCsGdyVPAc05n+YVpDNL1WKIsaLKpS+BuxanomlLfqVym0I3M8sN6/ForqJuKns66
	SRhRIphwSaSFoRNYueQOBcwWZQj1CcJV1Fhui5cX7KyZR7T+M+vvICMJ/uh8m7r4y0Q16UX8wrD
	KKOIlHRIpa2HTXsEjnatK6L5as3ByIOfmgxG0EXWVV+8/98xTl0MIvw8jAjflEuUoKyuoy/XBX9
	6LAoqFRfOW9LJn/hu3WzNOAONeXJrYBOQKTRfzedqrX1ADEBAZbRWKhQQD3YigUKSUDcrsja0Uo
	nZ0DVODaJk/fuo37rgf9FqS/h47vsKW360afr71TowlB6HOfFJHJt3+fGWOAu+m0ERo6UUbcNwf
	nMiGix+KQ/TVT7u6hvYg==
X-Received: by 2002:a05:6102:4188:b0:631:37cb:1e64 with SMTP id ada2fe7eead31-74533b5d732mr8759191137.4.1784039331337;
        Tue, 14 Jul 2026 07:28:51 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::c41? ([2606:6d00:15:e06b::c41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-744d6a3eb8esm10251628137.3.2026.07.14.07.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 07:28:50 -0700 (PDT)
Message-ID: <263a79327f88e75a821abbbeb6f1dfa0448da86e.camel@ndufresne.ca>
Subject: Re: [PATCH v2] staging: media: meson: vdec: propagate
 devm_clk_get() errors
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Alfie Varghese <alfievarghese22@gmail.com>, neil.armstrong@linaro.org
Cc: gregkh@linuxfoundation.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, dan.carpenter@linaro.org,
 error27@gmail.com
Date: Tue, 14 Jul 2026 10:28:48 -0400
In-Reply-To: <20260714140458.1276-1-alfievarghese22@gmail.com>
References: <20260714140458.1276-1-alfievarghese22@gmail.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_152854_693676_336D0383 
X-CRM114-Status: GOOD (  14.45  )
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
Content-Type: multipart/mixed; boundary="===============4340575942010986910=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============4340575942010986910==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-WDqrlTDAgquoB2fbpaws"


--=-WDqrlTDAgquoB2fbpaws
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 14 juillet 2026 =C3=A0 19:34 +0530, Alfie Varghese a =C3=A9crit=C2=
=A0:
> vdec_probe() hardcodes -EPROBE_DEFER for all devm_clk_get() failures.
> This masks the actual error code returned by the clock framework, such
> as -ENOENT when a clock is not registered or -ENOMEM on allocation
> failure.
>=20
> Return PTR_ERR() instead to propagate the real error to the caller.
>=20
> Fixes: 4f75e7dfa6dc ("media: meson: vdec: add driver")
> Signed-off-by: Alfie Varghese <alfievarghese22@gmail.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/staging/media/meson/vdec/vdec.c | 10 +++++-----
> =C2=A01 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/me=
dia/meson/vdec/vdec.c
> index a039d925c0fe..fba1e7f88d81 100644
> --- a/drivers/staging/media/meson/vdec/vdec.c
> +++ b/drivers/staging/media/meson/vdec/vdec.c
> @@ -1026,24 +1026,24 @@ static int vdec_probe(struct platform_device *pde=
v)
> =C2=A0	=C2=A0=C2=A0=C2=A0 core->platform->revision =3D=3D VDEC_REVISION_S=
M1) {
> =C2=A0		core->vdec_hevcf_clk =3D devm_clk_get(dev, "vdec_hevcf");
> =C2=A0		if (IS_ERR(core->vdec_hevcf_clk))
> -			return -EPROBE_DEFER;
> +			return PTR_ERR(core->vdec_hevcf_clk);
> =C2=A0	}
> =C2=A0
> =C2=A0	core->dos_parser_clk =3D devm_clk_get(dev, "dos_parser");
> =C2=A0	if (IS_ERR(core->dos_parser_clk))
> -		return -EPROBE_DEFER;
> +		return PTR_ERR(core->dos_parser_clk);
> =C2=A0
> =C2=A0	core->dos_clk =3D devm_clk_get(dev, "dos");
> =C2=A0	if (IS_ERR(core->dos_clk))
> -		return -EPROBE_DEFER;
> +		return PTR_ERR(core->dos_clk);
> =C2=A0
> =C2=A0	core->vdec_1_clk =3D devm_clk_get(dev, "vdec_1");
> =C2=A0	if (IS_ERR(core->vdec_1_clk))
> -		return -EPROBE_DEFER;
> +		return PTR_ERR(core->vdec_1_clk);
> =C2=A0
> =C2=A0	core->vdec_hevc_clk =3D devm_clk_get(dev, "vdec_hevc");
> =C2=A0	if (IS_ERR(core->vdec_hevc_clk))
> -		return -EPROBE_DEFER;
> +		return PTR_ERR(core->vdec_hevc_clk);
> =C2=A0
> =C2=A0	irq =3D platform_get_irq_byname(pdev, "vdec");
> =C2=A0	if (irq < 0)

--=-WDqrlTDAgquoB2fbpaws
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalZHoAAKCRDZQZRRKWBy
9ICYAP9pdhNwuOwbtfpwNZ80VSG7CJ/koMU0FTTz4mI20OIOhgD/YYFDt2jAB7h2
ZcXN8NZl9UQJkwnOiSpvH96NmWi2ZA0=
=7elq
-----END PGP SIGNATURE-----

--=-WDqrlTDAgquoB2fbpaws--


--===============4340575942010986910==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4340575942010986910==--

