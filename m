Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5282C25B76
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jun 2024 16:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lQ8uXtPoEubKzmHNGRvurF+a3gH8UU/8J+5570dLSf0=; b=diAWGOHnCRCwfrnzI0QkRtD5d4
	+/9SoCAfJB2nbNpj6gYY3zP4UA1fDlY6KOV8w75/65ooIke/ZAWu8LLiBqGfr053BtiKzxDLj/m7u
	Nl3hX7B1t3tCF6zMtwoUAKSIgDRPVUudyUsMF6OiC8hlajLU0upht81A0AdFzRHeRh2IV1zhysqcm
	GWwKO/K4Yej7BaeneSHhv8SX3XPQRTJB8FGFo7gMp4uhzc7xh/9m9h9CSIo5od7g37tFxojRiuXiX
	4R/xT/p6VS7R2Z/CiBFNkrL5dXh04R3s9J1v159fVNzlMeMRj3csLlaLPP60EPoZGoVWxs4N0vf/b
	LwDoirjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEtyD-00000006uwE-2axX;
	Wed, 05 Jun 2024 16:58:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEtyA-00000006uuv-28OJ;
	Wed, 05 Jun 2024 16:58:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9E0186188F;
	Wed,  5 Jun 2024 16:58:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 885C0C2BD11;
	Wed,  5 Jun 2024 16:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717606717;
	bh=y1dZJ8vNM9lhOuh+/XbBtRYjaxOHJLUue9NVr17fWL8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n5KRPFLCWESpqX/8tx55LSPg//Y/NY+cG+D3FaYcI9ay7NlTrE65pQiH86kN9S5Im
	 kIalpke02BuBB2/Sz8NXAKUYxRx2xij9PWRtucJsxhf2RbCa6tp0pswi1m3H+M7Rb5
	 IWFldkIZm8DkUbcAHM+45MEyOpv5gFAdCdpttPVslHvWCwi+1tEfl9aF9QJYciE5ly
	 zldCd/+tOuLZV0uM7DFN579svDBE1zTk6Kwfvt8pyjtpQMta3SX4qKDYPOD77ieEeg
	 3UDEuVbRNILs4m5pYF0pCyN+JnnVug6e345fZ8GVmDy8cFTC/DkYsKIodDSyqkmCor
	 QNST7qnkb2KQw==
Date: Wed, 5 Jun 2024 17:58:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: iio: adc: amlogic,meson-saradc: add
 optional power-domains
Message-ID: <20240605-abdomen-starch-4fd4d7ead431@spud>
References: <20240605-topic-amlogic-upstream-bindings-fixes-power-domains-sardac-v1-1-40a8de6baa59@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20240605-topic-amlogic-upstream-bindings-fixes-power-domains-sardac-v1-1-40a8de6baa59@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_095838_651038_A1F92696 
X-CRM114-Status: UNSURE (   8.89  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============9121550681478714484=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============9121550681478714484==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WFIeevaQAu8dnksl"
Content-Disposition: inline


--WFIeevaQAu8dnksl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 05, 2024 at 11:37:08AM +0200, Neil Armstrong wrote:
> On newer SoCs, the SAR ADC hardware can require a power-domain to operate,
> add it as optional.

What about the older socs that don't have power domains, the property is
now usable there?

--WFIeevaQAu8dnksl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmCZOAAKCRB4tDGHoIJi
0p9tAP9Q1Lzbf5N1VQfKderTZKLcQY8ND6Nvcw+SgZ1tiYKD9QD/bp3ABMjrpCdn
Z4LvNlFSOpdYuSZJGBv9gcVsHJlUJQQ=
=Idog
-----END PGP SIGNATURE-----

--WFIeevaQAu8dnksl--


--===============9121550681478714484==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============9121550681478714484==--

