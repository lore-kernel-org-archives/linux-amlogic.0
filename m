Return-Path: <SRS0=PQn9=2Z=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0B2AC00523
	for <linux-amlogic@archiver.kernel.org>; Sat,  4 Jan 2020 00:32:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6033421835
	for <linux-amlogic@archiver.kernel.org>; Sat,  4 Jan 2020 00:32:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o4+PC4KX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6033421835
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a6PCc26CDNc2hI5ivQJ5tE7XUyrNkQ4XVh4TI5TIIGc=; b=o4+PC4KXtZC/nY
	R0YgGvWhBJcFNIt9FgCrgQcwU3HOFvLbAqsqQ/1tTvikiiSXL3E7VD7lR1rH9QaMLuxsjoOaoR/kc
	3qc3H+tsgSzLNl49yeqXoxcQOahiKq3DA9F4cM28Isp6w6E52RX7CFd8GsIkretl+261BLaJvwOCo
	Ih83MvmjdAXuUZ908tB8Ntd95/pJ+u1n5ZhrmMzOclXXzGaoXavFnko02z1doQYqKDarFlSpKMz2t
	joiCl84bNNXJDQzUmne8m+fPRv/HQFj3Xz+7aI41olp0qy+WY5pLAZsCvBUQByB27L1epQv6sg9mR
	QytcHr4YwnzGQ0FLZ6Og==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1inXMX-0002dt-RJ; Sat, 04 Jan 2020 00:32:17 +0000
Received: from mail-il1-f195.google.com ([209.85.166.195])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1inXMU-0002dH-V3
 for linux-amlogic@lists.infradead.org; Sat, 04 Jan 2020 00:32:16 +0000
Received: by mail-il1-f195.google.com with SMTP id g12so38040548ild.2
 for <linux-amlogic@lists.infradead.org>; Fri, 03 Jan 2020 16:32:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=OkEhI0mGAaFruOBaLTQQRQIQxA1NVDP05WMjkcVPHmI=;
 b=m4WXNFKp+MCtcXFqNqk2qsczmSz/ObMC2jRyjVwidOXIgnGAwk4pfja0NEZXmg5lfz
 X5B74iG6qJrJt5uxD0aB9IFF91EJOmEIoY1E4lKXJM0p5VXjo6hSxnvST1+2lTi6WHRL
 lidhxjTIel9zpyJAMJzuQrM1x6zikG7TGjzLYYhQqgYmlVshLaxhKQLS2eEbDTncvZgf
 r2N0hbQKtMMVAPOCbe0j/j37NiUGu43+2xDeUxktq6xiNWRRmMxOQS4PcwBwfn0ltdrF
 /4nFwh/Uv7F6NmsnEKSCWz2zboheOW7GXQsWkbi7dn1CYF5nhbFW0seEAdmAWas31477
 itsw==
X-Gm-Message-State: APjAAAXLUhdu9GpIbNyCFIjIaDMDjLfpCbh88v++0u7b0Zw1wr5g5KSN
 I3oVuu1QqowyD1kIBHIMvEp1+TE=
X-Google-Smtp-Source: APXvYqz9zPF3qjXkzjIPO/hILm9HI5GEUadKISTarEgA2AGYyQRmyMlh76NSyoKC3HaG2ITz1CV52A==
X-Received: by 2002:a92:3cd4:: with SMTP id j81mr81487949ilf.77.1578097932687; 
 Fri, 03 Jan 2020 16:32:12 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id g23sm18674125ila.15.2020.01.03.16.32.11
 for <linux-amlogic@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2020 16:32:12 -0800 (PST)
Received: from rob (uid 1000) (envelope-from rob@rob-hp-laptop) id 2219a5
 by rob-hp-laptop (DragonFly Mail Agent v0.11);
 Fri, 03 Jan 2020 17:32:10 -0700
Date: Fri, 3 Jan 2020 17:32:10 -0700
From: Rob Herring <robh@kernel.org>
To: Hanjie Lin <hanjie.lin@amlogic.com>
Subject: Re: [PATCH v3 2/6] dt-bindings: usb: dwc3: Add the Amlogic A1 Family
 DWC3 Glue Bindings
Message-ID: <20200104003210.GA29074@bogus>
References: <1577428606-69855-1-git-send-email-hanjie.lin@amlogic.com>
 <1577428606-69855-3-git-send-email-hanjie.lin@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1577428606-69855-3-git-send-email-hanjie.lin@amlogic.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200103_163215_000196_49FE4FF8 
