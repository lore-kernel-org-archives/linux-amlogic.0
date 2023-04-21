Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 446E3C7618E
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Apr 2023 17:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=icGUQvk4lK/nwubOzX9eWIgIMkrkY/JjAulpiJztiaM=; b=uqHKSZS5m7UYbh
	q6lk8BcFqkQAUoWQvEEIh44rFduvgCn/D7KseYfQv/BYKnsLTAlrzj3J/KAP/6fuCkI8HyERCzRKF
	EggYCwolQYN8dWO2dAd5o3iDF95Dc1O7yvVuMTJdr4BK+vYZaYM9IWyTmH4WlLo5UkCg08wZQ93+v
	lNzwevvyqhIa1GwYtKyDbDK4LVOix7CDNGe1NIKWHP+9ATw70CF1o2oSjcWSK/+coZIHm1YYk60ir
	kWLSLt/qWJy+AW7Bx0dnyFzrxEDpWAeFl/HEFTWVS8jZp2Kzc+rgp/uctRfGvwhJrPotHjPM35fP8
	OGfod1yjGdIYBktOwZHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pput7-00BXp7-2Q;
	Fri, 21 Apr 2023 17:49:37 +0000
Received: from mail-oo1-f44.google.com ([209.85.161.44])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pput4-00BXoa-31;
	Fri, 21 Apr 2023 17:49:36 +0000
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5424b046c6bso701666eaf.1;
        Fri, 21 Apr 2023 10:49:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682099373; x=1684691373;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2AconcrSs1A3l/jlwS91qS5wDltwZxm/z65wO9RnSRQ=;
        b=fISoYgR5wLq1OkQBEsxADbWv2r68gA90h/s63nTkpucY7j1pJYDSSzLrVuOePCHLgB
         U8TJKo8kZ61NJxuL3TwR8gloadEwkgEAFE7fqIVhgfRjGV+au9euBX/4zNnMrkCoFile
         6dHBAMjIyBS/fA3uJ0mobio/ZmJdEjlZa2L6946SL8xLdfUk0C4LqeYUqlPB5A5gbeKE
         AsTkH1mGLujFOQKcIH6yrp74LHQM6JCTagoP5gvcc4VGivYqY/A2onmCxIMpoRmZX1D9
         x1WL5TmGv54E1nNjp2TC+tmpDZ/RGEjGyJn+2Ga9jyiXCEjkktzJ17ekXA4sGmWsLFAr
         Acpw==
X-Gm-Message-State: AAQBX9f39xWAcYfLdMYZ8sVDvNB4s2ka5zz8wJnu7oOrFuK2Wu8yV58z
	FKaB3wWXkr8n47l1dWAQGyxw3cwT+w==
X-Google-Smtp-Source: AKy350bLSefBVZzcnDvOCnXMNWEbvXD+LDCusHtI30LN0JGoqo9ygMS4gOKGGEZ4PwCTZpEoDqyZ5g==
X-Received: by 2002:a4a:e558:0:b0:542:4ad7:14d with SMTP id s24-20020a4ae558000000b005424ad7014dmr1392404oot.1.1682099373339;
        Fri, 21 Apr 2023 10:49:33 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id q5-20020acac005000000b0038756901d1esm1846599oif.35.2023.04.21.10.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 10:49:32 -0700 (PDT)
Received: (nullmailer pid 1536953 invoked by uid 1000);
	Fri, 21 Apr 2023 17:49:32 -0000
Date: Fri, 21 Apr 2023 12:49:32 -0500
From: Rob Herring <robh@kernel.org>
To: Yu Tu <yu.tu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>, qi.duan@amlogic.com, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, kelvin.zhang@amlogic.com, linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH V7 1/4] dt-bindings: clock: document Amlogic S4 SoC PLL
 clock controller
Message-ID: <168209937163.1536899.13850536868055091863.robh@kernel.org>
References: <20230417065005.24967-1-yu.tu@amlogic.com>
 <20230417065005.24967-2-yu.tu@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230417065005.24967-2-yu.tu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_104934_975066_D502EEE7 
X-CRM114-Status: UNSURE (   8.66  )
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


On Mon, 17 Apr 2023 14:50:02 +0800, Yu Tu wrote:
> Add the S4 PLL clock controller dt-bindings in the s4 SoC family.
> 
> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
> ---
>  .../bindings/clock/amlogic,s4-pll-clkc.yaml   | 50 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  .../dt-bindings/clock/amlogic,s4-pll-clkc.h   | 30 +++++++++++
>  3 files changed, 81 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,s4-pll-clkc.yaml
>  create mode 100644 include/dt-bindings/clock/amlogic,s4-pll-clkc.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
