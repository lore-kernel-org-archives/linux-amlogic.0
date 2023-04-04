Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB0AC6FD1D
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Apr 2023 17:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S2V7zyCn6py1AffPtz9s/rJZsLrmcZzoR1ORC7uH0os=; b=GZtRirWNUYRyqE
	rIkgvzzgr6xIyKNLkx/VVHVG6BmJzJu/UtoaZ3m79JQTJoqNolmZnPbnTpKyvc6dwc2EQ9NbQktdU
	32NmndK8wFVmkYRciUB0MNmu/0J/QAEJ6mK+SdrU6bJjZ4GgxdrxzodnNb9ZlWz4nw3h6BUe0PxEY
	B7/De5eI6uxewKdW1VG+tzrxPrbbD6Q+rRStmIGHvG5npVZWxVzNplLSiGnL+RqWnFykEgoOiZ38H
	zEJ6GAJBdB+BHfKBN6TskKd9B4PBDDCTd78aPwMcCjFNqeNeiQlhOpJrO/LofHqjeNQw1ggOYQc3m
	reRWDgIEc6+3LiwUVCcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjk8p-002Kcv-2r;
	Tue, 04 Apr 2023 17:08:19 +0000
Received: from mail-ot1-f45.google.com ([209.85.210.45])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjk8m-002KbT-19;
	Tue, 04 Apr 2023 17:08:17 +0000
Received: by mail-ot1-f45.google.com with SMTP id x8-20020a9d3788000000b0069f922cd5ceso17692718otb.12;
        Tue, 04 Apr 2023 10:08:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680628095;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5kyfGfHQKgkYy16DyfpdvEbx6sQQJifapGZEB9kHD60=;
        b=gvw0UkiAcnM2y8dr69B6TvAYi5W9vwwOdhleORY6W+2wlGpCcXkH4T+OZA892Lu73C
         9ZwzkStIqVC0hfYv2y4Mc7j2UygjapBzabdt+ZO5UTinSuPiIbTvbtJZUYWTlwqjYIye
         V52qwccv6tNyN3sufgmOX2HvTXi/pF1wfI3+CW0yf/AmmZkV4eRWbjWEOdYhWX/vO01G
         wPcx9GdzMmu9TdgE2gVg6WykzHsUWSNGGgw9p5ro0qmh5v6cI1vClktZmOcRwloS3qSv
         kBs7Mhczb1ZX7Z88u9dHGnRoM9K3WyGEywXIcr0Frtgj2otK6q5+igM/s+ni+hs83J7V
         cSOw==
X-Gm-Message-State: AAQBX9fKqCsgNfBJkIOhq6ZTHMJXa/2w++kxDBJ4jo44nv8ZmnQjGhWf
	YGSoBx/yCRY7W3AXf0aqZQ==
X-Google-Smtp-Source: AKy350bmJMrR1r7FrJGxefej2KGuvmYkx3SzlJzTOaJo3fly2J6n9OiGiUI/5C16CZmpe5LaLx5AEg==
X-Received: by 2002:a9d:7b4e:0:b0:69f:2774:b60 with SMTP id f14-20020a9d7b4e000000b0069f27740b60mr1694681oto.8.1680628095187;
        Tue, 04 Apr 2023 10:08:15 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id x9-20020a05683000c900b006a30260ccfdsm4494944oto.11.2023.04.04.10.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 10:08:14 -0700 (PDT)
Received: (nullmailer pid 115563 invoked by uid 1000);
	Tue, 04 Apr 2023 17:08:14 -0000
Date: Tue, 4 Apr 2023 12:08:14 -0500
From: Rob Herring <robh@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Florian Fainelli <f.fainelli@gmail.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Qin Jian <qinjian@cqplus1.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: reset: Drop unneeded quotes
Message-ID: <20230404170814.GC49361-robh@kernel.org>
References: <20230322173508.3971182-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230322173508.3971182-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_100816_393574_4F2DC27D 
X-CRM114-Status: GOOD (  10.12  )
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

On Wed, Mar 22, 2023 at 12:35:07PM -0500, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/reset/amlogic,meson-axg-audio-arb.yaml         | 4 ++--
>  .../devicetree/bindings/reset/amlogic,meson-reset.yaml      | 4 ++--
>  .../devicetree/bindings/reset/bitmain,bm1880-reset.yaml     | 4 ++--
>  .../devicetree/bindings/reset/brcm,bcm6345-reset.yaml       | 4 ++--
>  .../devicetree/bindings/reset/brcm,brcmstb-reset.yaml       | 4 ++--
>  .../devicetree/bindings/reset/marvell,berlin2-reset.yaml    | 4 ++--
>  Documentation/devicetree/bindings/reset/microchip,rst.yaml  | 6 +++---
>  .../devicetree/bindings/reset/qca,ar7100-reset.yaml         | 4 ++--
>  Documentation/devicetree/bindings/reset/renesas,rst.yaml    | 4 ++--
>  Documentation/devicetree/bindings/reset/sunplus,reset.yaml  | 4 ++--
>  10 files changed, 21 insertions(+), 21 deletions(-)

Applied, thanks.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
