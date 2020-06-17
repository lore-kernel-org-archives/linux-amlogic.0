Return-Path: <SRS0=vfsC=76=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0258BC433E0
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Jun 2020 22:19:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7B1921556
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Jun 2020 22:19:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SbGShV0Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7B1921556
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k5pcwfAi0VRe4RNcex6Ux17hg2Tp3GLaH0m7YCLVx8c=; b=SbGShV0QKNvy1G
	Zx2pbKWw0oN62cZvxOuv8UhW3tWqz9GYKa/CAQmsSEhJRp18Q5zj55D7CLoNtCfobAzqYDugRWvhw
	2iPxLeHRNjMoeRtttS0pzGY5Q1Pzc0aQSpyc49lJSIxaLR+9XGyDCE0U7cmWIimByvnkxCDUVQInr
	gANYBfNMiliP4BdpdsI5qksmA2WjQ3oR7OyIKsoVMpDKtxUbL6zkDVa2FrYKGZxURUWKMWBbK3lKU
	mERZvwDElRMay6G2J0ONwCaoO/HYqcYznDufhIOy37YnEZl26phgaWRZBPZLZdnR2mNHAP6GKgMv9
	IJB/1u+6EyOeBJsEuXQg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlgON-00050f-Gf; Wed, 17 Jun 2020 22:18:47 +0000
Received: from mail-il1-f196.google.com ([209.85.166.196])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlgNv-0004Zg-CT; Wed, 17 Jun 2020 22:18:21 +0000
Received: by mail-il1-f196.google.com with SMTP id i1so3860485ils.11;
 Wed, 17 Jun 2020 15:18:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Uz7g0bB18ztxeQgM+/H4yxv4w/AtkVlw+WDwFr6g8Ao=;
 b=cLAn3Uy2JGBY4VCicjcrIKA77BQn3VluMHTTHDrkTdGafcEEOci4r8iID25LTq7+nz
 QakZ7nQaDBGu4f1uHu37WGmN1+9CeYDqwL/ELHsqFlHbP7DZkj11AARW4x5VXD1N2xEj
 hVfws41xhtx1oUExAXDbMadNvSnKxV3PlZ7yfoFnOEXFMtFqfybVowe1JqUV5q+XWKoT
 vvTbxFaC+ih8qss+Yge88gVsFxDXt9RXJWk2x8AbBlPJcL+aHYNjjECTH60BWlXlubdh
 2Iy79dc1lHEey/hg7M/7jz4kkoWBAlwFkxbVE4JhQ+GMlpAKwPNExl6ArA67N5V1SymF
 VS0w==
X-Gm-Message-State: AOAM532KhCxiQmkh3Xuodwadqn5W4sJVlRh73gQ5C8CzKoVnHZBqc5Ck
 9pUeBNfEl3TPpLSQd+V2rw==
X-Google-Smtp-Source: ABdhPJwldBKKgVwMhWTp6+BTPDjZ5+GjxiMRxxsH5coqpGLhBPEg/c67Ti4jXWHLFczF1LllOIWBwg==
X-Received: by 2002:a92:cb03:: with SMTP id s3mr1132707ilo.161.1592432298592; 
 Wed, 17 Jun 2020 15:18:18 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id t72sm552531ilk.23.2020.06.17.15.18.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 15:18:18 -0700 (PDT)
Received: (nullmailer pid 2934152 invoked by uid 1000);
 Wed, 17 Jun 2020 22:18:17 -0000
Date: Wed, 17 Jun 2020 16:18:17 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/2] dt-bindings: clk: g12a-clkc: Add NNA CLK Source
 clock IDs
Message-ID: <20200617221817.GA2934098@bogus>
References: <20200610083012.5024-1-narmstrong@baylibre.com>
 <20200610083012.5024-2-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200610083012.5024-2-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200617_151819_435853_D9B1D454 
X-CRM114-Status: UNSURE (   7.92  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Dmitry Shmidt <dimitrysh@google.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, 10 Jun 2020 10:30:11 +0200, Neil Armstrong wrote:
> From: Dmitry Shmidt <dimitrysh@google.com>
> 
> This adds the Neural Network Accelerator IP source clocks.
> 
> Signed-off-by: Dmitry Shmidt <dimitrysh@google.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  include/dt-bindings/clock/g12a-clkc.h | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
