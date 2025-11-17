Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2909BCE8D6B
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Nov 2025 19:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2RQvLNcwwerXsqYZNvOxZL3vQfajTRj5/o2wsl7/c0Q=; b=LLLrLyuPiTWmlvQCOeNl11q07B
	+nLcT8aEuQDIbn+XtvXA09aOL3xAHO2vmuatBCkji2Gj2+O0REdcKfe4u6gGxBUj3hiW8hy1R3OGm
	GMHZFwWykwtuJYW71JaPNRWgvehNkPeqiyYKlPtKnJ7+8E4TmJBkuasqRx3fik0TE2L2FFMwgVcc7
	rLWpVVugZuSc4bvDvFE8OCgKsqpPNWGZJCTH8+ourR3cchvgzvSeL5yp/gA1ZY+ZbLxNAnPSnxWf1
	j+GJB+mkD73Pp0+CTLvctpB9WhdJTM8N6wzkwR7i5N/MGQ5ly4M4oVvNm8ztlo7jJ9YSLddN8phN0
	GQ+wSHxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4qx-0000000GkcD-27lf;
	Mon, 17 Nov 2025 19:25:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4qv-0000000GkbU-0004;
	Mon, 17 Nov 2025 19:25:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5EE41409F9;
	Mon, 17 Nov 2025 19:25:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A7CBC2BC86;
	Mon, 17 Nov 2025 19:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763407528;
	bh=p3z57pTtowM+hDOfFVIHcuBANjDIJ4b/jNR1Mf6AWis=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qrovRAUdV8rCkExxc7HVnOCFxhFytmmAJp9VkWfz5WmcI+BSimbHnhvV2MychMZQc
	 8u3FxmfzsNpipCRZc5p7fVfU8969DaKo/2huPDtgepF86PnqPasVKReZ2Nyj/fHUeK
	 xkdxWViB537InOUXl7xYqa8m2ICTzTEv5Fcc33Sw8SqVuEp12GjCklZeei+tPQI03z
	 TXBMKS5tu53LiSkau0zJjGsjvk+Q1WuueDPZ3D3xeBnYBk9q8j9+levBGQgU/54j3L
	 faiXPIrq2UCk9J2HgaBpJl9Ci7PeeFaJ2QkNNWQCWeSJINpzPOrEZpVw7wT1qoWjl2
	 IVFUGCqsTUc6Q==
Date: Mon, 17 Nov 2025 19:25:22 +0000
From: Conor Dooley <conor@kernel.org>
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: arm: amlogic: meson-gx-ao-secure:
 support more SoCs
Message-ID: <20251117-cement-hasty-15626e8c78a0@spud>
References: <20251117-soc-info-s6-s7-s7d-v1-0-6ab8aab03dce@amlogic.com>
 <20251117-soc-info-s6-s7-s7d-v1-1-6ab8aab03dce@amlogic.com>
MIME-Version: 1.0
In-Reply-To: <20251117-soc-info-s6-s7-s7d-v1-1-6ab8aab03dce@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_112529_060678_AC7C01E9 
X-CRM114-Status: GOOD (  12.54  )
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
Content-Type: multipart/mixed; boundary="===============6887170444573329219=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============6887170444573329219==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ovf/zn3cUQ3ngyH4"
Content-Disposition: inline


--Ovf/zn3cUQ3ngyH4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 06:17:00PM +0800, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>=20
> Add new compatible for ao-secure of Amlogic SoCs(S6,S7,S7D).
>=20
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

> ---
>  .../devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml    |=
 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-=
gx-ao-secure.yaml b/Documentation/devicetree/bindings/arm/amlogic/amlogic,m=
eson-gx-ao-secure.yaml
> index b4f6695a6015..fa7c403c874a 100644
> --- a/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-s=
ecure.yaml
> +++ b/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-s=
ecure.yaml
> @@ -34,6 +34,9 @@ properties:
>                - amlogic,a4-ao-secure
>                - amlogic,c3-ao-secure
>                - amlogic,s4-ao-secure
> +              - amlogic,s6-ao-secure
> +              - amlogic,s7-ao-secure
> +              - amlogic,s7d-ao-secure
>                - amlogic,t7-ao-secure
>            - const: amlogic,meson-gx-ao-secure
>            - const: syscon
>=20
> --=20
> 2.37.1
>=20
>=20

--Ovf/zn3cUQ3ngyH4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRt2ogAKCRB4tDGHoIJi
0gaYAQDiO8JsyUEsnXAM6pxAuMrCvpdZcXxoyFnzI6sK6oPaAwEAi8lxR9FnXNFM
tj2itrKWEslAmVMsNHQ5i8a35itZmAk=
=9IX8
-----END PGP SIGNATURE-----

--Ovf/zn3cUQ3ngyH4--


--===============6887170444573329219==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============6887170444573329219==--

