Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF7FC77B70
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Apr 2023 07:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=31STcPQXNh2yO63BQdU3XEiuIUmIKTYBfS4BO6mhvgE=; b=Rrcb3Ypl0CJBkPW9jep+AHsqib
	hrD5K5rpJAITN6QXdurslCzdHp7rA1auFAW6b6Pxcp4LtZ8rAbQrKFOqGyHZacgk2PpMNp71ZtLU2
	ZPIpRuEtrBLZEOt+drqtuyRs1c7JOKClZA8ZB3ctpU3iJJ38HNk5Frbwn1MhsadHEv6+31SIB5jM8
	NssdfgD8PKAGrL2lTx/HUQBqXEGMmxhV7SwtoxSUfKyScKRiTz2KMURS34bBip7bfW94LPfpV7gKc
	s5UhBcYlrg1nO+GKA5nLEN5IWopkLeG/bfsLbh4++Drp5S8b6rx5NW12pLt105eIHzyIJ+9QJtABv
	fchNwW7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poJ97-00F9eS-1l;
	Mon, 17 Apr 2023 07:19:29 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poJ94-00F9dv-12
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Apr 2023 07:19:27 +0000
Received: by mail-wm1-x32e.google.com with SMTP id l31-20020a05600c1d1f00b003f1718d89b2so1474828wms.0
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Apr 2023 00:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681715964; x=1684307964;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=O33Vy5QjAgffRGvOHAZRE9siWde3BOHSjGvCujdG+Nk=;
        b=ZDZ4TMQI6GveiBA2ARDzGsxvPSbbotMpouIk/vFYlECPNOd6z/566TQhXtT7y4UdlN
         B7yqm4Pnxjd1LsmI/cb8J1DNh8VyMXMu1rUKgpMQ/JWKywVLraaBRx7fDjL0tzCxQhkV
         U/l27FFFy6eyiexF7DKf8OvYLC0nu/un+zGUPl0LoP1a1oT9XLjnQg1rhp5JJnnos0lm
         Gh8n3NqtwrWcpzN7RsqE2qFJQ5SulpNvH6zqqHi3d84VGX5tl4hiLPYjWSV5/OZyUWcU
         m/nPHYF03e0yV64Cp/NpqJW5Jqetrwyxdg/LToP7rg6HHElN0hl2ruhqm/EjX1LG+0ce
         hViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681715964; x=1684307964;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O33Vy5QjAgffRGvOHAZRE9siWde3BOHSjGvCujdG+Nk=;
        b=Dz5+J7jZsGv4uMfX8b+KshSOPmrkAJEUuqzDBChkTgOGfLXyfTxb6wy54YOI76lK/3
         QdcT5tgCERvDrjVFOgSPgM43yIeprm/NlJgMdSdL3RkWtaRm0Nhtq/RfGBUGYUc9lKJD
         eUsDt1ocL3suZagTQigNZF7Rc5oEoEPLJ0wTqiA+KO1XqonjDPobv9kWMRih6o1fzL+w
         xdxDAnFP/hE3v8o94COEnSnd22by91uq3Tu76TPA7kQwUi+Qq1T/gK+DX4s7ZR2p0oWP
         tv26Fq8FiWI0kwDu7jWdfYzfqaqs2LlPOs29mlXVLhJvNK3x9t5rNZ0m+khBgyewsNAO
         kEGg==
X-Gm-Message-State: AAQBX9f81akRmQtGdPLWAvWpFCqWxtY+PA1XxhBN7UTiUr6Wpfn65/tw
	SWHK/4jXJ6IST50tIoXUN//wa2h8hDKVeX6BcCYbPw==
