Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A6ED3ABFA
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Nov 2024 22:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ole/ScN7DSKbu6eRFLc/eQXzkXrkHFCabVTCbLjqkNI=; b=4qkwe6yNrCtlA+
	A/H5Gw8GM42sryE5il8JktEiKgj9mnXDybQUrtVxaQQeYljgqLgDC0bOM/CfcDYdeedNx9S3zSRW9
	LVw2LTlAdVXklIYQ/vaT/Qz9Cb+yuBDMiaDamRI7I4f90e9g6ubYWO1SWiKIn527y+p6Q6Nx/iUN8
	+wnman04/9jcC62vqN5qUpqfZ3y9MnYmsJP+Kj4UYGoZKQKMHRMg84AyIAJZBUgyG2j1P9xVnSq4t
	pewfid09K9pr0V8m5hG7yhjFtGDfcwMucoljxCvJzAL2y1iil13GGelrHEQKDxSde5pa35U8FcuRg
	3oKcCAgQ5LQXVZd9nkUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAcfB-00000001T22-2kiA;
	Mon, 11 Nov 2024 22:13:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAcf6-00000001T0I-12tB;
	Mon, 11 Nov 2024 22:13:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CF1F95C3A46;
	Mon, 11 Nov 2024 22:12:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAD0EC4CECF;
	Mon, 11 Nov 2024 22:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731363211;
	bh=EzOqKCAezFm7x87BPNt/zzxHJFID7yktvqQaAuxYHNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HFqhzx5PQDJ8XTbqjKmtAw93yoOw8x7o/ZUMlJBX+8O04Mr/GRzq+M1/6R39B45zY
	 CEF098rtQHm7qtp5m7M/1uTI9rREirdMB2PusnrS8s6pRCochsLOpz2QnRL/FZjN1Z
	 NRHQ8URAAfWaLgAJ3Yrplk30QyGHmim3xUQBWWaMATzoEGBgMGlMmGIDaxPdWNPbUt
	 GEGDY1eh6Jx5f00TQKh8b8cf3pswctkUFSOHhrmAa5qUZdagddMg20xYjzrbsf1gUu
	 R6X4mDmSW0nfnFLOwPPZqnl+cjIfRBoWDEx/IKX/10fWcECLdSJ2f2VrudGmCjCKSx
	 CztEQHgDVNw6A==
Date: Mon, 11 Nov 2024 16:13:28 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexey Romanov <avromanov@salutedevices.com>
Cc: linux-crypto@vger.kernel.org, davem@davemloft.net, conor+dt@kernel.org,
	jbrunet@baylibre.com, herbert@gondor.apana.org.au,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	khilman@baylibre.com, neil.armstrong@linaro.org,
	linux-arm-kernel@lists.infradead.org, kernel@salutedevices.com,
	martin.blumenstingl@googlemail.com, clabbe@baylibre.com,
	vadim.fedorenko@linux.dev, krzysztof.kozlowski+dt@linaro.org,
	krzk+dt@kernel.org, linux-amlogic@lists.infradead.org,
	robh+dt@kernel.org
Subject: Re: [PATCH v10 17/22] dt-bindings: crypto: amlogic,gxl-crypto:
 support new SoC's
Message-ID: <173136320834.2047628.12512361262712701273.robh@kernel.org>
References: <20241108102907.1788584-1-avromanov@salutedevices.com>
 <20241108102907.1788584-18-avromanov@salutedevices.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241108102907.1788584-18-avromanov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_141332_484104_785381F8 
X-CRM114-Status: GOOD (  12.13  )
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


On Fri, 08 Nov 2024 13:29:02 +0300, Alexey Romanov wrote:
> Now crypto module available at G12A/G12B/S4/A1/SM1/AXG.
> 
> 1. Add new compatibles:
>   - amlogic,g12a-crypto
>   - amlogic,axg-crypto
>   - amlogic,a1-crypto
>   - amlogic,s4-crypto (uses a1-crypto as fallback)
> 
> Difference between this compatibles:
>  * Different registers offset and the number of setup descriptors.
>  * GXL doesn't support hashing like the others.
>  * G12A/B and A1/S4 crypto HW don't support 192 AES key.
>  * GXL, G12A/B and AXG require a reverse IV key before processing.
> 
> 2. Add power-domains in schema, which is required only for A1.
> This is specific vendor design: in old SoC's power domain for
> crypto HW was not configurable, but in A1-series it is configurable.
> 
> Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
> ---
>  .../bindings/crypto/amlogic,gxl-crypto.yaml   | 24 +++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
