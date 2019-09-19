Return-Path: <SRS0=mQoY=XO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE97BC3A5A6
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Sep 2019 20:07:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA56121920
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Sep 2019 20:07:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QwKtCWmH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="f8nGhVnv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA56121920
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rdRqELUMklPlv1GqvpD+MjNpPKsQuWSG0A33iKV3kOg=; b=QwKtCWmH/vgD7+
	suxTdbPLE4s7T2mtPCi2OxAgCEgGIBpRet/C+bxj6LQgORGoYc0/8vkA7BpkEuCzxTdu8t88f5lUN
	HrHqYEgJjdTYuzCNZrjpjP6yy3JXC+qv+G58FmypZQqvO/C6xEGzxrglCoCWlxGNFKgf+S0BSCB9d
	IPWd3odw4fdzCU5aOwMFO1Fyk2JI13coSMkGKthB59Y8IoCKCWijytbAwEmHTWfiyOjWdLiyIFo30
	uRqluOkMS0Js0W22O9S9gJLP3tI6NAvgf3qx0umpol2t/PKc16+shHVbj3Ub1Cb0qW93ROGbHXn9h
	xrgMmdbsgdIjL2CGHV9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iB2hw-0000So-AS; Thu, 19 Sep 2019 20:07:16 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iB2ht-0000Rw-9Z; Thu, 19 Sep 2019 20:07:14 +0000
Received: by mail-oi1-x244.google.com with SMTP id x3so3875653oig.2;
 Thu, 19 Sep 2019 13:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6SLgslheBeIIJex/gf/ZVhEBmirzOWHGUduUXl+JfS0=;
 b=f8nGhVnviG2KbGnxig/mqrpCztbeYB17qB2d4v8zgIMpIo21id++eyGrhRa7Hetlhu
 1uIaChRD0JXsIkhaEnLlOVilPn+4x4RCBwn4qftOj/Hn1jiDkcWSr9iSRfpGqYg8IPyg
 p6KZ5T0M5XXE7g4URtoFpVBwAr8qDD1kwXGZhmKQ5TN4D/ZBt9h1HabeDijheKoZ1Hq6
 Am7QREthxBCAoFRWZlZc9Dn8FvVmj/Ct4TgYQLr4ctdbmmcuJtv86n7ETES+bEZxL1mQ
 EVg7zzKRiWTN263W8ohXIHHzWdDRk8eIf0Lm/Lzn+chRgIy7X91h9B9AXapeP4UZEFK4
 1Pqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6SLgslheBeIIJex/gf/ZVhEBmirzOWHGUduUXl+JfS0=;
 b=AcyYme7yJ1Law1KbndDhz2QavFWpT+HJVp4zxtL+aSzGHdNA1XNWrgbGpEcCrtSJ47
 p7VMH/RYeY5LgU33Rj4nqs3gNGSbA4Azms0c+h7wTSOVbE1raO0rsgVwqRJ3EGM6fj/e
 hxHWhcPMr84dCjjroW4+eWtHlQiaFTCs/JZ9dijgsUplB8O4s5gsnpSX7CWEGPPzNhJH
 IWIXtnw3NdSOWT/hE+7CDKbKqx1pIH6iiDQXHC1Xdvp42ts4ilxkWvdQgk07kqbrsf7b
 Go4v3Hox49rHEQ5yksLmjvgQs9wscFIqrqU9ol9ox4R2SUsfxx0sVlIyIvk6sbU1Mghh
 xJcw==
X-Gm-Message-State: APjAAAXXU6NROptocjgVNxICbVETZnLe7p9TRzvxYjDwZdlffFf4xUJR
 0jcCMgQeaRwHgL6SHA7CHnKQSjeIGJ6d8MeZTEE=
X-Google-Smtp-Source: APXvYqxs8KaOnta4oS+qOBnum0sYdK4kwfRs3AjdmxE14hPdeI3PYvm+RSVJQcA/eiB1hLB6FfwDBOgY14u/8HhKXfM=
X-Received: by 2002:aca:3ad6:: with SMTP id h205mr3915280oia.129.1568923630403; 
 Thu, 19 Sep 2019 13:07:10 -0700 (PDT)
MIME-Version: 1.0
References: <1568895064-4116-1-git-send-email-jianxin.pan@amlogic.com>
 <1568895064-4116-2-git-send-email-jianxin.pan@amlogic.com>
In-Reply-To: <1568895064-4116-2-git-send-email-jianxin.pan@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 19 Sep 2019 22:06:59 +0200
Message-ID: <CAFBinCCxeYgso3WQWqNgWUwwCM835uo_6FftVv0YwYTFJV2Ovw@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: power: add Amlogic secure power domains
 bindings
To: Jianxin Pan <jianxin.pan@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190919_130713_337560_B68C096C 
X-CRM114-Status: GOOD (  14.32  )
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
 Victor Wan <victor.wan@amlogic.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Zhiqiang Liang <zhiqiang.liang@amlogic.com>,
 Rob Herring <robh+dt@kernel.org>, Jian Hu <jian.hu@amlogic.com>,
 Xingyu Chen <xingyu.chen@amlogic.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jianxin,

On Thu, Sep 19, 2019 at 2:11 PM Jianxin Pan <jianxin.pan@amlogic.com> wrote:
>
> Add the bindings for the Amlogic Secure power domains, controlling the
> secure power domains.
>
> The bindings targets the Amlogic A1 and C1 compatible SoCs, in which the
> power domain registers are in secure world.
>
> Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
> Signed-off-by: Zhiqiang Liang <zhiqiang.liang@amlogic.com>
> ---
>  .../bindings/power/amlogic,meson-sec-pwrc.yaml     | 32 ++++++++++++++++++++++
>  include/dt-bindings/power/meson-a1-power.h         | 32 ++++++++++++++++++++++
>  2 files changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
>  create mode 100644 include/dt-bindings/power/meson-a1-power.h
>
> diff --git a/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml b/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
> new file mode 100644
> index 00000000..327e0d9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
> @@ -0,0 +1,32 @@
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
> +  A1/C1 series The Secure Power Domains node should be the child of a syscon
> +  node with the required property.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amlogic,meson-a1-pwrc
> +
> +required:
> +  - compatible
> +
> +examples:
> +  - |
> +    pwrc: power-controller {
> +          compatible = "amlogic,meson-a1-pwrc";
> +    };
not a comment about this binding but about the secure monitor in general:
there's a recent discussion about the secure monitor in the nvmem bindings: [0]


Martin


[0] https://www.spinics.net/lists/arm-kernel/msg750010.html

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
