Return-Path: <SRS0=pha3=LB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82F3BC47082
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Jun 2021 07:01:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A19060240
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Jun 2021 07:01:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A19060240
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=sydp3C8xrHmwc5pLEnPqDKkZX3S5SQF16IMqH7xQ+6Q=; b=MFG316/GMdwrEm6DUE3VCTQTUb
	MqNInMCeIKR7HR9DnE3tSyGQPelzskNxGBmnBKXVgdeK1r9ZO4d5Hr7jMlPbaWHZyuNmiz9bQ8mwB
	lDQpG70LIHOq0RbV23GqJIBXwdAAy4q7gCWI7WgjEN6GUclISHLwQxtZBNFboqiBmgs28QE8yFy3t
	PvdRVo19H59Vt4DrVmbQOlGzjusV/SvCpHoKC+jxJArr9WK4oA8cPRT52Ns7n7/BABjMYxeEAQBDT
	izZkcSMm6kkH03JXexh4sZY+v4XjoWtQp+Q+SkblcYp6v8mbmsNeKRM6ItrnXFA/Fk31dMBRBkeO9
	DDBlEv9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lq9Gd-001sPv-P1; Mon, 07 Jun 2021 07:01:47 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lq9GV-001sJ6-E8
 for linux-amlogic@lists.infradead.org; Mon, 07 Jun 2021 07:01:44 +0000
Received: by mail-wr1-x42c.google.com with SMTP id q5so16297022wrm.1
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Jun 2021 00:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=51VmsxUZ/IAwiM9uqtyHR/QzterIDzyNotbKCVYVi6U=;
 b=UErHyRPG3ov/MsTwHowtTjWSFcC+P/2iwVP5iJLA1usgbYKBmvqeFxr3XeTFR2JnVM
 tIwANwHiuwIBNwHB0Yyx/8jZZjbXyx1OXp1dFW1HaaWLtu+o1HKEmcnxlbCbgMaDkBtK
 hOzisd/j7mC1huYAZW/58XnfF1PuQP3eZ1B/DiEsKfSXbxSPlcixSlI6KxskHB2EhYjg
 7kiwleNFIsXUD0zS3bgYHZxO5Av2tUPWotOwO2acjibOs8/mbOR0SqbYTytrCd66RVHP
 T1O4I6dw0hcdZ4jyXyDOBZYyOm3rimC5OB3+ARrJwBZj3iIdOUQbSTB10RSsCV2Yd2Bq
 iGxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=51VmsxUZ/IAwiM9uqtyHR/QzterIDzyNotbKCVYVi6U=;
 b=EddYX5ZxH1vDKN2x5EOtiseqEYPF/b0p5QAToavHkkrns++pPRI4KyVAJ6dY2cHKyJ
 Rf7cVm6qBcJ4HJ6+kwKp/NPcQuW/RWtCUlmlBX7xYMp0ig93WRe/KbloIqRhOSSBi76C
 hTUyf5gNhVvqtx2dfUqcfY6CzpytbOMqymzFV2F9kZZYnn8RTthvKmbfgrD2EMATT+SV
 HF9KGXg7l1qsm+fHEZmAYxeY6B8xyZR1NoIE9d6Xm4ZbknhOMgwPB5a4L793MnJ83q37
 4jD1LTTuBwA5oWTbne7D/dUUFqD/AScPFWcGsS3hEcobuXQaqzaMlaeAnw8nNBB14JG7
 qFUA==
X-Gm-Message-State: AOAM533ESgeOuv3n40HM3E5gZO9FiVoQVGV+ePAMTPdGRHRYtGQvCxBh
 LsnVZAwfM1v4H6nNMMzABUkXaKuMQXMJ3VQH
X-Google-Smtp-Source: ABdhPJyFU5Bdb0c/UXMAqn+htCSNFOi08UtRCmr3smv+Y+vGV9/Wwr8eHauHTkflHSi04H1eurQDzg==
X-Received: by 2002:a05:6000:89:: with SMTP id m9mr1446926wrx.8.1623049297239; 
 Mon, 07 Jun 2021 00:01:37 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:7c1f:1c9f:555e:7398?
 ([2a01:e0a:90c:e290:7c1f:1c9f:555e:7398])
 by smtp.gmail.com with ESMTPSA id q11sm14647214wrx.80.2021.06.07.00.01.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 00:01:36 -0700 (PDT)
Subject: Re: [PATCH 0/6] Add serial and i2c aliases for Khadas VIM boards
To: xieqinick@gmail.com, robh+dt@kernel.org, devicetree@vger.kernel.org
Cc: nick@khadas.com, artem@khadas.com, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
References: <20210605062313.418343-1-xieqinick@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <4e1e960c-16b3-59a5-61c2-6d6e2f8204ac@baylibre.com>
Date: Mon, 7 Jun 2021 09:01:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210605062313.418343-1-xieqinick@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210607_000139_540778_D8549A8C 
X-CRM114-Status: GOOD (  17.87  )
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

Hi Nick,

On 05/06/2021 08:23, xieqinick@gmail.com wrote:
> From: Nick Xie <nick@khadas.com>
> 
> This patch series update / add serial and i2c aliases to
> keep the same with 4.9 kernel for Khadas VIM boards
> (VIM1, VIM2, VIM3 and VIM3L).
> 
> Nick Xie (6):
>   arm64: dts: meson: vim3: add serial aliases
>   arm64: dts: meson: vim1: update serial aliases
>   arm64: dts: meson: vim2: update serial aliases
>   arm64: dts: meson: vim3: add i2c aliases
>   arm64: dts: meson: vim1: add i2c aliases
>   arm64: dts: meson: vim2: add i2c aliases
> 
>  .../boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts      | 8 +++++++-
>  arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts    | 7 ++++++-
>  arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi       | 9 +++++++++
>  3 files changed, 22 insertions(+), 2 deletions(-)
> 

Thanks for these patches.

I'm not sure about the current policy about aliases, but when we started upstreaming the amlogic boards,
only the exposed interfaces could have an alias and in the board.dts file only. But since other vendors
added a bunch of aliases of all the possible i2c/spi/uart/mmc/ethernet interfaces in the SoC dtsi....

But the question of the 40pins header remains, should we add aliases for interfaces present on the 40pin header ?????

Personally, we should'nt since these pins has no defined functions, so any alias should be added by a DT overlay loaded from U-boot.

But it's my own opinion.

Rob ? what's the current policy on that ?

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
