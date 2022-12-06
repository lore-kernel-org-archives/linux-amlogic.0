Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C17E0C352A1
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Dec 2022 16:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K2z2e3XKmMd0CpHyfNyV0Db6XuNhp/kmpdDgSHfqUKI=; b=xaY3pPp+lI5zVArgjD8v/C6viA
	Qu6Eion02pqGPofaKEvhCzG6phNnWbm9h1/PiQN80jGri3Zn7h99V5MOMg9TS7OtpZYndYRGqcDkb
	lDXUEmeOMas0l6RdReJug/x8U7lNZ/zyWkqr3khfw0Mnoj+WeK+Ht+IY3eKzmSoKygaGUIm6G0x5D
	FonMG8L3VbKm/R+R49AI/Bf0RVNu704uv6ztr8zGC/07qFgNE4wH8i0ZjIdwqe7wohYthpV45+RP4
	qvz0rtzMrUjG999EPkd6L+8HKo0VFVxDs9mbZHQgjARoedjmU1H16Yxvg8YGPD+ni1EADAGeDvO4P
	H2x4vFsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2awH-00F3p4-5c; Tue, 06 Dec 2022 16:37:01 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2aw5-00F3KA-So; Tue, 06 Dec 2022 16:36:51 +0000
Received: by mail-ed1-x533.google.com with SMTP id c17so12521143edj.13;
        Tue, 06 Dec 2022 08:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cu4l7c7T/KB912u2Bgs9LaIHGYUGD4KvKD2RT7SocLI=;
        b=PMIsbCZcJUnwlcb85e4se4Lhmnkg5/p3CZ/cDZsAukZ3f3i3tmY4g5sANJgykCYirK
         mlvGaIPbXgCyzpAmH06sYNk8vCmaADFoE6zZqQHb8hGg4x0/WHv6Z8hYJ0LBIWS+LTtc
         u+Elv8Ugh2Cba3MU9nJxstXdxBM91J+/NK6gRkjIOK3iiQ+uH5og/9UApeMWkOKnd9cj
         1HfW0ZgVT20uEcispZUyLDadLhenYxpl6mq5JxMXKgftr+gVs0wv+tsc+y54FBjZx7F/
         u//HOUZNxymJ9GIObTMD8FDbnCFX9F/nCVNnq/jzUgW6MoBC+f52FSuv+e3PAFbJwBdU
         tGnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cu4l7c7T/KB912u2Bgs9LaIHGYUGD4KvKD2RT7SocLI=;
        b=L2k5fe13dvW7Oe+GntVz4adLxy59kclQxBUnX0CGpg+Zr/JmW26/B2kLcFlPW4J0Hj
         LFxMSGVhqGwrgAVQhNl/o+CWltBm8/uEHINCKGYvr0ML8D/k1q5IoFeUwZTaYQWHzoyt
         cqlW4oRnpVhbQAYYxU9yjKw3k2yOa9WNMGQvCv7+S8IMQkiDgaa+HqA1W615sDNwGCsH
         cAupAgI8jq3mNSMDaq7quE2x0Z1H2tijty/9innCAbAxawe6eVzAwsfk36Hyw/N9yCTx
         7tHhcFt87lquQ0eSCyAoCw4AinSAHc1I0/k+eTx0Dn9zsIyRI2OUTdAym0WblWhQImuy
         CKOw==
X-Gm-Message-State: ANoB5pm6TqjDKlXT3o7iAfzkRHTrBp3lKRTxpoZcoLcTtXbp8tYkTvr+
	tVEBpB5aqv457VSiAu5Mddg=
X-Google-Smtp-Source: AA0mqf73SzGZEjm/ohEPWqbfiYGIO3rXn2gObtryTw0s7vUBeNfZ9CzBOpFc3oS8A3V5nkWXr1+saw==
X-Received: by 2002:aa7:d1c5:0:b0:46b:a536:e8d0 with SMTP id g5-20020aa7d1c5000000b0046ba536e8d0mr26626675edp.261.1670344606270;
        Tue, 06 Dec 2022 08:36:46 -0800 (PST)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id y20-20020a50eb94000000b004589da5e5cesm1168852edr.41.2022.12.06.08.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 08:36:45 -0800 (PST)
