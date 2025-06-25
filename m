Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A49C77B7C
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Jun 2025 21:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ogmTztHBNg6m/gO8Oi9dfu1TCVavB3lcGrtDlykrj2w=; b=lkrf8II042r0u3
	CEFeEHhCDzGgD2tivQwSRv/+UombTiko6ZBMLQIs3/7uOxcz7B3iOvPUFz28Hra6rFhXc67H52e+O
	+rKYN3RBZ/Fmk+ps4hzHjGl9IxtB/csGC09XoT9naxCWJCD528INaFBOWv4TlcE25dswpf5w2NKY7
	2FCdwKXzNWWhCd4cPyYyRfu1tk+Drdpb4C1zQnglpmptvP9ZRkFDB/ZUcaSiz/Ad24rws548E6vhV
	Z1KtxIoa6dgKf6qgOqAbVO0tkuYwRksb8UHwyNOwrjjW1h7v2WXCeXZrkTDfK6BDhJ1IoGDTDtG/u
	f7KvC3TzfW3k/80GJ1hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUXpV-00000009yfj-09gT;
	Wed, 25 Jun 2025 21:38:53 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUV3x-00000009dS2-0QI7;
	Wed, 25 Jun 2025 18:41:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 57182A52D08;
	Wed, 25 Jun 2025 18:41:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D29D1C4CEEA;
	Wed, 25 Jun 2025 18:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750876896;
	bh=wxeKAaw4aalXeyf5+7rhG+eyj+foK0QMHsVAbOwvW24=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z7qjIcdkJyu0GkdqJZyBHRZUdFn1DrTxxu5BtvpIZNgFWBqdaAOuuURO/j5rZwhn0
	 T9gr05XzG6g9tHsnmmKxiCe18Bzg7cP8oUM8jJT6SZIeSiy5ZcGJxYte2DDx8XJYuy
	 8hW8IOj+qeLPXyJ8ApBt/KAUUKGBYWO3Pnf97Yr3dKrPYutGy4dPOpY/vkG2tF2Rok
	 AM+b1Ejonsztge8HkA888c7z6/Bxv6VILAljTGDjCpvDSqkhu6/mkh4EMglH4oQoF5
	 hLSCPKLF++Q06qhgkKUkFBdcuBU75ShT9EIAesAFgTdQhf9fG2u6bGmvZUPyt6MHJC
	 eeEx3rr+GGXcQ==
Date: Wed, 25 Jun 2025 13:41:35 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-sunxi@lists.linux.dev, Jerome Brunet <jbrunet@baylibre.com>,
	asahi@lists.linux.dev, Chen-Yu Tsai <wens@csie.org>,
	linux-tegra@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-arm-msm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	linux-amlogic@lists.infradead.org,
	Thierry Reding <thierry.reding@gmail.com>,
	devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Neal Gompa <neal@gompa.dev>, Suman Anna <s-anna@ti.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Sven Peter <sven@svenpeter.dev>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>, Janne Grunau <j@jannau.net>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Hector Martin <marcan@marcan.st>,
	Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 5/5] dt-bindings: mailbox: Drop consumers example DTS
Message-ID: <175087689465.2000134.18175207388418623670.robh@kernel.org>
References: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
 <20250603-dt-bindings-mailbox-cleanup-v1-5-724407563997@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250603-dt-bindings-mailbox-cleanup-v1-5-724407563997@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_114137_206776_DD496949 
X-CRM114-Status: UNSURE (   8.76  )
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


On Tue, 03 Jun 2025 13:57:12 +0200, Krzysztof Kozlowski wrote:
> Providers DTS examples should not contain consumer nodes, because they
> are completely redundant, obvious (defined in common schema) and add
> unnecessary bloat.  Drop consumer examples and unneeded node labels.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml       |  6 +-----
>  .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml     |  9 +--------
>  Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml | 10 +++-------
>  3 files changed, 5 insertions(+), 20 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
