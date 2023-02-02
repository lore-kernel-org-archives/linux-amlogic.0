Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E378C61DA4
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Feb 2023 23:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BpX5pZtHUF3O/Y2BVRp4X4VrIWM56vBA0NmasNteNU8=; b=cKXsEe4fgvH4RD
	y7Zkvq+xae4L/0nlmq30E1015wYQUbuLWmyNhBSoW7yTPyIHB9xvRYK7hyNk9B89KPqjSYhrffvw8
	YLH1pCAmUEUbkSKo1X5YLnbNOi2PBdiH9sweQnntD3Q23IAjTqNIeE8/7Hg4kgFeoo88m36Z0Uj4b
	DK4TfUE5a+B9ZvowSo+kjxqKEmbAjt7Am57hHDoWQ/1L0nAwTM94fqnMdmX9gbxpxbk7I4Vgtv9MV
	umsFdxlSaqy+X+P1v8Jal0GIbSrs0Pto68nsdEkJ/OXFUTf22hl08vUm7hV/t8QNkL1CVOEQWZjaO
	RxGDkDrIV9MNiNGF/6tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNjPT-00HSDi-MY; Thu, 02 Feb 2023 23:54:31 +0000
Received: from mail-oo1-f41.google.com ([209.85.161.41])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNjPR-00HSDF-6l; Thu, 02 Feb 2023 23:54:30 +0000
Received: by mail-oo1-f41.google.com with SMTP id b10-20020a4a9fca000000b004e6f734c6b4so348570oom.9;
        Thu, 02 Feb 2023 15:54:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2VCS0pNVsYt06k5zDzEs8Faz6RYiYEqDWO9Bf/Yg0I8=;
        b=2mcZqYV7KQMnn4n/hqGm9ENO5HWG+XZtbX+s2J8lGfZgy91EzWvs/7n3ksblnpcdOi
         /C/ql8IeeQFYMdTmL40HUVUkYJrjj1jMDuMfDlps3Yx2DyHxbGGxU9UAxqyseeS8VLD4
         HxWb+emjq6Zy9PXMHKV1quNV5U+fznMz3KjQ9i7L7F9gaxiZn7wKkRJrukvS8gRgxzPv
         tmXYaeDIA6btLDawNrTQZfzaUU390lJvZElxBBojZzGOzAljsQejZ+uVP79Og5WJPLkP
         SCI+UQBKIdx3SmM1z+e3PFivVN2I9wExB3t4iJrDlwXyliST3GtPQmWwU3LnA0Tz05eX
         S+Zw==
X-Gm-Message-State: AO0yUKXupQSUDksNakyZAEuB6Qgq7U/ClxHi1o8BI0GrL5ElsFF9JJSr
	ornYW/PN7cpm3oYDMnAhQQ==
X-Google-Smtp-Source: AK7set/IDqDAsp6U6ML93g2sfU2nPieiugA5msOO5zUoE4jwCL7JJkY0/XOQ1c4zWBeAr6DVlhzrNg==
X-Received: by 2002:a4a:948e:0:b0:51a:35de:d4c1 with SMTP id k14-20020a4a948e000000b0051a35ded4c1mr1502653ooi.5.1675382067058;
        Thu, 02 Feb 2023 15:54:27 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id i5-20020a4aa6c5000000b004f241603c49sm397199oom.20.2023.02.02.15.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 15:54:26 -0800 (PST)
Received: (nullmailer pid 2927110 invoked by uid 1000);
	Thu, 02 Feb 2023 23:54:25 -0000
Date: Thu, 2 Feb 2023 17:54:25 -0600
From: Rob Herring <robh@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-pwm@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Kevin Hilman <khilman@baylibre.com>, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh+dt@kernel.org>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH 4/4] dt-bindings: interrupt-controller: Convert Amlogic
 Meson GPIO interrupt controller binding
Message-ID: <167538206470.2927056.7621098912599548470.robh@kernel.org>
References: <8df4ceec-663c-dc68-d775-5caeb02c0cca@gmail.com>
 <8cae0b08-8040-ef7b-da0e-92d9b3695249@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8cae0b08-8040-ef7b-da0e-92d9b3695249@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_155429_288231_0B975FFB 
X-CRM114-Status: GOOD (  11.47  )
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


On Wed, 01 Feb 2023 21:02:02 +0100, Heiner Kallweit wrote:
> Convert Amlogic Meson GPIO interrupt controller binding to yaml.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> - consider that more than one compatible may be set
> - remove bus part from example
> - remove minItem/maxItem properties for compatible
> - reduce compatible fallback complexity
> ---
>  .../amlogic,meson-gpio-intc.txt               | 38 ----------
>  .../amlogic,meson-gpio-intc.yaml              | 72 +++++++++++++++++++
>  2 files changed, 72 insertions(+), 38 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
