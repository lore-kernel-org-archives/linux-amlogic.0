Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7592C001B0
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Jun 2023 20:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PRvOKoDVLeU69GfXVcpbWoebiWLvT50k7VIBRoKo2aw=; b=vNW8eP4F9iSJwg
	QPwxTAmAeWVkbrAnJmNzDxY6LXOnzB/OkTgJ4IAPYxZsC3NMGDeVNY9jrpIDGQH4lUdtAYyIVtkkk
	ZjRF9XODnoZXYmcIH4BUDucpel11kt/4GXY6qVU9ZmUWFxNHo9jqhhnSiVVbXgv1mrNW+UN0+D5ZG
	ZaZ8VcPME6A3l207xQKssRrDxVdRt9RUOsqQV3IoN1wfiZBfxEbmELoFAvGzGG4tZKQBVy3LjgAtd
	oEcovRsKi/PA+vvK3TrF70Fg7JW+QlsiLH2DZgcp6QXg/65M8sogNR0DAO773tgMfZlS6pwK6jBfQ
	La+8/1JA1D/mMChtnIkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCnCr-004SSG-1n;
	Fri, 23 Jun 2023 20:16:33 +0000
Received: from mail-il1-f178.google.com ([209.85.166.178])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCnCp-004SRm-1K
	for linux-amlogic@lists.infradead.org;
	Fri, 23 Jun 2023 20:16:32 +0000
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-34271602c32so4139145ab.0
        for <linux-amlogic@lists.infradead.org>; Fri, 23 Jun 2023 13:16:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687551387; x=1690143387;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rg/P2zhgjAUIopl8t7yQhUsy858DpN4kyXTcUhN5dxQ=;
        b=eK+P2ZH7RPui1WLfrhmhk40pHYqHJoBbfQR9NWNrVRVWHr049ZG9NmVU952fM5JO+d
         XpfF3fka7YiPEJHB9EDuCrAgtuvUOXCbEu1mjto3XZyuwoV3sCjwQaKUw59F/a6Msknx
         dHPL6Ry9n5sD/JsNDNq+VE0bqiJsRgG1pCxj166KghzaCqibQSrTt+v/XCjtzKHwo82N
         o3NNSAtddNsxiaR4DpPe0mrHtYtFCz8s9/wfhlpLAOd08U0XO0FwdQSA6u+qubUx8UZH
         1GTwrrd/IOYWyv5Wob2kTclYdYX5t1N7q0gZzMgODyWgOqVS1Wsb/Eakr98Bb0usnUl4
         bCjg==
X-Gm-Message-State: AC+VfDwMNN87FuLVNnMt2Un3AQ8QX9+5QRfqTGrJOf+9vV+Q5du/vD3G
	8R2rDHoklQpPICRDkEzhVA==
X-Google-Smtp-Source: ACHHUZ4Fso4Lmt1qsSt17keZ134C/Kw4+TuhenK7iJdSx01fnSyGw3szdKNZIu5pgpbUZWCI2e5tDg==
X-Received: by 2002:a92:d691:0:b0:341:b14f:971c with SMTP id p17-20020a92d691000000b00341b14f971cmr19319993iln.27.1687551387267;
        Fri, 23 Jun 2023 13:16:27 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id d8-20020a92d788000000b0034233fd80d3sm48463iln.22.2023.06.23.13.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 13:16:26 -0700 (PDT)
Received: (nullmailer pid 1038150 invoked by uid 1000);
	Fri, 23 Jun 2023 20:16:24 -0000
Date: Fri, 23 Jun 2023 14:16:24 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-crypto@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, linux-amlogic@lists.infradead.org, "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH v3] dt-bindings: crypto: drop unneeded quotes
Message-ID: <168755138352.1038014.15444309395419792467.robh@kernel.org>
References: <20230621064403.9221-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230621064403.9221-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_131631_445077_EC8144C0 
X-CRM114-Status: GOOD (  11.94  )
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


On Wed, 21 Jun 2023 08:44:03 +0200, Krzysztof Kozlowski wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> ---
> 
> Changes in v3:
> 1. Adjust subject perfix (drop ixp4xx)
> 
> Changes in v2:
> 1. Drop more quotes (also amlogic)
> 2. Add Linus' tag
> ---
>  .../devicetree/bindings/crypto/amlogic,gxl-crypto.yaml      | 4 ++--
>  .../devicetree/bindings/crypto/intel,ixp4xx-crypto.yaml     | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 

Applied, thanks!


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
