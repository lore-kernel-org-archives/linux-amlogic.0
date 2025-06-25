Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC796C77B7C
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Jun 2025 20:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xm3OCoyJrru7uWeSDoJEKsJbyOlNHzN+VZ/wnbSC2kA=; b=ZccxCaLXTw1zoh
	Cz6OQHjR1k/bgWmakIMoZYpeZlP8YRiE42OexUOfwa1lKTwZE86tyCAOHlG8PQu/Qh4H+AQFSd2Oh
	aUY+Lk0t7gVG2e/0fpCLu84BsdpXvAFp2wWip8dnKRS9HbXqnS+aFgw9ZyybXlr2oYDDRckPnXj2O
	sYShfUh1Rcx5yj9Uqs9I98TKFkfBZrOWXNfapIh3J4YVQO0EbclrgOn2BGW/F9EHGU1nzNTyS9kC0
	JGsOM+VekEissP4jaYCGjWHipvDj8vyc1nsw+940Gz4rF9f+XYdcqNw0wbaXb6KMcypvs4I7ndZ7J
	cc5ytpqWXCeHrfuuSvaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUWq7-00000009rks-3i0L;
	Wed, 25 Jun 2025 20:35:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUV3Q-00000009dNB-2dkM;
	Wed, 25 Jun 2025 18:41:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 592965C4EA5;
	Wed, 25 Jun 2025 18:38:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 527B9C4CEEA;
	Wed, 25 Jun 2025 18:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750876863;
	bh=OnNE9mY+q1rPxEWew6abwgQMr1/ISDmBqUKGPWYE/Og=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uqFVH/IF47MkJv2QMT9nXskdrh6mA6XytghV1a9FkAyNEQXwRHNx48AfVfp8sxkTu
	 xcrrLIhBh1vAqcfVijfFwT45igCxcf8oSVWgveYJi2+MReQwtYoMLXjk6cosWrWBOe
	 NorsS7+RPXTKkXN0S8JuFPKnFVP9TzeJdlb/dHo/oC2CUCygyHg8HCf4B94fdWLa4J
	 pdgYH53ICBaXDPbEauVog3wOBVDPX9Klt0FXlCLWaeve3o4K2eeMbEyAAUNtqcz1yK
	 tKcWitq7Q4nWjgN5y/r+6R8Ly6DVuW3q9+IKMZ7Dd/TIcGawpgDFuT+MKytsUCRKbA
	 b6gJiqaj/4ihA==
Date: Wed, 25 Jun 2025 13:41:02 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neal Gompa <neal@gompa.dev>, linux-amlogic@lists.infradead.org,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Hector Martin <marcan@marcan.st>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Nishanth Menon <nm@ti.com>, linux-kernel@vger.kernel.org,
	Jassi Brar <jassisinghbrar@gmail.com>, Suman Anna <s-anna@ti.com>,
	Janne Grunau <j@jannau.net>, Jerome Brunet <jbrunet@baylibre.com>,
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	Sven Peter <sven@svenpeter.dev>, Conor Dooley <conor+dt@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Kevin Hilman <khilman@baylibre.com>, linux-sunxi@lists.linux.dev,
	Neil Armstrong <neil.armstrong@linaro.org>, asahi@lists.linux.dev,
	Thierry Reding <thierry.reding@gmail.com>,
	linux-arm-msm@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 3/5] dt-bindings: mailbox: Correct example indentation
Message-ID: <175087686216.1999261.11778803038524197779.robh@kernel.org>
References: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
 <20250603-dt-bindings-mailbox-cleanup-v1-3-724407563997@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250603-dt-bindings-mailbox-cleanup-v1-3-724407563997@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_114104_707993_FC13C29D 
X-CRM114-Status: UNSURE (   9.78  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Tue, 03 Jun 2025 13:57:10 +0200, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces, so
> correct a mixture of different styles to keep consistent 4-spaces.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/mailbox/allwinner,sun6i-a31-msgbox.yaml     | 14 +++++++-------
>  .../bindings/mailbox/amlogic,meson-gxbb-mhu.yaml         |  8 ++++----
>  .../devicetree/bindings/mailbox/apple,mailbox.yaml       | 16 ++++++++--------
>  .../devicetree/bindings/mailbox/ti,secure-proxy.yaml     | 16 ++++++++--------
>  4 files changed, 27 insertions(+), 27 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
