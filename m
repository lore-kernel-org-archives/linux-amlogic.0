Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7AB2EE57DF
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Sep 2023 10:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EXL5i5cNN8ZHhFdp2/AiP22+x+mCnLs6P8qJUgjwGO0=; b=PycJxo73nbIciv
	DoEUMYrxlQp8p/R0notebnJzzVH0OIIvRtUN9O1eux5+ztIy5XkEfG0jax0mlZpRsNDBchz4kJ55q
	5Cq+NdliKZ2tbvF047Uue280FxkcbB6T0HKt2cWwLkN1nGDSqJwpkn0DnrPQJYyRdOCFkd7VKOvMv
	5VHlJmZNSdGa5Rr07Y/qR4TYZCn04upTIpjkAUirG7XmiQLeR9lJhtSOiJ479jETQ5YQzjBgg7uex
	UiGDou8DZxOjsngZf7WHopGyyG/2bCddW/9W8BnVXBQGBUIIQYPdX/kBq5moXcR7VRCCfppMUhvqY
	wiGWrmiBPYRSBs4mABtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfeLC-000Hlg-2j;
	Mon, 11 Sep 2023 10:40:26 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfeL7-000HkP-1q
	for linux-amlogic@lists.infradead.org;
	Mon, 11 Sep 2023 10:40:24 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-401bbfc05fcso47489995e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 11 Sep 2023 03:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694428820; x=1695033620; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nZSXoR1SQBbf2X2ttBO0g4HsNPppA2Wq4FfW/XOJFlE=;
        b=kvPW+rp2BhqRgqW5/JJrbQo4uvPyg/BS71Pv0u40wDs+9Z2nnH/kNmGdpMrbqFndnb
         p7rcwrEf6lY/Ken8kYs3pWj0WbDu4NzrHku1ENQrN7ICVsgrT9GGf/WXqw4lAyt3wmld
         M7FM9+tgvVTFrcxa/6mSJvm7T+s4rmVD48RM5Whmi9nj+iH+JfrbmL3Y3Ll6Q61elMzo
         TZ4rjhXZe5iC+rUX3kPsEmbag6+w1JXKXDGYvW8b93CqLRDV47tnQAELtb9dGkP25o++
         jixWm15FSWvyhbmBhbzYsFfYqbNteQT4letdGeRquWUwWLvQHM5gxOho0jsw/Elka/sd
         f3ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694428820; x=1695033620;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nZSXoR1SQBbf2X2ttBO0g4HsNPppA2Wq4FfW/XOJFlE=;
        b=ScEa8I0akteERvHeighMxEeUHcLNHcJTMaPMP72LL3/PL4bWf+GFLHt2nTQVc4Cbzt
         +8QK95WsXi2ebmdeAzAaLm81XZJgwTAD5qRPFi0Z2Kc87U/Mg2fSYshpbiHajGuJfJSw
         prd9jp3L9kFMjuBNWJWoSJte831Ksa64fx/uWqacbhXMDUXsqvH6MLQNr0gt73bzLY/6
         ikypP7ETrfJOeQKEUNS15X2TfABlN/L6oHWaRDLmuEwDQj0Ne8vVviJHch0bzjYWhxki
         DpsaG/wWokPGNdLhCe0fPe8BdOqZLj14zYl+YJL1xgFwGFRNL/gnLISkLtN6TCat8ron
         9+Jw==
X-Gm-Message-State: AOJu0YzdolWRemBHtKSMrc2980SA3IE73znj8O2EptVNHhNTLMQGfjmG
	yZI0OlGiwtCBex2J5pM2LA/MAA==
X-Google-Smtp-Source: AGHT+IEMtjw51WJ6go/mT//XcIW9jxT+cdwMORAppGRhH9+qDFNOXpaVSQf8LSknkwL6HqZrY9iqUg==
X-Received: by 2002:a5d:4204:0:b0:317:6175:95fd with SMTP id n4-20020a5d4204000000b00317617595fdmr7382285wrq.43.1694428819896;
        Mon, 11 Sep 2023 03:40:19 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id n8-20020a7bcbc8000000b003fe29f6b61bsm9633911wmi.46.2023.09.11.03.40.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 03:40:19 -0700 (PDT)
Message-ID: <a2cc29fa-4433-30d1-2206-d07672cb1428@linaro.org>
Date: Mon, 11 Sep 2023 12:40:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: (subset) [PATCH 0/3] This patchset adds IR controller driver
 support for
Content-Language: en-US
To: Sean Young <sean@mess.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 zelong dong <zelong.dong@amlogic.com>, linux-media@vger.kernel.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Qianggui.Song@amlogic.com,
 Yonghui.Yu@amlogic.com, kelvin.zhang@amlogic.com
References: <20230825115310.39993-1-zelong.dong@amlogic.com>
 <169442559302.3235506.15361466537260729684.b4-ty@linaro.org>
 <ZP7sKdvAWQQSrTmX@gofer.mess.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZP7sKdvAWQQSrTmX@gofer.mess.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_034023_216524_EE9C61EF 
X-CRM114-Status: GOOD (  13.86  )
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

On 11/09/2023 12:30, Sean Young wrote:
> On Mon, Sep 11, 2023 at 11:46:33AM +0200, Neil Armstrong wrote:
>> On Fri, 25 Aug 2023 19:53:07 +0800, zelong dong wrote:
>>> From: Zelong Dong <zelong.dong@amlogic.com>
>>>
>>> Meson IR Controller supports hardware decoder in Meson-S4 and later
>>> SoC. So far, protocol NEC could be decoded by hardware decoder.
>>>
>>> Zelong Dong (3):
>>>   media: rc: meson-ir: support rc driver type RC_DRIVER_SCANCODE
>>>   dt-bindings: media: Add compatible for Meson-S4 IR Controller
>>>   arm64: dts: meson: add IR controller for Meson-S4 SoC
>>>
>>> [...]
>>
>> Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.7/arm64-dt)
>>
>> [3/3] arm64: dts: meson: add IR controller for Meson-S4 SoC
>>       https://git.kernel.org/amlogic/c/dc8bc779feb5e855421215384f23de90a4fcd622
> 
> Would make more sense to have all three patches go in together through a single
> tree? I was about to apply all three of these patches to the media_stage

No, DTS should not go via driver (non-SoC) tree. If you insist on that,
it would be a sign your patchset is not bisectable or have ABI break.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
