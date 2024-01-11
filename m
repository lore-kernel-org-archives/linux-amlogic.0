Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F687C4707B
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Jan 2024 01:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ONqEzA2bS2vFjV7A7vHEURouZZ1uooKIOh6aYG1WWo4=; b=0lsHesyLBhhnCJ
	02p6ibjtCNSVJwJlos8eWyS2fEMpEg7puGQtdm9y4erw5WE/VxnKVXx1Twl0M2bivJIDKUdZ05+hb
	IBAWiNzkzaUmpiwY2/eciZOYmkc5RSip0gkDn/95YukB1Odmu3/ixyshn9V7IfkPH8Lskej9yGytI
	l5jsX5Xze40EbJCMp2iwdlOYmge+xe+FvTwqat6FW6IPdp4uIn/aupo8PqKVWaz+SBFFv1emOMBMc
	jlmYhbIohuVKQZHWvXOUcYbhNDskN7MfX6omv4czmB40sMEdfUIsIFgikatQDT8/Id46Gz9ByBoJp
	X7f3+W3vE7iHRlaKFIUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNk7o-00FJ8i-2u;
	Thu, 11 Jan 2024 01:44:53 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNk7l-00FJ7Q-3D;
	Thu, 11 Jan 2024 01:44:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 44852B81E59;
	Thu, 11 Jan 2024 01:44:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F36EC433F1;
	Thu, 11 Jan 2024 01:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704937485;
	bh=OKRetjGQLoWiGsYECHl6Shr/8v8FXWaRDdGGxsatbvM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D/t62/y/fhs/K+heY9fWtwp1kCVF2DvLy/cZIEF7iZ/cNqSLljWc6zDn10SE2+vdJ
	 KULsW1Ge8PVRfNZ8YxO14LeLJKyXNLGO9LcmMXydclLLw4myJHWE6adXoR3XhL8cFp
	 F7isooQIwd8SW/PLq6UTKdyfr9Cn/ANhPbXWYCE4OZSDypGMSoZ4ERcyR0Bi3a0+nr
	 OupwgC32DaJ8ardK/qLN0/qNWhS3SOlg+jcBXElhxCmvXLZG/9ZD44pWQwbL/8kbpN
	 OBCYRyqfQAT4n9EtdYINcOAS5Eo9/B7Zv8xs5TM2MyGIJ8MvCG/XWqQO8BrZUIO5zu
	 Nb0ImccpGczng==
Received: (nullmailer pid 3159538 invoked by uid 1000);
	Thu, 11 Jan 2024 01:44:42 -0000
Date: Wed, 10 Jan 2024 19:44:42 -0600
From: Rob Herring <robh@kernel.org>
To: Alexey Romanov <avromanov@salutedevices.com>
Cc: narmstrong@baylibre.com, neil.armstrong@linaro.org, clabbe@baylibre.com, herbert@gondor.apana.org.au, davem@davemloft.net, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, khilman@baylibre.com, jbrunet@baylibre.com, artin.blumenstingl@googlemail.com, linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@salutedevices.com
Subject: Re: [PATCH v1 16/24] dt-bindings: crypto: meson: add new compatibles
Message-ID: <20240111014442.GA2984286-robh@kernel.org>
References: <20240110201216.18016-1-avromanov@salutedevices.com>
 <20240110201216.18016-17-avromanov@salutedevices.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240110201216.18016-17-avromanov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_174450_163004_43AFA569 
X-CRM114-Status: GOOD (  13.32  )
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

On Wed, Jan 10, 2024 at 11:11:32PM +0300, Alexey Romanov wrote:
> Now we can use crypto driver at G12A/G12B/S4/A1/SM1/AXG.
> 
> Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
> ---
>  .../devicetree/bindings/crypto/amlogic,gxl-crypto.yaml          | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
> index 948e11ebe4ee..317003505510 100644
> --- a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
> +++ b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
> @@ -13,6 +13,8 @@ properties:
>    compatible:
>      items:
>        - const: amlogic,gxl-crypto
> +      - const: amlogic,g12a-crypto
> +      - const: amlogic,axg-crypto

You need an 'enum'.

>  
>    reg:
>      maxItems: 1
> -- 
> 2.30.1
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
