Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4CE5C54FD2
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Jul 2026 06:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eqo+EyIeIR5SrkgteSNPwEY2T784/LYs9+jWAMbAIiw=; b=0swLOsbXAi8KGc
	2ak7xU3MY8CGCpDyhe/grp87R/5W3viWZHi7jRIFNkJrErmpMl4EK+6GnW33G1mUY5YPhRr8oGs+5
	4IZMm3XJ4IxyQmoEzngPKI3HO5EEz+fy16fY3Ah3f3oKZ7uyCS4qrKp2/LDYGGYkXkC3hSmV08kmb
	HqPblEI14GTuuBdKHbh4FgDVQWc/Ji4UB/ZIX8yT8vZwbmON5mYSpsmZgu64w63CdYeKoN4ooIDgQ
	NCNt6JXWxHwtItdGv0BlmK77SJHVobC3qQXjFDRqHDvdL7OfHM+KaEJVjcAXWWtrV/9T2BToyhe3k
	A6k98VXEr+GXd/PN5uZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKGV-00000009c7o-0IIL;
	Thu, 30 Jul 2026 06:29:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKGT-00000009c7X-1qAk;
	Thu, 30 Jul 2026 06:29:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E9AE540B30;
	Thu, 30 Jul 2026 06:29:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFFA01F00A3D;
	Thu, 30 Jul 2026 06:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785392948;
	bh=e5nUPqOgBUcCps4UUa85WPqHhpCKC3YB8Bzpg7kK8Q4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=geLT90Tv+Y24wq1uH6GOtIrTXp+SnxrMMStS7FBAJzrKAf3j0BaJUxVX2s97hRgK8
	 lhkgwMpPXhtHBu2iDSJ2QX8OMEDiMuX8tEgddscmKaXa8ZQ7L9nv+2Xk6PjUMjKHAa
	 Mx8g8D8siScKIicdab4rJL/qbzmtjPLpLiLX93ZKXHX6oe6hSmDgn6luotXTmTczHA
	 nl/e9fRnmG/t5KGt4j/gHQ7Hzqdmw2S9rkEsUcuJfXhMuMW4h0AqALe1PQBSqzBIp8
	 4nAQ1eBDzVlbadOfua1kskcV8oLSif5xuX3vnWOOCjMiHNYtlLFI+tQzbF8EqVqlFU
	 X8Qw1sqq7MsRw==
Date: Thu, 30 Jul 2026 08:29:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alberto Robazza <robazza.alberto@proton.me>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	Alberto Robazza <robazzalberto@gmail.com>
Subject: Re: [PATCH v5 2/3] dt-bindings: arm: amlogic: document Orbbec Zora
 P1 board compatible
Message-ID: <20260730-gainful-helpful-kiwi-90beaa@quoll>
References: <20260729175134.92909-1-robazzalberto@gmail.com>
 <20260729175134.92909-3-robazzalberto@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260729175134.92909-3-robazzalberto@gmail.com>
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

On Wed, Jul 29, 2026 at 07:51:33PM +0200, Alberto Robazza wrote:
> Document the "orbbec,zora-p1" compatible for the Orbbec Zora P1 board,
> which is based on the Amlogic A311D (Meson G12B) SoC
> 
> Signed-off-by: Alberto Robazza <robazzalberto@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
