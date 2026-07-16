Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 745E7C44507
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jul 2026 01:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Date:To:From:Subject:Message-ID:Reply-To:
	Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hg5TKnBBkhhR+Rhn0ciNH/8ld7KHVGC+8GhTbFzyZQI=; b=PBEXw6V0UWK7GTqQ7UCHA/f3/2
	qgUu797ceuqu1KJWXAZSdqWiMKD5inrkCPueMEXN+p/xwy7JUdV9EFI2h+bWfMJV2DzegOwYq1Px0
	GgVeq8bkrs5T7QVxBgAgme4qosCv0iZfBJaJbUqRf8hll+jr+xaYFJ4gwyd8vzKhqQEK7zO8/6g/W
	ehgYlNJMyAZLHDCJBPbGBIYx4twJ+LAP7CEUCjvElV+0BVbFteR5tVUUxyHFy8rvkb8WJxkDeD9/6
	+ypjq6cQnQaZEjpqSCp292n4lHA7PFSG5Ab+S1b/sUFiFmAE4X7crjBF66UOATQBCmjEV2KxK0Lm9
	WMbT5EOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkAnW-0000000GBbW-1P6P;
	Thu, 16 Jul 2026 01:21:58 +0000
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkAnP-0000000GBaJ-278I
	for linux-amlogic@lists.infradead.org;
	Thu, 16 Jul 2026 01:21:56 +0000
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-59b074ec7ceso2429546e0c.1
        for <linux-amlogic@lists.infradead.org>; Wed, 15 Jul 2026 18:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1784164910; x=1784769710; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xIEX4i18qoVXbjqoK0UngJpGYgpYOqx2AEwOVZpDdYM=;
        b=G1ab0OWIzKCDSB6xl4E+s4pjNOwtv8lYqwXMZyIewESibmyHBV7NcNvh8HFNKYxivl
         nfV1qplRDUWBthhSmb/kst2NRRkJxzDbpnLZ9yJy9nto7V/wuWm3+idzQaW7Ss0Aqx0n
         YfNQsGjVy28n05CWkJMzrB9zlPtuF62wmUF92SsVemBtoNuvdJ5QAL66CfN0HZqUuhzj
         SfiLCredKGiRfY/Oli6OqNMw1A8CXUxtacoIslgAqM30OR31VjvwZ5te50/atIH7orjt
         rMTP9mp/jRvnyYkKSvhtIrcgT3u3Vq3Bq1ap7tAZX768z4Wv3TJ4ONNeeC8HPIqb5E2j
         LhGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784164910; x=1784769710;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xIEX4i18qoVXbjqoK0UngJpGYgpYOqx2AEwOVZpDdYM=;
        b=qFRWbMTUhBnitBsCB8gJadeSH0yfDbQG6tv1imWvMpro2F5ETP1aOr+IFMwPED1kez
         oe8YHRbCg4bINwQdo7nCq+UxkXMDl2wtgitJf2mPnbCn4Yv5ig0EgcvXpAbnbRr0O8g5
         bokinPJ+FJZEhV4mCx5VX74XjYyrr0eNh5y51lgfqv6uiHkeDm1foBPfyL5EoNdmtK0g
         WY+3QsIbYgQrrIIiksPZQp3WDjGb4o1PcPpj9qx2PNd7so2YpiQFeVGEscnROk3u8Ct3
         IsXDXKfs701FcR1lacSST483X2y+x1D2/hUK9MzRMEZ20f40OaQ3tWdpFSLPIpQ23Aj0
         cweQ==
X-Forwarded-Encrypted: i=1; AHgh+RqHSveO6RYhVN2izsZqU8NlmZwebLFcomhcjcmV5zRvpI5XXtY6GJzFNPHC/1bDQxOc0TNMUDx6FuYNncJa@lists.infradead.org
X-Gm-Message-State: AOJu0YzDjTMYPYUvYY+uKrCxqXjz4eKbOAYid8GNIJIVLi3UovUmvwqd
	6ZYMKIvaSVyghZpzqDpHAaOHOIv0zgmvwPgEBJrxcjU3sHoWR5RU6EL4TMMHYsw43U4=
