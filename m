Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D015C636CD
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Feb 2023 07:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=60pnzDKvoJb7F25HSt5LfNGZVMsomWUpfsP5t2Bx/TE=; b=qxPeA/zeBBzwbjIQ/uEmAnqtOp
	GiZm+I7/tmp7kwFpbUan6tlMvkxlh+Leaxvb+tiaApY5GLLkEl2vszBX+g7s/L3sQ1skS78CxlG2o
	FS7gS7pBn8xLeOJh8uXJWm6nRVrPtVgmLZEWgcY0yxJ1+BC4UVw5jTpc+tZqguWDDWwyE+/pvWYmD
	SA10d26RbsBwfe6DMzwjkCCf+q9hJ/MKy7hhNP6r5fqwI/XpAen3Snay2QnctW9ZToVLdXvxcPbV4
	OjWAhdDTCI/0ESRv6BZ5wRYwJAxpKbhDFRp0cO/5R8guSGVn5RkUrS4o+VJ4ljykX7yLOec4+eAgZ
	xDQcVj3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQOJe-004h6I-7l; Fri, 10 Feb 2023 07:59:30 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQOJT-004h3c-LF
	for linux-amlogic@lists.infradead.org; Fri, 10 Feb 2023 07:59:21 +0000
Received: by mail-wm1-x32b.google.com with SMTP id bg26so3223676wmb.0
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Feb 2023 23:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+XjYK20Z08CMJ61Ae3bO9K0sPsABFePhKjoRZaxPj0w=;
        b=FwTQagCqHZBABtqT7c2YOwFGXCN4n/i8P6ss2C3cdcne9PvIgZ/n8RNBzfdYdd5Si8
         Pv0dZMkhvEzjYq1/ZvR5aM17Wa8lfkRaxx+zKN31zB6lqcxxvx/ghEx7UXpyKE07uVYd
         R5jmmUgGvEP21U38aEB7bWT/JGCDAF/YywEOCMtkVkloY+NC0nZJXF4GxE141qiTx8iB
         hdSn7Irwyzgwpsqw9CppmGO7ctpmJqS1jxRHQxDtGxr4Whih4Pt1j0nJ95qemacPqyq/
         AJCkDQXp+PGRV1RlvHdcfWXRnP+C6+GFFvrwm8q3B8xBUqKhJoJr/TcKZ2ckVA6UODnE
         MamQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+XjYK20Z08CMJ61Ae3bO9K0sPsABFePhKjoRZaxPj0w=;
        b=0RVo1qyqyuGGLcaDLgljcnHEEYKjgvKQEwb2KjX0lv5x1kZfVGORkJThRVZu9p+llT
         aDdvi26XQfqYI7crqZrUB7P1Xpw3ykTtfHAGjBbXgiTd7b3u7raBpTJ5GA+9qBmSzZiH
         RVd9nT6/aeuMfDE1bdEsQifutpRwa9foilp9MEr6WciiEVcwtIPZ4hq1xvNiP5roMosZ
         hoDWslCMU+SIjTI4AmlKYi5IqntoVK/Ak5w2kHkAkYeNGVLiVYri86RTd2boExhCo+iq
         xplFk7lrzNCe21czOSEgAYgVsOo5Q3sZwarJ1RGvVd02VBMO0xOKfOJLeql+UmPWW/jY
         zPVw==
X-Gm-Message-State: AO0yUKWSZwPciP/EJLykDeiRVX2L2sdNqYWiiPHnK1oETHouAcffPdSL
	AT5q4leSZOAhUX267Id/cOWwZg==
X-Google-Smtp-Source: AK7set/m1cnuBqZci0vEZGzyB1pxqMFjdCFZt8wrHM88utT0HRNglMauCq2td0Bpzoz6YabJk2s4iw==
X-Received: by 2002:a05:600c:1819:b0:3dc:58a2:3900 with SMTP id n25-20020a05600c181900b003dc58a23900mr11965948wmp.29.1676015955694;
        Thu, 09 Feb 2023 23:59:15 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:5a65:5553:55cf:3027? ([2a01:e0a:982:cbb0:5a65:5553:55cf:3027])
        by smtp.gmail.com with ESMTPSA id o41-20020a05600c512900b003dc4aae4739sm8320580wms.27.2023.02.09.23.59.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 23:59:15 -0800 (PST)
Message-ID: <b3d972c8-6230-c818-7e80-968996985ac3@linaro.org>
Date: Fri, 10 Feb 2023 08:59:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/3] arm64: dts: amlogic: Make mmc host controller
 interrupts level-sensitive
Content-Language: en-US
To: Heiner Kallweit <hkallweit1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Nan Li <nan.li@amlogic.com>,
 Vyacheslav Bocharov <adeep@lexina.in>
References: <8a99341b-8546-8f90-c9a5-087d927cac48@gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <8a99341b-8546-8f90-c9a5-087d927cac48@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_235919_784636_8A197259 
X-CRM114-Status: GOOD (  11.66  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 09/02/2023 21:09, Heiner Kallweit wrote:
> The usage of edge-triggered interrupts lead to lost interrupts under load,
> see [0]. This was confirmed to be fixed by using level-triggered
> interrupts.
> The report was about SDIO. However, as the host controller is the same
> for SD and MMC, apply the change to all mmc controller instances.
> 
> [0] https://www.spinics.net/lists/linux-mmc/msg73991.html
> 
> This series replaces the prior "TEST"-annotated patch.
> 
> Heiner Kallweit (3):
>    arm64: dts: meson-axg: Make mmc host controller interrupts
>      level-sensitive
>    arm64: dts: meson-g12-common: Make mmc host controller interrupts
>      level-sensitive
>    arm64: dts: meson-gx: Make mmc host controller interrupts
>      level-sensitive
> 
>   arch/arm64/boot/dts/amlogic/meson-axg.dtsi        | 4 ++--
>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 6 +++---
>   arch/arm64/boot/dts/amlogic/meson-gx.dtsi         | 6 +++---
>   3 files changed, 8 insertions(+), 8 deletions(-)
> 

For whole serie:
Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
