Return-Path: <SRS0=FAU3=J6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0AFAC433ED
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 May 2021 15:06:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D592E6121D
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 May 2021 15:06:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D592E6121D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:In-reply-to:Subject:Cc:
	To:From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4igyiMWhiSsgjOe7wdIi8xmF++ZIQ1Lr+s6vnxNjoTg=; b=LD8e3zfd7w4MQS92AwA14ii0Q
	2tpE1COX5auOPcgOmA0+V7Vp8U+Fz/KOZdptlM7nnaeBJWWl283wCSfXh8vuVUYLtKK4j76SA6snA
	rUB3OMMrPGSvXAN9eK0D3N4HtvIUPgpMx6feJE2EDX8BrMIoJ9Zb1eT7RmK10C13WzrlRZl54TgLi
	nsDjA6TyDsuN2pKY/NTKOH4vx7vocu60AYfUaalvjjaJeu7M3bfEXbqsIpLstcLTpBv6Hivdiy0ol
	dG9BczAlV/dtKoQa+sYy6GiX8FQeQN27kCde7Jx1y8/cY+A+bIpDzY4OJYTGQTsDrmSwIopUv40yK
	kOoVhQrgQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lda8x-00EAuc-03; Mon, 03 May 2021 15:05:55 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lda8N-00EAmn-TU
 for linux-amlogic@desiato.infradead.org; Mon, 03 May 2021 15:05:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Date:
 Message-ID:In-reply-to:Subject:Cc:To:From:References:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=kkLHrS0ofkE+YRgADp77s8W+PKn0GKptcBr+B7OS3xA=; b=kNtAyvUO8VuHx7eFdzPqMYefvt
 nEwq4RQr2A8CNYDHxloi9TXl0xSqqofWUNnEwVYxWBUz99FplcOFqKjd9vK8zsW6NAug3N8A1HVXn
 B58IpsoqR5gd7og0CJxlDSbjQ1R4AmnlN3ORptShgIysuJKgImH8l7tzI58BqHVBQY8zqvaULnhle
 zML+qM+CDo6247lwgBVY6b8Z8YQ+PQCRTanAukxxB4lgLGeZeZNvtDzAnSHzqz5KEAwdVhztCX1cG
 2UMecvwyxsIZna5wQZ0vXkYErFIZPGKBJQFBUt1kDXdwKipUnTcLM6EQeS4exruh3sxHBs7YJEx50
 YS1KpjeA==;
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lda8J-0039f3-M9
 for linux-amlogic@lists.infradead.org; Mon, 03 May 2021 15:05:18 +0000
Received: by mail-ej1-x62b.google.com with SMTP id u3so8329876eja.12
 for <linux-amlogic@lists.infradead.org>; Mon, 03 May 2021 08:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=kkLHrS0ofkE+YRgADp77s8W+PKn0GKptcBr+B7OS3xA=;
 b=dSvcMix4NZkdXHKFvMmFcsvN8T+XeE4OhpbGEP9vYPvXYf+Wp0r5/hj4/TbToYCGbC
 JH4S19mCIJcLHiN9Wf++jtFjQW8B7LBqG3QVQDhH8VBDHpHoz6qWJwQZVxfHTR4vdwtO
 CCWkCYV6I1e7B2BClyWRuLi0P0RL//c5+7SsdLHtXMmc0MyYE+2b+Yud9HgTEOfZtnyo
 a5kf+mbUbaSr0Jd9mVLdWVKvIbj+wbhZOXCacSRAdwzUrlqOeMIduH0sXQJ82s+5oJ3T
 mOMcA+XTmE1a1O5d/xuF+2nMrBcOsm4vLvTuAxj2IrSzO57ATvc5znWOisq5iFmV5v/u
 pF5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=kkLHrS0ofkE+YRgADp77s8W+PKn0GKptcBr+B7OS3xA=;
 b=ZNP/2Ic1vu7rqVrOmnTtPfCI7xwDyt90sPRN30Q4UwP1ZIncnwd5G9LbIxRqyCFxfR
 2+vZXGvAHMAwwLYjHUe6oMLtZ3HilgaFO8jdVmUuww2Xd5Hr7cpIBS+rY6cAhtsVgRv9
 e3RyfXvCc/7pKKx8IyHLJGgCaP/hmsxz8imyNDDN7cEvda8WGV/r7CxOtJ6luOTS/Gsy
 +04nVQqyVzldym8ju7yOlH3iXX/73oP5/0rpCCj26cIqJaZzvg1OtbFHreerFyJ6jtPc
 bDUs7Bx88+OUBbNss7HFJmUWHnXBTwgbYup7O8uDqzEYOvq91ijJKuYWAT6GpD8PGHS4
 W7zA==
