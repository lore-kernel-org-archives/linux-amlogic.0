Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E472C636CC
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Feb 2023 09:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=49/X9M8V+JWFZ7v/w746YX8P2oQ3jArFhCohudxTsCU=; b=Ex20Cj3EKW0A4D
	YtO+Ub/c+o7MwgrsF8zk9EH4b4KpG0IK4wDWmYbGrP7I/8vTJGji1mbz1I+yX+zopOY2EwOT40iyC
	96wVEgq+++MugH+3g96Q5rEDWy+7vVkHQsgx2DPIcKdfRj6Tqky2Bh3Ln2RS7QWzOCWxgtgRhwLrf
	oZWP2froD1UP11ze4x0Iy19PJ3frvcAXhrBbI+Y4u0QM6vV9MJVBU0wMlh3ovfSOiqpLeVxJMag0l
	gEt6OjplLp7YLIPxmkagftnN4c5ItGbNmWqSkxX/kElhj472IdQnpuIDvVQQRorxAoEn1PXFZ0VsL
	D/7P3oy3fptoZCU2+okQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPKGr-00BU5i-5w; Tue, 07 Feb 2023 09:28:13 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPKGo-00BU3M-Ge
	for linux-amlogic@lists.infradead.org; Tue, 07 Feb 2023 09:28:12 +0000
Received: by mail-wm1-x330.google.com with SMTP id n13so10550767wmr.4
        for <linux-amlogic@lists.infradead.org>; Tue, 07 Feb 2023 01:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=fcYMfFwrBDTiSgS1D5DQQyLqrqb91363x879A7vfPTI=;
        b=4wSdJscR7Zrk8CAATrkQ6roeRKQbEaEYZEEjsnESE9d7B7zDy6RoXwXDby6Q47+TKt
         +nX68CtmYqeCyNvEk26+QggvPF/niThLCzBwilyca0CQEEYXSgdRTTuuJnE8XXOFFJUD
         B7jH1Em2tmXHTkDoNcV44i3msTPv5oA+kwk+JCS9Ttxuc8rF7SD+0qVgnG1KAI6GBKUv
         hYR9eWe4LgEp/lqIJvrXaBFsPQV6/x3Ks9pM1jSxgr9yRjnVlWLwOQuBu3hnXnMzdo+x
         qhW4n/+a6Ms8E6Ts1CM6ziW9V3o8rc9zYj0uSfFv5awl7Gh8xEAIAfk/PCdaOZ5CeRjS
         cEdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fcYMfFwrBDTiSgS1D5DQQyLqrqb91363x879A7vfPTI=;
        b=zsmftoLGJi7abg+7jorkTbepp9XkuP1RVANmQAYZmz1Y6DwtQ87Vfd2DMn4l/yJlz3
         UCgjuWqIfK5PE3v87GcNyLlj3tqgS22lnWZosBC6MKczhyMXBuoNZxgun7iM/Fn5bY6J
         MtBu+h/PzrTXp6WZk3QjhVV8tEZLCyKLaZB0KyGt79UUdZSZWeESxdgpmQvSKcW1sY0w
         kGppnwcRJu0X2mICfNY4eAFxMfglB684YXJVEwPdvMTEHkysIj5AH+gM1iZRyUPh0Xrr
         cOYT0zGqWDmiGrrsYUbXf0DeVMTfy2odwG2yvRrdtogOqp5/HUip9MJ5bv3P989uZEpM
         65FQ==
X-Gm-Message-State: AO0yUKXYYQsP6x/leqZg6g6tDaV8RF+TeFnnwNKp63j09O3EOM0SwqXP
	kXvmBU3JQiJKyB5fV/Q2ygi95A==
X-Google-Smtp-Source: AK7set9zNVx+57hEOZgnPtvD4Q05Tfog3tybMA2WkK7+QAyedz8hiD09lLmb812r+ufxAVP4VvrZwA==
X-Received: by 2002:a05:600c:1894:b0:3de:1d31:1048 with SMTP id x20-20020a05600c189400b003de1d311048mr2489815wmp.29.1675762084495;
        Tue, 07 Feb 2023 01:28:04 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id fc13-20020a05600c524d00b003db01178b62sm20449772wmb.40.2023.02.07.01.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 01:28:04 -0800 (PST)
References: <20230206153449.596326-1-jbrunet@baylibre.com>
 <20230206153449.596326-8-jbrunet@baylibre.com>
 <a711905e-dbfb-4258-62be-250a9549a9c4@linaro.org>
User-agent: mu4e 1.8.10; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Mark Brown
 <broonie@kernel.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/7] ASoC: dt-bindings: meson: convert axg sound card
 control to schema
Date: Tue, 07 Feb 2023 10:25:53 +0100
In-reply-to: <a711905e-dbfb-4258-62be-250a9549a9c4@linaro.org>
Message-ID: <1jbkm53jvg.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_012810_578096_9EB5AF61 
X-CRM114-Status: UNSURE (   9.48  )
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


On Mon 06 Feb 2023 at 20:21, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

>> +
>> +  audio-routing:
>> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
>> +    description: |
>
> You still have everywhere | which should be removed. Here and in almost
> every other description when no special formatting is needed.

I'm sorry if I misunderstood your comment. I thought the problem was
with the '-' of '|-', which I removed here.

Should I use '>' for the YAML multiline format instead ?

>
>
>
> Best regards,
> Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
