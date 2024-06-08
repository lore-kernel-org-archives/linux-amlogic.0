Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA000C25B76
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Jun 2024 17:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l1C0GAZjhKOQegrPsqI33XXweYxjaJqkGiRo6ZIQiBQ=; b=HLJ02b42lpGXeX
	XlyAiZv2Zxx13uJUTkwMTHHNQLjXryPsh+opSQgjrkEqvWFYRM8wA4Ep7hvYwxLvzDXKvBmA5vLjR
	6teDktLCj2Inc2jubY40hlCo5plMr7vFK0QQVQbZHX2epZIPHSzx65pSZ5EHe2+6Sc+KxE8HFMTFj
	hdEk9G+w9aAMdaKNuTHOd7aXatEMI0wrZKiW1NKCuSb2WG2D0/XdtXoIft4S3Wy1CvhQ1aNo1o2Ha
	XeLKNWr9kTCm9lYuSY1fGrLGSoG3azCrTg27f2sTLMWEspw9nv+dSg0LKwn3oiKjlmTSADOoFknpm
	j6tORFABs67tFus7rc+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFzwf-00000000Tl3-3bit;
	Sat, 08 Jun 2024 17:33:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFzwc-00000000TkE-27Y0;
	Sat, 08 Jun 2024 17:33:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5BF7E61A27;
	Sat,  8 Jun 2024 17:33:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84958C2BD11;
	Sat,  8 Jun 2024 17:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717868011;
	bh=Cs9lOa2WavPLN7oqK/3pwGjhjZXspdBdBObW8TWyNJ8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dI+p40P/rjOMkAAJBImUJkveglA+w5DQrPk3PBPecI+PYeeYOVuj2cv09+kAuVLfR
	 WVtdWrUF9/M7mqJgtiVi7yWZmGiCLXZt532LhG7Ud/MckSEFdmvHbqGugEzTC7oj5l
	 1umXp8i3qOnwIKFxidhGt2Tal6fi+qO+1JIrn+DtzpkL+7MMocyTmyeBL6dz2kpQgJ
	 Zie6vODafE1HGPF9IKEhbGyfpdDGxtK6eWyQ11TDOEE3rEVVe+3eBYG2W5daWgRMhy
	 viwnAAzeAHTS8lrI4gR86Y8/oRoalYyeXxTNp4QdRLj/ttrVtMDADPiKBeybRJZAwp
	 ZEtwbMKWq5AFw==
Date: Sat, 8 Jun 2024 18:33:22 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin
 Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: iio: adc: amlogic,meson-saradc: add
 GXLX SoC compatible
Message-ID: <20240608183322.1274e5e4@jic23-huawei>
In-Reply-To: <20240604055431.3313961-1-christianshewitt@gmail.com>
References: <20240604055431.3313961-1-christianshewitt@gmail.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.42; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240608_103334_651271_78695EE8 
X-CRM114-Status: GOOD (  14.13  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue,  4 Jun 2024 05:54:30 +0000
Christian Hewitt <christianshewitt@gmail.com> wrote:

> From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> 
> Add support for the GXLX SoC. GXLX is very similar to GXL but has three
> additional bits in MESON_SAR_ADC_REG12 for the three MPLL clocks.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
FWIW series looks fine to me subject to the precursor series getting
posted to linux-iio (and hence ending up in the right patchwork!)

Jonathan

> ---
>  .../devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml        | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml b/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml
> index 7e8328e9ce13..b2fef72267b4 100644
> --- a/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml
> @@ -23,6 +23,7 @@ properties:
>                - amlogic,meson8m2-saradc
>                - amlogic,meson-gxbb-saradc
>                - amlogic,meson-gxl-saradc
> +              - amlogic,meson-gxlx-saradc
>                - amlogic,meson-gxm-saradc
>                - amlogic,meson-axg-saradc
>                - amlogic,meson-g12a-saradc


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
