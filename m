Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA0FC7EE2A
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Jun 2025 20:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KSAwiqQtzArb5Y9dTSez/8FAvhmWffgAURjv5L9C1pA=; b=Q09yhjVfRvEBAo
	gnYK/SjSTqxg53FJ56zwm2+u5JmKzBN/NyFvKwmotj7q94V2p8rD/piYQwhoGMhjSUoX1vkTTGTyV
	B9f0f3VIvFtF8MA00Oyu0KZgA1yc/gmqHHfzMGTQ8hl4JfWZl8jjkgu+QvXlns2pFf+Mqs2Xw1PF+
	48DnJYIMP26y2+22fago5Sy+NmvgZlna8q9sFTHBYg55h8XaXxHmYFNiYXvALO8I46JM7Q4fj1pxG
	bP5zAVmrHTH8LutCm29DATR3Etw686h+Zju1qArni/bCfV1xiiOcQfo0dQovaFtbp3prC9IOq6gfS
	A0fYxbtLYLGJCei18HZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUWq6-00000009rhy-0YJk;
	Wed, 25 Jun 2025 20:35:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUV2y-00000009dJp-0Fo3;
	Wed, 25 Jun 2025 18:40:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0EA8C61425;
	Wed, 25 Jun 2025 18:40:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E206C4CEEA;
	Wed, 25 Jun 2025 18:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750876834;
	bh=q/8or6cq8OGa8xNABTFOKqL3F2hse9FddmDtZIeWGZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gLH/g5IYQCHlVK3DIrWDwra/rt2rYAY1XwbXQdPNk68KzQgeHdrGH5VSQRVsGoTFp
	 Kn2chB4zeZ/O98kh3MtkzcUhtybnpKKwxom1iz6XNpN06zJ/GDi7/cYxugypSyFcAY
	 M6zpqQrDyrhaWKlvaIvJzLeHdYnMAreyUumQ/EMPyPUfrFU6JmkdzebSzcOh0q1mos
	 5aF9DJfJClk/HuMMrr/WASrZiAtjWo4HuwP0NiVn6hQLWHY7bMETe7y9du7BhLITpv
	 difTA58iFtjsmNeP8t/obDl0qLs2ecRO67a+yU5vJHXXl3gJbruk7xFtvvVXJephrW
	 qHED+15vVzC0g==
Date: Wed, 25 Jun 2025 13:40:33 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-sunxi@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-tegra@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Neal Gompa <neal@gompa.dev>, Kevin Hilman <khilman@baylibre.com>,
	asahi@lists.linux.dev, Nishanth Menon <nm@ti.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel@lists.infradead.org, Janne Grunau <j@jannau.net>,
	Jassi Brar <jassisinghbrar@gmail.com>, devicetree@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Suman Anna <s-anna@ti.com>, Jerome Brunet <jbrunet@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	Thierry Reding <thierry.reding@gmail.com>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: mailbox: amlogic,meson-gxbb-mhu: Add
 missing interrupts maxItems
Message-ID: <175087683295.1998442.14302996914739580882.robh@kernel.org>
References: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
 <20250603-dt-bindings-mailbox-cleanup-v1-1-724407563997@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250603-dt-bindings-mailbox-cleanup-v1-1-724407563997@linaro.org>
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


On Tue, 03 Jun 2025 13:57:08 +0200, Krzysztof Kozlowski wrote:
> Lists should have fixed constraint, so add missing maxItems to the
> "interrupts" property.  Since minItems=maxItems, the minItems is implied
> by dtschema so can be dropped.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
