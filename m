Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA1EC7EE29
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jun 2023 09:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JlogZYGVk+pOqjfqRDVuRz4IfyKIis1K78krlyNcNPU=; b=cfWJVLMEh9Pi5ixhgtgoxFCjQK
	NQqlfTTtRO/6KytByoKwwzxM8tfIURyn9tJds3a3jb3wemm9Z2NIO73RzSMbSz6uv1ogYBw/BgPWP
	RuDLJaIWo0+eeCy6xxtybWpRSdi/bMWqt9nBHOlQsm5wo2rNfbiZi5t9PiSs7oWOzbMN0zghocVxv
	oifb0T8cX+dCMZob2oWZk0vTFGZIBCQLKVyYupzZlG2oEqgn2YekS+tfwqzpT7ZfSL/MpSas6XMcd
	08MOFSsTPjnBNJhCo1eTH08CF6SFM/mONuJYWo8xN1zUw9CxsP2+sAgE0oIisbEt1i9sDYpfHCd2W
	PR9YDlow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q90fa-007Yh4-27;
	Tue, 13 Jun 2023 09:50:34 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q90fX-007YfH-32
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Jun 2023 09:50:33 +0000
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id DDFAD3F272
	for <linux-amlogic@lists.infradead.org>; Tue, 13 Jun 2023 09:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1686649826;
	bh=+S8RVn4cwZ2hxJXT/iwldZ/F9edrSEM7MNIbg+01La8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=oggMr+VrzupefQ5YI9jTJ+1QI6ftAxJbype6LjY9+IW4y5zQeLjwOBXHh9jq1Y+fh
	 QeILcLKAbPVzKxlArgb452JDtcYjmtNI7Rieqm7DDaBL0CoGws1gYCiOaB+mbwp26R
	 PbY7Zkt18D2OYR6EINDm+avUh2ZBPdUg31Gu2xlEIc3IvjOdbFI/pZt/JhEtHB+7i1
	 tLpS8fLnRpO3hi011Lf2p4RrwiV5eUNKssEx0IpiMp3d3vkUc1rx1cBwMS5VZNmOEe
	 y/VxMej23M+K8Hvuh6hytnaLYSNNGc9N3XBYslwMshtmHS8k8Xa88IecYqOHuaXXab
	 MQTzSPQXewJlw==
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-30fa3ea38bcso1382945f8f.1
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Jun 2023 02:50:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686649821; x=1689241821;
        h=mime-version:organization:references:in-reply-to:message-id:subject
         :cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+S8RVn4cwZ2hxJXT/iwldZ/F9edrSEM7MNIbg+01La8=;
        b=imBu6QTlczCFrvub6tAwVi96ZyOSGQdn3UhCpbwxaCqZ3RBkYiv2bmL5r6ec6QDC4v
         L6NWq+X05+DZfCRwkpfCnO+urUzqhgqZYT04a+5J4euM1MypgFgaWMxpm/MoOJ10hzBE
         5L63GxXLvXPaiE657i4vkH0hqeRRTiVlapfFGcTTDiLIwIBuEOGkiNThBp5aFF3K4d2X
         4NOXTXHBu87FkUZ94s6kQ/0l5ZIM2yV7BNjt+uWVloU6UoGflFfCacUpRUKjkXu7YvKr
         8NSAiq6mIY/r8yuXeY0uN7BFcizDmvjx1sdgwemF1AqfBS9adEwYdbJQ5uIMKaQlRz1p
         M/uA==
X-Gm-Message-State: AC+VfDz79mVlJ9ckUZ5XTxWhwvT1QCsS2hxz25Ucmtc8r/2fGnbAPDuf
	q4u3tF5IQzst3Aedp9PzaPXvH9I4aNXIIyyQbpkgyKVtgusiiLK6WvIq/PpYE/QgmuOjgU6zdRr
	4Fdgc5atI/U15dKgbaMgjc9QSyIRAAnMs+tEio45pSZHyhe3O
X-Received: by 2002:adf:f5d1:0:b0:30a:e973:b182 with SMTP id k17-20020adff5d1000000b0030ae973b182mr5621223wrp.1.1686649821375;
        Tue, 13 Jun 2023 02:50:21 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5qsylu7h96z/YokKVYhvI775gxBdTlvE0mtDesHac9WjQrm8pjsK7JHPCjjoGLyNjMF04RdA==
X-Received: by 2002:adf:f5d1:0:b0:30a:e973:b182 with SMTP id k17-20020adff5d1000000b0030ae973b182mr5621204wrp.1.1686649821059;
        Tue, 13 Jun 2023 02:50:21 -0700 (PDT)