X-Gm-Gg: AfdE7cmgGsuA2tYA+pZhKU0aMFBOqUEafrCTy+VVlkdbvT9Pz6GcEpk+d8x19oXjx/a
	XU/zQ7U63eilrXwUw1mme7eQ3eM107uJpoZRghsQiL5y6S7bvmox4UbP7hmrAn3FkmW2ADCp4EI
	krvNZFPf7/4v5bjCR19qrUaS3Ezi4Hy3X16OalRQOGSA18oa6XE/uZeD0n1y7SN+CJl9nm4GYKt
	cMS6A5a1ZrMq455oG8LVZUXybz0YeS9R0REdASo8iblYfZzRyn+o3lKTfvnt275NtkRv+GUaiq4
	if9DyZKoPCS4mfEs6uj6p3+ozep3qC5g1zGPs2hyaYCDXY0ujDXnrf15DBlqDPvHkS2b5e65Q69
	amzN/8V81OZY0UdWiRQ4tXScAqCe7HXVNdgmr8jY7CFH6jKW+wbR1cgbcvKiQoSDTwE6vJUn4eA
	g/8G1FuHE=
X-Received: by 2002:a05:6122:6d09:b0:5c1:2150:9de7 with SMTP id 71dfb90a1353d-5c121509e19mr2977113e0c.12.1784164909903;
        Wed, 15 Jul 2026 18:21:49 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::5ac? ([2606:6d00:15:e06b::5ac])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96ed663ded3sm12075936241.12.2026.07.15.18.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 18:21:49 -0700 (PDT)
Message-ID: <cf1251490bf5c07649ce5ef3a14ec3d8c4314639.camel@ndufresne.ca>
Subject: Re: [PATCH] media: meson: vdec: fix NULL pointer deref in
 vdec_try_fmt_common
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Christian Hewitt <christianshewitt@gmail.com>, Neil Armstrong	
 <neil.armstrong@linaro.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl	
 <martin.blumenstingl@googlemail.com>, linux-media@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-staging@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 15 Jul 2026 21:21:47 -0400
In-Reply-To: <20260624065809.2460720-1-christianshewitt@gmail.com>
References: <20260624065809.2460720-1-christianshewitt@gmail.com>
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
X-CRM114-CacheID: sfid-20260715_182151_564531_727AE6F9 
X-CRM114-Status: GOOD (  18.46  )
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
Content-Type: multipart/mixed; boundary="===============1240629015565824791=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============1240629015565824791==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-KCwQdVf4kwVZHhK4QLVf"


--=-KCwQdVf4kwVZHhK4QLVf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 24 juin 2026 =C3=A0 06:58 +0000, Christian Hewitt a =C3=A9crit=
=C2=A0:
> When VIDIOC_TRY_FMT is called with an unsupported pixel format on the
> OUTPUT queue, vdec_try_fmt_common() falls back to V4L2_PIX_FMT_MPEG2.
> However, if a distro has locally patched MPEG2 support out (as it has
> been broken for some time) the platform format table does not contain
> MPEG2 so find_format() returns NULL and the subsequent dereference of
> fmt_out->max_width triggers a NULL pointer dereference.
>=20
> Fix this by falling back to the first format in the platform's format
> array instead of hardcoding V4L2_PIX_FMT_MPEG2. This is always valid
> since every platform defines at least one format.
>=20
> Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

>=20
> ---
> This fixes use of v4l2-ctl and v4l2-compliance tools when MPEG2 support
> has been disabled via vdec_platform.c - NB: although this is a fix it's
> also a rather niche scenario so there's no need to backport it to older
> stable kernels.
>=20
> =C2=A0drivers/staging/media/meson/vdec/vdec.c | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/staging/media/meson/vdec/vdec.c
> b/drivers/staging/media/meson/vdec/vdec.c
> index 4b77ec1af5a7..f3e7072f221a 100644
> --- a/drivers/staging/media/meson/vdec/vdec.c
> +++ b/drivers/staging/media/meson/vdec/vdec.c
> @@ -504,8 +504,8 @@ vdec_try_fmt_common(struct amvdec_session *sess, u32 =
size,
> =C2=A0	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> =C2=A0		fmt_out =3D find_format(fmts, size, pixmp->pixelformat);
> =C2=A0		if (!fmt_out) {
> -			pixmp->pixelformat =3D V4L2_PIX_FMT_MPEG2;
> -			fmt_out =3D find_format(fmts, size, pixmp-
> >pixelformat);
> +			pixmp->pixelformat =3D fmts[0].pixfmt;
> +			fmt_out =3D &fmts[0];
> =C2=A0		}
> =C2=A0		break;
> =C2=A0	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:

--=-KCwQdVf4kwVZHhK4QLVf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalgyKwAKCRDZQZRRKWBy
9OvqAQDPEXcCfysbjMcLVok8WR5NVGdePin12f6DHmQ4YTlBWQEAsFlwChimwCuO
DdCcPjAuGpLhXWPu0UTxtMyQfsa74Q0=
=Wvj1
-----END PGP SIGNATURE-----

--=-KCwQdVf4kwVZHhK4QLVf--


--===============1240629015565824791==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============1240629015565824791==--

