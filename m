Return-Path: <SRS0=WuYP=CR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF470C2BC11
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Sep 2020 19:11:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 625A32137B
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Sep 2020 19:11:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nEJvRSyN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 625A32137B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oB5e9BXTl+MINx9Shk73Mb4bryMXlWTmL1o/Wk/bCXU=; b=nEJvRSyN8NeqnHoNihfd3+X/e
	6mX+489qUYqF6uTw7mEThiJjy57SzqIqfI45p03wgcr3fx72Wc9cb40hXyZkWDnHWiPjrk5WZo5Sd
	CYN3gncjfSusDtL3oMyKUvWzDaogR2h9YfMrUFdRC3C6g+gTvRj5Sj2dZkqPnUUmZxRi7Mjvv4n07
	Tfdq8Cf24jDPlmp8t8w9RB5RdLtSeh/kb56gdPFHK2CQCv1A8C/tlibHW/h3hIt2/Kvfyl8tKHIkD
	RMvPaq60yEeb+XhfcUHKEr71O+IN93Qxv1B5xpc5PgGQHD1CmqValxuDpglMw5e5qDJI3fbMQW83Y
	wCcxe1YrA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFj1f-0002Gp-G3; Tue, 08 Sep 2020 19:11:31 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFj1d-0002G0-3K; Tue, 08 Sep 2020 19:11:29 +0000
Received: from kevin (unknown [IPv6:2607:fea8:55f:a950::68f4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: alyssa)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id AD43F295E47;
 Tue,  8 Sep 2020 20:11:26 +0100 (BST)
Date: Tue, 8 Sep 2020 15:11:19 -0400
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 5/5] drm/panfrost: add Amlogic GPU integration quirks
Message-ID: <20200908191119.GC10568@kevin>
References: <20200908151853.4837-1-narmstrong@baylibre.com>
 <20200908151853.4837-6-narmstrong@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20200908151853.4837-6-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_151129_268632_0A3E21E5 
X-CRM114-Status: GOOD (  16.86  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: robh@kernel.org, tomeu.vizoso@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============8194952763425707345=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============8194952763425707345==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b5gNqxB1S1yM7hjW"
Content-Disposition: inline


--b5gNqxB1S1yM7hjW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> This adds the required GPU quirks, including the quirk in the PWR registe=
rs at the GPU
> reset time and the IOMMU quirk for shareability issues observed on G52 in=
 Amlogic G12B SoCs.
>=20
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/pa=
nfrost/panfrost_drv.c
> index 36463c89e966..efde5e2acc35 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -656,7 +656,25 @@ static const struct panfrost_compatible default_data=
 =3D {
>  	.pm_domain_names =3D NULL,
>  };
> =20
> +static const struct panfrost_compatible amlogic_gxm_data =3D {
> +	.num_supplies =3D ARRAY_SIZE(default_supplies),
> +	.supply_names =3D default_supplies,
> +	.vendor_reset_quirk =3D panfrost_gpu_amlogic_reset_quirk,
> +};
> +
> +static const struct panfrost_compatible amlogic_g12a_data =3D {
> +	.num_supplies =3D ARRAY_SIZE(default_supplies),
> +	.supply_names =3D default_supplies,
> +	.vendor_reset_quirk =3D panfrost_gpu_amlogic_reset_quirk,
> +	.pgtbl_quirks =3D IO_PGTABLE_QUIRK_ARM_BROKEN_SH,
> +};
> +
>  static const struct of_device_id dt_match[] =3D {
> +	/* Set first to probe before the generic compatibles */
> +	{ .compatible =3D "amlogic,meson-gxm-mali",
> +	  .data =3D &amlogic_gxm_data, },
> +	{ .compatible =3D "amlogic,meson-g12a-mali",
> +	  .data =3D &amlogic_g12a_data, },
>  	{ .compatible =3D "arm,mali-t604", .data =3D &default_data, },
>  	{ .compatible =3D "arm,mali-t624", .data =3D &default_data, },
>  	{ .compatible =3D "arm,mali-t628", .data =3D &default_data, },
> --=20
> 2.22.0
>=20

--b5gNqxB1S1yM7hjW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl9X11YACgkQ/v5QWgr1
WA1SyhAAgVduu4bMRXVDtE5vLGTa6kOSM3YzDXPkd5eadv5cvcsZCPjzItTlpbV0
TdS7/SVgZZyDkGGCI2YzL5j7cNkso6ffe6y6LrUPkttYFfmsib3VuEUxLZG+evUD
rgq3BlmPI/4++/hmzaBRE8lD3TjhcY7cki3cpoz696GxstugGb2XkXuUpnUwS5f0
J4ZHmc5foIP3BtUUo2WVE2J4Ey0ljCM4pBjFtT72h1PMZDiTPo0nnNzZWbmu7ScM
eNQvFReKPVK9WTLYjpDzB1Da5jDB7ULPCLdQ2Dihb/QdPhjN7Ik47H+p82CxZ+2/
tMvJaPDEH8IzwkJTQojv148r+uWuUQV2Lqllkn4WTLvNwdWeIb8r/rr0ygiDqg9y
/poPMKnL+OIyvL4nBQMc+W1BWB4CPPjBYHEfKA95c2bb1djdsAYyF+uVhsbMbTPQ
q3YlWlJLadtYpSiHIVtVE9ISzE8+c9XnfruhZfniTTGHAI5bsagvYTh3ONdhI/I2
W2zNBiF0mqNBxoyAc14KURy0PMCNfgsvFiS/n+E4uB72NDdHhu7S7CbG96tsUQPX
zf2PrPHCarpFSK1mCr9OCdHWeJ1iWR7gNqrMYgZAzXNKtrqrFjle7KHnxIVU09l3
BxpldnOaHPD32usBXkAmlOWlSGv2qs3AEt5kpOCs8AM6LBZOCLk=
=14Ih
-----END PGP SIGNATURE-----

--b5gNqxB1S1yM7hjW--


--===============8194952763425707345==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============8194952763425707345==--

