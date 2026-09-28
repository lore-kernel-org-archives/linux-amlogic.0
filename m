Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D07D3CA5FA3
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Sep 2026 19:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CNz7UCIrHi0rW9nY9aYl0JbW1j231Is+xVmP5HOsIC8=; b=jy2sv7WQbwHni1FxSMju9XnksA
	ED4u1qz60jfGU9qEdQeN4X8zEgzB9asE00WkNbT/e1smumWufwaPIY/LnJz/9JWf2mV/6LWZlp8Zw
	TK/O4rECBNv3oAzn+F96mJOdoPgEsDVDkA+mUQMPfOuAw1bruqcVk5PI1rd+7U/edcMdsXDKOgIfT
	HLBUsfN1KXXjWkp4H/7DqDPPyV1aQFqtIFntxLxVhIraGYVNUPXuFdfQH3UrrGyUYyZyUaqLo1CnV
	Olmk1GKkMWdxlt//j8nzzxRVTxoOZ6RtPf9nhvhOFGu6iea26fBo2LrTYwbGgPhIpvWn5hp+Awa+P
	0fxN/gaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBH7s-00000001Soq-1EJ5;
	Mon, 28 Sep 2026 19:35:00 +0000
Received: from mail-ua2-x10.google.com ([2a00:1450:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBH7T-00000001Sbv-3YRL
	for linux-amlogic@lists.infradead.org;
	Mon, 28 Sep 2026 19:34:37 +0000
Received: by mail-ua2-x10.google.com with SMTP id a1e0cc1a2514c-97e97e2c7b3so1884497241.0
        for <linux-amlogic@lists.infradead.org>; Mon, 28 Sep 2026 12:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1790624074; x=1791228874; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6eqac1h8irF+zeWRR8Dm7dn5WwgpsnMLx6CDzc6fVO0=;
        b=FxfAAuyTJm7vcAPE48uoGdf5MMYeZQP55kRmeCCBXbbfrTSf7x57V7JDepn3/VXF1m
         3JrnP2176v1gVHz/L32v65mUjqL5xFV7InG7eRHusQpyMhTmhne3kClI46+YMc/cWxry
         iGM+abe9amcMTnzKEXAlS7LeZxBjmFhryEk2lOYoSuIyh8I+GxUu5cCdC9x9yMQ+0zHY
         XxsccwKDBD++UpVf6Ey1yLDRS4Pn2P/BK+gJrftSbwhdTGKhz852th6PaX99FonW5vZm
         yQUnItxf54GxiQtLKNwiebhC07JjiFzQGeA31zB9seH3G0P9bTmqRqbD/zHKth12tVhx
         eGlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790624074; x=1791228874;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6eqac1h8irF+zeWRR8Dm7dn5WwgpsnMLx6CDzc6fVO0=;
        b=06dKmxUfIlFo7oh5lbvjMwyVw08PcwbJFi3gDx2uu7A9SVVTntkoL6Ma2HSbkpJ3/9
         /nBilPevJRjDMRaLKqMxX3/MLWjUZuDWdWuQ2TD2ol3STpOtrxIMpjQDta3392W8rX06
         DUTSDj44cB+abSExOd5NcvFk/mwhBw7mUYUHKyY/B/HlRaSmMUKqfGG9poGzMuh32GsQ
         8zsKTVzOZQNra7YIMKYaFyI3QwkuWKkdZG2a2zzGB/B/C4M1baRKXmn3P0E2cR3vwiAN
         5R7Fu8FpI9ChL4L8UF2/KU5+l0GmRZShqFNJUBzUJUAbtTJTQFARSRYxaCCf763cLZTq
         w55A==
X-Forwarded-Encrypted: i=1; AKwUvBwwVCPfjOXiKQZSEG2lZ1Xw7+FXrrKDW9Y1F/+EC9Ed5NXnZ2lZKMk5QdhULABx+n1wcLnq6lDXWnBuNd19@lists.infradead.org
X-Gm-Message-State: AFq9FYLj6F3I5XrorX1q8NjvXfqCuMGANGJTZA7gw8+mC6a+8GIyREP7
	FGsxsPPp4wkhmbTl37unT3ll/N8PsjuOQ2VNsm00i5MzzpfZrpYP6vXHlM0k8kaxE+c=
X-Gm-Gg: AYBFou3jc8ExqQsvZ0xfFeWrIME9fdeJ19MiLEuN2TtwITs3577O/1UE35Wi/NacHue
	Npz0FDoIcFMaBkYW2KzdI/e+fPrwE6+PVUjbUhKNfC8iIzknSe6VsOh6ipZ8iMBGKHRdI9SvKDk
	/biXA7Pm1ENZ3mEnPvF6ifQq4/SdBOdUoKJu7oMhg7n1+wTCb8uov3iLNZ0E/rxJK0MvOFdnvan
	xiKhkhkNJFt2HYuO9TXu0RibD6OmKUfJI/7MUTtUvzVhQAzRkJ4NdFRU5ZOqfJs3NLwYnKosE2r
	ZBPkoqlAX/3SArDz2yF47/MFavwTZ2dCcu4O1uN5BXNVqD2P9j3YvCsLFyIJCFDm56BvRapzyEK
	X5ysKztqV8QRcXyDiJ5CNGimkWI+o+R5cnlqYFIGOBZLPqiTTTipCUNLNjKYVyLAI1UK/edtYnX
	XQ2xwJp4aYkOWrkIAWr9Ah7vDafxfm5TYV36OpWBK2T708eLTqYkcniRdpQd/qIDfdeZbo4ZU7G
	/23Ok+L+wKBaQ==
X-Received: by 2002:a05:6102:c94:b0:7b5:4700:3a5e with SMTP id ada2fe7eead31-7b547006f20mr1391763137.11.1790624073763;
        Mon, 28 Sep 2026 12:34:33 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:34bd::5ac? ([2606:6d00:11:34bd::5ac])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5cde6b43916sm10558755e0c.18.2026.09.28.12.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 12:34:33 -0700 (PDT)
Message-ID: <4f6f3ba03cc3520505a3af8a259bb1db4fc68e19.camel@ndufresne.ca>
Subject: Re: [PATCH] staging: media: meson: fix typo in codec files
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>, 
	neil.armstrong@linaro.org, gregkh@linuxfoundation.org
Cc: mchehab@kernel.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, linux-media@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-staging@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	hverkuil+cisco@kernel.org
Date: Mon, 28 Sep 2026 15:34:31 -0400
In-Reply-To: <20260508055731.19784-1-mahamaryamjavaid@gmail.com>
References: <20260508055731.19784-1-mahamaryamjavaid@gmail.com>
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
X-CRM114-CacheID: sfid-20260928_123435_927788_598A075E 
X-CRM114-Status: GOOD (  15.54  )
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
Content-Type: multipart/mixed; boundary="===============1008661103250918081=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============1008661103250918081==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-ioRvVvCQ5XFlC4aqFG8O"


--=-ioRvVvCQ5XFlC4aqFG8O
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

subject should have been "[PATCH v3] ...", already picked but wanted you kn=
ow
know.

Nicolas

Le vendredi 08 mai 2026 =C3=A0 10:57 +0500, Maha Maryam Javaid a =C3=A9crit=
=C2=A0:
> Fix spelling mistake: substracted -> subtracted
>=20
> Signed-off-by: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
> ---
> Changes in v2:
> - Combined both meson typo fixes into a single patch
>=20
>  drivers/staging/media/meson/vdec/codec_h264.c   | 2 +-
>  drivers/staging/media/meson/vdec/codec_mpeg12.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/staging/media/meson/vdec/codec_h264.c b/drivers/stag=
ing/media/meson/vdec/codec_h264.c
> index 89e0f8624e5b..a6074de15118 100644
> --- a/drivers/staging/media/meson/vdec/codec_h264.c
> +++ b/drivers/staging/media/meson/vdec/codec_h264.c
> @@ -16,7 +16,7 @@
>  #define SIZE_SEI	(8 * SZ_1K)
> =20
>  /*
> - * Offset added by the firmware which must be substracted
> + * Offset added by the firmware which must be subtracted
>   * from the workspace phyaddr
>   */
>  #define WORKSPACE_BUF_OFFSET	0x1000000
> diff --git a/drivers/staging/media/meson/vdec/codec_mpeg12.c b/drivers/st=
aging/media/meson/vdec/codec_mpeg12.c
> index 76e9ca7191ab..ab4374e3b2ef 100644
> --- a/drivers/staging/media/meson/vdec/codec_mpeg12.c
> +++ b/drivers/staging/media/meson/vdec/codec_mpeg12.c
> @@ -12,7 +12,7 @@
>  #include "vdec_helpers.h"
> =20
>  #define SIZE_WORKSPACE		SZ_128K
> -/* Offset substracted by the firmware from the workspace paddr */
> +/* Offset subtracted by the firmware from the workspace paddr */
>  #define WORKSPACE_OFFSET	(5 * SZ_1K)
> =20
>  /* map firmware registers to known MPEG1/2 functions */

--=-ioRvVvCQ5XFlC4aqFG8O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCarrBRwAKCRDZQZRRKWBy
9LQxAQDbhfzAoaDPMzDhwB/2BfSnHFrathZiFBRY73XPw8V60wD/cj3/gXBOsU2H
IXhvc2D00xxNhwhw9hEzo1JUkC370Ak=
=AYIv
-----END PGP SIGNATURE-----

--=-ioRvVvCQ5XFlC4aqFG8O--


--===============1008661103250918081==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============1008661103250918081==--

