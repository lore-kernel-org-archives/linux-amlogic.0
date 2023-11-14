Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B6EC4167D
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Nov 2023 17:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3gKq3/mwS8PHzeJwFMUqKOj0tAN8wW2NqiEQhvRIrRs=; b=HE7xLuKC5pXFDsMQaPmoarn0Na
	Ki30PL7KWumFNu9xPlXDRBygtGM9/tnXgi8lcWGIR+TBM/fQKKAg8735RTOZ7u9/bLrkuUEt0VmqN
	YB+4FMcN2qYwZLjAP64dyGTrcyQ6OK4UpzeTH7tw50qDnQifL0cKimnvDMyLHemy24RCHmOr1zv7/
	6YFW9Gh2IDQqWML8JviQyOYQ5H6H4GhELnA+PpfLkUqd+K8SUI/D8uUzUXRlbfsGD67UirgixqQWZ
	RAb5eA+lErLvpDScskvDMiXXFv6eR1uYSa5Z9OvusgMkjFFDJ6UhP3iaz0OmbK9YZ/AA6vXkdHhTE
	3sQsr/gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2xVl-00GX5y-1P;
	Tue, 14 Nov 2023 17:47:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2xVi-00GX5P-2n;
	Tue, 14 Nov 2023 17:47:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 57DE761163;
	Tue, 14 Nov 2023 17:47:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CAAAC433CA;
	Tue, 14 Nov 2023 17:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699984058;
	bh=D9KzSEK2MNUlw54aT4akCNMjbWc04nlocOCzra8qnEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZVNPcPm9Kvz2KPrx2w7zth7Hu6Ge58GrV2+G/LwiEnMdI6P+da59r2GZoYtlJfeiY
	 mki4tmtRxIRX7AvZ7KBfDEFi7Ewxyw2d6AwEmJe9WRhvL+lzD0L7cGThdr2tUI3t/l
	 RGl86ZwmnWSkG6WDi5avj/bP6gLQk3Tim7eh7hwHLW/LT058UQo5ngvoyH4nt29Cbo
	 ozUtdZU1OIYMSD2R6iDEbmA0dh3twWaCg44U7vwfWa2PH6S7mNjqdCSZEY051w9LOj
	 itJK1ErevAMpwf7xCFoej/TtvpDeAZKoYW700O4x+3GkQVQGZnPn1F0iD24wsbxYjY
	 Bd3FOvB/Q5LCw==
Date: Tue, 14 Nov 2023 17:47:34 +0000
From: Conor Dooley <conor@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: clock: g12a-clkc: add MIPI ISP & CSI
 PHY clock ids
Message-ID: <20231114-lash-singer-ddf33f11bc4c@squawk>
References: <20231114-topic-amlogic-upstream-isp-clocks-v1-0-223958791501@linaro.org>
 <20231114-topic-amlogic-upstream-isp-clocks-v1-1-223958791501@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20231114-topic-amlogic-upstream-isp-clocks-v1-1-223958791501@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_094738_945691_49E35C3C 
X-CRM114-Status: GOOD (  13.70  )
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
Content-Type: multipart/mixed; boundary="===============2591728981470032487=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============2591728981470032487==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Mg1UK2b3qj7ouDpz"
Content-Disposition: inline


--Mg1UK2b3qj7ouDpz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 14, 2023 at 11:14:43AM +0100, Neil Armstrong wrote:
> Add MIPI ISP & CSI PHY clock ids to G12A clock bindings header
>=20
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor,

> ---
>  include/dt-bindings/clock/g12a-clkc.h | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/include/dt-bindings/clock/g12a-clkc.h b/include/dt-bindings/=
clock/g12a-clkc.h
> index 636d713f95ff..fd09819da2ec 100644
> --- a/include/dt-bindings/clock/g12a-clkc.h
> +++ b/include/dt-bindings/clock/g12a-clkc.h
> @@ -281,5 +281,11 @@
>  #define CLKID_MIPI_DSI_PXCLK			270
>  #define CLKID_CTS_ENCL				271
>  #define CLKID_CTS_ENCL_SEL			272
> +#define CLKID_MIPI_ISP_DIV			273
> +#define CLKID_MIPI_ISP_SEL			274
> +#define CLKID_MIPI_ISP				275
> +#define CLKID_MIPI_ISP_GATE			276
> +#define CLKID_MIPI_ISP_CSI_PHY0			277
> +#define CLKID_MIPI_ISP_CSI_PHY1			278
> =20
>  #endif /* __G12A_CLKC_H */
>=20
> --=20
> 2.34.1
>=20

--Mg1UK2b3qj7ouDpz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVOysgAKCRB4tDGHoIJi
0hqQAP4hX+8A/W3JLgzC4C6VHY0eRmE1mwCTvgaeXnGFdMFyggEA0jDMrTecaNnW
13R4LiJbI3EwIg6VMuKZ9z0Plz5r2g4=
=wOqs
-----END PGP SIGNATURE-----

--Mg1UK2b3qj7ouDpz--


--===============2591728981470032487==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============2591728981470032487==--

