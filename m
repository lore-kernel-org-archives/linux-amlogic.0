Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 313F4C7EE31
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Jun 2025 20:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SSnsjDrhKlWO06L/aLosFNLHgzZLml4BL4sobnx2M8I=; b=Kp/ryXxko9ARJe
	OvD8yVNUD9P+PD3uf6sHXoAMWRYgaeDHMCIPYLJEtl7psNWF5hfTftLm1c6lFAT1un0yYufyLVqTT
	DEjDQWx8LmETuv8lU8h9o62t9JfearnhZzWqN8LSGLoZSnyW9fpa4n9EKZydzmpLa3m4VDT8xZFlc
	TU4z1h/RURySOCMRycG72kY2jVBHi8cNgd/5fnlGe+8QfQe27xWu9PRow0G+Rzx7ScInWcs4YbeGe
	UJ+BFbWlIT2IXJeQCSa6MGLC90bVSVjSC8gyq+EMmf15rF2NF/CYCcn8+Sg0dokYw8cFO3yU+Yu3O
	6HCycgaX612wUI9oxWVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUWq6-00000009rk4-3OKS;
	Wed, 25 Jun 2025 20:35:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUV38-00000009dKg-0xsd;
	Wed, 25 Jun 2025 18:40:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3F73F61425;
	Wed, 25 Jun 2025 18:40:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C31C9C4CEEE;
	Wed, 25 Jun 2025 18:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750876844;
	bh=G0ZtbjjaXpwn9zFSPBNkvbd+Aj3mZgZ0xv6kXXcjdt0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=efojQDROTflqmTIAaXAItvhNnGdXHxQjO1uoj/C/j9dOY/+gAiwrk8mrGCTIQEZP7
	 nAScazUl5mDMqI+uRPvxQCsCPKvPdt7zjYdped3HC+re8L3VUNVEBffO2mf6BUHFwk
	 afr73TA+vf0s2FEYzn+qNfpU+3cQCDM9780QLVQvdxFMeLQa/YaRdDJyQ0G7exrp5E
	 aon2jMH2FgNTS9J7AoTcyA2r+W1AtLL4bfug4EOEWq+UmhXhQqWrbHVnmdWsRNEJkV
	 tsZJ5Nir+nfrwc1OioIEkj/V8wg3912PIHzZQR9M7Up/HCsneFfuEfQIrJCmJHJCu3
	 pKmUQtx+Afgjw==
Date: Wed, 25 Jun 2025 13:40:44 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org, Hector Martin <marcan@marcan.st>,
	linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
	asahi@lists.linux.dev, Chen-Yu Tsai <wens@csie.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-kernel@vger.kernel.org, Suman Anna <s-anna@ti.com>,
	Janne Grunau <j@jannau.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	Kevin Hilman <khilman@baylibre.com>, Nishanth Menon <nm@ti.com>,
	linux-arm-kernel@lists.infradead.org, Neal Gompa <neal@gompa.dev>
Subject: Re: [PATCH 2/5] dt-bindings: mailbox: ti,secure-proxy: Add missing
 reg maxItems
Message-ID: <175087684357.1998777.17182209219488528393.robh@kernel.org>
References: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
 <20250603-dt-bindings-mailbox-cleanup-v1-2-724407563997@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250603-dt-bindings-mailbox-cleanup-v1-2-724407563997@linaro.org>
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


On Tue, 03 Jun 2025 13:57:09 +0200, Krzysztof Kozlowski wrote:
> Lists should have fixed constraint, so add missing maxItems to the "reg"
> property.  Since minItems=maxItems, the minItems is implied by dtschema
> so can be dropped.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
