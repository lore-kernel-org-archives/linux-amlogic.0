Return-Path: <SRS0=91Jp=YS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B904CCA9EA0
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Oct 2019 20:30:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82B7C21872
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Oct 2019 20:30:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k3ASLEVm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82B7C21872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N2fvZfROhR/KT6zDDjKeJ+r6WDVf5/489fxhRie4Cg4=; b=k3ASLEVmlELp2g
	7GfgA+TNm4PrJT8hWtif978KcIDuEDNZXRN7jDbE5k6WquGkEqJn//A+rKvagxRy+4axZx4X4do4p
	ibm+ueYXNcksgQevVnLtatSxlt1o1sUYjZAMIMHZyPwKRh0/0c2Yhup+xYrNGVFw6PxBdBr7ej4z8
	CnDiZHp0uMlfqNnR28V7UwwhBwAKo9dYc/kbbBAJM8AcLcbXOx0YXEnEzsaEGVIfohPt7hZNmez3R
	rE4GEhI1tkg47FeLjhUhHqOr6wvZnD7fwVuN83YcREZlu0MKtqnB4l8JyMCIN6teo7jHIAdF7tBxR
	fdBX1clCkdVUqzsrTm0w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iO6EF-0001l2-QY; Fri, 25 Oct 2019 20:30:35 +0000
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iO6ED-0001kX-3W; Fri, 25 Oct 2019 20:30:34 +0000
Received: by mail-oi1-f193.google.com with SMTP id j7so2465138oib.3;
 Fri, 25 Oct 2019 13:30:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DjnUodnaL6w0elyh2CsGwsstDrRTdxNuqmD9G+YqUd4=;
 b=g+wOU2oxMtyxu/QDx9Hb0XwFRNyGEJryzyRoWCz9jbqmMi4qAZHO2K6ootEqcW8twX
 COoXho3jsd/X3PDFhhtA3iJy43n6vzgiqM8P+2+cgAdbI28Xbll7p/pfGGpoWbre7vxg
 rUJ3riYLReZVyP8xunbZAZdp+IzZnT5zjm6CLUlx6tSMfmQADOTj6bKMdn+1oN9yxrxY
 pyLE1V9UlX7R4wPRMoeGANf7nLXuIsao1Dpd1y57P1VgRnTNtIZ4UTl1eJRRMlKhuKNC
 l2xQjB2WGmAOBku2t9LhR6Zw9mwnhPUHlajacgBJ5nSb9REk/BAfUP0IHSfXVEdIjqSQ
 0+rQ==
X-Gm-Message-State: APjAAAXDfJRhCQkVmkfk4yLILte/7k0e8hiyIuBmxZb7CJZfht5vMvlE
 MLlPIBHwaHFilZhhh7XQ6g==
X-Google-Smtp-Source: APXvYqy/fDo5GIME57rCCB5sn8utMkgqqWQkRouqjcMDQCu4olP7uzs9etttYKNKUcq1tCCeLd1KXQ==
X-Received: by 2002:aca:b256:: with SMTP id b83mr2268898oif.101.1572035431991; 
 Fri, 25 Oct 2019 13:30:31 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l19sm842018oie.22.2019.10.25.13.30.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 13:30:31 -0700 (PDT)
Date: Fri, 25 Oct 2019 15:30:30 -0500
From: Rob Herring <robh@kernel.org>
To: Xingyu Chen <xingyu.chen@amlogic.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: watchdog: add new binding for meson
 secure watchdog
Message-ID: <20191025203030.GA28391@bogus>
References: <1571983984-11771-1-git-send-email-xingyu.chen@amlogic.com>
 <1571983984-11771-3-git-send-email-xingyu.chen@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1571983984-11771-3-git-send-email-xingyu.chen@amlogic.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191025_133033_146687_7013C671 
X-CRM114-Status: GOOD (  15.20  )
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
Cc: Qianggui Song <qianggui.song@amlogic.com>, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, Jian Hu <jian.hu@amlogic.com>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Oct 25, 2019 at 02:13:02PM +0800, Xingyu Chen wrote:
> The binding targets the Meson-A/C series compatible SoCs, in which the
> watchdog registers are in secure world.
> 
> Signed-off-by: Xingyu Chen <xingyu.chen@amlogic.com>
> ---
>  .../bindings/watchdog/amlogic,meson-sec-wdt.yaml   | 34 ++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/amlogic,meson-sec-wdt.yaml
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/amlogic,meson-sec-wdt.yaml b/Documentation/devicetree/bindings/watchdog/amlogic,meson-sec-wdt.yaml
> new file mode 100644
> index 00000000..0bbc807
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/amlogic,meson-sec-wdt.yaml
> @@ -0,0 +1,34 @@
> +# SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +# Copyright (c) 2019 Amlogic, Inc
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/power/amlogic,meson-sec-wdt.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Amlogic Meson Secure Watchdog Timer
> +
> +maintainers:
> +  - Xingyu Chen <xingyu.chen@amlogic.com>
> +
> +description: |+
> +  Secure Watchdog Timer used in Meson-A/C series Compatible SoCs
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amlogic,meson-sec-wdt

If there are no other properties, then you don't need this. Just have 
the secure firmware driver instantiate the watchdog.

> +
> +  secure-monitor:
> +    description: phandle to the secure-monitor node
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
> +required:
> +  - compatible
> +  - secure-monitor
> +
> +examples:
> +  - |
> +    watchdog {
> +          compatible = "amlogic,meson-sec-wdt";
> +          secure-monitor = <&sm>;
> +    };
> -- 
> 2.7.4
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
