Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC677C636D7
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Feb 2023 09:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2YYg7Ao6EU/7rB1kWjM7VJGVBRHtcwRfPlx654mtwcE=; b=KoeUM93pRj/Lr9
	2ILeaDC+DR5A2jQSioebcsLTaM6SUw+ET4ZeLdE+EQHQ5Eqvnm42nO+8pj+szjaCEBWwhZs57ArQ3
	MuAsjD0/vfzPaR2j+KV7yR7Ohbtlsy8jDXvIp7H8A/FfYtfKdXsJKXXPTh3kewIccgdONin/smOIw
	Ase9vbKxuTFrVZ6TP43SlaImKWbfiJHjq+sohI4mb51UWSB3vxeYg4D1appLl6JJ+5NdKAcYE67df
	sspntO6NZ62r9EionlOkIhCXMYPjWpjFc0g7LT47r8R9kEpqwG7zWhY5ycFr/JQudBnf3ZiRV4JaN
	A+HFnQRUXmURGJHhlD0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV7aC-00FdIF-Tm; Thu, 23 Feb 2023 09:08:08 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV7aA-00FdHW-Hi
	for linux-amlogic@lists.infradead.org; Thu, 23 Feb 2023 09:08:07 +0000
Received: by mail-ed1-x52d.google.com with SMTP id i34so14362530eda.7
        for <linux-amlogic@lists.infradead.org>; Thu, 23 Feb 2023 01:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nmC8rU/r/vCYcTCassjtbwxQQmvscPWPC8NwoK8nv6Y=;
        b=yXHwG+9zDhuVZ2TCZZ4Z30RxvwOLheweftDdXO1MbTiq4GvnDaonuOL5PDrPpEMpdk
         mRiEcZ/44ZPPwvrGQ2FLuwMO4+0KXmQ5KzWof+9uprrkevZkwltts+56/Or9kfsf81iy
         x/TNi+MZI/eSSvB9TSvpMfRtTEe7K9dCoEC8eeHVMsMWmddeiKOV1po+0vR4/WOwghUm
         GXvTvMYFT8O3Qv2uOIryrT40DyUDESsePbbCr8K1ALlP4amRrO0gsEFPWT966ebb5PEa
         mgt4NjoCIXt+2EI4Kj1PB81uk0i5v0b9WsTfsLuJTzcloptM13D1hKzDRGtLC3723ey4
         vfEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nmC8rU/r/vCYcTCassjtbwxQQmvscPWPC8NwoK8nv6Y=;
        b=ZE2OPsJbLhnf/EtyzDwU9TtlIDmKeMnhQetF7yWIatd4VxPZZoRCdgu0UAZKTgFa3Y
         tTZFks+Ca/XTPUdziKG1AVbuT9nsHtjhko26NmHs9XT9B9wcu9qyF+QsH1IaZiXLTHH9
         V3W3o/ob5BqQPSpicS/YAW79iabGMu9cff7+gMlsumCqk+33uSODBGWrM1WalKj3RtgX
         vgU+/0gUgzY7Zv25cONwJd/aAeeuJWe/rbVm1tB8ayw82OUlk25SMLD0hx0LF/3OFW5/
         X3y9xfSdmYxr+7Vh092NnivnLAShajcrZFnO9gaZmavloUlqsHGL9zyDh5qeA60Yrt1o
         bY3w==
X-Gm-Message-State: AO0yUKWD6x8bULWP07V/+57j86Lc5KO+UuKQeZGNRJV2rF1IXpVUTBcV
	dtlVZaD0853zKWPt+abqglL2AA==
X-Google-Smtp-Source: AK7set8FqssPw31ewckoqg56O8trOVzvzax0KiJfiMOPwugY0umCwzbsSexEYjm9Rymh5WfeBMy3Rg==
X-Received: by 2002:aa7:d351:0:b0:4ac:bb85:c895 with SMTP id m17-20020aa7d351000000b004acbb85c895mr9724924edr.1.1677143285066;
        Thu, 23 Feb 2023 01:08:05 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id m6-20020a509986000000b004aef147add6sm4252398edb.47.2023.02.23.01.08.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Feb 2023 01:08:02 -0800 (PST)
Message-ID: <bc514ba7-406e-bca8-4d3a-4f8997cd3241@linaro.org>
Date: Thu, 23 Feb 2023 10:08:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1 3/3] arch/arm: dts: introduce meson-a1 device tree
Content-Language: en-US
To: Alexey Romanov <avromanov@sberdevices.ru>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, linus.walleij@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@sberdevices.ru
References: <20230222115020.55867-1-avromanov@sberdevices.ru>
 <20230222115020.55867-4-avromanov@sberdevices.ru>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230222115020.55867-4-avromanov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_010806_624280_2E9A4410 
X-CRM114-Status: GOOD (  10.75  )
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

On 22/02/2023 12:50, Alexey Romanov wrote:
> Add basic support for the 32-bit Amlogic A1. This device tree

Use subject prefixes matching the subsystem (which you can get for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching).

> describes following compontents: CPU, GIC, IRQ, Timer, UART,
> PIN controller. It's capable of booting up into
> the serial console.
> 
> This is based on arm64 version of meson-a1.dtsi.
> 
> Signed-off-by: Alexey Romanov <avromanov@sberdevices.ru>
> ---
>  arch/arm/boot/dts/meson-a1.dtsi | 151 ++++++++++++++++++++++++++++++++

There is such file and there is such DTS/hardware support. I don't see
any reason why entire DTSI should be duplicated. What's more, your
commit does not explain it - does not justify duplication.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