Received: from gollum ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id q3-20020adff503000000b0030fa3567541sm11795106wro.48.2023.06.13.02.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 02:50:20 -0700 (PDT)
Date: Tue, 13 Jun 2023 11:50:18 +0200
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: juerg.haefliger@canonical.com
Cc: gregkh@linuxfoundation.org, jbrunet@baylibre.com, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 martin.blumenstingl@googlemail.com, mchehab@kernel.org,
 narmstrong@baylibre.com
Subject: Re: [PATCH v2 resend] media: meson: vdec: Add MODULE_FIRMWARE macro
Message-ID: <20230613115018.562c843f@gollum>
In-Reply-To: <20230126153258.1558471-1-juerg.haefliger@canonical.com>
References: <20220818064810.17856-1-juerg.haefliger@canonical.com>
	<20230126153258.1558471-1-juerg.haefliger@canonical.com>
Organization: Canonical Ltd
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_025032_353893_FE91BB5B 
X-CRM114-Status: GOOD (  13.19  )
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
Content-Type: multipart/mixed; boundary="===============2229120614673648217=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

--===============2229120614673648217==
Content-Type: multipart/signed; boundary="Sig_/ghcr7VuYGJ=w+H+lw1iLJue";
 protocol="application/pgp-signature"; micalg=pgp-sha512

--Sig_/ghcr7VuYGJ=w+H+lw1iLJue
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Ping


> The meson-vdec module loads firmware so add MODULE_FIRMWARE macros to
> provide that information via modinfo.
>=20
> Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
>=20
> ---
> v2:
>   - Drop duplicates
>   - Add Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/staging/media/meson/vdec/vdec_platform.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/drivers/staging/media/meson/vdec/vdec_platform.c b/drivers/s=
taging/media/meson/vdec/vdec_platform.c
> index 88c9d72e1c83..70c9fd7c8bc5 100644
> --- a/drivers/staging/media/meson/vdec/vdec_platform.c
> +++ b/drivers/staging/media/meson/vdec/vdec_platform.c
> @@ -280,3 +280,12 @@ const struct vdec_platform vdec_platform_sm1 =3D {
>  	.num_formats =3D ARRAY_SIZE(vdec_formats_sm1),
>  	.revision =3D VDEC_REVISION_SM1,
>  };
> +
> +MODULE_FIRMWARE("meson/vdec/g12a_h264.bin");
> +MODULE_FIRMWARE("meson/vdec/g12a_vp9.bin");
> +MODULE_FIRMWARE("meson/vdec/gxbb_h264.bin");
> +MODULE_FIRMWARE("meson/vdec/gxl_h264.bin");
> +MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");
> +MODULE_FIRMWARE("meson/vdec/gxl_vp9.bin");
> +MODULE_FIRMWARE("meson/vdec/gxm_h264.bin");
> +MODULE_FIRMWARE("meson/vdec/sm1_vp9_mmu.bin");


--Sig_/ghcr7VuYGJ=w+H+lw1iLJue
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEhZfU96IuprviLdeLD9OLCQumQrcFAmSIO9oACgkQD9OLCQum
QrcQVA//Xnyo7NgEIg7RU1068vZ3jYv79u7ET2NDlEqPLkXRGNpC09DHkjFbVsh6
pIKGdGT27w2eN7UoOueSXoX3UMr5ZMXVdfh/zsQSmfb7Jxm1cAujfJwiBLwtnGZz
J2IBevnvVy8BddBMtAlxcR1cVWj0H5SZWoO2rYGQWJ3udpA0l7kb2taZndeUNs4i
Pklfe4w7FsgFWoIAyG67C3prc9LQh657mYzLvdWWNfnhhFGmy/SvXXWaLMKraboF
u97X7QT92k8dOn08zUwCGfzFePuFUidcSFQMrf0hf1hCWSzxYMP1ELWqJNBnqo4l
pt4ivVVr2RarOXRpnJfM8+sCjVcJh3HNsW5zZp0nACBUQ2dLarBvf8Zwmo59oQC6
e2VjXIrLImN03fz+rlFG4w+Y12fRJq0tDNoCoAcksZx361ppaAWgjyU414hDpXjp
WNIcZXhEwpgqqUCHpb8Os9q3y6LbMy45ybhoxhpf3HkvZ2QgUdOEZkDtk90GHPxY
5ApOAm9Z1fZdD/wv+3JIMu7GZ41+F12cT6fnt9Xk1shNv9kqOFVlLy1r1il92wZ9
kqLfQBqg1PU9aBRJ+331N+ILCDxM3L/NV5pAftDB+oI9oB3x872Ap+Kk/4K5zMjz
B/yf3x6QDrX8eJKRmcOYR93LIgb5vMquSlhJ18eoWhimhazb5qc=
=sYn1
-----END PGP SIGNATURE-----

--Sig_/ghcr7VuYGJ=w+H+lw1iLJue--


--===============2229120614673648217==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============2229120614673648217==--

