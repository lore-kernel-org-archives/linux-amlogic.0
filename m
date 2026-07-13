Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 204E9C43458
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2026 14:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rtPGdsi3UQhaMGR0arPinyYLH1vfnRyygDhS8RHea5w=; b=2MEVNo+I4a8xDQ2w91pB2r+26y
	5E5a8TTRKqsecU5dwm8OioRl/0Loy938cpjWxtsNtu34uab72sHewHhsNO5cCsm9gpIU1+AYw134s
	Le7ILihcS/EQgBAVLhomBlJYTMi8GnjUW+DgR0Fk4urzkdy2FvrPlSh1gJ3HY8Rbj/E3LTM/r0Ulg
	dwngb3eVA5Mg01mlCxOTD9ZgL+2kQFi9+uQ1+yk6DD/+UeA8XqDfBk+yj27CA1M3XkxH4tPQOrZ32
	d6htWqHtJGIsjWS40hAgiMUwI7qA3E4kmkZIgfQT+VVt5daPH1GSMpIQPUxICOJ7+/14m7HcyYAd6
	69hTjCzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHGV-00000009Xbf-250B;
	Mon, 13 Jul 2026 14:04:11 +0000
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHGR-00000009XZK-3ZSa
	for linux-amlogic@lists.infradead.org;
	Mon, 13 Jul 2026 14:04:09 +0000
Received: by mail-vs1-xe32.google.com with SMTP id ada2fe7eead31-74019ed06aeso2553032137.3
        for <linux-amlogic@lists.infradead.org>; Mon, 13 Jul 2026 07:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1783951446; x=1784556246; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eBW10Cfwapwvr0gihXMdckLTW8yiKSYBxKONjhqXCr8=;
        b=GIlzv3BWN2NkEOFu7n7LmRegZSluTWBqhAlpSWylLrt2Qu6R0zbHg0kffO2o4+DMEn
         kP3aMMiuNADhaOcF9cIWUHwmYYl67e+A9ebw2W4CdHt8sdUwB6k5rwWy1PXAZnngL3P+
         IFMkQ6LOJ/S6k+dhySyTbPSMqHpzZQiVMeWGVD+NUdL/zOuiPLRAkOsAayr9iYg1PQi8
         +DPWytFqVpCUu7KJGcdgM2/o9auMEW0YnxDjKK12ayrt5xw8D1mZ3LjWmGJUrSyTNkuJ
         1Cs1lKf9tXIXbFJHnwz1ZkBR6ykmgfKR0V4pUJ04VMgiVaqSTg33TYeYvB2p7nOaIaQo
         lIQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783951446; x=1784556246;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eBW10Cfwapwvr0gihXMdckLTW8yiKSYBxKONjhqXCr8=;
        b=K5xpoRpZeYmjZLUqtSqT+aAWeiGj6iqhGVzY+csRuVQV/2t46WUOnF8/2112aC+7F9
         lAbV2W74v5RB7nMZzuH0Kt+0Tud1u0YKyM5cdbYpWgzTw2YgONB1n/75cok2GPU+pr1U
         eNwaChyZ8Dr+JQubphS7pOlgvJZt9YDieCzrMofRJKMawWXEeqkL0m8eN/keHOk6GzAw
         9W+9lZSAM8mb74LQojfcQnmzshEl/jmcsni9JtaTNdigKa36JhtWI88PKuNBCPGvDi3l
         i+RkK3NIDGulaYP919Q+3ttMJAvFtJj0Mq5xhvq2AAL9JKKSa7XR/ZuGHUFBjZVW6+wr
         8FPw==
X-Forwarded-Encrypted: i=1; AHgh+RqaYKQkeoer1W2Ax8jxa0SK2pNwR6I+dL7a/+U4Cma2hkKQewU8CGTeQ/1bf4tlpoAm8w68BoUOaA5/y2Mn@lists.infradead.org
X-Gm-Message-State: AOJu0YwkpLmOhlbL18NtVhqy5DJHceWZ9hVCvIaaNN0rKTujKJyGKCXt
	zvlVx9HrjWS3jkqFxt3AF7nfNRef/meVxaQ3G2iq59EBSISfviFEjniB8rJ61BIBma8=
X-Gm-Gg: AfdE7clnowgDKt/R5KXM+Twu4Ta6bMM0oVq/t+mI1QZfp2tYFwqbNnvimvb2i/iPuoz
	wSqsbIhnVG75bU7i2zL5q3xqyAoVVCk8kJiQmfWpb44EJCAhMUvFL7p+TPHHDoV1R6rTLPspKkn
	aDu0VFyE6ToJWvQcZNXhjuoq0L4wtmop0GJIM9OtMCGkMdG7OTEaaAjyIUlmKP3g8opAXefrZgI
	r5T1G99P54ZAlfQUSNhzOsHRNj3ubtcPBpkql3tEK50GQYDV4kl8q+bprZFjvRTi3i+PHSM0GcL
	KTUS0rKIHdB5JCXoi6S2dE2ygkQjsdh7e5VIntxNiUHKE35nbvAIVqNetJp7PduoQOjJAtEmPWy
	rvxWgACGkV0TS4FG8K7Fz3db59ClA9WVL684j4XMAWjU1K+SE2hGjaN+7JiGrfdHCq5ceZ7vLdW
	GTkg7WoCfHjZXvP+rtWg==
