Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3307EB64D9
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Jun 2023 09:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eGxr6ef+ETu+lY+AWT0xF/qh3fPP2WnfZmsjWp2nB58=; b=ed88LXjrb1SxrH9YUZAPQbuBhC
	DHoXJW0Jkk+ett/cow1dF0XIOymDWPZd1P9X7MGKuV61UIzdDuonyPBNFNphmubudzQJYpVtK9zr3
	BWlZtgoZQoR8lkaA5/moyE7Jq7rEUZxdHanUxl8Bm55zsjCWvEMc80xkmxNljDNarML1skSUWUeEA
	o5/nSMYOlAHDrpOQlqOt5VcDupDSOyUHogZeedKi3UnLYktYuZSNvIeEkokABlmHzqcUmUrCIkDJa
	S9hYcxnXUsOw3ihR1cVujyqghfaT9l0zkO2ymEz7thqB91Bf7z0TbTY7pbGyKP5jE9obqu77e/4Jg
	gcKx11Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qE4kx-00CfCl-0a;
	Tue, 27 Jun 2023 09:13:03 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qE4ku-00CfAI-0B
	for linux-amlogic@lists.infradead.org;
	Tue, 27 Jun 2023 09:13:01 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2b69e6cce7dso33946371fa.2
        for <linux-amlogic@lists.infradead.org>; Tue, 27 Jun 2023 02:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687857153; x=1690449153;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MwXCm3w9KvNw8TG6/YFSNlXC4qr8SMmlk1RW+cwukN4=;
        b=CiZEqjlcfKhnAchK8fxDZcHea1pCM6CXXmrhHRKMyEMSM1IhoFu1EtEAqEc6IhbdHj
         qh72wiI1Ei2WoWifKTmCEHd5B6+e5Rgcs09JxJINgIZvmiigtR5mXmrHjuqd5a6G6Dpo
         5OsKgMIaS0wOyEXb4g8pVQbqGzXxohBnnuu/d4z0HTIPz2xAAkPDIOBO3okiabclha+j
         je6ncpKoXpT+HR9SkODE+vf+/BRcejLrBgUU55kIX0iMyngZNkuK++U7O55bwyclt62K
         BLg5lZ3+dxeUAR5y/AY/CH9eydv34VMvjO9NICXaaKEZmA1JXouRaH0ZU/Se138VtAfM
         vhvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687857153; x=1690449153;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MwXCm3w9KvNw8TG6/YFSNlXC4qr8SMmlk1RW+cwukN4=;
        b=ZEoXD+v5FqG9VfzyIv98Nt2KzUnlQ13eVdlokvXA0IY2bqH97r1VT6tyIxfzjk0v9m
         tKWtwoFYDh1y0rUFSCKxzUF+YZVKa2a+WgFVUcg6m5+Gfn2BXPTmGBTq+2KXX+Zc4JnI
         BscpRq9ibZjB6vyBSU64u6YQy1K9KOQUoyeSd3cd1IKTwpAEoDsE9snGtp4aqVHm1hEB
         UdIWESaQW7sbNFpa+l+i1mPRqu8WiA37qKcJaw5slRRvPDUCLvgaJ5cB2yMRkAEA2Q3H
         l7SR/s6R5jF5s81DJgDUvKgWaj4cbwRPAZU8j7YJbmicAGxsnhcQUR8yQht1eUWsbP6d
         nQmw==
X-Gm-Message-State: AC+VfDwe3U1nIakvoLkmLS5IbZK5Nv/XIyZLDCaEOfKYCFX1rE5xYIdX
	ag72f1HtquhkzuyZiPJtcmIRaw==
X-Google-Smtp-Source: ACHHUZ7rNhQ854F9BOz5TRA9Vw5SDjSPF19fWlHT4iiFUUWEwxVtbf7M6d/ZqbJms+y4Q+qS3gUAOw==
X-Received: by 2002:a05:6512:10cf:b0:4f9:657d:e4bd with SMTP id k15-20020a05651210cf00b004f9657de4bdmr9901842lfg.24.1687857153046;
        Tue, 27 Jun 2023 02:12:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:cec9:2929:7a19:7afa? ([2a01:e0a:982:cbb0:cec9:2929:7a19:7afa])
        by smtp.gmail.com with ESMTPSA id i5-20020a05600c290500b003f9b66a9376sm13102500wmd.42.2023.06.27.02.12.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 02:12:32 -0700 (PDT)
Message-ID: <3570635f-99ab-7127-0441-53852688a59c@linaro.org>
Date: Tue, 27 Jun 2023 11:12:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v6 3/4] tty: serial: meson: Add a earlycon for the T7 SoC
Content-Language: en-US
To: Lucas Tanure <tanure@linux.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Nick <nick@khadas.com>, Artem <art@khadas.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20230627091007.190958-1-tanure@linux.com>
 <20230627091007.190958-4-tanure@linux.com>
Organization: Linaro Developer Services
In-Reply-To: <20230627091007.190958-4-tanure@linux.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_021300_094536_8D2C6056 
X-CRM114-Status: GOOD (  13.88  )
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

Hi Lucas,

On 27/06/2023 11:10, Lucas Tanure wrote:
> The new Amlogic T7 SoC does not have a always-on uart,
> so add OF_EARLYCON_DECLARE for it.
> 
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
>   drivers/tty/serial/meson_uart.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
> index 2501db5a7aaf..c24e105a98c5 100644
> --- a/drivers/tty/serial/meson_uart.c
> +++ b/drivers/tty/serial/meson_uart.c
> @@ -649,6 +649,8 @@ meson_serial_early_console_setup(struct earlycon_device *device, const char *opt
>   
>   OF_EARLYCON_DECLARE(meson, "amlogic,meson-ao-uart",
>   		    meson_serial_early_console_setup);
> +OF_EARLYCON_DECLARE(meson, "amlogic,t7-uart",
> +		    meson_serial_early_console_setup);
>   
>   #define MESON_SERIAL_CONSOLE	(&meson_serial_console)
>   #else

I've reviewed last version of this patch, please keep tags for minor changes,
or explicitely explain why you didn't keep the tag.

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
