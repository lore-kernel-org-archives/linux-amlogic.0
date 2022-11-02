Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 496ABC4332F
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Nov 2022 08:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i1KnQ8gfA4u6MfRzqcePD9diKmb93Y0v8BzkZtMMzic=; b=3kkHWi458BGjk5fSeeazmwfxqc
	7+P4ozu70+FDVAT5Tneso9h/BMej6fNBWbxIjnWneVRHsPbIrTXR8ET2Afj0cigw0EAGNbTOSYW0y
	uAl5Sujd7UDkl+SBdD4xM9k0e6rm+V0y4ixQgyqvk9vsVsIgTH+7CUExIsBWNML/us31NGYLk0ReX
	kzzcRH72hpPawNLnrgpJkfQfj3RvFCCGigjQavrJeBggVmogeKIqGHeKjZ3MaqQEIOhNro2Wmh64q
	Vn+Kc8VdGoHaSBPXHeAALb/Miu+vMP8k6owbBUPRW7y5Wtd7OVHCWRPVjcmJZo0K6MkZ6gUUUjKw1
	pPeb9VIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq9Gc-0092Z8-GH; Wed, 02 Nov 2022 08:38:34 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq9GP-0092OJ-Au
	for linux-amlogic@lists.infradead.org; Wed, 02 Nov 2022 08:38:22 +0000
Received: by mail-wr1-x429.google.com with SMTP id w14so23382865wru.8
        for <linux-amlogic@lists.infradead.org>; Wed, 02 Nov 2022 01:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BvT9kf5BTtKmq09LqoceItJYkcPyXkCgbgmlD1552lI=;
        b=CcuR7qmEPZxsqCFuS6zPktbtXA0halB9mU6/SoDaivOMcMMZ8WMLVqr82rijeKB0Xt
         JqDzZnK3eo3bmYccYJHvCNiutAG7MipVJ62vyY7lBlbFtR8DWKShXS3I7aSaUN9fX5gi
         VU7lzgAwUTWwRN1cYe9+jIfz1b83yoXyxsjBjrW0utw0Mah5Zue6zIL600uY+l+hiCmT
         xMUAbljSH+k0oYL+FmM/kA9tH+dNIKxhmv82PZixy/ERhN9GHE0mveBv2QBK0MQUGiMp
         IfFo0MeRugLLakc/3ZP1hXWwnIBanWoND0RgU1WKMjUOY9pEZvFg+ZsInkE9p9HV98fB
         U7uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BvT9kf5BTtKmq09LqoceItJYkcPyXkCgbgmlD1552lI=;
        b=5E2cDDARxIffOCPoxKqscEGgpvZV5uk7c7fdD9Q9hh1wvZqYg5odsQI5VBzhm2i72J
         tR+sX+EJLezj15cM+LBtpr3Bz6pqurKTSjnC1RdFchK+k8vj9Sga1QYAnvb8+M78NSAm
         eIcyvUjttlCE/yN6tVaqkpPIzby6NJkopkG6RTnqHXEMF1BsCIb5TTjzlISX9DhuxmGB
         EOaOkqWDbt0xcLnQY7ubu4TzOBoPutUQoUoMCGmIGh35X8VCQzR7qqABwv7qP/DVpO2P
         F2Bo2PWNokIqJ/bLvZ5FFLk2OVwqVbEr3uE3nkof+HrjmrNktsnB4lPlcpYLZXOioil6
         cCrg==
X-Gm-Message-State: ACrzQf0jPM31Er42nVIprHK+0pyTqU9lSjnpBuC7wWPNAAmqSu9DknPT
	DOxsrTgsnH7719F+k1CHK0JeaA==
X-Google-Smtp-Source: AMsMyM5xffb8Gbv/LZqtSakj2Eo0F4VehH3Lv16f+r2sDSsxwZp3bHD+76DIeqSa+hXeqcXkUS0hgg==
X-Received: by 2002:adf:f58e:0:b0:236:a8b2:373 with SMTP id f14-20020adff58e000000b00236a8b20373mr14480463wro.575.1667378297124;
        Wed, 02 Nov 2022 01:38:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:6bae:ac40:a798:cbb4? ([2a01:e0a:982:cbb0:6bae:ac40:a798:cbb4])
        by smtp.gmail.com with ESMTPSA id x21-20020a1c7c15000000b003b492753826sm1218514wmc.43.2022.11.02.01.38.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 01:38:16 -0700 (PDT)
Message-ID: <59f1364c-2ee3-d4f2-9291-a8af9eeed81b@linaro.org>
Date: Wed, 2 Nov 2022 09:38:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] spi: meson-spicc: fix do_div build error on non-arm64
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
References: <20221027-b4-spicc-burst-delay-fix-v1-0-5a6e9a88e54c@linaro.org>
 <CAFBinCCx-8u_VNjNtjivgwp3aOc8cUppxstwzzLL1oGLtS6tZA@mail.gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <CAFBinCCx-8u_VNjNtjivgwp3aOc8cUppxstwzzLL1oGLtS6tZA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_013821_419508_5063E3B8 
X-CRM114-Status: UNSURE (   9.57  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 01/11/2022 20:13, Martin Blumenstingl wrote:
> On Thu, Oct 27, 2022 at 2:11 PM Neil Armstrong
> <neil.armstrong@linaro.org> wrote:
>>
>> This fixes :
>> error: passing argument 1 of '__div64_32' from incompatible pointer type
>>
>> By passing an uint64_t as first variable to do_div().
>>
>> Fixes: 04694e50020b ("spi: meson-spicc: move wait completion in driver to take bursts delay in account")
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> and also:
> Reported-by: kernel test robot <lkp@intel.com>

Thanks,
Seems To: Mark is somehow missing, will resend with it.

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
