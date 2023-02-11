Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D2C3C636CC
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 Feb 2023 20:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M818tqShD18t5Vtzt57arShNgvWxsyzQapEF6Sd3xjI=; b=rMgNcRlAO+MrVp
	F/Am+Robxk/yQ/dAiIuSpVE1VP/xXFcjXsBqs55mP0bcmiMlkAFHM+DoR7P3VxpAmYGrOfxMkw/h1
	NgxLJYsToYpCPGdA46FxefWSbLJZUeoRjHMJ1eUXePcLwM2tFh6q4k7J6UFkSwtu0bMWERks8XvrO
	1KoaUE6RWAwN6DFkcBjRVrCZKDWYSFV1dk/Gyo7WUrE1Q/Z14XkWmPxG2+51LGZs/rVY/3todAURK
	m3kwCdA8GWA/M+BN6eVissUFK5XxDec+qyQG7qBD0s96v1DQ0cdf7NsBc5XeZfnZXm5FoKR0vx+iZ
	1egge1U1jX2PEmIsrBDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQw9O-00AGnr-EU; Sat, 11 Feb 2023 20:07:10 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQw8v-00AGVQ-8C; Sat, 11 Feb 2023 20:06:42 +0000
Received: by mail-ed1-x535.google.com with SMTP id a10so8268453edu.9;
        Sat, 11 Feb 2023 12:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rnqh2DLP0np8pTj2BQOmeoswoqFE/C1tlKJL7Qk99hM=;
        b=jqa03l//+OZWkVyEyhhu3gyjhfV9r2RVrkv1RbDe5GvohjbXjGBxXW+8rYm79v41nL
         hM+3DHLNREFTd0LZ08PHOH2dQS/TdEs7BHlXcxLUJ0NBVWUtadArp88KxqOHgd81IlX8
         96Jw4KRqKQch+/NbX7fztSygE18gsupVnXmsMBulOf4KwALB1knlC1AhStNeonF/J9g0
         2fIlUyjqX4iMHeeOU4hY2CYITKc5KR0jvsxIxy6ORBU8KKfQi3duPKQqCLEnzeLZ9sAp
         x2Bdv5ch+vcS3+do/Bt6KQA7nBDCe0cpg2VWBxwoCo3Jji/88e1pi3EwSpFZxO/4Pa2n
         6xCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rnqh2DLP0np8pTj2BQOmeoswoqFE/C1tlKJL7Qk99hM=;
        b=1HfdpBGqyVh+0QPxp+8+Tr4S+4+IwFWxZDMzt85oDM2royjbwDR2upJJQg/z1lHaUZ
         SQOHdwTbf6itDuelikNeRhQp118Z7fwLMykaAB6sxCr4/LmzKihCibTKzkNsjIFcTCUz
         Q9B6N0gkKYOQBYGzFmV1ArmsI/J2DwP9D/O+DonvT/uWBciCo6ZZVsoWz7kiW9/jghao
         Lgzx3m8brN5dHtTzDLjyw2BZzH4V06GPlBhgAs3dI3wQGY1LBayfkCkRjqVps9pe8tgV
         VLapthnyoIqmGYz8cqVrG22Dzxv0Xa/MSmgEwdYApZQ0hzt+FgEgTey7HuVrnXWPnxYd
         422g==
X-Gm-Message-State: AO0yUKVtVMypO8nwMg1VQI0sgtilq19vLGeWrKLLFHG4LFAyrvOxFNDS
	+QCXo4zbj8TBhCZolPqSvtsqy/M7vTlSPrbBZgOReG+pVsY=
X-Google-Smtp-Source: AK7set/vi99W3ZhR0iZH1E7CNMEgROCLeXaJIwHv4BojbNk9z4azaJ6NweCU9GbZaJmaAUzeji4SHBl6OptG89Q1as0=
X-Received: by 2002:a50:9ecb:0:b0:49d:ec5d:28b4 with SMTP id
 a69-20020a509ecb000000b0049dec5d28b4mr4808743edf.6.1676145999968; Sat, 11 Feb
 2023 12:06:39 -0800 (PST)
MIME-Version: 1.0
References: <20230207-b4-amlogic-g12a-usb-ctrl-bindings-fix-v1-1-c310293da7a2@linaro.org>
In-Reply-To: <20230207-b4-amlogic-g12a-usb-ctrl-bindings-fix-v1-1-c310293da7a2@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 11 Feb 2023 21:06:29 +0100
Message-ID: <CAFBinCBHNTj_NAJ_PgProduVdi0BqUvzYLMfMzEjWsUniVJdRQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: usb: amlogic,meson-g12a-usb-ctrl: make G12A
 usb3-phy0 optional
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Felipe Balbi <balbi@kernel.org>, Rob Herring <robh@kernel.org>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230211_120641_357527_1C4964F5 
X-CRM114-Status: UNSURE (   8.70  )
X-CRM114-Notice: Please train this message.
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

On Tue, Feb 7, 2023 at 4:02 PM Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> On the G12A USB complex, the USB3 PHY is shared with the PCIe controller,
> thus on designs without PCIe enabled the USB3 PHY entry can be ommited from
> the PHY list.
>
> Fixes: cdff2c946f06 ("dt-bindings: usb: amlogic,meson-g12a-usb-ctrl: add the Amlogic AXG Families USB Glue Bindings")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
