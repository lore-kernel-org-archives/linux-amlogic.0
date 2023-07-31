Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 805ECC001DC
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Jul 2023 08:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AxtaxTIWxKqNaaqsahIBbyfz+KyJLmYvoCklO5f64is=; b=S4acUCmAL1UUjseG9JmrNOy4Um
	1VdJFS9IT7iUSQ3Dmk/KwZO5wSRK6uu+7682pi2/p9Mhrc1fNVppvd2rygAGPjyVE6KGVjtQDw+35
	Fd6u+XpBkLBeGFymsGFL2082i+aunncMtiYLxY1RaGzCWUIxQAocjnIQV4nh6GnqUETXEMg5Iuw5H
	lWelx8Y2BzM5ukRveskWreHHUnw6dR5gKC1xKVMW2Iv0YIml9RtmFf0RWNVWqKe3QBKK111HXPNoq
	XTPZaY3mdoGShIOh9w53vEEEm4aL0z6vCSFuBF1MOAUtf9cx8tKUC+dTbZCNWTE+HnLuYO8NwW/CE
	oDVWZkkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQNxi-00EUdU-2G;
	Mon, 31 Jul 2023 08:09:06 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQNxf-00EUc7-1I
	for linux-amlogic@lists.infradead.org;
	Mon, 31 Jul 2023 08:09:04 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2b9a2033978so61435441fa.0
        for <linux-amlogic@lists.infradead.org>; Mon, 31 Jul 2023 01:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690790941; x=1691395741;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/ZMPq1Vq9+aiEXvy60benY4O8ZQ7ZziRieqMJ71TkNY=;
        b=r80IGWpakAO1kcNvP4errkyd0Z67dJz0N+u2Mb+NCpiXTcJZnFlp4WH3/MWAwk3n6D
         qP+gJjQscKq8VBBLvHaanb7evARPzOhjdNo51Ie2Ttv2yAPBW6XDZB2mwWWKhbb7eqEN
         yuXNT5RdcDNuq0Nc+vU0g8fn37iUa8aYAf3/7NBddvwkkYMNc5ypSM2oQNgS7gLrxepC
         u1q80apdwld9SnqjDP0gaP4Bk0e/yhYQiZy0IDaS/d2gl33SWYMQvpmmefxfyB7HbiWl
         Kl2W/XW9zi31RXEDLWiPVLoR5gM1b78fLVBl0XB6jF6M74oc9cRcRJD0PZCxzKrLx2s0
         hJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690790941; x=1691395741;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ZMPq1Vq9+aiEXvy60benY4O8ZQ7ZziRieqMJ71TkNY=;
        b=EvnfG0uTkDaiY9D4B7dG+Dxf3PT4XOZSJqaU6XHHRDDS/NvOzB6f7PDv9wx7PpNuwd
         OfIWtHH18RVq4u+V1ziVzQ9WdBYhLc+5Irf6wGaD0ctKXS4OqdecmjIigXyFOEEKorMj
         D67SX4GCFDjoITWw5bwcem8od6k3O51FMiwZYr2d86m78AQc5WBbOXkunVPwRZqEmd24
         cK8WhmRh/87Tqj8dITJNon4DJp3SuWq8TX1ML5QdXJg+b/SRyTIj4EpyXwhiqvW3JVXC
         UBr1eZKkf2N9dYoCpMJABthhBopzCnYrR7fx1hLEJDSDfXBau2H2vXroz5nQZnuGa4le
         2eug==
X-Gm-Message-State: ABy/qLZNjOCSbU3YmhuxFCNMSze/CyCRUppvyyQ3obU42yXHCU2ejGXE
	CMNtiGm9+k/8iJePolB7P05/WA==
X-Google-Smtp-Source: APBJJlHoFNF+VGM3nk8XWKZer/sRmq1LlXeWOg6YkoYrxxXqLbMy6VRkmFl6789offjMZK/t/P1/lw==
X-Received: by 2002:a2e:9e89:0:b0:2b9:cddc:adeb with SMTP id f9-20020a2e9e89000000b002b9cddcadebmr5190141ljk.29.1690790941185;
        Mon, 31 Jul 2023 01:09:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:14b8:9aa7:6bf0:256d? ([2a01:e0a:982:cbb0:14b8:9aa7:6bf0:256d])
        by smtp.gmail.com with ESMTPSA id l13-20020a1ced0d000000b003fba2734f1esm13336442wmh.1.2023.07.31.01.09.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jul 2023 01:09:00 -0700 (PDT)
Message-ID: <50935d75-bed6-4919-70fc-adcaba6a30a8@linaro.org>
Date: Mon, 31 Jul 2023 10:08:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: reset: Add compatible and DT bindings
 for Amlogic C3 Reset Controller
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, zelong dong
 <zelong.dong@amlogic.com>, Kevin Hilman <khilman@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, kelvin.zhang@amlogic.com
References: <20230719060954.14864-1-zelong.dong@amlogic.com>
 <20230719060954.14864-2-zelong.dong@amlogic.com>
 <f7b72ee90009f6749700a7bd79a3a63786a82a32.camel@pengutronix.de>
 <68b7d772-8dc4-a781-031b-ea33dae41751@linaro.org>
Content-Language: en-US
Organization: Linaro Developer Services
In-Reply-To: <68b7d772-8dc4-a781-031b-ea33dae41751@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_010903_435657_AC444AF8 
X-CRM114-Status: GOOD (  13.30  )
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

On 28/07/2023 18:40, Krzysztof Kozlowski wrote:
> On 28/07/2023 17:49, Philipp Zabel wrote:
>>>       maxItems: 1
>>> diff --git a/include/dt-bindings/reset/amlogic,c3-reset.h b/include/dt-bindings/reset/amlogic,c3-reset.h
>>> new file mode 100644
>>> index 000000000000..d9127863f603
>>> --- /dev/null
>>> +++ b/include/dt-bindings/reset/amlogic,c3-reset.h
>>
>> Given that this is only included by
>> arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi, should this header be
>> moved to arch/arm64/boot/dts/amlogic ?
> 
> I think there is ongoing work or at least plan to use the IDs also in
> clock/reset drivers for all Amlogic platforms. Do I recall this correctly?

Yes the header is used in DT and the driver, so it's in the right place.

Neil

> 
> Best regards,
> Krzysztof
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
