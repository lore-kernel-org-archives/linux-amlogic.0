Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C99BEC43334
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Jul 2022 07:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Jh4Mvlb4XymUUG4JllZ8HQ58Woz9BFPhG+hnAKv6/g=; b=kgdaRROgJVm1KA
	kA/KC+8v/a2vEM74Gb1Ga1vqsGnr3eONdMcO6xZqTHnzGZfhMOSZJ1gnWQrnu0LtdwyL7vE2nHyvT
	2KIqHlHYJYCT5nEwB2Y2Ytbo1CDE4vk49Icg7puUFLkxCoucs9R4sVyZGYcy41I2w0CovL5N1R/PO
	rp5sI3wlVXFZUabkJewKyB/FHBbUlR9+0InqSXDvQqZFry+uIjLx0X6oNOe05/i3jrG13p2ycKTFU
	YXHZCyP3NJbLgGltjbjS7so3S85hykGLCvh6CnjK5w9r/Xv0d6heoSPsF9CKxCm2MZLvRjHTtiIKj
	nrbFFAhFbH0I+mrSaxIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDhg9-005vkq-1A; Tue, 19 Jul 2022 07:30:01 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDhfy-005vgo-EC
	for linux-amlogic@lists.infradead.org; Tue, 19 Jul 2022 07:29:51 +0000
Received: by mail-lj1-x22e.google.com with SMTP id u14so8382822lju.0
        for <linux-amlogic@lists.infradead.org>; Tue, 19 Jul 2022 00:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=qYJ2Ci7a1lf89U1vcDBY/8u8HhjuVkqjFLJSEkMj5js=;
        b=YPtJ4Ht2+jDuXfhE+S4rx1PKtgJo9YPPW+4ozWIKgJ+vHqvy9qGnTbe9sWKLtoZoxU
         CIQF/Mt1IONb9Ra5dk0390QEA2tGt1mm+GgCKjw2+4c9uyS8422nmCdd2rPx7iG3XKgW
         ZQdhWeTtw/d/Ezu3bhQIYliiHmc1xTho/A3cWmoCvGfSaiqHx7R5YRvW2ieDYoCPzAVd
         TW3a9EhghwNm1zI/xon36cf4dFHRTexgl/Fa5Gj5l21cFOocZ6eUB2DqaTaIfFFSb7T6
         a11R70OvPvJ0uo1ytdEv84d5IRofuGVfuiBWdwQLAn1jpwP0TstN5ZXJsh5qcYv5hhrC
         DTbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=qYJ2Ci7a1lf89U1vcDBY/8u8HhjuVkqjFLJSEkMj5js=;
        b=ROk7G1ZY0U92SjEEBI1BcFVFV3F5WCuO1iXh3/KfxAn+WoZZzJc9qkTGXmfrwkDD0S
         3pRBsa8srKZTlaXplnVSUuhjpCE7aaUni4rMiAxWEZ0YE5NB1PW5niMhUdxo349Ew/D4
         D7DqQ1VwG6dKJRkocOsg7DiBOh/OU7/76KsFtKTtE5VW2AuKK4YiaUnRJ95YumoDlZtw
         XKI1xjaMTQKITTAeE0I8/8LjMs2Kmq7dg/WiCsdlqIQow6FeXCLJDdyo7WlNSIpdBXlx
         meRpSzr0rwUxpCw1xCfotCHszyhI8gO7hBjJYRCaSnxXLpaEq/VG19ZYe9rCHwX3GiVb
         279g==
X-Gm-Message-State: AJIora+Rb8TqouyocxF5RZuPZlytLjBNks5VyGj19ZIxVq0T/h2K560+
	4p1SH8Rf9M5rABtppze32bCxZQ==
X-Google-Smtp-Source: AGRyM1sxC2K13iDqWHb5X25rEERWhy/0IQ2/nnzau7ycdv9fY+X1L0+CnVLZLjqYFJO9YORihTHvZg==
X-Received: by 2002:a2e:9992:0:b0:25d:8e5f:bb96 with SMTP id w18-20020a2e9992000000b0025d8e5fbb96mr13646884lji.113.1658215785732;
        Tue, 19 Jul 2022 00:29:45 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id h11-20020ac25d6b000000b00489d16820ecsm3067155lft.165.2022.07.19.00.29.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Jul 2022 00:29:45 -0700 (PDT)
Message-ID: <12a2487c-6d49-af99-aa5c-edd7a2eff071@linaro.org>
Date: Tue, 19 Jul 2022 09:29:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/3] clk: meson: s4: add s4 SoC clock controller driver
Content-Language: en-US
To: Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20220708062757.3662-1-yu.tu@amlogic.com>
 <20220708062757.3662-4-yu.tu@amlogic.com>
 <7fe9aab5-73a2-6209-ae65-d955c426f745@linaro.org>
 <f5bf2abd-4d60-523a-3f84-879da2f1c78a@amlogic.com>
 <152cee25-9a36-a948-98e7-847d9ee36c1f@linaro.org>
 <50078eed-3c24-a4b5-1e21-3187daa9867a@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <50078eed-3c24-a4b5-1e21-3187daa9867a@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_002950_516111_80F974BA 
X-CRM114-Status: UNSURE (   9.84  )
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

On 19/07/2022 08:58, Yu Tu wrote:
>>>>> @@ -1772,7 +1772,7 @@ M:	Jerome Brunet <jbrunet@baylibre.com>
>>>>>    L:	linux-amlogic@lists.infradead.org
>>>>>    S:	Maintained
>>>>>    F:	Documentation/devicetree/bindings/clock/amlogic*
>>>>> -F:	drivers/clk/meson/
>>>>> +F:	drivers/clk/meson/*
>>>>
>>>> Why?
>>> Warning is displayed when using checkpatch. I will correct it.
>>
>> What warning?
>   ./scripts/checkpatch.pl --strict 
> 0001-clk-meson-s4-add-s4-SoC-clock-controller-driver.patch
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> If I add that strange change, I won't have this WARNING.
> Should I ignore this warning?

Yes, it's not related to the patch and the change you made looks not
correct.


Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
