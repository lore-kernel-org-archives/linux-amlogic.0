Return-Path: <SRS0=KZtH=SC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48EB4C43381
	for <linux-amlogic@archiver.kernel.org>; Sun, 31 Mar 2019 06:40:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17DD22183F
	for <linux-amlogic@archiver.kernel.org>; Sun, 31 Mar 2019 06:40:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kx5SV0l7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17DD22183F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jhl3Z1NOJGOTrsYGWwYQjB8CAKRO1zyQYNtPDAqPP/k=; b=kx5SV0l7BsEBvx
	x9KRngsudnri6m+3SRLyPzMgOCqVxklufN++HszC/k/OckPxrrBPCf6mIMAaMoF7cBQXNUuutAGQE
	o1uQeOaJ6EdiF0On93pknQV2u1dxbLI58715bY33z5s5E6vx5HMe8x+z+szB0DYy6R1qwrmnblhUw
	+mB3pCWb5hG2uGLUoxHXlhkM8uxsQNj+1i3kIGBCsXjpguYAQ6dUvly6M2tOq/4ABd+q4Jco2PS/N
	Xb20krFFwvhuyntKiNKAOcVlK+RjS6u44mqGS4NB2yorVCDYndN5gix44ygOHQuP6iQrY+e9X1/Kf
	bAmV4nfO338D+JQEydjw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAU8x-0007AA-PW; Sun, 31 Mar 2019 06:40:35 +0000
Received: from mail-pl1-f196.google.com ([209.85.214.196])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAU8r-00073e-5y
 for linux-amlogic@lists.infradead.org; Sun, 31 Mar 2019 06:40:30 +0000
Received: by mail-pl1-f196.google.com with SMTP id g12so2924301pll.11
 for <linux-amlogic@lists.infradead.org>; Sat, 30 Mar 2019 23:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gyVTZ1PkbobqjcKxa3+GkPj//34KKTZhu8/15Zm/dJI=;
 b=ZIlslijzvzOXcuHygWNvCpVyQpuIpYwGlbrzzw2MqdFpaEp7bgMs+8w7NYyzCXLbXh
 ZHiwWGB7D8oJfbA9vjBJjbkCXxbkSuZ44PrlKCdBLGA4FjEsGKl1D9y1VUkYLFw/wRrX
 AvjnoqD55Jtr1E0wJrH/SsihIESVOk+X5hSCHAhPfEYN7fnM9qeQng3Ur5WZEwBzy7md
 Ot/nTXUB3Vzu4hXsBpfht2r91vDEnOSnU4VVl1JkTyfZLV/Wh9i4GYf7ka/Wu6FI3tID
 R0NCubeK/GARNZs+Tgw4EQpj83OFtSG2/dHbcSSWnhIg3YhqWOHqyEp/GMeHUH44ZibP
 J1vA==
X-Gm-Message-State: APjAAAV0/fq+wLsQ+8Bdh+d4Ms7Q3VyJmagjePx9a8KMtIHkAvh8wAt0
 sesQsHeCjjpNbDDo8kevUg==
X-Google-Smtp-Source: APXvYqx3vnn7NYGkPVv+gCcn4vQ1asfhLQuOQU06fUnG8zxikzEIX43j/85iEIXVvS2phfDDujia8g==
X-Received: by 2002:a17:902:864a:: with SMTP id
 y10mr58263982plt.76.1554014428444; 
 Sat, 30 Mar 2019 23:40:28 -0700 (PDT)
Received: from localhost ([210.160.217.68])
 by smtp.gmail.com with ESMTPSA id 13sm8170123pfi.172.2019.03.30.23.40.27
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 30 Mar 2019 23:40:27 -0700 (PDT)
Date: Sun, 31 Mar 2019 01:40:26 -0500
From: Rob Herring <robh@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: meson: Add drive-strength
 property
Message-ID: <20190330212830.GA28281@bogus>
References: <20190314163725.7918-1-jbrunet@baylibre.com>
 <20190314163725.7918-2-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190314163725.7918-2-jbrunet@baylibre.com>
X-Mutt-References: <20190314163725.7918-2-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190330_234029_216988_014A1F2A 
X-CRM114-Status: GOOD (  12.23  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Guillaume La Roque <glaroque@baylibre.com>,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Mar 14, 2019 at 05:37:24PM +0100, Jerome Brunet wrote:
> From: Guillaume La Roque <glaroque@baylibre.com>
> 
> Add optional drive-strength property
> 
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
> index a47dd990a8d3..4e3d5a27c91c 100644
> --- a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
> @@ -51,6 +51,9 @@ Configuration nodes support the generic properties "bias-disable",
>  "bias-pull-up" and "bias-pull-down", described in file
>  pinctrl-bindings.txt
>  
> +Optional properties :
> + - drive-strength: Drive strength for the specified pins in uA.

The standard definition says this is in mA.

> +
>  === Example ===
>  
>  	pinctrl: pinctrl@c1109880 {
> -- 
> 2.20.1
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
