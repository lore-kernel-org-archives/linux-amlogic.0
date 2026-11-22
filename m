Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E59606A32A
	for <linux-amlogic@archiver.kernel.org>; Sun, 22 Nov 2026 14:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pKQHaj3x;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xa5/Fa4i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9NSp/+8ZlqNkzRVw64pRKHeWC5DHzmoLTbKjR0gi738=; b=pKQHaj3xV8KcH5Ez85RMDI4BVb
	X8pB1cAv7qoGCQXOO0hLFpUcqyeL5Ss+FtKKLTKCCtE3MGJ04uQhRZMA1PAK/6Ri6NEiLf1G+S438
	EC4SxPanc5wrTy515CCMyjsJ3oL27t5obnAm7uQip5Jps+dG7737QBDHafQPPJ0KnU0QsCOR31IEZ
	mfUwsoAkYrEZ+R5+3EnAcIyurmuuvN5DrAOL6GS91+RccThIeOSK5JWIu/a0a0n3VN1h8ANwLveo7
	ayNW3reOEFvc0ZQb2XwAA3Y4QCJgXM27x7UKxKNyUyA0jRPM3wCKFmeDOaktD2D6r+ylFN8y8VqMu
	CooIyJsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV8go-00000001CqT-1Xiq;
	Sun, 22 Nov 2026 14:37:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV8gn-00000001CqK-060R;
	Sun, 22 Nov 2026 14:37:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 516D560625;
	Sun, 22 Nov 2026 14:37:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE5D71F000C4;
	Sun, 22 Nov 2026 14:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795358227;
	bh=kuR2Kw8cNv8RIOa+h6iOlsgOXA09fvFgvUja95wPB5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xa5/Fa4i8Nya/+TGNN40OP18fEPPcLRHOHVQkJRWXiOgxFK59Tcniu1NNqblz2Zj3
	 NliIu84K4Ra0qPTS7aSkN0hxc8zB1Xrc8txLbHESWmXKGBMCWQW0+TjGdnu0S9qWz5
	 Juv7gTFCaE4qNh+Q5W7lgoMXbE5ePF2G0dY10S2dn0OLSFJh5PlbEIN/b8l2UWFe5x
	 P1k+LP0yxaGmXDAyqR5+KlK/8hY8zKsHAq06IowIYejHkFia6tqfPll98eTthxUgEG
	 r+eb8sGZ5MPgw+JdvQ2nrPef2rRn1MypzqgtXYy6a0+wedBWs7GNvCFkLTWoAglSfX
	 Kr3IXnX2GzoAg==
Date: Sun, 22 Nov 2026 15:37:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	davem@davemloft.net, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 1/4] dt-bindings: net: amlogic,g12a-mdio-mux: add the
 T7 compatible
Message-ID: <20261122-brass-raven-of-serendipity-6cacb2@quoll>
References: <20261121213102.143130-1-tanure@linux.com>
 <20261121213102.143130-2-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261121213102.143130-2-tanure@linux.com>
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Nov 21, 2026 at 09:30:59PM +0000, Lucas Tanure wrote:
> The T7 has the same management bus multiplexer as the G12A, in front
> of the same on-chip 100M PHY, and the G12A driver runs it unchanged.
> But a device tree that names only the G12A string leaves no way to
> tell the two apart later: if a difference between the two blocks
> turns up, every T7 board would have to change its compatible to get
> the fix.
> 
> Give the T7 a compatible of its own with the G12A one as fallback, so
> the existing driver keeps binding and a T7-specific match can be added
> without touching the boards.

Drop paragraph, no need to explain obvious schema and driver is
irrelevant here.

> 
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
>  .../devicetree/bindings/net/amlogic,g12a-mdio-mux.yaml      | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
