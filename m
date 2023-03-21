Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A592CC74A5B
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Mar 2023 11:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WKTP7g9IL8aKT/MyYFa07rYSKMniAQ3bSCtvZagWWow=; b=PJ706NqzThqmbymasl2IwK34wU
	Kn0G4JtaFRXkoIrYAFL8sZtdyFklBNTbvHAGHNWa0sRUzP5y3fonqT+RuzfRLJRQa5MUrDYQvm0Zh
	dhjII4Rv2vamPBVEMLbECT7xQgIl+dwbc1LKgfPvTc6eqbCt2Vr69I1eO7s/f+MVnyd4LaZfRL4Kc
	Y9ToULvxY+6KamXRvhCC+6QNkwOuC/gMcAHXx+mYd8yKi4Fmxmc+F7wm/vTQ4aDxtRFymVK1C8YWM
	l/l05JcpCweCxueNqejqsasPvWwdNG0MXVwxDmKZH0kOHYw69Qk+j4CVvhOkDkTeLhZ4cz4LuLalM
	946Fiznw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peaRL-00CEam-2x;
	Tue, 21 Mar 2023 11:46:08 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peaRI-00CEZ8-2P
	for linux-amlogic@lists.infradead.org;
	Tue, 21 Mar 2023 11:46:06 +0000
Received: by mail-wr1-x42b.google.com with SMTP id j24so4434076wrd.0
        for <linux-amlogic@lists.infradead.org>; Tue, 21 Mar 2023 04:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679399161;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Aoa86AtLIbV7nO5suJgaHyPoZu1RFBX6SeZwEU5izi0=;
        b=g0tDnK7U3yE1cXgUCouZXhSeaPQjHU0hO0Wb7E6Rrp9eYGppf7tv6hE/VIdtGhnLJC
         iURk84zw+7T5jTFbfO2/eM8m2Ffql0M50F3blCnmfrPlhyhTb8p6rRREXjOfExH57QaJ
         spPBaJDlPM0/IDowS5CT/3HZSVO8aBrlcishTtyVWw2dOIy/qVrDxoS3BKirb0t285nf
         r4pyjxkN+DT/m4A1tBXThODVVPeNkhgQgnJDswE5n6jM8d/y7IZyjES0LgmMOAIqB7jV
         5ycLODo/DHSEd/fnUrMywCLko9ijPvyELlJprcZaH7ilLhXCkWo2KvItPOSlkWBIdtMq
         V66A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679399161;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Aoa86AtLIbV7nO5suJgaHyPoZu1RFBX6SeZwEU5izi0=;
        b=he3ExhBj59NpUQUYnBQe5zQK4rRZaxuliNewrUHiqPvgiiz9Ew/ODwccu9Klse4bog
         L6fD6cw7HiGjCp3y8utBmuoE4r3JExbj07nbj75YHymZqVZnRGp+ur8cpwk6fRVUmzFm
         Yuh/gMXrRj/s+MmF6W9QNndXSXKNDcqYJcldZ3KSBZ45+LrYbeRMlcJ/KwvmvE/ZnRPi
         kSenK/DsfTgd6oDodLnqLDigUSVUmigk0A2mTJHBLK3hoILNQRedaf901fG5XQ2yzKci
         7gyGlbDcraQzbDrD4Id7WZXph7R7KBLtsDAgT+mmWkppX2L+LLzWGGoLF+p405zI34pm
         DsIw==
X-Gm-Message-State: AO0yUKWuIUtTmXC7L/MYgrzWo+IIngEOFNTNISHvSkojVKI2HRBWHwSq
	Zs6f2iMzt3mgrgqCGyNdpkbUDA==
X-Google-Smtp-Source: AK7set9UnwHxt4TUznSruwgSkTeqo/4spI6v/mq5YvGSm1KsUXOMir+4ZvQ98uVGlqIMqKA2STyEBg==
X-Received: by 2002:adf:dccb:0:b0:2d0:d739:e37e with SMTP id x11-20020adfdccb000000b002d0d739e37emr1999488wrm.40.1679399161083;
        Tue, 21 Mar 2023 04:46:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:c8ed:7915:30cc:f830? ([2a01:e0a:982:cbb0:c8ed:7915:30cc:f830])
        by smtp.gmail.com with ESMTPSA id e2-20020a5d5942000000b002c552c6c8c2sm11115902wri.87.2023.03.21.04.46.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Mar 2023 04:46:00 -0700 (PDT)
Message-ID: <e768dd6c-5945-c1ed-89c5-b250bc90241f@linaro.org>
Date: Tue, 21 Mar 2023 12:46:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v1 RFC] rtc: meson-vrtc: Use ktime_get_real_ts64() to get
 the current time
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-rtc@vger.kernel.org, linux-amlogic@lists.infradead.org
Cc: Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230320212142.2355062-1-martin.blumenstingl@googlemail.com>
Organization: Linaro Developer Services
In-Reply-To: <20230320212142.2355062-1-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_044604_797042_9E4FD698 
X-CRM114-Status: GOOD (  21.65  )
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

On 20/03/2023 22:21, Martin Blumenstingl wrote:
> The VRTC alarm register can be programmed with an amount of seconds
> after which the SoC will be woken up by the VRTC timer again. We are
> already converting the alarm time from meson_vrtc_set_alarm() to
> "seconds since 1970". This means we also need to use "seconds since
> 1970" for the current time.
> 
> This fixes a problem where setting the alarm to one minute in the future
> results in the firmware (which handles wakeup) to output (on the serial
> console) that the system will be woken up in billions of seconds.
> ktime_get_raw_ts64() returns the time since boot, not since 1970. Switch
> to ktime_get_real_ts64() to fix the calculation of the alarm time and to
> make the SoC wake up at the specified date/time. Also the firmware
> (which manages suspend) now prints either 59 or 60 seconds until wakeup
> (depending on how long it takes for the system to enter suspend).
> 
> Fixes: 6ef35398e827 ("rtc: Add Amlogic Virtual Wake RTC")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>   drivers/rtc/rtc-meson-vrtc.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-meson-vrtc.c b/drivers/rtc/rtc-meson-vrtc.c
> index 1463c8621561..648fa362ec44 100644
> --- a/drivers/rtc/rtc-meson-vrtc.c
> +++ b/drivers/rtc/rtc-meson-vrtc.c
> @@ -23,7 +23,7 @@ static int meson_vrtc_read_time(struct device *dev, struct rtc_time *tm)
>   	struct timespec64 time;
>   
>   	dev_dbg(dev, "%s\n", __func__);
> -	ktime_get_raw_ts64(&time);
> +	ktime_get_real_ts64(&time);
>   	rtc_time64_to_tm(time.tv_sec, tm);
>   
>   	return 0;
> @@ -96,7 +96,7 @@ static int __maybe_unused meson_vrtc_suspend(struct device *dev)
>   		long alarm_secs;
>   		struct timespec64 time;
>   
> -		ktime_get_raw_ts64(&time);
> +		ktime_get_real_ts64(&time);
>   		local_time = time.tv_sec;
>   
>   		dev_dbg(dev, "alarm_time = %lus, local_time=%lus\n",

Thx for the fix!

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
