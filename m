Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 265D4C636D3
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 Feb 2023 21:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hn+I91v2jp0pMAY6vBENzuXFSPo5KmTca9NDOSTtTBo=; b=OvcYmg7eMGnOl3
	lxJTaGnhu/v6vq+EQB1EJ91+o/L47yOc2j1M0xrHtRvwWJG+ju2uLI2fEnPCTLd4bysxXrDOB/e8v
	1uG3WKCtwrj9JmWovE4p4dp+EeO/jHjOuuf2JOZjixh9SBWwoat1BIZFlBRrpp9ONUQCPgLudsAzR
	+7E6UAC9B7DdKVFeMTIZsAKuhNEwQ0VR5C7Qs85Z+svjdkMqtSIwjZ/dv/MQSnEuzttS2yQOiu3cm
	mIG39cdRvZKkQ/DxPxBJy9Gf8lr6DrcpuHMe3qGHfyln5/im/TFhJDQZ+7rzNsZyULDQHY/6HWp3N
	VvM9wDSqgKwW+sHLeXXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRK3A-00COaH-7r; Sun, 12 Feb 2023 21:38:20 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRK37-00COZR-Ov
	for linux-amlogic@lists.infradead.org; Sun, 12 Feb 2023 21:38:19 +0000
Received: by mail-ej1-x62e.google.com with SMTP id n10so616219ejc.4
        for <linux-amlogic@lists.infradead.org>; Sun, 12 Feb 2023 13:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GjbMJUi347HCxf+hnG8Qc5+j4zvqsCPMZ87JcgW5Skk=;
        b=II6XAQ6nepw63aUXx4g+F5GwNBMXKfmnAneZVwT89b+NZ7Zh+dPFEp8/C5JcmTMtdV
         6+AXny/d3aTdIVyqbQYdEVm3MhC1Dik/6DE8o8YueU4lKLhb1/J2knzRq8z97woYiEr4
         6C6LeWQ4Hc9xzi0VBNILEG+rLypZ2O/D/oeEoidzipyAT4qltPgRd/kUgj6jlP0SU6CC
         UjzVKWwrNhkcFPVgcruWP7QxvuJhvNXouNreETbshK/lXFH8tyEevAQ8ob9BHkJtfMe9
         R7/5kiYiVD5jleSJjTUbQpyaX7P1Q3JJ1F9l7tgUimirGgO2gAYDxezlhrvLyeydoMmm
         ZIQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GjbMJUi347HCxf+hnG8Qc5+j4zvqsCPMZ87JcgW5Skk=;
        b=qtsDAtqLpsiyHuQ+g4wtjkVLSt3G2tCYjTc1TccDyGwEjcl0oyYhBvuAqP1lisXUon
         ufO018uZBYg5oRYU9LItepkbrq5FkwXRecndq9Ve1TSg4FiBcx8MI56QbX2FifqqTHxB
         RxCbpkMu0lGaFSbq6WTnVuiEW6isU2TzHOTxdRN9D+74kymEZGRG/COMoKVqG5Ye9MbR
         iNlnvuBFnUswd2nUiws+mdpoTpgA7vccpyXPLYynszFCGMqW8jBzIdwn42MCBkSmi9As
         6Fs8p5IW3dlMv+xVc2YqvlvNB2oVoO0DU5NRlLu0urtadizqLR5RdxW8NDn+1fCS+D7E
         mTCA==
X-Gm-Message-State: AO0yUKXlO3+PaRkP22E3DLvXuChxB+p5WS5v2O1xPO7kES/nQg1YPQaO
	xhuOzTNbSu15pC0CACHounc=
X-Google-Smtp-Source: AK7set8viyyvbpsf1ZRnp0DZf3LTkodhzIIq0tkP40zKxPAjo/UGxKJl6CoZJosbyfqURncuAKBkvA==
X-Received: by 2002:a17:907:985b:b0:8aa:f2f2:7541 with SMTP id jj27-20020a170907985b00b008aaf2f27541mr18522544ejc.77.1676237893267;
        Sun, 12 Feb 2023 13:38:13 -0800 (PST)
Received: from ?IPV6:2a01:c23:bdd2:4300:1932:303f:b63a:5a0e? (dynamic-2a01-0c23-bdd2-4300-1932-303f-b63a-5a0e.c23.pool.telefonica.de. [2a01:c23:bdd2:4300:1932:303f:b63a:5a0e])
        by smtp.googlemail.com with ESMTPSA id v26-20020a170906565a00b00871ac327db6sm5800685ejr.45.2023.02.12.13.38.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Feb 2023 13:38:12 -0800 (PST)
Message-ID: <d1e91460-1823-813a-82c7-90623829706c@gmail.com>
Date: Sun, 12 Feb 2023 22:38:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
To: Geraldo Nascimento <geraldogabriel@gmail.com>
References: <Y+fU96RVq4GwKaDH@geday>
 <bd2dc69d-f7b0-bc60-782f-34ac497d9507@gmail.com> <Y+g114kasLS6/x12@geday>
 <2CB0C2EC-B084-4185-843D-3DEADAC5864B@gmail.com>
 <ccc7ca41-8874-74ca-d647-4eb84cb0f207@gmail.com> <Y+lM20XtiZ7CxftT@geday>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: Regression caused by 066ecde6d826b443 ("mmc: meson-gx: add SDIO
 interrupt support")
In-Reply-To: <Y+lM20XtiZ7CxftT@geday>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_133817_842936_4A8535AF 
X-CRM114-Status: GOOD (  13.80  )
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
Cc: Linux Amlogic <linux-amlogic@lists.infradead.org>, Ulf Hansson <ulf.hansson@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 12.02.2023 21:32, Geraldo Nascimento wrote:
> On Sun, Feb 12, 2023 at 12:55:25PM +0100, Heiner Kallweit wrote:
>>
>> Could you please test whether the following fixes the issue for you
>> if cap-sdio-irq isn't set?
>>
> 
> Hi Heiner,
> 
> With this patch there are no problems even if cap-sdio-irq isn't set.
> 
Thanks for testing and the feedback!

> But shouldn't we set this capability to take advantage of your new
> codepath? I noticed that on the old Amlogic BSP (downstream kernel) such
> capability was already being set on the DT, so it's not some sort of
> hack.
> 
Right, next step is to add cap-sdio-irq to the chip family dtsi's.
My intention was to let users opt-in for SDIO IRQ mode and test,
before it's rolled out to all users.

> Thank you,
> Geraldo Nascimento

Heiner


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
