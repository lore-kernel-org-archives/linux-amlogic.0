Return-Path: <SRS0=PQn9=2Z=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55965C00523
	for <linux-amlogic@archiver.kernel.org>; Sat,  4 Jan 2020 00:28:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A06D21835
	for <linux-amlogic@archiver.kernel.org>; Sat,  4 Jan 2020 00:28:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pIE/kref"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A06D21835
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uZIq8QuNFvU0ybii5QT0j9Fo5GzyYqk6lgm8e18SNeg=; b=pIE/krefbicM5H
	rXiNYoOL3S4LQVkEEUF2zb3Hnmy9fG6/FTNkQh6aF2rNAmXIgzhV39FE2sN7Vq1Owp/R8Xumwh5Uv
	wAWR+gZvt/ng804E+8dsw9ShoLuZk9mj60TOHVFbmYg+Toxop7BWqa25ijkSOa4LrbKH89LeOF2at
	3lVHx2o5Jp+8MYOD1gZyYOAi+dQigC5NFSezObWef9uIcEKaOE0OVrH8UjeTSSvRTgGNnHYiNJAz/
	AhHb1GXHALohylecVuWWeH/ZWIwOXweZHFiN08vvs9EAq22xHkvzEVL5jb8XRv2Nz0mxi1kQ6vNkF
	ibaPT1gJwjzQOIrHkR7A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1inXIb-00010Z-7k; Sat, 04 Jan 2020 00:28:13 +0000
Received: from mail-il1-f196.google.com ([209.85.166.196])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1inXIY-000108-Ed
 for linux-amlogic@lists.infradead.org; Sat, 04 Jan 2020 00:28:12 +0000
Received: by mail-il1-f196.google.com with SMTP id z12so1540657iln.11
 for <linux-amlogic@lists.infradead.org>; Fri, 03 Jan 2020 16:28:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7In7Tco29iuCsOLy3g6JjgD5lKC+PYNDMM0DSnAitvg=;
 b=G+r1LpyCncTJyKGKM7cSlKPJccJQuSeXXrClokdJ1Fst0HaHg/30MKbIRIsU3s+Tb2
 fGswa2bUvc4/crBPFJ2IpgmJTwcF8M9pO+miEc7cM/ZBFXhO6Vi4ddzowmo0VXRnsGDN
 Zvm/w0ZPqv9sEiLdU3iaF8sj1TOQIGh4WUAIPHGpC2dNWWiy48AZ/1hQMmuwqaNrnMYq
 gqaZYJ6JfGb+n6nys5gNxi4DF+TIKNhjLNeYfIBAWWLqFPyor0O9U5JJykOBKVpdSRdp
 64kewBQWH3iIKJCxZEQ+JSSTPEd0V+Fa01QzljqS7v1DHaBgTpw8rpxZZR8Dw73lATje
 Pw3g==
X-Gm-Message-State: APjAAAWv7/yFibN+i0ZLEyTUYZX+6BmPsh3NSaicNXeOwx6en/snGULx
 fWSx0LO0GDJ/rIr3jd5Mjdb5Gds=
X-Google-Smtp-Source: APXvYqxDZKKPYPAca+mZ6KEuh0jDF3JVVVE596c3g3x7TWibWv6HOZg5YWavSd1V5kWodnISJws+aw==
X-Received: by 2002:a92:cc42:: with SMTP id t2mr77405821ilq.111.1578097688906; 
 Fri, 03 Jan 2020 16:28:08 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id a3sm14976882iot.87.2020.01.03.16.28.07
 for <linux-amlogic@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2020 16:28:07 -0800 (PST)
Received: from rob (uid 1000) (envelope-from rob@rob-hp-laptop) id 2219b7
 by rob-hp-laptop (DragonFly Mail Agent v0.11);
 Fri, 03 Jan 2020 17:28:06 -0700
Date: Fri, 3 Jan 2020 17:28:06 -0700
From: Rob Herring <robh@kernel.org>
To: Hanjie Lin <hanjie.lin@amlogic.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: phy: Add Amlogic A1 USB2 PHY Bindings
Message-ID: <20200104002806.GA24214@bogus>
References: <1577428606-69855-1-git-send-email-hanjie.lin@amlogic.com>
 <1577428606-69855-2-git-send-email-hanjie.lin@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1577428606-69855-2-git-send-email-hanjie.lin@amlogic.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200103_162810_493791_AF980ACC 
X-CRM114-Status: GOOD (  14.69  )
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

On Fri, Dec 27, 2019 at 02:36:41PM +0800, Hanjie Lin wrote:
> Add the Amlogic A1 Family USB2 PHY Bindings
> 
> It supports Host mode only.
> 
> Signed-off-by: Hanjie Lin <hanjie.lin@amlogic.com>
> Signed-off-by: Yue Wang <yue.wang@amlogic.com>
> ---
>  .../bindings/phy/amlogic,meson-a1-usb2-phy.yaml    | 55 ++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/amlogic,meson-a1-usb2-phy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/amlogic,meson-a1-usb2-phy.yaml b/Documentation/devicetree/bindings/phy/amlogic,meson-a1-usb2-phy.yaml
> new file mode 100644
> index 00000000..2b2c526
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/amlogic,meson-a1-usb2-phy.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2019 Amlogic, Inc
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/phy/amlogic,meson-a1-usb2-phy.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Amlogic A1 USB2 PHY
> +
> +maintainers:
> +  - Yue Wang <yue.wang@amlogic.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amlogic,meson-a1-usb2-phy

Use 'const' if there's only 1.

> +
> +  reg:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    items:
> +      - const: phy

Don't need *-names when there's a single entry.

> +
> +  "#phy-cells":
> +    const: 0
> +
> +  power-domains:
> +     maxItems: 1
> +     description:
> +       a phandle to respective power domain node as described by generic
> +       PM domain bindings (see power/power_domain.txt for more information).

Drop the generic description. No need to duplicate everywhere.

> +
> +required:
> +  - compatible
> +  - reg
> +  - resets
> +  - reset-names
> +  - "#phy-cells"
> +  - power-domains
> +
> +examples:
> +  - |
> +    usb2_phy1: phy@40000 {
> +      status = "okay";
> +      compatible = "amlogic,a1-usb2-phy";
> +      reg = <0x0 0x40000 0x0 0x2000>;
> +      resets = <&reset RESET_USBPHY>;
> +      reset-names = "phy";
> +      #phy-cells = <0>;
> +      power-domains = <&pwrc PWRC_USB_ID>;
> +    };
> -- 
> 2.7.4
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
