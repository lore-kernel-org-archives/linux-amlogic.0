Return-Path: <SRS0=PQn9=2Z=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4368FC00523
	for <linux-amlogic@archiver.kernel.org>; Sat,  4 Jan 2020 00:25:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15FE921835
	for <linux-amlogic@archiver.kernel.org>; Sat,  4 Jan 2020 00:25:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YPndtZjC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15FE921835
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xAi+TL9OACFzGtBH6d72PiJFg1TYUd/APGdsbazW9M8=; b=YPndtZjCXzphnW
	SDSVj7pKWLeQ/GDzixoZDK4Ys06zAiYggwlwk4MMy9foJUucS9dEAPISajhsON0e4iJ7p5kC7JxrR
	/0bAQL1SyMHyVRWiyp5nEggGDQRPKHIDJ/BtEMB/BQEGaad7KAP1J6Zblx79UGMHFqFchB1fuo5Yj
	K2Fb/CH8Tfx/1YwuPdcXlzImOwu1Dit0WEAUFERQ8VBxxx4ZM94F6osftr3UB6eXxT8k2VJDBxN/H
	5l7ScuU4WcXQLTzkq0Ve78V5FPd8rsJGxTKuXngbsl0HvhqlreDjihPDMEWJl2qpu+0v/TIZRcQPv
	ovCab/ROxZ6elTMYcTUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1inXG4-0000tb-F5; Sat, 04 Jan 2020 00:25:36 +0000
Received: from mail-il1-f194.google.com ([209.85.166.194])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1inXG1-0000tH-FP
 for linux-amlogic@lists.infradead.org; Sat, 04 Jan 2020 00:25:34 +0000
Received: by mail-il1-f194.google.com with SMTP id f5so38005090ilq.5
 for <linux-amlogic@lists.infradead.org>; Fri, 03 Jan 2020 16:25:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RHzS3lmjvqBu923Z3jA1u6CAnoZKf0aTLGdAiWMkzuM=;
 b=aWKCoC+Pf3PeqxzceuIg3STdHk6ed9xNqBFR3MCrjNEwUmyiXXvgIjzKdwwVCfnDBF
 6MH2rE646E9MYFBDRDv6TeICZbH9sSArmOLac1rUN/fX7FHi2ALzs3vXemwCL4BejcGx
 FSjlGWlKVhm91YIyI69B39uQaTukjSVRvY7sfxGff/2M5Rh+257xo1Sqn1ar7YLQdA9o
 hSCx+oU3lQ6hqanitqvb0yoFYyH4VC3MVY/G7L/qLbU3NtlkeZYA9Tw/tKCkokY2MMVM
 KWgw0LaedOjhyUobX1zRUuEvSk+nQqKSLJ0XULvXJP3ifDKr3MxpWoPvJ4qt2H+suSZq
 qWig==
X-Gm-Message-State: APjAAAVbP6/lK8D4CaDPz7GRzt0M5vbMk8udydVOc5Qb1PO/Khg6LeR/
 YXIMKWihxV97J+zfgbpyA0f/5ik=
X-Google-Smtp-Source: APXvYqzXrJzAWdrluOooLEl42Pgxa/WGLch+dj1gKocJM9cZqKLdLeP1O175P+UFXSxBVe60uOrtbw==
X-Received: by 2002:a92:4016:: with SMTP id n22mr75825089ila.13.1578097532412; 
 Fri, 03 Jan 2020 16:25:32 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id g4sm21604743iln.81.2020.01.03.16.25.31
 for <linux-amlogic@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2020 16:25:32 -0800 (PST)
Received: from rob (uid 1000) (envelope-from rob@rob-hp-laptop) id 2219b7
 by rob-hp-laptop (DragonFly Mail Agent v0.11);
 Fri, 03 Jan 2020 17:24:29 -0700
Date: Fri, 3 Jan 2020 17:24:29 -0700
From: Rob Herring <robh@kernel.org>
To: Remi Pommarel <repk@triplefau.lt>
Subject: Re: [PATCH v3 5/5] dt-bindings: Add AXG PCIE PHY bindings
Message-ID: <20200104002429.GA18966@bogus>
References: <20191224173942.18160-1-repk@triplefau.lt>
 <20191224173942.18160-6-repk@triplefau.lt>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191224173942.18160-6-repk@triplefau.lt>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200103_162533_514697_8602ED0A 
X-CRM114-Status: GOOD (  13.82  )
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
Cc: devicetree@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yue Wang <yue.wang@Amlogic.com>,
 linux-amlogic@lists.infradead.org, Andrew Murray <andrew.murray@arm.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Dec 24, 2019 at 06:39:42PM +0100, Remi Pommarel wrote:
> Add documentation for PCIE PHYs found in AXG SoCs.
> 
> Signed-off-by: Remi Pommarel <repk@triplefau.lt>
> ---
>  .../bindings/phy/amlogic,meson-axg-pcie.yaml  | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/amlogic,meson-axg-pcie.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/amlogic,meson-axg-pcie.yaml b/Documentation/devicetree/bindings/phy/amlogic,meson-axg-pcie.yaml
> new file mode 100644
> index 000000000000..c622a1b38ffc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/amlogic,meson-axg-pcie.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2019 BayLibre, SAS
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/phy/amlogic,meson-axg-pcie.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Amlogic AXG PCIE PHY
> +
> +maintainers:
> +  - Remi Pommarel <repk@triplefau.lt>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amlogic,axg-pcie-phy

Do you expect another compatible? If not, use 'const' instead.

> +
> +  reg:
> +    maxItems: 1
> +
> +  aml,hhi-gpr:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    items:
> +      - const: phy

You don't need *-names when there's only one entry.

> +
> +  "#phy-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - aml,hhi-gpr
> +  - resets
> +  - reset-names
> +  - "#phy-cells"
> +
> +examples:
> +  - |
> +    pcie_phy: pcie-phy@ff644000 {
> +          compatible = "amlogic,axg-pcie-phy";
> +          reg = <0x0 0xff644000 0x0 0x2000>;
> +          aml,hhi-gpr = <&sysctrl>;
> +          resets = <&reset RESET_PCIE_PHY>;
> +          reset-names = "phy";
> +          #phy-cells = <0>;
> +    };
> -- 
> 2.24.0
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