X-CRM114-Status: GOOD (  16.99  )
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
Cc: devicetree@vger.kernel.org, Victor Wan <victor.wan@amlogic.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-usb@vger.kernel.org,
 Yue Wang <yue.wang@amlogic.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jian Hu <jian.hu@amlogic.com>, Liang Yang <liang.yang@amlogic.com>,
 Qiufang Dai <qiufang.dai@amlogic.com>, Xingyu Chen <xingyu.chen@amlogic.com>,
 Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Dec 27, 2019 at 02:36:42PM +0800, Hanjie Lin wrote:
> The Amlogic A1 SoC Family embeds 1 USB Controllers:
>  - a DWC3 IP configured as Host for USB2 and USB3
> 
> A glue connects the controllers to the USB2 PHY of A1 SoC.
> 
> Signed-off-by: Hanjie Lin <hanjie.lin@amlogic.com>
> Signed-off-by: Yue Wang <yue.wang@amlogic.com>
> ---
>  .../bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml  | 57 +++++++++++++++++++---
>  1 file changed, 51 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml b/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
> index 4efb77b..6103cc2 100644
> --- a/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
> +++ b/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
> @@ -9,6 +9,8 @@ title: Amlogic Meson G12A DWC3 USB SoC Controller Glue
>  
>  maintainers:
>    - Neil Armstrong <narmstrong@baylibre.com>
> +  - Hanjie Lin <hanjie.lin@amlogic.com>
> +  - Yue Wang <yue.wang@amlogic.com>
>  
>  description: |
>    The Amlogic G12A embeds a DWC3 USB IP Core configured for USB2 and USB3
> @@ -22,10 +24,14 @@ description: |
>    The DWC3 Glue controls the PHY routing and power, an interrupt line is
>    connected to the Glue to serve as OTG ID change detection.
>  
> +  The Amlogic A1 embeds a DWC3 USB IP Core configured for USB2 in
> +  host-only mode.
> +
>  properties:
>    compatible:
>      enum:
>        - amlogic,meson-g12a-usb-ctrl
> +      - amlogic,meson-a1-usb-ctrl
>  
>    ranges: true
>  
> @@ -37,6 +43,11 @@ properties:
>  
>    clocks:
>      minItems: 1
> +    maxItems: 4
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 4
>  
>    resets:
>      minItems: 1
> @@ -47,17 +58,22 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> +  phys:
> +    minItems: 1
> +    maxItems: 3
> +
>    phy-names:
>      items:
>        - const: usb2-phy0 # USB2 PHY0 if USBHOST_A port is used
>        - const: usb2-phy1 # USB2 PHY1 if USBOTG_B port is used
>        - const: usb3-phy0 # USB3 PHY if USB3_0 is used
>  
> -  phys:
> -    minItems: 1
> -    maxItems: 3
> -

Why the unnecessary move?

> -  dr_mode: true
> +  dr_mode:
> +    description: usb mode for G12A
> +    enum:
> +      - host
> +      - peripheral
> +      - otg

No, this is a common property that doesn't need to be redefined here. It 
was correct as-is.

>  
>    power-domains:
>      maxItems: 1
> @@ -80,9 +96,9 @@ required:
>    - resets
>    - reg
>    - interrupts
> -  - phy-names
>    - phys
>    - dr_mode
> +  - phy-names

Again, unnecessary change.

>  
>  examples:
>    - |
> @@ -124,4 +140,33 @@ examples:
>                snps,quirk-frame-length-adjustment;
>            };
>      };
> +  - |
> +    a1_usb: usb@ffe09000 {

You are only adding a compatible. No need for a whole new example.

> +          status = "okay";
> +          compatible = "amlogic,meson-a1-usb-ctrl";
> +          reg = <0 0xffe09000 0x0 0xa0>;
> +          #address-cells = <1>;
> +          #size-cells = <1>;
> +          ranges;
>  
> +          clocks = <&clkc_periphs 36>,
> +                   <&clkc_periphs 85>,
> +                   <&clkc_periphs 2>,
> +                   <&clkc_periphs 3>;
> +          clock-names = "usb_ctrl", "usb_bus", "xtal_usb_phy",
> +                        "xtal_usb_ctrl";
> +
> +          resets = <&reset 36>;
> +
> +          phys = <&usb2_phy1>;
> +          phy-names = "usb2-phy1";
> +
> +          a1_dwc3: usb@ff400000 {
> +                  compatible = "snps,dwc3";
> +                  reg = <0xff400000 0x100000>;
> +                  interrupts = <0 90 4>;
> +                  dr_mode = "host";
> +                  snps,dis_u2_susphy_quirk;
> +                  snps,quirk-frame-length-adjustment = <0x20>;
> +          };
> +    };
> -- 
> 2.7.4
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
