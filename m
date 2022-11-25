Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC90C4332F
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Nov 2022 22:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ANY71cyuEXFLXKpcE9SK9OAfBmhhSihuBh62+65p3m4=; b=JGTHcPpuwQPKZQ
	UfQaWkR182iSlHE6ImmpfcGEMjxvBW8j47LAuSqJ5OQ9HznT9QtWdxB3TeuLwJedbvNY8KLrk1oGw
	5c6Xv+8/xZmsFoXBD2tCOGAdvWuCQtc5mSD3BjQRvNKRGgcI/ck2WVhdTRFR5/LlSFQiHrOeZEz7E
	clToeBVnNdJi6t5PPCb57mTKdFcRYytwYhxftz6RdRCLT73+adwz10Lex6KzK+Qtyk16KDZOrBPsw
	O9yrNIDkghWnbXj2w87LjHbfPu+6A4kbX9NKHrZVxWFtPANU6zVpqdL6ZybzU2e3XzClr+ywpYhl9
	a2cP7KtaKoR1BtXnj1Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyhbp-002bsU-LK; Fri, 25 Nov 2022 22:55:49 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyhbf-002blg-AF; Fri, 25 Nov 2022 22:55:40 +0000
Received: by mail-ej1-x629.google.com with SMTP id bj12so13060312ejb.13;
        Fri, 25 Nov 2022 14:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cSQbE6DTU1OTWIo88z37u8F7NPhgsW2MN2Tg59pPOXc=;
        b=aLDxlgkJMAfQKJ/PsFzHPhylnPEW+gDKATHZAOerYca/LjJYpDbVG0zBfNLwnHmLxS
         V7P6bwrlFa00RdChbApUzhy95iu88EJnnce3uGOIRDVWQQXPRe72zG3yy6/y3QuY5joM
         G2FaBbnUYKJO57ZVyOyphLqVeohgiZskhZIs7FkkmeXgNyPfClUS90ADJnHV3vg1zt0z
         uoz/FBdInhZnMYPYaAgjN3ralRBltlkg1kw+j4I5DYh1tr7fty7iLiJsE4Bq3ZluOCY8
         ClMUj/Y3nD6Xcegq/zRHCF9sI0No/rp8D+ww1VFygNJcHYDzLkrSbngRLiMoMWvRyXYP
         VpSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cSQbE6DTU1OTWIo88z37u8F7NPhgsW2MN2Tg59pPOXc=;
        b=AnLEPMLs5rZ0p+eNh7a+bDIXc/vpT4fEstyChufh5HFbWOLytiKUlLz7J4PEKv/kQU
         +8FWValoWGzsqtYfcRAnBT7goeEU6nDaCNVXEXkEmjmIyi+9BgiduVnsSWWddRgRDL31
         tmfLHPA5F9ak+JylRq9HC5qAGquq8f2ZxPrQm8h7B1Kppt1gydu/HApJrl2G8RdGIZWA
         WecnbmfeEZSarY2Sq3WIXRGF2Jd6g7D+U+m0Afy/9061gRwWNTUNj09y7biDcNd3Givo
         42t8YwXiOIcaZyJZGBAt+vvYftlCUeWR/Ti20ec5XGhGds4surJZoMxHd/iU/oaVtWFo
         WTeQ==
X-Gm-Message-State: ANoB5pn0NUYVOJcHhgRxoi4IwHzMtmUQ639XnPLsfAwqmcRwAmtwH5uf
	SQLuX57eyBE7NCvws+UhUeF8iCJ3LsuoaaiDrJrGPW6C8ds=
X-Google-Smtp-Source: AA0mqf6TwkgpJ8rCH+EA5o8FW6/bDGwDyPkwIt+kioEMwalKVB9sy6wWTCae8gr3PFM8J9sWSbhDQw+IVh5lHIHTtKs=
X-Received: by 2002:a17:907:a709:b0:79f:cd7c:e861 with SMTP id
 vw9-20020a170907a70900b0079fcd7ce861mr33281694ejc.339.1669416937103; Fri, 25
 Nov 2022 14:55:37 -0800 (PST)
MIME-Version: 1.0
References: <20221125144141.477253-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221125144141.477253-1-krzysztof.kozlowski@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 25 Nov 2022 23:55:25 +0100
Message-ID: <CAFBinCCHQXqEwQU=BWfXj-iTJXXQ6_Hr_2rokzrmFzGF7nrgyg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: amlogic: align LED node names with dtschema
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_145539_374787_ABEFBDB4 
X-CRM114-Status: UNSURE (   8.16  )
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

On Fri, Nov 25, 2022 at 3:41 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> The node names should be generic and DT schema expects certain pattern:
>
>   amlogic/meson-sm1-bananapi-m5.dtb: leds: 'blue' does not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Thank you for this patch! It's:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
