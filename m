Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 725C2C04AA5
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Aug 2022 12:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FgFJRAyWvT3X2u6USriiKzhoXOHxusVfURNZJruT844=; b=QQolgQ6gQVs+KN
	pqTPN+saquf9GzWuaJCgXb+OV3+TDn2jYSjWVpN/et4iAU0UJEmXT0rEY9HZJ579/NxMGNa2IvGx/
	y4diaNAZBwOXjQoRYs+jPLwxfqCMBZ5oMeXHjAsiDXyGoinH9V1m4PVWVrDahZUsyirxL37Zs15fp
	mpFDx9P5CymLpzK3O0voRPqTnuevlfrDy4AChdaJJEdB3TMw9B4JQCtUiBJiQDB0T8AYSRDfIr0Ur
	po35aVDiW8+mxfGOMZ8DVcZUigRL0+NCpyaD2IBKznYtuJ50f01juyWMuMeiAkvLzjCOyspq+G3Mh
	UJv5bfJ6GzBN9kBHvJhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRBZV-00DIAh-Ek; Thu, 25 Aug 2022 12:02:53 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRBZG-00DHbI-Il
	for linux-amlogic@lists.infradead.org; Thu, 25 Aug 2022 12:02:39 +0000
Received: by mail-lj1-x232.google.com with SMTP id bn9so11655327ljb.6
        for <linux-amlogic@lists.infradead.org>; Thu, 25 Aug 2022 05:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=o6731Xg3uO5AI5x1e5LBWQaIC7OQDL55NoHUUcojApI=;
        b=P/0dLvrSbYllUSKNvLcVaTp/7rEj9xNoOXS9wBI5Pz3SHQCDQECfMJpzwQA2h8/QX8
         rndTmAuJxXOT4pF861scjFqx4+O9kfdK6sofBbQSun3MwD/bWYzOhUGqSI6by6n2Khpn
         HFT44xpkDWe+xGpDMu/Cx8/77trn3yIRZc06MTeaghRZXgzCaMM1RpwMkte53I+fwKYA
         XuJdMt2PPS0VN1lwevlr3f5eG88M7srNyMO9aZYVoRYLx7fYe2lBbF0cim+jK9hctwYB
         ZXuDcxJ1oCiJ5sxZFGvuXBoOPVnp5yMGYxgLJ4DEEeWusz3Z6pcFaA2dPatQS1Du19Xg
         NVtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=o6731Xg3uO5AI5x1e5LBWQaIC7OQDL55NoHUUcojApI=;
        b=4LzJdPS5z2NWLc+GQTuMOyrKlhouYD+Zx1Y6huuBxhrC3EfTei7cLy7q1caz9XyUPV
         RQW8XeTlDqGC+IAsjpxNBPyhN/ZlB64U6NpaACC6FzK2QUD73ec0bPEVKQJW/OxB5pTa
         u+R+vXXAozOGUyj5IK1KKaxs+d+vulx919H47xxtjRqcFMBj6UuD/RjiKn7kTNNlkgBq
         aDD0v0Cw0/6fAvRp3q5DBMyki1MJ3XBN1bHFMaX/r2GPkkl3Ax9JDeZXoWi+ntluLWkS
         j9++rB/JNNEGQAPn9aMkDqK1nMEDH0/OGA6iXb2RJWwYrcOoutbhxS7b4e/tbeCeACnk
         bF2A==
X-Gm-Message-State: ACgBeo3ApM8wZciPcYkhEC8IUBiGRwwmTuOJ61Gul1yvkGPIOy+IJyjG
	bdGSGnUJOAm7wmB0PQyjZOq18g==
X-Google-Smtp-Source: AA6agR55GD5od73dv0g9JiBl5UZUqTJtQdGJesoeHaC6tznWWEUcvvev13E7N+dsDBjpXhVKDLAZxw==
X-Received: by 2002:a2e:9515:0:b0:261:b705:9909 with SMTP id f21-20020a2e9515000000b00261b7059909mr980260ljh.508.1661428954598;
        Thu, 25 Aug 2022 05:02:34 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
        by smtp.gmail.com with ESMTPSA id g9-20020a19ac09000000b0048aef1abb06sm471094lfc.69.2022.08.25.05.02.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 05:02:33 -0700 (PDT)
Message-ID: <debf4f0f-7d94-4fe3-c1a4-9e986e113c9d@linaro.org>
Date: Thu, 25 Aug 2022 15:02:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] arm64: dts: meson-s4: include meson-s4-gpio.h
Content-Language: en-US
To: Huqiang Qin <huqiang.qin@amlogic.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, narmstrong@baylibre.com,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220825115154.2150323-1-huqiang.qin@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220825115154.2150323-1-huqiang.qin@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_050238_630800_9AC51530 
X-CRM114-Status: UNSURE (   7.09  )
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

On 25/08/2022 14:51, Huqiang Qin wrote:
> Add the included meson-s4-gpio.h in the meson-s4.dtsi
> 

Why? We can see what you did here, but commit msg should explain why you
do it...

Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
