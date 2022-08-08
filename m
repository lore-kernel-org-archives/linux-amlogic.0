Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1839BC00140
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Aug 2022 06:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hre6bARTbCy31ZXnFEG339yZGrF8FwadP3mxQCqrros=; b=1MsmDkoOAca8DP
	jjyp2kpNZroS2HLOlzWGP1PPfIWILS8XB3ARS6fTE2s1pBzWmwYal922xDQjdgsNNOjL+G9HOSKRB
	8aCN0M5fRjj+pmreGf1RWPgKw5LrAR1oBbQdBknR73LD6tqDHprJWzLfJRjoRz2U0ht9ZjPt43Uk/
	YIlbJUxWoOyltvmr47FJgBRNNp5830cdo/M1hiIpbIg/GqDljzhAnsD6L1NE/9QCXGTSuUPtqqqnd
	xDcGPaD2Ycyc2xCUAqMmNvy4G9rehZP/nVUv3Q7FSKAoV9eIW1sQhbZZWf31SqUyjxJWcav8qshmV
	SlwMEV6X1kynE0JuqcjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKw27-00BbCU-O1; Mon, 08 Aug 2022 06:14:35 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKw25-00Bb7Q-Cm
	for linux-amlogic@lists.infradead.org; Mon, 08 Aug 2022 06:14:34 +0000
Received: by mail-lf1-x132.google.com with SMTP id bq11so11223197lfb.5
        for <linux-amlogic@lists.infradead.org>; Sun, 07 Aug 2022 23:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ompPcRph5SE2OcXFEkgWpzfcSKSgmCD4nTXnvDSGRVQ=;
        b=TaGrVBJes0/24VTEqZsfwl5xn/6YdzpvB/VFk7wDHgZBZCAXJv3dPYovHNi28fUwj7
         ySl+kIzkV5PcFebmdnCKE0BuUmAGA6ODFQj5b916U0+FmlkHoPgxog8bMqAm2L63oVPP
         loitqUG9ShBRalABJifTs9mnABU4/4D2H2fZCnWYnUDYkzN5bCiVuOs+SGBQSuKxEi7T
         RorieaqgkeFpJcjYzuqzeOb1/UxxqFG1eDgYy4FeYrBKetIMpi8DgM1wq9nHk1ahbLpe
         PGJMatMmmRqjc5EEa4+wM79vPea+ty42i2VaXe+XqdUueZQE1jWynDaJ+GRrqMJhwSpa
         Zh7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ompPcRph5SE2OcXFEkgWpzfcSKSgmCD4nTXnvDSGRVQ=;
        b=6VSQrATBAQM1pd8PMQr19zDFsygQgbZL9e1c1z68JWM6IlKVJXaODqC9lXa+8dQNCf
         okGT0+jVWgeEhJn73+GQmtiV6Y7tfrY9sLARf8b4Y8SUXmwHwR7SUwgIVQoP9zT7AMtu
         YJTl61FWPK/XL1rLKfvgaR6+kvP5/xhYLCZlLO3PSIVYVVpsU96EOBn5qE89rI1RyuMR
         fIOBnkC6QBcuJiqUuTe3RUa6shJEqI7jKyQFSH9mVZjCGqbXi9IwvUHfP9hzgmaWKPQI
         1usW1iJ00d1iUCfCCMnfp0tB5/VHcQz54Z7bajxP4/rCoPMLK+T5rtre+rTIAabHYEXA
         L1Lg==
X-Gm-Message-State: ACgBeo0foMZPsw0aAiJ/ymFAJVSikajlkSi7PsJHsHf5gHKH4xwIZYuc
	CgCGVs/kKDGi6bfODVmVdRMeTw==
X-Google-Smtp-Source: AA6agR7Z/MOhjFXYhQRjYiTUo4lEsDfla2XkL+FYEksAUOVz/UdD8SVoCa6se2b2K6jZ//oPCmuuTA==
X-Received: by 2002:ac2:5c02:0:b0:48b:29ed:6e1e with SMTP id r2-20020ac25c02000000b0048b29ed6e1emr5620328lfp.560.1659939270651;
        Sun, 07 Aug 2022 23:14:30 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id c6-20020a056512324600b0048b2245519asm1310057lfr.192.2022.08.07.23.14.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Aug 2022 23:14:30 -0700 (PDT)
Message-ID: <a02bd793-e2a4-6a46-4ab5-9bb8c5533df1@linaro.org>
Date: Mon, 8 Aug 2022 09:14:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 3/4] arm64: dts: meson: Add DDR PMU node
Content-Language: en-US
To: Jiucheng Xu <jiucheng.xu@amlogic.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chris Healy <cphealy@gmail.com>
References: <20220805071426.2598818-1-jiucheng.xu@amlogic.com>
 <20220805071426.2598818-3-jiucheng.xu@amlogic.com>
 <e963157e-5ff0-f0c1-2299-50528cf291c3@linaro.org>
 <0fac4541-0d05-1076-487b-86a7b92da71e@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <0fac4541-0d05-1076-487b-86a7b92da71e@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220807_231433_526769_EA9BBEFB 
X-CRM114-Status: UNSURE (   7.31  )
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

On 05/08/2022 11:57, Jiucheng Xu wrote:
>>> +&ddr_pmu {
>>> +	compatible = "amlogic,g12a-ddr-pmu";
>>> +};
>> Adding nodes at the end causes conflicts. They should be added in some
>> order...
> Is alphabetical order okay?

Yes.


Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
