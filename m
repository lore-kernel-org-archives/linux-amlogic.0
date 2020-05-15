Return-Path: <SRS0=wX20=65=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AB2EC433E0
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 May 2020 06:43:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DB7A2065F
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 May 2020 06:43:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="boFFABKa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=verdurent-com.20150623.gappssmtp.com header.i=@verdurent-com.20150623.gappssmtp.com header.b="pD/NsOHg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DB7A2065F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=verdurent.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S+GJRtxSUOVhHWd4WbL/hU5wuOYijPiKXXtDp2cAOFk=; b=boFFABKaFPZLsv
	ZHvk0s/tFPS8rSJDS7vyUah3pf5cltRZB+IX3sg0Vyg2ZUkb/3lEA0swEpnsE88BIEE2h/yztEE3z
	B8jJCPszc1JyoF6/R6pI3lrYHUGQgS15KxBq4L5qMy25FOFP68RZ+WdGNJHwe6/ZfwS9RgAkfSIh0
	d8F2VqnIQncrqyTjKUrd7IwwbbLU8o+iEkUnISFUvo/8p/xO8O2EcOknhhtkNpQ5+mHoboDCpwgOH
	bPB+Q1zm6Bes3NfVzaJaM3Fgd/qfuYWNQ0Je8gh+DcVWb0SJ9asO8gQVztHfZiCfL2PotjVe4xgfp
	7IPwiaifNUUuAFtl7VMg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZU47-0003pR-90; Fri, 15 May 2020 06:43:27 +0000
Received: from mail-vs1-xe43.google.com ([2607:f8b0:4864:20::e43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZU41-0003nV-BP
 for linux-amlogic@lists.infradead.org; Fri, 15 May 2020 06:43:25 +0000
Received: by mail-vs1-xe43.google.com with SMTP id v26so614765vsa.1
 for <linux-amlogic@lists.infradead.org>; Thu, 14 May 2020 23:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=verdurent-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3u5biufGGoeHTr+TJL8nbm6kBJzdWnn/M3v0cfmw50s=;
 b=pD/NsOHgg9RiRzrmFZckLGgtKv4FNpjz6MHbVkQ9V5iKpGCmFLdD9+7u8AzgIJdOUx
 iLCRHKLZI6aJmLhCA4u/iuIgKUKWvgytv6eplSb4xpChzRdJZswwqTH+RGOkhfavvGxG
 9OqNaw3NjTjZyC88sDBbY/jwaH0osejduH/BQCz1vkUPR5thEUYmREH+nTWqA7nntaIY
 a91o5rJlHh3HrATc0gEZ14PJ7r4t+orDTaS7hQY6HaL8OQUj7ZESKlpDmHICKJ9Uwlxq
 TUnqSThoi6EzywAYWhMr/iHqiGIiOxZSwA34a4ST8G9x+/PeaFtKmyUNT/jJUwlFjN+g
 212Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3u5biufGGoeHTr+TJL8nbm6kBJzdWnn/M3v0cfmw50s=;
 b=mHbhkUNuxF53U42eh/gBh6YdHVEzyQLbw/dTwqspKG7EmA/z3TjEU2+jfP53RbiEnF
 YaIghqVUpJJobJpMH+x7vigNR246IqJt+r31jE8/Dm/pvmsQyXbm40p4AVRGjWxuKUh7
 FYH/S4nf7tI0DNdG7k6gLnf+M/VBK8VV6KkwWXuSEdh+6gbBPnkGar1Ho7uj+o+DBeLf
 Z/lCaosjgz6SU4RPY3q3XbkTgEAYw6y1KtNR1LmXSdb4AWXP4Q1MAAsaf+4uFD+DMVxF
 i7AZ66xMJr+AQ9e0iqo+FRTu9T+F6P4b8y2SQik2wyJ+j73kQz9vuutVwbYoiBj6IO4s
 ibBQ==
X-Gm-Message-State: AOAM530PQV/uJ1N1WRpUNX8OImg5AvsHWA+jAPpJ4fjDEYkgEthxVfXT
 HyNlwp8LWeCaOo/fA1SpnJ2m4WnonZ25rcuv617g7w==
X-Google-Smtp-Source: ABdhPJz1EnXjRX110fk6oUizGR6vyVuia3mcnLi7d3Ga6JMGWl+PQ5YITnQDF2FwN/zC8y0AEoQFGDiVNZgyE8UHtf8=
X-Received: by 2002:a67:42c6:: with SMTP id p189mr1528692vsa.9.1589525000316; 
 Thu, 14 May 2020 23:43:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200512132613.31507-1-narmstrong@baylibre.com>
 <20200512132613.31507-2-narmstrong@baylibre.com>
In-Reply-To: <20200512132613.31507-2-narmstrong@baylibre.com>
From: Amit Kucheria <amit.kucheria@verdurent.com>
Date: Fri, 15 May 2020 12:12:39 +0530
Message-ID: <CAHLCerMP2m1BfzNGoOzOe=4_zYr=i-kXOXnJ_WTN-f1L4N7SUg@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: mfd: add Khadas Microcontroller
 bindings
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200514_234321_395591_3C3EE8D3 
X-CRM114-Status: GOOD (  14.91  )
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-amlogic@lists.infradead.org, Zhang Rui <rui.zhang@intel.com>,
 Lee Jones <lee.jones@linaro.org>, Rob Herring <robh@kernel.org>,
 lakml <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, May 12, 2020 at 6:56 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> This Microcontroller is present on the Khadas VIM1, VIM2, VIM3 and Edge
> boards.
>
> It has multiple boot control features like password check, power-on
> options, power-off control and system FAN control on recent boards.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>

> ---
>  .../devicetree/bindings/mfd/khadas,mcu.yaml   | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
>
> diff --git a/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml b/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
> new file mode 100644
> index 000000000000..a3b976f101e8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/khadas,mcu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Khadas on-board Microcontroller Device Tree Bindings
> +
> +maintainers:
> +  - Neil Armstrong <narmstrong@baylibre.com>
> +
> +description: |
> +  Khadas embeds a microcontroller on their VIM and Edge boards adding some
> +  system feature as PWM Fan control (for VIM2 rev14 or VIM3), User memory
> +  storage, IR/Key resume control, system power LED control and more.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - khadas,mcu # MCU revision is discoverable
> +
> +  "#cooling-cells": # Only needed for boards having FAN control feature
> +    const: 2
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      khadas_mcu: system-controller@18 {
> +        compatible = "khadas,mcu";
> +        reg = <0x18>;
> +        #cooling-cells = <2>;
> +      };
> +    };
> --
> 2.22.0
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
