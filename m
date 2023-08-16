Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B22C41513
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Aug 2023 06:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A29/Wp5uIIbpLpJIPU5WPjiDRn8wjN5/RG3mfRg3uTU=; b=BOMMIE+KVStmul
	9XVPFt57hPzHleSEmgMelmN7YaSSwGXtoJuBAy0fNESira63jysHU0uRxgEKeZVENqf7sh5iVEBUn
	zYsYIWSvwHo9qyEt+tUD+FyZH+fX/nD7jdODrciNbxtY+16DyuMy/IuCJWjDj8GiDWhZ+syq7URYN
	ghKniyXbMwsNHLmWHLimzk/xCQOwl3OKdfEJ/XYmt4jH3f9szzLfVPNK6lHB6zjmfAV39+9L6RJka
	GbxRJJLRw+cFPbTPDPZqQpiH6uxwJWmaxtsUTNw7mAb6dy3KPcDIj5TdFiXU0gaCgjlFOf3bNlV7V
	EAfTx+BEi9m6CundDVBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qW9wI-003IcE-0l;
	Wed, 16 Aug 2023 06:23:30 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qW9wF-003IbQ-1m
	for linux-amlogic@lists.infradead.org;
	Wed, 16 Aug 2023 06:23:28 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5234b80e9b6so8344786a12.2
        for <linux-amlogic@lists.infradead.org>; Tue, 15 Aug 2023 23:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692167005; x=1692771805;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=asPixu7Asy3yEcOq1kgfbXQGxzgiqvQoWFwOpe/xVX4=;
        b=Zbjw5Ym2Zzxhx/vAi/Yhum6EWbvFAhTRfR1OrP58zBVy0rq6HxAeo54a7BdOkInLhg
         W6hFM2pB9Ad62x6V8u4U63Oui/vdZUqZDGTw7GgBdiEPv2WCekqomiqsQHBXH844TPO9
         zcc4137D47lJHDG89iX4dQ+C0yE+/LTB0104i4XXmO5bSymvnXUOd39IihgdmZqLkSK/
         KSEmJYLEHrac0m+wUqhjP0Y+6LXeeDwkHKsqWhwzxz2mgpnltd30JyJW5zbR1GfHdH9/
         RVLTcM4neQd7uRo2SPunE2y694EKwN/Wo4pmFO7AQ6I4+37uey0lRWLr4y3gAM5BpEzk
         uMnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692167005; x=1692771805;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=asPixu7Asy3yEcOq1kgfbXQGxzgiqvQoWFwOpe/xVX4=;
        b=kwPcwhkyilQ2zJMrHYzY/82d8sXL0GQoH0TEhLNqxbbfEUS6HFTA+KJj261HHz6B4k
         bp0vwKGwXQszVhji+/KBoR4A67cyYJVwLIovzojo0KdOScglOwZQEKlklELMoZNJVbvC
         wNQfaL7SZlTbyIKabM8VqLx0mqWkDOcM3pmiemwCH2WCMPBWgJgyBPnDNc/ps9suHXmZ
         CLMrZfasTBjLdhSuGdtuWNWUq39iI2207gX+df8pEwK1z2abFDf3uu7zDxOdq9TazCvF
         +TAt17u3i8Al36BqfykDGC/2J3c0/hvMifTBFPnc4aDqO96SvfmwBcUsvUt3iuKvXss4
         rMHQ==
X-Gm-Message-State: AOJu0YzEucaLKNieZHqaLPriODliJFBd2msRW3hfHNUFGlmXXP4WRh7L
	ytb7Rm6xk5JeHY6KVHBGBKubYQ==
X-Google-Smtp-Source: AGHT+IGCFVseg7x6hLpLt+CyrQNMXOCgTcmGxx6RMcrNO8He7YhGyN937RnMKYEYbtNVG5KU//M0sw==
X-Received: by 2002:aa7:d8d8:0:b0:525:6e04:bcb3 with SMTP id k24-20020aa7d8d8000000b005256e04bcb3mr817133eds.40.1692167005623;
        Tue, 15 Aug 2023 23:23:25 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id x4-20020aa7d384000000b005233f2635fbsm7790697edq.21.2023.08.15.23.23.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 23:23:25 -0700 (PDT)
Message-ID: <3f437e5b-2bae-384a-0a08-216a4ec55bde@linaro.org>
Date: Wed, 16 Aug 2023 08:23:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/2] arm64: dts: meson-g12: Fix clock order for
 amlogic,axg-tdm-iface devices
Content-Language: en-US
To: Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Alexander Stein <alexander.stein@mailbox.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20230808161755.31594-1-alexander.stein@mailbox.org>
 <7ha5uyes3f.fsf@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <7ha5uyes3f.fsf@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_232327_617838_9C88BCE4 
X-CRM114-Status: GOOD (  16.72  )
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

On 10/08/2023 19:15, Kevin Hilman wrote:
> DT maintainers,
> 
> Alexander Stein <alexander.stein@mailbox.org> writes:
> 
>> Binding specify order of clocks as:
>> 1. "sclk"
>> 2. "lrclk"
>> 3. "mclk"
>> Adjust clocks accordingly. Fixes warnings:
> 
> I understand this patch is to fix DT warnings (and thank you Alexander
> for fixing warnings!) ... *but* the underlying requirement being
> enforced by the schema here seems completely wrong to me, and a step
> backwards.
> 
> Sorry if this is a FAQ someplace, but I couldn't find an explanation for
> this.  One of the main goals of introducing names in the first place was
> to get rid of ordering requirements.

Not entirely. The names was just a helper for cases when order is not
fixed, but even with the names for every regular case the order was
always strict. We always expect these to be ordered.

> Now the DT schema is enforcing
> ordering requirements, but the drivers don't need ordering, so what is
> the point of enforcing ordering requirements?

Because names are not everything. One OS implementation might still take
by indices, even if names are provided, so you cannot change the order.

Few bindings allow relaxed approach here, but these are written that way
to allow mixing order.

For few other bindings (e.g. newer Qualcomm clock controllers) we just
dropped the names entirely, because they bring little value and also
code for lookup by name is slower than by index.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
