Return-Path: <SRS0=hwcs=KJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0459C433ED
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 May 2021 14:29:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F29956144B
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 May 2021 14:29:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F29956144B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oudFt4WNO6E53MCjjGx9nYfcnvsEsl+ttfuOq2AMvxI=; b=BhStE/Xyf3/GtpwH1Ed/FbSJE
	RAcbCsnvLMG6UNtVYXiwNkMRKzfjdQ1gKnZWL0L3RNsqE/oxSDNywNm8wZQuxI7f3ePvygZ9586tW
	YDr6HTV6UPRAEgj35mJHBaSQcthytUw1cqVr2D8s/fpjsox7k+eUGQRZB6auDZyiw5NTdzqXLzthm
	BmMD8H6uIC4Bq2l1cTfC8sROGOM/Y7Sja7eSYVi32eZGVtwcpPvXga7ZPBtWxq3iH8uVWW0HfdVx2
	beK4WqE0mwnGeo+ZF+rd3xLbW92eWOIWoSD/H/TOfDdw5Fy/95BVLwlXREu1VioYb1RCo/CncwnyG
	Zsbf4IZpA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhYod-008HjB-Rg; Fri, 14 May 2021 14:29:23 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhYoP-008Hgk-98
 for linux-amlogic@desiato.infradead.org; Fri, 14 May 2021 14:29:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=ajP5fbTlV7Xk8Ece3WpQsvs9eX1/DimIoZ0u1+o/eDg=; b=JbVOQzmMeL2FZCEfjFu6P/Otjx
 99sAqgPwUcEawfIxSrHVA9hOMjhEoeqZMhT/8veXWo0FEt+CNgHX1GergD3EyONS5W7tjlHXo6f78
 M4+nBGp5xCJE4a/trQNER5jJUbEw+sxS8AkMSuG+HJJe2krBMfFAIS1hYrgcy4wVSqgKNh123XPoR
 rtgks6r523IrzvyMDlseKcwJl39FmxBDGMfEN8LRCNK+3eCpaHvq1u5cWPHPi/vA4mBTMviNKs0Bw
 e7C2zE4Xp9HaKlRJVr2acb2a+vuZBxv4hG890lLzonu3ViGuT8QE2J+bqqO/+T1cFm52mgbflljG6
 f06ZZEpw==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhYoL-00C2dB-Ue
 for linux-amlogic@lists.infradead.org; Fri, 14 May 2021 14:29:08 +0000
Received: by mail-wm1-x333.google.com with SMTP id
 b11-20020a7bc24b0000b0290148da0694ffso1540243wmj.2
 for <linux-amlogic@lists.infradead.org>; Fri, 14 May 2021 07:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ajP5fbTlV7Xk8Ece3WpQsvs9eX1/DimIoZ0u1+o/eDg=;
 b=bksMeYi/sY2KQH7SYm+hGmrRM7WJNk8GSHTFjNZe2P5eYDi9vor+MGBvEG2ZLhqcPt
 rLhzii4iojHiiSEeYpogplBuNK7VbgSiSBkgqzome3g/Z7p1cgqDtCRAILgqq383A95H
 UWwzAiDQsCzyTpRJiKtviNEBNiQPfZPDjer0zOtMg9vISA8fKUErWdBTeC8JhesTdzp9
 uVGeeZoPi69Eb3uYS6kSK/JaMTHGSH+T8TLP8sizz316uLgoWq06ilxWOOde4Y7OerkI
 T/7qnYuOaa1VCHsxsliAjyKM/ydOAcwj/0+GujZ5E4iHvTbvX+63j1fvGTEpbuH01m6L
 pLYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ajP5fbTlV7Xk8Ece3WpQsvs9eX1/DimIoZ0u1+o/eDg=;
 b=Xrskl8ToGgvAapTnkQzo4yjjKnud0fb6GIibJflqiCnnJw1CoSBLtwBrsWPvA3Y/fs
 Yrhx7JQIzX7PmPgxHdUDAdLwOSTrX09/tB/1o0VoYJHlobAn9gGZ6FHWtY5jEgmOg+2R
 ibSbBKr9xxHRbSMQV04uNtVQM4U3BKXqj9NT5S7ejW4gpXjWKN5B17WVFiwQ6s9zbsaQ
 taVh9YtGDPQhKRdzqB1qks9OFnav6kpAYSGc9s+4cT65EYZTiHJSC/fpI0qaUvRaUGpK
 Ijg404JeMgIlZnVQSCJGPV4C0JauIHPpVy65DXP0CkN7XEmTRnCDPPdZ0+8eFjlfDooe
 m4Fw==
X-Gm-Message-State: AOAM531Daw9lGnH8gbFPUW7/lFb+M0Nmm0eI2WC/UB94VpTmckSBkCVZ
 ZkrlvkJB3TiD5HDz2NlpWX2OUQ==
X-Google-Smtp-Source: ABdhPJxNZTxCs6GT6OXAXvuzvpZW/JitfY+kukfZ7CVj3oJCqJN8g/gVdH5KTqhW1yjuEiQolFgwuQ==
X-Received: by 2002:a7b:cd98:: with SMTP id y24mr10053342wmj.4.1621002543926; 
 Fri, 14 May 2021 07:29:03 -0700 (PDT)
Received: from [172.20.10.7] ([37.173.48.34])
 by smtp.gmail.com with ESMTPSA id t17sm6740080wrx.40.2021.05.14.07.29.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 07:29:03 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] arm64: dts: meson-sm1: add Banana PI BPI-M5 board
 dts
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: khilman@baylibre.com, jbrunet@baylibre.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210505073248.3816183-1-narmstrong@baylibre.com>
 <20210505073248.3816183-4-narmstrong@baylibre.com>
 <CAFBinCBa=rHQ+Sho2Lq0cA0dYnhKX4ZJaQUqBcaiOxNzD+bFiA@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <089dfcb8-e821-da98-d93f-f3aea3d45ad3@baylibre.com>
Date: Fri, 14 May 2021 16:29:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAFBinCBa=rHQ+Sho2Lq0cA0dYnhKX4ZJaQUqBcaiOxNzD+bFiA@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210514_072906_160569_DD474E11 
X-CRM114-Status: GOOD (  16.87  )
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

On 05/05/2021 22:20, Martin Blumenstingl wrote:
> Hi Neil,
> 
> On Wed, May 5, 2021 at 9:32 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> Banana Pi BPI-M5 is a credit card format SBC with the following features:
>> - Amlogic S905X3 quad core Cortex-A55
>> - Mali-G31 GPU
>> - 4GB LPDDR4
>> - 16GB eMMC flash
>> - 4 USB 3.0
>> - 1 GbE ethernet
>> - HDMI output
>> - 2x LEDS
>> - SDCard
>> - 2.5mm Jack with Stereo Audio + CVBS
>> - Infrared Received
>> - ADC Button
>> - GPIO Button
>> - 40 pins header + 3pins debug header
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> one nit-pick below, but still this gets my:
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> 
> [...]
>> +       /*
>> +        * WARNING: The USB Hub on the BPI-M54 needs a reset signal
> s/BPI-M5/BPI-M54/
> I am hoping that Kevin can fix this while applying

I'll send a v3 since I forgot to CC DT maintainers for patch 2 anyway..

Neil

> 
> 
> Best regards,
> Martin
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