X-Google-Smtp-Source: AKy350af8X3M+NtMCs6aC7xfZ3fovHhLF0zJl5lyNcpQyCs4U9HEhCThmcddltEog8QoWgdL1dku1g==
X-Received: by 2002:a05:600c:470f:b0:3f1:754e:69e6 with SMTP id v15-20020a05600c470f00b003f1754e69e6mr469397wmo.17.1681715963957;
        Mon, 17 Apr 2023 00:19:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:a1e1:81a8:1acc:2b91? ([2a01:e0a:982:cbb0:a1e1:81a8:1acc:2b91])
        by smtp.gmail.com with ESMTPSA id l15-20020a7bc44f000000b003f17661bc0csm43942wmi.7.2023.04.17.00.19.23
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 00:19:23 -0700 (PDT)
Message-ID: <9a384508-4645-6cfc-3e27-8a896b73a26b@linaro.org>
Date: Mon, 17 Apr 2023 09:19:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 0/4] pwm: meson: make full use of common clock
 framework
Content-Language: en-US
To: linux-amlogic@lists.infradead.org
References: <9faca2e6-b7a1-4748-7eb0-48f8064e323e@gmail.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <9faca2e6-b7a1-4748-7eb0-48f8064e323e@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_001926_359390_D4092C3C 
X-CRM114-Status: GOOD (  27.27  )
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

Hi Heiner,

On 13/04/2023 07:48, Heiner Kallweit wrote:
> Newer versions of the PWM block use a core clock with external mux,
> divider, and gate. These components either don't exist any longer in
> the PWM block, or they are bypassed.
> To minimize needed changes for supporting the new version, the internal
> divider and gate should be handled by CCF too.
> 
> I didn't see a good way to split the patch, therefore it's somewhat
> bigger. What it does:
> 
> - The internal mux is handled by CCF already. Register also internal
>    divider and gate with CCF, so that we have one representation of the
>    input clock: [mux] parent of [divider] parent of [gate]
>    
> - Now that CCF selects an appropriate mux parent, we don't need the
>    DT-provided default parent any longer. Accordingly we can also omit
>    setting the mux parent directly in the driver.
>    
> - Instead of manually handling the pre-div divider value, let CCF
>    set the input clock. Targeted input clock frequency is
>    0xffff * 1/period for best precision.
>    
> - For the "inverted pwm disabled" scenario target an input clock
>    frequency of 1GHz. This ensures that the remaining low pulses
>    have minimum length.
> 
> I don't have hw with the old PWM block, therefore I couldn't test this
> patch. With the not yet included extension for the new PWM block
> (channel->clock directly coming from get_clk(external_clk)) I didn't
> notice any problem. My system uses PWM for the CPU voltage regulator
> and for the SDIO 32kHz clock.

Don't you have any GXBB, GXL, GXM, G12A, SM1 or G12B boards to test on ?

Anyway, I'd like to see a complete test on those SoCs on the actually
used function (mainly 32k output clock for wifi) before seeing this merges
since it's a big change.

> 
> Note: The clock gate in the old PWM block is permanently disabled.
> This seems to indicate that it's not used by the new PWM block.
> 
> Changes to RFT/RFC version:
> - use parent_hws instead of parent_names for div/gate clock
> - use devm_clk_hw_register where the struct clk * returned by
>    devm_clk_register isn't needed
> 
> v2:
> - add patch 1
> - add patch 3
> - switch to using clk_parent_data in all relevant places
> 
> v3:
> - patch 1: move setting mux parent data out of the loop
> - patch 4: add flag CLK_IGNORE_UNUSED
> 
> v4:
> - patch 2: improve commit message
> - patch 4: remove variable tmp in meson_pwm_get_state
> - patch 4: don't use deprecated function devm_clk_register
> 
> Heiner Kallweit (4):
>    pwm: meson: switch to using struct clk_parent_data for mux parents
>    pwm: meson: don't use hdmi/video clock as mux parent
>    pwm: meson: change clk/pwm gate from mask to bit
>    pwm: meson: make full use of common clock framework
> 
>   drivers/pwm/pwm-meson.c | 201 +++++++++++++++++++++-------------------
>   1 file changed, 107 insertions(+), 94 deletions(-)
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
