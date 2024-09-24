Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AAD4CF9C6B
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Sep 2024 09:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zb5r9naa2CKer3SISjzfhoSksiIMKvWLOguXa0E5OrI=; b=X2Ig/dOzSpR8mP
	oYnTQJsIoN+QP2mPLUHMn6e4DidhP7e/gU7tAmSFmlyVq5y/SpD9ucNcnWL3urqOSikl0PsGY7NEs
	xiRvV579GTOndJuuDHsA9MFqUb6n6fQnlNidKtJe/FRb9yqgTllScB2BCqtpl9T2eU2eXLwDU69hB
	p5oqblTTzpwgDeB+/K82AjmHU69w1KX666TQ/4J/4tIsnzrD+gU/RphEhmZ//1S3n5GLujazl6WDF
	eu2aC1Hd1v7iICPqScH2jbhNqJUPe1o8zVXgnyWTVcxy+4PblgJUqnfoJCr2/UEv2jKeOWM2hISrN
	W9zcuZOapum+hNldjkkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st1co-00000001kzC-2xe7;
	Tue, 24 Sep 2024 09:14:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st1bE-00000001kcR-396F;
	Tue, 24 Sep 2024 09:12:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 41A235C5B99;
	Tue, 24 Sep 2024 09:12:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 147DFC4CEC6;
	Tue, 24 Sep 2024 09:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727169167;
	bh=OWP93lxMU7Kz7NXhHpQx1nS5UtQYEswveLq4GJOZPeA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tWuEqDAvLDmw+g74otC7+T/ALm+AaCx1SFASlCaSbJk0UYwqeGeXw5lH63uAOihzG
	 M6+/VdXUfX1qwTTNJsaXeVZM4jSczGcEfB+6/suJQeWfFPLjqJNpJhywOvFvi2l0Iy
	 pFiT0xg1thDnu+RAVaqZa1AuVa7cWCTMsc1nLxecD0EX+/ctZsBnK7KAezw1U3XJig
	 p0FHHhQAh1ulnvR2TwCfo/VHePqibUD5FnkmfkNotszk+d7Q/S6Od7pMZLL6x7umt4
	 8vjUSReu3lGW5tGaaOgFU9O19E41UKz8rRNveEtg0Pny1rKA0uKtEe1xUGq6WQereq
	 Pvaw4Zo5bhDYQ==
Date: Tue, 24 Sep 2024 11:12:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: mmc: controller: allow node name to
 be named slot@*
Message-ID: <qt3ivwsa3uaidcgkzbd2ewohbyd6zbzseraihftdhxpziuhnpq@xsne3f4wdfua>
References: <20240920-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v2-0-5aa8bdfe01af@linaro.org>
 <20240920-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v2-1-5aa8bdfe01af@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240920-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v2-1-5aa8bdfe01af@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_021248_853862_9ED04A76 
X-CRM114-Status: GOOD (  16.17  )
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

On Fri, Sep 20, 2024 at 10:38:03AM +0200, Neil Armstrong wrote:
> In preparation of supporting the mmc-slot subnode, allow
> the nodename to be either mmc@ or mmc-slot@
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  Documentation/devicetree/bindings/mmc/mmc-controller.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
> index 58ae298cd2fc..f797c32ea688 100644
> --- a/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
> @@ -20,7 +20,9 @@ description: |
>  
>  properties:
>    $nodename:
> -    pattern: "^mmc(@.*)?$"
> +    oneOf:
> +      - pattern: "^mmc(@.*)?$"
> +      - pattern: "^slot(@.*)?$"

I don't think mmc-slot is allowed by this.

This should be squashed with mmc-slot child patch. It does not make
sense to allow mmc-slots if there are no mmc-slots.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