X-Gm-Message-State: AOAM533NKDh57r6d/2OKJmHRTRNPYEGv4RePagyGm2pgiurKjWzjlaCq
 T7cbjHgyVOsqFc2KQrgLVqaX+Q==
X-Google-Smtp-Source: ABdhPJwj8qmkT3Q16/vnKVoyTOiBJaX3gt9H3JD2BovwlpoOZV4hL7hxJcc2ZF6irUXO0VgADStxLQ==
X-Received: by 2002:a17:907:a076:: with SMTP id
 ia22mr17033044ejc.233.1620054312349; 
 Mon, 03 May 2021 08:05:12 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id z7sm3534527edi.39.2021.05.03.08.05.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 08:05:11 -0700 (PDT)
References: <20210503145503.1477-1-linux.amoon@gmail.com>
User-agent: mu4e 1.4.15; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Anand Moon <linux.amoon@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCHv1 0/9] Added Audio and HDMI power domain for Amlogic SoC
In-reply-to: <20210503145503.1477-1-linux.amoon@gmail.com>
Message-ID: <1jsg336eoo.fsf@starbuckisacylon.baylibre.com>
Date: Mon, 03 May 2021 17:05:11 +0200
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_080515_733135_15959F79 
X-CRM114-Status: UNSURE (   9.53  )
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


On Mon 03 May 2021 at 16:54, Anand Moon <linux.amoon@gmail.com> wrote:

> Patch series add Audio and Hdmi power domain for Amlogic SoC.
>
> Tested on GXBB - Odroid C2
>           SM1  - Odroid C4
>           G12B - Odroid N2
> -Anand
>

AFAIK, the audio power domain is a no-op on the g12/sm1. At least this
is what we've been told by AML. Unless this solves something, I don't
think it should be done at all.

> Anand Moon (9):
>   soc: amlogic: meson-ee-pwrc: Add audio power domain Meson g12a and
>     g12b SoCs
>   arm64: dts: amlogic: Add audio power domain for g12a and g12b
>   soc: amlogic: meson-ee-pwrc: Add hdmi power domain Meson g12a SoCs
>   arm64: dts: amlogic: Add hdmi power domain for g12a and g12b
>   soc: amlogic: meson-ee-pwrc: Add hdmi power domain Meson sm1 SoCs
>   arm64: dts: amlogic: Add audio power domain for sm1 SoC
>   arm64: dts: amlogic: Add hdmi power domain for sm1 sbc
>   soc: amlogic: meson-ee-pwrc: Add hdmi power domain Meson gxbb and gxl
>     SoCs
>   arm64: dts: amlogic: Add hdmi power domain for gxbb and gxl
>
>  arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts    |  2 ++
>  arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts      |  1 +
>  arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts   |  2 ++
>  arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts  |  1 +
>  .../arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts |  1 +
>  arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts    |  1 +
>  .../arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi |  2 ++
>  arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts |  1 +
>  arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi     |  1 +
>  .../boot/dts/amlogic/meson-gx-libretech-pc.dtsi      |  1 +
>  arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi  |  1 +
>  arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts |  1 +
>  .../boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts      |  1 +
>  arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts  |  1 +
>  arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi     |  1 +
>  arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi |  1 +
>  arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi    |  1 +
>  .../dts/amlogic/meson-gxl-s805x-libretech-ac.dts     |  1 +
>  arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts |  1 +
>  arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts |  1 +
>  .../boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts  |  1 +
>  .../dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts  |  1 +
>  .../dts/amlogic/meson-gxl-s905x-libretech-cc.dts     |  1 +
>  .../boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts |  1 +
>  arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dts |  1 +
>  .../arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts |  1 +
>  arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts  |  1 +
>  arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi    |  2 ++
>  arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts     |  2 ++
>  drivers/soc/amlogic/meson-ee-pwrc.c                  | 12 ++++++++++++
>  include/dt-bindings/power/meson-g12a-power.h         |  2 ++
>  include/dt-bindings/power/meson-gxbb-power.h         |  1 +
>  include/dt-bindings/power/meson-sm1-power.h          |  1 +
>  33 files changed, 50 insertions(+)


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