X-Received: by 2002:a05:6102:8026:b0:737:2ce5:7b2d with SMTP id ada2fe7eead31-74533bf2bccmr6755210137.9.1783951445952;
        Mon, 13 Jul 2026 07:04:05 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::c41? ([2606:6d00:15:e06b::c41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-744d6a3eb8esm8744432137.3.2026.07.13.07.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 07:04:04 -0700 (PDT)
Message-ID: <5224ab5bffdee0777ecef73a3b96c88e8eed38e8.camel@ndufresne.ca>
Subject: Re: [PATCH v7 19/19] gpu: drm: meson: Fix DMA segment size limits
 and maximize allocation boundaries
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Anand Moon <linux.amoon@gmail.com>, Neil Armstrong	
 <neil.armstrong@linaro.org>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl	
 <martin.blumenstingl@googlemail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:DRM DRIVERS FOR AMLOGIC SOCS"	
 <dri-devel@lists.freedesktop.org>, "open list:DRM DRIVERS FOR AMLOGIC SOCS"
	 <linux-amlogic@lists.infradead.org>, "moderated list:ARM/Amlogic Meson SoC
 support" <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>, "open list:MESON VIDEO DECODER DRIVER FOR
 AMLOGIC SOCS"	 <linux-media@vger.kernel.org>, "open list:STAGING SUBSYSTEM"
	 <linux-staging@lists.linux.dev>
Cc: Doruk Tan Ozturk <doruk@0sec.ai>
Date: Mon, 13 Jul 2026 10:04:02 -0400
In-Reply-To: <20260713120840.17427-20-linux.amoon@gmail.com>
References: <20260713120840.17427-1-linux.amoon@gmail.com>
	 <20260713120840.17427-20-linux.amoon@gmail.com>
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
X-CRM114-CacheID: sfid-20260713_070408_031768_FA34636A 
X-CRM114-Status: GOOD (  16.26  )
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
Content-Type: multipart/mixed; boundary="===============7871307790387956685=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============7871307790387956685==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-K7ZLBpNLX5/kwXKFKQKp"


--=-K7ZLBpNLX5/kwXKFKQKp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 13 juillet 2026 =C3=A0 17:37 +0530, Anand Moon a =C3=A9crit=C2=A0:
> When importing DMABUFs exported by the Amlogic video decoder driver
> (meson_vdec) for hardware-accelerated rendering paths, the DMA core
> subsystem throws constraint validation warnings. This occurs because the
> display controller master device lacks explicit DMA layout configuration,
> causing it to fall back to a default 64KB maximum segment size limit.
>=20
> Address these architectural constraints during the master bind sequence:
>=20
> 1. Initialize and validate a 32-bit coherent DMA allocation window by
> =C2=A0=C2=A0 invoking dma_set_mask_and_coherent() with a DMA_BIT_MASK(32)=
 argument.
> 2. Maximize the contiguous scatter-gather allocation segment boundary
> =C2=A0=C2=A0 check constraint to UINT_MAX using the dma_set_max_seg_size(=
) helper.
>=20
> This guarantees that large video bitstream frame buffers can be imported
> and scanned out across sub-driver domains without triggering allocation
> warnings or page boundary splits.
>=20
> Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>

Acked-by: Nicolas Dufresne <nicolas@ndufresne.ca>

> ---
> =C2=A0drivers/gpu/drm/meson/meson_drv.c | 6 ++++++
> =C2=A01 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/me=
son_drv.c
> index 49ff9f1f16d32..899e70bca4ce2 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -202,6 +202,12 @@ static int meson_drv_bind_master(struct device *dev,=
 bool has_components)
> =C2=A0	if (IS_ERR(drm))
> =C2=A0		return PTR_ERR(drm);
> =C2=A0
> +	ret =3D dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
> +	if (ret)
> +		goto free_drm;
> +
> +	dma_set_max_seg_size(dev, UINT_MAX);
> +
> =C2=A0	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> =C2=A0	if (!priv) {
> =C2=A0		ret =3D -ENOMEM;

--=-K7ZLBpNLX5/kwXKFKQKp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalTwUgAKCRDZQZRRKWBy
9NNdAQDmsQSLx7lRRr/0dmnss88GGZZ8T5JiUJHYnp57V3Vo9gEA5tSuLIwnYukh
D1WBuDEOFQqGktSq40CeUMEDMi1jCgg=
=9ZVW
-----END PGP SIGNATURE-----

--=-K7ZLBpNLX5/kwXKFKQKp--


--===============7871307790387956685==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7871307790387956685==--

