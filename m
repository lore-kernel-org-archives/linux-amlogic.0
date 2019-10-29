Return-Path: <SRS0=U197=YW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB4D6CA9EC0
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Oct 2019 02:01:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C303217D6
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Oct 2019 02:01:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HB22oK6m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C303217D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RccCft9Lys0QWf3WDFvzZ9oK3c/RgaqYmIAgs0fKLG8=; b=HB22oK6mfXm/qf
	gd9jphUX1KgP721ljZJtOIFzA1R/XvA5Tl1gIsHndP2KHHknj1ZKc8BFmStHv7XFGG8sMnpexxQ0j
	G6sXEHAbtVTb823JWtJIi2pLSg/Wn74D7sW0+9xdZyk+nuUYbWSWxZ2Nqkxly9Uyc/hdxeNePmXrC
	CU6FsadwblZgeKAL5jbsvHHmlf2F5aDK+aVkSQi3DVz79t6wfgdRJEJ6Jnj328Vg5DO3OU5atta2Z
	QAtLMi8ibej2pfi9XA1EhxGLT2D/QMXP3y9BVFYmnT5OtUEELf9gbmauxREOtpAQanB2VAuULuIXw
	IHD2U/8PTvL66ELsP0eg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iPGp8-0007x3-HY; Tue, 29 Oct 2019 02:01:30 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPGp5-0007wf-EK; Tue, 29 Oct 2019 02:01:28 +0000
Received: by mail-ot1-f65.google.com with SMTP id d8so8432671otc.7;
 Mon, 28 Oct 2019 19:01:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9BL3Z1A/tEWwa5UAepvAQv367j/DZhoKZ8WMU7Awauw=;
 b=FTO4HIsymhPnvmIP3V3xSuzraosE5G+961JtvbVj+HsoIr2QHKWL5yzfQTW/cyIFAS
 QrEyoi8Nb0jsPRibPqAyS7rZ1Z6CBw6WJ5zmKXAxySOIZu9EqXFWxzNl8txrLV84Iu7h
 d9f1RTlfIuYNlGiG4i81K2/Kcxff1UC3BBrbp0U9H6k2snUZvhaKhoxJZFbrjjZyq0h6
 xi8S3o+UZgLxun3M8VNmI/iRfu+XcuvH/618QfoDlXdgRmgwEhXi1Ccm4q9dmcBiMlBW
 q9wc0+yPsJir/p3svMrJ3Z+EZYyXuZYtwT11feu2tFPVYWb5A61lXIVSE5kqQWM9Zpcd
 FszQ==
X-Gm-Message-State: APjAAAVXT4IXOd8j6U3yKHxPPzfs9BY3dGfxLNv2tTuyRSgRDBRFZlUi
 TTHPCxo3JdbrayXuvtdIKw==
X-Google-Smtp-Source: APXvYqxTMdckI8FQ4OvetDPaspVzeYA6kfan5ggpGK9XdwPtUCWnW0VVdmXnlKq6EvrM8Js1EYCC2Q==
X-Received: by 2002:a9d:538d:: with SMTP id w13mr15641639otg.184.1572314486742; 
 Mon, 28 Oct 2019 19:01:26 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id h17sm2203144otr.53.2019.10.28.19.01.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 19:01:26 -0700 (PDT)
Date: Mon, 28 Oct 2019 21:01:25 -0500
From: Rob Herring <robh@kernel.org>
To: Jianxin Pan <jianxin.pan@amlogic.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: power: add Amlogic secure power
 domains bindings
Message-ID: <20191029020125.GA11182@bogus>
References: <1571391167-79679-1-git-send-email-jianxin.pan@amlogic.com>
 <1571391167-79679-2-git-send-email-jianxin.pan@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1571391167-79679-2-git-send-email-jianxin.pan@amlogic.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191028_190127_480186_07978C1F 
X-CRM114-Status: GOOD (  13.56  )
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
Cc: devicetree@vger.kernel.org, Hanjie Lin <hanjie.lin@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>, linux-pm@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Jian Hu <jian.hu@amlogic.com>,
 Xingyu Chen <xingyu.chen@amlogic.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Oct 18, 2019 at 05:32:44PM +0800, Jianxin Pan wrote:
> Add the bindings for the Amlogic Secure power domains, controlling the
> secure power domains.
> 
> The bindings targets the Amlogic A1 and C1 compatible SoCs, in which the
> power domain registers are in secure world.
> 
> Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
> ---
>  .../bindings/power/amlogic,meson-sec-pwrc.yaml     | 42 ++++++++++++++++++++++
>  include/dt-bindings/power/meson-a1-power.h         | 32 +++++++++++++++++
>  2 files changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
>  create mode 100644 include/dt-bindings/power/meson-a1-power.h
> 
> diff --git a/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml b/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
> new file mode 100644
> index 00000000..88d8261
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +# Copyright (c) 2019 Amlogic, Inc
> +# Author: Jianxin Pan <jianxin.pan@amlogic.com>
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/power/amlogic,meson-sec-pwrc.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Amlogic Meson Secure Power Domains
> +
> +maintainers:
> +  - Jianxin Pan <jianxin.pan@amlogic.com>
> +
> +description: |+
> +  Meson Secure Power Domains used in A1/C1 SoCs.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amlogic,meson-a1-pwrc
> +
> +  "#power-domain-cells":
> +    const: 1
> +
> +  secure-monitor:
> +    description: phandle to the secure-monitor node
> +    $ref: /schemas/types.yaml#/definitions/phandle

Like the watchdog, make this a child or the secure firmware node. Or 
just add '#power-domain-cells' to it. You don't really need a child node 
here if there's not other resources in DT for this.

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