Date: Tue, 6 Dec 2022 17:36:43 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Joe Tessler <jrt@google.com>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Jeff Chase <jnchase@google.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 8/9] media: dt-bindings: nvidia,tegra-cec: convert to
 DT schema
Message-ID: <Y49vm34cwgilAA33@orome>
References: <20221205151845.21618-1-krzysztof.kozlowski@linaro.org>
 <20221205151845.21618-9-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20221205151845.21618-9-krzysztof.kozlowski@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_083649_954538_235452A7 
X-CRM114-Status: GOOD (  16.86  )
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
Content-Type: multipart/mixed; boundary="===============2064181945435620109=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============2064181945435620109==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Go2Ynh+Vu1nkhJ/W"
Content-Disposition: inline


--Go2Ynh+Vu1nkhJ/W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 05, 2022 at 04:18:44PM +0100, Krzysztof Kozlowski wrote:
> Convert Nvidia Tegra HDMI CEC bindings to DT schema.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  .../bindings/media/cec/nvidia,tegra-cec.yaml  | 58 +++++++++++++++++++
>  .../devicetree/bindings/media/tegra-cec.txt   | 27 ---------
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 59 insertions(+), 28 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/cec/nvidia,te=
gra-cec.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/tegra-cec.txt
>=20
> diff --git a/Documentation/devicetree/bindings/media/cec/nvidia,tegra-cec=
=2Eyaml b/Documentation/devicetree/bindings/media/cec/nvidia,tegra-cec.yaml
> new file mode 100644
> index 000000000000..9a4025ff7fad
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/cec/nvidia,tegra-cec.yaml

For consistency with other DT bindings on Tegra, it'd be good to name
this nvidia,tegra114-cec.yaml since that's the first generation where
this IP was added. Not a big deal, though.

> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/cec/nvidia,tegra-cec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nvidia Tegra HDMI CEC

Again, for consistency with other bindings, NVIDIA is the preferred
spelling. It's not a big deal and could be fixed up in a subsequent
patch, there are a few other cases where the alternative spelling has
been used.

The rest looks okay, so either way:

Acked-by: Thierry Reding <treding@nvidia.com>

--Go2Ynh+Vu1nkhJ/W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmOPb5sACgkQ3SOs138+
s6GLkQ/+JBbjUjYZFvRHaZqueKhqQcvpNxzAo/fyN5BnZRl/Dr6r9OkfSNoSVuEm
io5uqdiYDfXXvkApiv7BbHeNaXH8BX0PxRZ9J+hsE41zpGVHRHE+dmRlcE+rhY54
/TpkHx0VCMROkD6C1KQShCE4n9CQGRixLL2sHdhIWxmkaC2fLR609+duNNQ4t8Up
ASXC4hJuo1TaO31lGydUoB6S7SeU+iSO71B68Pc0HZ2cFib1ZnsdLPgK1gMJyO9q
ooyvj+IZsPX+YMfId0bMq9owxQRdqZhxSx58LOELQPR/5Ac8Cyfll70L9eZ9uw/8
5PKT6Eb5ilJnjfCDzF/ef8BGMBL1Ko5qoZBAdqE2Pgk01joFuRIclgZBHcujEaMl
ymMSnEla9I8thLrJ+8grukft6H6FcuKDnqsn4jhCoIm8b7tID+jyKCbmaBxb0AmC
VBn13BuYlSv6czihQawg9cfUyjnam/f6t/KksETr1Ne6HzC0qN7ZrxXNjcqFVB48
mrmKcUbT1adE4eq5czWTEExxckY91LIGSBxZVO6JFRp+13qv4HUV6ZfC8bHM+0x+
g8WACmp+9HsfNHLR53X2ASF7UIzPicMXNMw2SHK2Zx8y2/WF1MdWRkYIj9NpfkhD
eIbGX2q9nIG7nsmqzH66uQO59Wqdv40FseT6dQM5KPpNNz9Z8eI=
=2Wsf
-----END PGP SIGNATURE-----

--Go2Ynh+Vu1nkhJ/W--


--===============2064181945435620109==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============2064181945435620109==--

