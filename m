Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D4A0C54E76
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Nov 2023 16:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7+kKweAgEBXCDaBZigOQWgw0yZVGVxD9SsXHaTwVf/Y=; b=RdupYI4wPdtcvR
	MEy6yf5VL4z47XmR4bBZtdLyIc+h7nng+tWTD4ZH10uvvoXhS1I61I4Hz+H/Us1GHv18VHjf8CPFc
	EPhhPACuEZjM9DVEnqa1u/igaDLjwZSZUep1Vqp/ySr6jJSOAO6EJlB3NOICN/ZuYahwtiMY9hY84
	40YUbetL8pslT45oiilceWODct+V9QkzZeOK+cvXRnxSP/6yUKd3qj5+QXYLo0LMMxHCy8AvJ+THx
	IBYZssD/iX9yLc7Ak/P7a+n7ecBIZYV5WF6h4P/JYGOC0xeF2G2BENuWIXrZ+rYbKeLRqES5jvQ3g
	CNTJE1ftpY6IbCvQSypw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4kHe-00AN35-0I;
	Sun, 19 Nov 2023 16:04:30 +0000
Received: from mail-oi1-f177.google.com ([209.85.167.177])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4kHb-00AN2c-22
	for linux-amlogic@lists.infradead.org;
	Sun, 19 Nov 2023 16:04:29 +0000
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3b40d5ea323so2562294b6e.0
        for <linux-amlogic@lists.infradead.org>; Sun, 19 Nov 2023 08:04:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700409865; x=1701014665;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IhoBsgcYCPoMOyBClZKCjJFuGRHuuw4KSHpd/ceIW1o=;
        b=KIdLYlgSLB4gSbi5me0Ux2NrYM4fQwg0WMsjG2stNZ787vnI+CUeNz2OA25QWgnMU1
         WJcWL1iGU2DSwyEngKjNnjrL05xG95negfXMDD3DT2Xg90vvpqgdhsrMdIlpjCdsWOUD
         yKWMzl9d/TyQELLeZAqzLyABxIpQrwb0Rw4w/PGxSuB3Rvk4n8uDl/1ou6DpZ+8M8Rkf
         rsLsZmpkKI5kdgWSilRcghqNNKZ5OMbZIr81M2xe3WOJxIiOaulD31Miwy9qtOWPKL5P
         uW7I8Np3bDvMMIiB680AxWwr2t3PNgRbYy/0mDltXI9W22mYVFs+VNVH92t81oIOb+ml
         bCLA==
X-Gm-Message-State: AOJu0YwNBxJOPWubgcAY4/LcxDf9dyO9XDwX48S39g5akiFarP1Hvpja
	USUkooeni7IhOM6Pb2IVSw==
X-Google-Smtp-Source: AGHT+IEPvxQPpSKlB8eS9XX5UGJPIu58cXdUceezJBLkAF6LxsC6V68SFxNoVg0VbT5dJDvCZMnbkg==
X-Received: by 2002:a05:6808:bcc:b0:3b2:f431:e029 with SMTP id o12-20020a0568080bcc00b003b2f431e029mr8622231oik.26.1700409865587;
        Sun, 19 Nov 2023 08:04:25 -0800 (PST)
Received: from herring.priv ([2607:fb90:45e3:889f:15b4:1348:6d64:224b])
        by smtp.gmail.com with ESMTPSA id i16-20020aca2b10000000b003af642cf646sm998621oik.37.2023.11.19.08.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 08:04:24 -0800 (PST)
Received: (nullmailer pid 267899 invoked by uid 1000);
	Sun, 19 Nov 2023 16:04:22 -0000
Date: Sun, 19 Nov 2023 10:04:22 -0600
From: Rob Herring <robh@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, JunYi Zhao <junyi.zhao@amlogic.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: pwm: amlogic: fix s4 bindings
Message-ID: <170040986161.267844.16868927442799371234.robh@kernel.org>
References: <20231117125919.1696980-1-jbrunet@baylibre.com>
 <20231117125919.1696980-2-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231117125919.1696980-2-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231119_080427_689098_DE8B3F36 
X-CRM114-Status: GOOD (  22.48  )
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


On Fri, 17 Nov 2023 13:59:11 +0100, Jerome Brunet wrote:
> s4 has been added to the compatible list while converting the Amlogic PWM
> binding documentation from txt to yaml.
> 
> However, on the s4, the clock bindings have different meaning compared to
> the previous SoCs.
> 
> On the previous SoCs the clock bindings used to describe which input the
> PWM channel multiplexer should pick among its possible parents.
> 
> This is very much tied to the driver implementation, instead of describing
> the HW for what it is. When support for the Amlogic PWM was first added,
> how to deal with clocks through DT was not as clear as it nowadays.
> The Linux driver now ignores this DT setting, but still relies on the
> hard-coded list of clock sources.
> 
> On the s4, the input multiplexer is gone. The clock bindings actually
> describe the clock as it exists, not a setting. The property has a
> different meaning, even if it is still 2 clocks and it would pass the check
> when support is actually added.
> 
> Also the s4 cannot work if the clocks are not provided, so the property no
> longer optional.
> 
> Finally, for once it makes sense to see the input as being numbered
> somehow. No need to bother with clock-names on the s4 type of PWM.
> 
> Fixes: 43a1c4ff3977 ("dt-bindings: pwm: Convert Amlogic Meson PWM binding")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../devicetree/bindings/pwm/pwm-amlogic.yaml  | 69 ++++++++++++++++---
>  1 file changed, 60 insertions(+), 9 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
