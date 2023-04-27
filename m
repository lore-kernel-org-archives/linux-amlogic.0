Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14321C77B61
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Apr 2023 14:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7WhMSOTE/qdD5JJAQQlHWSAuhIOL3OmGYxN6WFQk62A=; b=no89KDxBmTbNr1
	IoHVn5+v6N2F7agb6YDWrF8r4q9qviFoTYKEJccroaK6MbL4iJWT3zV1Eptfsr25S0mfNyVFCrOW8
	oOoxdIXV99eiBqxOZvYHSdv9AP0cMccu7j8fOEpbdKi1PsY0QFHj7gb2KSAaxtSPNgSP/ehN2Dlzg
	nnkb2KrwaO1Zevyr0PHCeo1r12Y17SE8A/t0OKfg2sg4bPGXXoJkLE9BKAFDP5LmJ7A6Zi/AZL5eR
	Bj8xmMixm8+pooLLXESmfXQ41J2kG+KEKhHF7jchF+z/r3Oz11NZOwl86Bna2P+eusLHfISEXTGXZ
	jx62Hz3JMLq1VhJGrn/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ps2Wx-006kg6-21;
	Thu, 27 Apr 2023 14:23:31 +0000
Received: from mail-oi1-f176.google.com ([209.85.167.176])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ps2Wv-006kfR-1o;
	Thu, 27 Apr 2023 14:23:30 +0000
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-38de3338abeso4683645b6e.1;
        Thu, 27 Apr 2023 07:23:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682605407; x=1685197407;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Hq4grDEDt/Oj8MLtTtn2ti2V14UBOPOnIQkLRnCWAs=;
        b=OkDr9r3thXCYAqJg8ZjQboKOEN8c5bQWVFc82xPbEQ8Qky+XjiBwbmbiUCYxcNL/NY
         e0FiFuYxUcrLqsKx4bEHzPRya20Icge6PCTCClt0ev0Ggc+oBa1JjmLyGuxyZQO88B8Z
         QkrhDzUFQCBvH1DKkDwVXh1mTt+24XaEM8zKVPh4xrGavaZHwEqILYlC5r2GbkEERXw4
         KBE2NNeM2Zp+aLvtMa58t30KCrgM0uriRKGQ/E0dPdAeIx10BVhFAmxEgKvx+0EEsQSI
         9laLHBXmv+7EAtiUEbRbNXW6+NA5EgLcp8TlU1oBLYuacWCqFdclF5O6bT9iscZDzG04
         QOmw==
X-Gm-Message-State: AC+VfDya+hXqEdoEBmxkwEg/cqbH06dy4jxs/HM3KbX4bbaEaFkaMuL7
	82u61mfmN+0TUIgqyGGT6qj9H1FZ2w==
X-Google-Smtp-Source: ACHHUZ69NrO0nvfkAwrXNiXDurRIt4xbVe0xGVtrBaHC3bzSfttdfGzQiHK6gCD/b9OQa/bKGuhbZA==
X-Received: by 2002:a05:6808:317:b0:38e:aa4:e4a4 with SMTP id i23-20020a056808031700b0038e0aa4e4a4mr804181oie.8.1682605407570;
        Thu, 27 Apr 2023 07:23:27 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id ca20-20020a056808331400b0038ebd84ce2bsm5259241oib.19.2023.04.27.07.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 07:23:26 -0700 (PDT)
Received: (nullmailer pid 2991901 invoked by uid 1000);
	Thu, 27 Apr 2023 14:23:26 -0000
Date: Thu, 27 Apr 2023 09:23:26 -0500
From: Rob Herring <robh@kernel.org>
To: Karl Chan <exkcmailist@inbox.lv>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, jbrunet@baylibre.com, khilman@baylibre.com, linux-arm-kernel@lists.infradead.org, martin.blumenstingl@googlemail.com, krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: arm: amlogic: add Xiaomi Mi box 3
 binding
Message-ID: <168260540558.2991868.9005828920169849530.robh@kernel.org>
References: <20230425165624.11999-1-exkcmailist@inbox.lv>
 <20230425165624.11999-2-exkcmailist@inbox.lv>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230425165624.11999-2-exkcmailist@inbox.lv>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230427_072329_596716_695E8F83 
X-CRM114-Status: UNSURE (   7.85  )
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


On Wed, 26 Apr 2023 00:56:23 +0800, Karl Chan wrote:
> From: "Karl Chan"  <exkcmailist@inbox.lv>
> 
> Add the board binding for the Xiaomi Mi box 3 Android Set-Top Box device.
> 
> Signed-off-by: Karl Chan <exkcmailist@inbox.lv>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
