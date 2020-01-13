Return-Path: <SRS0=Ohoh=3C=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B029CC33CAF
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jan 2020 23:37:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A7C820CC7
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jan 2020 23:37:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R4kevM2y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="b/ab/jdX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A7C820CC7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3FbswrqX/VyicJ3vPov56rZkhubS36appvrzpfWJwnM=; b=R4kevM2yf8iGxo
	YmA/xh1UDQxDgF7n9xUhvAQnRKFh06gV/uOg6lq71MW1cCUlQLkLeUMAGQVPglp2rT6BFshiTYosy
	WattSkldiZFPzavWwYqzGtkZzpJU4yuZsUk1QsWWysYELwMHQhjrhG8Yuqi+7lJ2NRfwWMtjEZG5D
	eQlePnnjcds2/7jescZ4l+jMQTzPKxikDilii6OGEpwnpeBPpMZpEuClmunJ4F4XdcNOgior0jfXB
	auhy/qWF6cQwjLpUN0H7SM0VFVvtx6BOnWRCDKwV2rFHXaWrB2ddJeTQKlDk2HbL7A6FdFOqT3VtL
	FR88s6dmQuFac24zSp2g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ir9Gd-0001FR-Jj; Mon, 13 Jan 2020 23:37:07 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ir9Ga-0001Di-1m
 for linux-amlogic@lists.infradead.org; Mon, 13 Jan 2020 23:37:05 +0000
Received: by mail-pj1-x1043.google.com with SMTP id n59so4987471pjb.1
 for <linux-amlogic@lists.infradead.org>; Mon, 13 Jan 2020 15:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=URU0nYVVIvG9fQe+g2UcCIBs+6Op8N6XSVfeKx2sX+I=;
 b=b/ab/jdXLWIU3ED09YHc4yD7PEZYMen7BL6s7F1/kjYZZ83fH7thRSgRFb4nvmHi9+
 I8uOh4axY1udmFUQ9CRB6Ak22NsM0Q5kOUrMSui9gEu5AZwkkiQGPJxHY4Ek0jT/BU7x
 dN3GGRtSBhufBlwxACNUPr6YqSRNplN/UB1VyIzSrV23VJ/BxtF8x8jOUP/NEUxtfkff
 VucOsF7idPxxRbVhU5/fTAEEDTXLWM6GxHyPAO3/NDMx+eTcgWfIn5rfkPyTksPsZSjP
 e4eZNbaY5gv76V7loiTc0SQ3nvjtNOKckOayZ/Icwb44Nfq+t/qB4ZXVB/jumkX3KfWa
 mBoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=URU0nYVVIvG9fQe+g2UcCIBs+6Op8N6XSVfeKx2sX+I=;
 b=XZmZ0obaypK+ixKsT2G18L1x3gVdKG+18/ueWJ5c55sjN8qjuQJU3662nM56XlF26Y
 Fxw57fN/O4cOzOqOyXeLdYHuB7tqzVXzee5Yq69i+t9qcug0k56muhb8HcrjNXPnPPWF
 J5xPIOrsorSNCp8Rp4NRkdErGsTfzyDE6RVUl7DKwDohCoLJu4aMu/BjjpQafNDSEG2S
 X5smmWJPCUvmCyfDH4DHnHqZp/kkuQeC8lQ2hQP9OtkBin75eaZOaphdC3crSvecR1hk
 QRFQNtbgdcPudBJ9Tnfun0jl9t3empFH5U+D59niIWV3WqY9GhmDIUMypuDW/pMXU/TO
 eLRQ==
X-Gm-Message-State: APjAAAX3b1m1TWVGFReeC2xu77u/wNPEgcO8Bqhxk7LB3E5a/sguI7hd
 7fT0py/TdFbjApCtLjH6sjH/5A==
X-Google-Smtp-Source: APXvYqzCuoCV4QA2/uQQXAdoLv7iqVZ5/gY2tfSqNNG6zeLXktzaA9OsR+piF0ld/u9H+WkLG6qR5Q==
X-Received: by 2002:a17:902:bf0a:: with SMTP id
 bi10mr17117837plb.324.1578958623194; 
 Mon, 13 Jan 2020 15:37:03 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id q15sm14613132pgi.55.2020.01.13.15.37.02
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 Jan 2020 15:37:02 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Jianxin Pan <jianxin.pan@amlogic.com>, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v5 1/4] dt-bindings: power: add Amlogic secure power
 domains bindings
In-Reply-To: <1573532930-39505-2-git-send-email-jianxin.pan@amlogic.com>
References: <1573532930-39505-1-git-send-email-jianxin.pan@amlogic.com>
 <1573532930-39505-2-git-send-email-jianxin.pan@amlogic.com>
Date: Mon, 13 Jan 2020 15:37:02 -0800
Message-ID: <7ha76rdj35.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200113_153704_227532_863E454D 
X-CRM114-Status: GOOD (  11.30  )
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
 Victor Wan <victor.wan@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
 linux-pm@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jian Hu <jian.hu@amlogic.com>,
 Xingyu Chen <xingyu.chen@amlogic.com>, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jianxin Pan <jianxin.pan@amlogic.com> writes:

> Add the bindings for the Amlogic Secure power domains, controlling the
> secure power domains.
>
> The bindings targets the Amlogic A1 and C1 compatible SoCs, in which the
> power domain registers are in secure world.
>
> Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
> ---
>  .../bindings/power/amlogic,meson-sec-pwrc.yaml     | 37 ++++++++++++++++++++++
>  include/dt-bindings/power/meson-a1-power.h         | 32 +++++++++++++++++++
>  2 files changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
>  create mode 100644 include/dt-bindings/power/meson-a1-power.h
>
> diff --git a/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml b/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
> new file mode 100644
> index 00000000..2ed269f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
> @@ -0,0 +1,37 @@
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
> +required:
> +  - compatible
> +  - "#power-domain-cells"
> +
> +examples:
> +  - |
> +    pwrc: power-controller {
> +          compatible = "amlogic,meson-a1-pwrc";
> +          #power-domain-cells = <1>;
> +          secure-monitor = <&sm>;

As requested by Rob, please put this under the secure-monitor node.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
