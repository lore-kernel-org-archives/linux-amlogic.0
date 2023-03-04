Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B829C678DB
	for <linux-amlogic@archiver.kernel.org>; Sat,  4 Mar 2023 11:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HVADaO8qtXJBbqS4TW7pGuTZFiSfeMDrRC0QzgEMQ2A=; b=BOFZWIyP2NzW/0
	vWC0QPKsH+U/ETnHe7YXNrIksksevy9Qw44g/FSZc3TIu73iET5dDhmEwwDi53FlxiDsakCsdlRm8
	lt4I7n04lMNIRyefzIG+5FyEfAB8eUl1RCPXgwMHqRc7VGhJb03GnBQ/eE5tmJA5zyyoou0QB73N4
	dYIqQreGbmjkGa+E2ePfxdhNcvxZCIfeJFB9IMJ/hO87d7GukrDL56jMxfO46fMXLspZjhnKHsr9V
	9aa8H3VVDvpJb9ZlZP5mmtUVHeXWVzz+dgASyRbuVQj2FW3KbFiTDuud6iDAjNvz8bUl4zWyHOeyE
	0xV3rCKhXRNzz6ETcglw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYPrv-008qRR-WD; Sat, 04 Mar 2023 11:16:04 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYPrh-008qN6-Td
	for linux-amlogic@lists.infradead.org; Sat, 04 Mar 2023 11:15:51 +0000
Received: by mail-ed1-x534.google.com with SMTP id o15so19893088edr.13
        for <linux-amlogic@lists.infradead.org>; Sat, 04 Mar 2023 03:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677928546;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=riI8W1OeTdanG6DhLcOpMcEAV7nOWyx0CknvtQk5J5A=;
        b=mNEYt0ZBSD9Wxo3IkINZY3iH4zFidKlQUzT5GeqV5E3De2RLR6HD6C2+EyRfyzbiXv
         RqO9zYK2B5W2/a3G2uuzLRlKd0KZR65xXPSRo94HX5YS/Eo1/vp2Nc4lA+eaoIRXrl2m
         JbxzQTu/mDTqnNk+v6HlU8qXQDeC3rNQCb0Vg/Bh83kkdyJ1sChZS5S3MND5W9ySZmLw
         8H9SgAEvHZXuIEFDtgXU8L0Ylo9YuyXmmpbz839AoIHKyO5NvtzkS1uIM66NSMoEdok1
         nsqADHt+o4rRP526Ic/ASZwZM11XHgePGtDDv1bK/mF11bRfhGJMlnSkIaH3GfzIcxIR
         q3ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677928546;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=riI8W1OeTdanG6DhLcOpMcEAV7nOWyx0CknvtQk5J5A=;
        b=BvKub4RDOzNp+s1rhdTjtJKnBoMODd1Do6nTl4aG2pLgipyeD9zsX+ZQU7fNNWTFie
         ubvE3vtjk83Qgm50EA9A0wJkcf66uYF9SJQ4NwLCu/pNpoDxQzaHiQXLvjFruUpL2NWv
         tUCL1bY6tGeVUYoA+ttfjta8xlVyqbLEFhEKAlJugwDp8mmVJ//PQrf7kTq0shUGR0Gz
         ke6/1yaVkrr8q7xIbhobE9TV7Lz/vyZlP6QwmYlow8rk1ecXDg446uBZIYJQPL/roIOd
         kcKVnaZ0xjTUCD2ytkSG9EWAo2GVaWV6G6LGI+Srn1Ux7tibaCv/cuDQnNKk+nA+jQOb
         LmyQ==
X-Gm-Message-State: AO0yUKUVJR6xznOneCcvpmlGLNtC1xixalwC8olM/ajHGXixn4RZnjtV
	JE0JG4V+0mO0DGY0gQIyDmOpYg==
X-Google-Smtp-Source: AK7set8f87SwQanTdMZHKvUZpuyMEd19J3rFxEsNxx4MjXorqExKUzPiHhkn8y2uKTKzmH+vbvqiUQ==
X-Received: by 2002:a17:907:98e5:b0:8b3:e24:de0e with SMTP id ke5-20020a17090798e500b008b30e24de0emr5068705ejc.27.1677928546309;
        Sat, 04 Mar 2023 03:15:46 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:b758:6326:1292:e2aa? ([2a02:810d:15c0:828:b758:6326:1292:e2aa])
        by smtp.gmail.com with ESMTPSA id ss18-20020a170907039200b008d325e167f3sm1940199ejb.201.2023.03.04.03.15.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Mar 2023 03:15:45 -0800 (PST)
Message-ID: <bd314b74-6525-b790-bcc3-849c3c8bef09@linaro.org>
Date: Sat, 4 Mar 2023 12:15:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] dt-bindings: arm: amlogic: Document the boards with
 the BPI-CM4 connected
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
References: <20230303-topic-amlogic-upstream-bpi-cm4-v1-0-5a23a1ade6bd@linaro.org>
 <20230303-topic-amlogic-upstream-bpi-cm4-v1-1-5a23a1ade6bd@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230303-topic-amlogic-upstream-bpi-cm4-v1-1-5a23a1ade6bd@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230304_031549_998616_9A3D1E5E 
X-CRM114-Status: UNSURE (   8.90  )
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

On 03/03/2023 18:37, Neil Armstrong wrote:
> The BPI-CM4 module with an Amlogic A311D SoC is a module compatible
> with the Raspberry Pi CM4 specifications.
> 
> Document the boards using this module, by specifying the BananaPi CM4
> compatible in addition to the baseboard compatible.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
