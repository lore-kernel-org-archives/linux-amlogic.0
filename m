Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B51C3271E
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Jul 2024 15:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sXSBy9B3d+MMVs0FOHaHKPQa4MCGzkij42BemuCJoTc=; b=Q/p11jgEKO38BH
	kgnKXyfq1hQ7LwH4tWHgoVDRKBXTy5VN0QrnQp2ujo0u/1/vBycLld8iNy6LMQcT78Q3nw77NfSLE
	OHOpLtwzLNNO3QSWVPCD9DXPbwxd8Qev4XTmIFCKhPULEbkA0ArKICGfNXqdpOkZPmpThL08F5tvA
	pbe7jP0Q90PPdsKNJT7Gr/gmIVZAPYbImFfmFUzpwG4W0tACfBj3sgK2osm+LvcSVwJroTi+IMrkI
	0l36xrBdKnNi9fFscMkY0HRCkwVQonUnr50RRw7kGEZ+fB8qryT3XZ7P4MlctiqHDU/CAIoItTh/U
	ZJ0OFjda5HPVeH4bFSjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQqf4-00000004IQp-07Go;
	Mon, 08 Jul 2024 15:52:18 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQqf0-00000004IPp-3Hz1;
	Mon, 08 Jul 2024 15:52:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 97A76CE0DFA;
	Mon,  8 Jul 2024 15:52:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A8FBC4AF0C;
	Mon,  8 Jul 2024 15:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720453930;
	bh=BQg4ZdFzDwwDN7evDXN3MBq4j4BMw5MqDlE19xZONW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fCI4ytXTNkR9PaCDa+HL4hGXYk74jmyFJjyEHZ8b1Nl99+m+jrKjckKYKxgVDab/g
	 O/fiJ8kHbHNmkQtvW/1YECiEhHcZl4nIXtEa1SG2Jw3rBYlGB7nHb/eeDakJFJSRh9
	 cagcXBekLdu7wSQ+F55DedMIGn5xuSofvYxA9/M8sQwX6iymHci/kS7+jnvvl+YBOL
	 1q5fRoJBM1v6WW0Aa7tjAM+YwSufIL0U4XEABU2+kboVBYEU6FmUBAxB3Fh4TUBKKe
	 8IsCtTlLtEDbRL3HTGHf4ZLR/hrJwXW103Twy7Eo/50gsfzeQpntlrBbY33X8itaRh
	 YwU4bSmcmT72w==
Date: Mon, 8 Jul 2024 09:52:09 -0600
From: Rob Herring <robh@kernel.org>
To: zelong dong <zelong.dong@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	kelvin.zhang@amlogic.com
Subject: Re: [PATCH 1/3] dt-bindings: reset: Add compatible and DT bindings
 for Amlogic A4/A5 Reset Controller
Message-ID: <20240708155209.GA3239782-robh@kernel.org>
References: <20240703061610.37217-1-zelong.dong@amlogic.com>
 <20240703061610.37217-2-zelong.dong@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240703061610.37217-2-zelong.dong@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_085215_019752_13D30A5A 
X-CRM114-Status: GOOD (  12.60  )
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

On Wed, Jul 03, 2024 at 02:16:08PM +0800, zelong dong wrote:
> From: Zelong Dong <zelong.dong@amlogic.com>
> 
> Add new compatible and DT bindings for Amlogic A4/A5 Reset Controller
> 
> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
> ---
>  .../bindings/reset/amlogic,meson-reset.yaml   | 22 +++++++++++++------
>  1 file changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
> index f0c6c0df0ce3..80345af81d5a 100644
> --- a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
> +++ b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
> @@ -12,13 +12,21 @@ maintainers:
>  
>  properties:
>    compatible:
> -    enum:
> -      - amlogic,meson8b-reset # Reset Controller on Meson8b and compatible SoCs
> -      - amlogic,meson-gxbb-reset # Reset Controller on GXBB and compatible SoCs
> -      - amlogic,meson-axg-reset # Reset Controller on AXG and compatible SoCs
> -      - amlogic,meson-a1-reset # Reset Controller on A1 and compatible SoCs
> -      - amlogic,meson-s4-reset # Reset Controller on S4 and compatible SoCs
> -      - amlogic,c3-reset # Reset Controller on C3 and compatible SoCs
> +    oneOf:
> +      - items:

Don't need items here.

> +          - enum:
> +              - amlogic,meson8b-reset # Reset Controller on Meson8b and compatible SoCs
> +              - amlogic,meson-gxbb-reset # Reset Controller on GXBB and compatible SoCs
> +              - amlogic,meson-axg-reset # Reset Controller on AXG and compatible SoCs
> +              - amlogic,meson-a1-reset # Reset Controller on A1 and compatible SoCs
> +              - amlogic,meson-s4-reset # Reset Controller on S4 and compatible SoCs
> +              - amlogic,t7-reset

What's t7?

> +      - items:
> +          - enum:
> +              - amlogic,a4-reset
> +              - amlogic,a5-reset
> +              - amlogic,c3-reset
> +          - const: amlogic,meson-s4-reset
>  
>    reg:
>      maxItems: 1
> -- 
> 2.35.1
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
