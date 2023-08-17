Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D4A8C2FC14
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Aug 2023 09:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XTOck/wJqIcKHLzp7Ptj9GWOpMU3gfsaiEE8JgQeQC0=; b=MUh+ZoGjn3oT1j
	gwr0opjCNNo0yQrZj9/KvA37jaCvXneDFMs9KCU0TuM8vpQIgTSYXqPn10NvC50BKB1QfHFBkwBIs
	NzBV6B6oIPWx/diIFB95x4Rqyw++vwTusxRHUUAzWM/kgQ6zKJbTC3c98Y6Inh+7odNPWQD2f0LuZ
	Q+Hr4dRRszJPPTCSAYEalejUsbr5IwvkKeQN2Z0PF1VVD6revw0DkGIoY6OfA28I9TMqchIMpYfd1
	fN1XHNkAb6Oirsg5VWnmeZmV3g0WePwL+1orEfGhLIIDgppLu3Z3O0dz84a1dWZxigtSKr3VNfO/H
	iCx39I2i0vExmjFxgHVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWZj6-005z48-2k;
	Thu, 17 Aug 2023 09:55:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWZj4-005z3T-03;
	Thu, 17 Aug 2023 09:55:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 897D86343D;
	Thu, 17 Aug 2023 09:55:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96352C433CD;
	Thu, 17 Aug 2023 09:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692266133;
	bh=g55SepoXLDrkk51p7rxR8hHGhpvN+y+XxCr1EgXQE50=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WVt2sdLPMPMqAvlPszVHFgZ31LEim75KL+bszsgTWc/PvN3CEHPLnP3Pflv6XLUaS
	 6ScWiqmQnYwCdisESHLUCVEOUsX3TqwIIZch+GcT4+i+mZuf9kRS2lL/1DPr98eypB
	 62SjT6c8PRTcVWySdH7f/apYC6aqSETnT4vf9lRWlmR7wQktz8+V0flgfi0qoBlC8L
	 0tPSpFUdSqh583VPKDV1aa1AoHt8DEb1z8P9X3A9SFK+VZDNtU3Tb+mM4OjVae3bcO
	 v/SIzHUGHzDf1GgdnQRksMaX+0O7HsxQwfp/fBM3JOSuNCClrPW1InwecMjl6/QhOJ
	 s1G68nluZmOog==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andi Shyti <andi.shyti@kernel.org>
In-Reply-To: <20230810091310.70231-1-krzysztof.kozlowski@linaro.org>
References: <20230810091310.70231-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH net-next] phy: amlogic: meson-g12a-usb2: fix
 Wvoid-pointer-to-enum-cast warning
Message-Id: <169226612922.81413.13715336314388096096.b4-ty@kernel.org>
Date: Thu, 17 Aug 2023 15:25:29 +0530
MIME-Version: 1.0
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_025534_158749_8356D3BD 
X-CRM114-Status: UNSURE (   4.90  )
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


On Thu, 10 Aug 2023 11:13:10 +0200, Krzysztof Kozlowski wrote:
> 'soc_id' is an enum, thus cast of pointer on 64-bit compile test with
> W=1 causes:
> 
>   phy-meson-g12a-usb2.c:322:17: error: cast to smaller integer type 'enum meson_soc_id' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]
> 
> 

Applied, thanks!

[1/1] phy: amlogic: meson-g12a-usb2: fix Wvoid-pointer-to-enum-cast warning
      commit: b72d87b4cb67984419502eb7c16adfea48cc56aa

Best regards,
-- 
~Vinod



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
