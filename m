Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8809DC3ABA2
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Sep 2024 17:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=77OhqV/CUOQoqC/oG5lO3jCQOhn2eSEUzKukmxxzrrI=; b=jVpnz6DL65j3uN
	sdXX8RMF6eSFDu3RQsxbWl8zZyZydrM/yy80tBMvueU9SQcJRneXVVFJs7AEhiIbIree0xbSgSSMn
	79BaUgj0qGDD/swaYewH5HQpVA/dxcHMSmYRFYhJ5dNeaFsGCH3bg/1ntrCF1mCKgDal3GQE2HOgX
	fToiwuVFDhkt8nlN4rUAvfqF9y39rM0yEFeT+Spn/y4dMW7I39PfSQ4kPvFQQkIWr40OFdLpprv0U
	LaLc5clQi73mI6NDlow3yVGoLZhSv4S905N+h0iPR6SMPWgF1s2S4imU+zJHm1CejPmRS5p18hK3L
	OcF5BzYKglEy6qLRSunQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqFjO-00000004cWQ-1DRT;
	Mon, 16 Sep 2024 17:41:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqFiZ-00000004cKG-1huL;
	Mon, 16 Sep 2024 17:40:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 295E65C5C6B;
	Mon, 16 Sep 2024 17:40:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4369EC4CEC4;
	Mon, 16 Sep 2024 17:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726508454;
	bh=H3fDLudcBrNk74QDfeWshQ2J+DgjZQCYFDUHRa1CYlc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rDraCLh/vG1D7ShexGLbNoBPrsMYKGapcNed5uODqdI6A0MD54A3BwD+xqfBSVHZh
	 bjYfNl30Bo1/WNAykrEt1kArIxGu4Qlebsqdb6HPCthwijBIGwmAZqNKzuBcbL1zrh
	 5kPL3MLCokSw1zKjOeia5Nn5tetxta/TlhhKpTw+bQVs16XfmDuZPzwLakQZQXMYRO
	 qCoaU/sSgAFEic2KPnaJspXyBa7rnitJ8fmS8l1U78XNQcOdD3QUJSEFKwmoLPxOb1
	 8f+B/IbSWzPbeFiP5j/B69hCb0Ovn9raNF+gsTZHl4+5p+egmUYWMXRVqKJFEbPhXX
	 G4ghU8GhHtJBQ==
Date: Mon, 16 Sep 2024 12:40:53 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>, linux-gpio@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: pinctrl: amlogic,meson-pinctrl: lower
 gpio-line-names minItems for meson8b
Message-ID: <172650845270.858385.3434216032560496339.robh@kernel.org>
References: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-meson-pinctrl-gpio-line-names-v1-1-4345ba336ea4@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-meson-pinctrl-gpio-line-names-v1-1-4345ba336ea4@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_104055_509990_3E97D7A1 
X-CRM114-Status: GOOD (  10.05  )
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


On Wed, 11 Sep 2024 17:24:38 +0200, Neil Armstrong wrote:
> The Amlogic Meson8b SoC has 83 CBUS GPIOs, thus lower the minItems
> for gpio-line-names to account for it, fixing DTBs check on Meson8b
> based boards.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml        | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
