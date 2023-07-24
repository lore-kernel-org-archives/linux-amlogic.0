Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D32C0015E
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Jul 2023 07:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MZ7oUIBNLVzsNoH5mbkb/hPrhqJulJEfsTgg3lD/QB0=; b=A3J9tyxoJNjsxU
	iyl8Mm8ShYXCVWW9K2eUeH1k9DW70qBoVwPikuY+05P0xkxFmMm2PgObesvHsC0OXGWEPyVVPonSY
	BIsHKg62ji4o7+ZjeUa8PppjwuJ79WMouJ1Za1V2/S7nlwL2l49NNqzK9JTt7OMDFSDBuj5YnbISQ
	0a64R9qe5xC8WPQUV+npfEShLCN7/1OBNkq7R72mFfVGPAoKPr7Rm3W8nxpAUM6b6XcimiBH0EzuI
	XhD3W2Ib/A0vHdASx7YwkSliRAMOtxKIvmnNHsS/Uw8KLwBuJOVykitgkAPI9TC52+44okhP++KbJ
	EphYMS7SS12jczSLg3yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNpx4-00360C-1i;
	Mon, 24 Jul 2023 07:25:54 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNpx2-0035zB-2M
	for linux-amlogic@lists.infradead.org;
	Mon, 24 Jul 2023 07:25:54 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-51e429e1eabso6025659a12.2
        for <linux-amlogic@lists.infradead.org>; Mon, 24 Jul 2023 00:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690183549; x=1690788349;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W9l6Fr37LZFsRI9a0cNRKO3u2d4EkTsh5kDdAxFsIuI=;
        b=t9vzLQ9R8JYoxSaw9dEkBOCBjCFmpSHYtUzBgPJ3pXOUgFiR4HbwH/weIkqYtWTnB/
         ev8/SA2VV71ZCmED5AALV5FndUCgw1iqyxftbB5HJlQXoL+2WCQZ4ThWLdsCwvQ0fjpS
         FYdxJh1TQPh/EEIz8LfAqJWjubGC0qTYBlzzR2W1t3ZbAZaQ/2ME2JZmA9P8+4PxbrX3
         gINhauBulbi5+Tbf0M4T/8zSDM5G1J3donIDnbDT7rZEhx1c66nuTYwv2EDSBhaP+an4
         My4BhRVpyZCbAD9l9iyDn9QvDx1mXt6xTENO7/T+5qhQGJHEenCO4NoIRR/UQJhjwrU2
         m9nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690183549; x=1690788349;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W9l6Fr37LZFsRI9a0cNRKO3u2d4EkTsh5kDdAxFsIuI=;
        b=G7YhnsiZw63KUkuj/YTcFGNNzUF0+QbPHmFjL7q/MufDgB1CnPmsrimnuAUNdZW3Sg
         FyYLAntsFPQSaci+Cx8HdmpWIvb+wIxYEhudXZepApIU+41X00f/hKqzGyaJ2xeR/WmR
         nc0dIxRxADag+8y6iN/7m4JOREWj4rKvV6SkYge29n2iStOxIoMAWFHWAoI4IW4ffqmw
         s9m3WgRh1Pws0C/UNwUxq0XkyW1eRgFuKGsk7bYFFjPpajciyKmmtNiNRLhrH5GBIyUi
         9AxNcShaydrTvc4/qGkrsBtVlC6Eal3QHlYmo5TZiG73VoAjBTyLeCQGcbmh9kGxso1y
         Orvw==
X-Gm-Message-State: ABy/qLZJqbpUz8cHCyVqk0RBL/17hGFcKONZWn4DsAYK999coLO/Ye44
	1W4qXxq6d6L89K9afWxvih55Pw==
X-Google-Smtp-Source: APBJJlF9IAG1RI4StyH32kjNgDCa1flUBleL5s+aVpEXrbFOAOpWmrTFckd4EbsDhL8JWoJKxTxFfg==
X-Received: by 2002:a17:906:3185:b0:965:fb87:4215 with SMTP id 5-20020a170906318500b00965fb874215mr8662868ejy.15.1690183549124;
        Mon, 24 Jul 2023 00:25:49 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id bt16-20020a170906b15000b00993159ce075sm6235250ejb.210.2023.07.24.00.25.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 00:25:48 -0700 (PDT)
Message-ID: <61409dfe-60b5-e124-a6ef-5437752f4d2e@linaro.org>
Date: Mon, 24 Jul 2023 09:25:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH V2 1/3] dt-bindings: interrupt-controller: Add header file
 for Amlogic Meson-G12A SoCs
Content-Language: en-US
To: Huqiang Qin <huqiang.qin@amlogic.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, linus.walleij@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20230724060108.1403662-1-huqiang.qin@amlogic.com>
 <20230724060108.1403662-2-huqiang.qin@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230724060108.1403662-2-huqiang.qin@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_002552_769766_CC1FDE67 
X-CRM114-Status: UNSURE (   7.22  )
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

On 24/07/2023 08:01, Huqiang Qin wrote:
> Add a new dt-binding header that details the interrupt number of the GPIO.
> 
> Signed-off-by: Huqiang Qin <huqiang.qin@amlogic.com>
> ---
> 
> V1 -> V2: Rename irq-meson-g12a-gpio.h to amlogic,meson-g12a-gpio-intc.h


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
