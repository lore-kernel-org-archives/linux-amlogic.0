Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F4EC433FE
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Nov 2022 10:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gVUV+681NyeJzg2uF1PdYaEHerKgVKvzM8KyP1euNIo=; b=Yyj01jso3vw8Gd
	7OKwKWIWMV9sKP1Qc/ovSiTFSMfR5VYFzIv2rg8LfWA5MG3Z5wGtWjRI34AalHAC85wzwt+WOxEvK
	Nt/ETN+R4qh8cWL0bkt7h+NzhR6L7HNOVO5M9/FK7YhL6Q1JKYkOsfTeu8Ll+a5ccLqOj2I9l5BuO
	ISP9nybNFi+NGz8LvczVcJI4qtDw+1qSruESOC79wiBRRyOw7a6/S6mRSuMUQx+Hh868Z4pajsquM
	n51EpoFKzOABoZVRk5CYAG23w2PzoOt01cQhhtkF65A1qy57h84I8AyDRFTJM2EC1Yk+kB4DKAy1/
	vaR2YRIlW9+33ERZGtbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxmhe-00GGF3-El; Wed, 23 Nov 2022 10:10:02 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxmhc-00GGDa-4m
	for linux-amlogic@lists.infradead.org; Wed, 23 Nov 2022 10:10:01 +0000
Received: by mail-lj1-x22f.google.com with SMTP id t10so20880353ljj.0
        for <linux-amlogic@lists.infradead.org>; Wed, 23 Nov 2022 02:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RjVx0yPImCcrCeHJYSZsdrbYMFr6VcjIJVu6xhC1kYQ=;
        b=LoDEChFlLgzRfgj2sVBMbstyjMSGKEC6XjMZqmuvucEVuveBIlMXgMMSiuI++6+IcQ
         aS9bnxmzJlAaKE+MfOds2q1b+s9mvevdH7oyVKelyHFFwUitnM3B6hVK/Q4+dSUZML4m
         Shqp7BNXicViAayytoxOzh5SIR1YozQRAcKIIho5gSGw7Yly/2XOiUkYyMnPzevrBxSO
         9eKLGtlDGoav4GxFExmr0nsywKeoBzKpnkjYraQgBUnOY+M7H4qofnwhO41PkZw+vYzx
         wXuLtPXV8ddWlwU8afXb2XTDejwM14uouwWAX0eYMVU2UOu7cuRnrakbiNz7eCLy607j
         FcWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RjVx0yPImCcrCeHJYSZsdrbYMFr6VcjIJVu6xhC1kYQ=;
        b=6R5wYzyYlOMMpA4Otmve453H5QGncUY+g9I4dInZKmv+0SK/1iUfITCzPRBA+iPbCf
         qOyolEQqE2V9Hqz43sSY6+FKjduSFLUppdiIBOAicSHtwOm4UcPSlrA6eoeIlxubDGUF
         xlAuWySLft1eyTvmkQpPPjHPWVyVCtzNKL+nEl937X5UslP0WQLO8UXLsoYgHKvFJp2e
         T7iRiw1rfAzShbW3/EcMjtD8l2nYqc37Z6dhwx7GLavDvZ0zmOhNmtOqKVHUp4ggB8u1
         Khmi3wawJ0OSYGzMxg1yHlTYPVSdlVsX5zImE+0VH/7OOFiAvk4KPnSZ/iWwTCxZt7ac
         lJMQ==
X-Gm-Message-State: ANoB5pnqWLOk85gSI71UifcXbnbTBmpJ/xHrqtowvbXoudWGWL+JB5OF
	bWKs+wq4PxwGYq8LvYwcq3bOXw==
X-Google-Smtp-Source: AA0mqf5TV5txgsK0WFTA0l4gRjfGYwijM8avNcNq2kGWPcaw69fP3+7jectvC9FDgDMfpYRzpwNglg==
X-Received: by 2002:a2e:8891:0:b0:277:a4e:98f2 with SMTP id k17-20020a2e8891000000b002770a4e98f2mr9186739lji.358.1669198197083;
        Wed, 23 Nov 2022 02:09:57 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id c28-20020a2ebf1c000000b0026b2094f6fcsm2141922ljr.73.2022.11.23.02.09.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 02:09:56 -0800 (PST)
Message-ID: <09a443b3-4e27-a751-ba2c-057d69363a13@linaro.org>
Date: Wed, 23 Nov 2022 11:09:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH V5 3/4] clk: meson: s4: add s4 SoC peripheral clock
 controller driver and bindings
Content-Language: en-US
To: Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: kelvin.zhang@amlogic.com
References: <20221123021346.18136-1-yu.tu@amlogic.com>
 <20221123021346.18136-4-yu.tu@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221123021346.18136-4-yu.tu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_021000_218905_B30FF3F9 
X-CRM114-Status: UNSURE (   7.10  )
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

On 23/11/2022 03:13, Yu Tu wrote:
> Add the peripherals clock controller found and bindings in the s4 SoC family.
> 
> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
> ---
>  .../clock/amlogic,s4-peripherals-clkc.yaml    |  105 +

No, this is total mess now.

Additionally, you received a lot of feedback but your changelog says only:
"V3 -> V4: change format and clock flags."
so you ignored entire feedback?

That's not the way to work with patches.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
