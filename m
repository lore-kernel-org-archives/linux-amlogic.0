Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 685C5C54EAA
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Jan 2023 09:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jYKNyXzVrFavoRJJCHMFLXQIBqyYZpU7813wnfMWT44=; b=3Mq5EeB+CHRYmG
	OtjlUfV+PPRdpszuZYaj83RoZDTW4dWAa4aujh9LZm9XPmzsLxXyrafq3BYJft20pKkhrPOnTZNMA
	uLx5z4+E8rQOZsRrw2v4HKK0hXcq0sDG6JC6Vtfcfm3U0V/FVg+8f/i+jf/NT3kw2OMHGqf4bVZx1
	stwHYCQdR0GWE0L/I3tq0H4xRLk0D7sV7bW7sQBHIIQWF3XtmHLlpPUY06pOtJHSSoI8mHQliYdqO
	cOgcw0s6xZL8dRQ53AV0LFapOR2wZB+w8badFmfwyg7sl66EAJcpkIR1qfwLr4bFe/K8I5WFHubmR
	KqEgh0WrMdBTi5Ev3pPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLLCB-00DigX-Vc; Fri, 27 Jan 2023 09:38:56 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLLBG-00DiJ4-8C
	for linux-amlogic@lists.infradead.org; Fri, 27 Jan 2023 09:37:59 +0000
Received: by mail-wr1-x42f.google.com with SMTP id h12so4387910wrv.10
        for <linux-amlogic@lists.infradead.org>; Fri, 27 Jan 2023 01:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yksAV7yHL3wN3w9c8k40mCMMPiyV1hd99TyFgaBpDUE=;
        b=Q1IgsFXQgA4vRbKnGHEV09YcIKYNHOU6wbfDCYOa/8oRhBoDcw6DOo3ZtKEAlh/hVz
         DJXrF3MPff5EwbaLVr5ax7Z1ASkgVRgaqhrum6TGTC4BF4AzSIDJb3HMsnFv3BL0KI6/
         hDyRGvdPoXOnHloSa515sLqxxEYhkDAy5I3adl8lqK6S6sLoLLXSpvC4rxcCWqU2ePVU
         g4M/iYrz5B1PflrG4UZ8+Cg4sFR761tiBYlxlG4aqy9XJdeCYl+0isoKHa/U8upK4wMy
         xZmtzVlG9Z1mYf0Zgf3inLuQupaVfE7vsRrndR0C/EA1zbyvM6leuc7wKxEh9L+cR0JY
         QEjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yksAV7yHL3wN3w9c8k40mCMMPiyV1hd99TyFgaBpDUE=;
        b=4gQHZHw5S8EfpqkA5oSD9CnjQcXOcCCBZ74RAYE30jqEHmkmY1oHrZTPp+4F6F3kCi
         O0YDt7KXfrBPXn1Dd8jzBZa22e+L2jNbE0iskFmpjHbopFMIQ5Np5mOfq5vJK1daVm50
         Iz6FNe5YVl/OzmXD//KkWNbJj0K7J2twkxQILiWy6ndUPMVeVtlMrhxmn2nsg87jFv9q
         TMQ+mP8zh8yJYfCycLWLO0JBWpHVR1LuZyFTmgU0BAPd6n+8X1e20idnMA+ngct4BfGP
         9OKXPORB9AQOsxf9W4Ob3OLBl+Iw6Gw3R6Lr0EoubejiBbGvR01/upF48TUY2gCx2vdu
         hgkw==
X-Gm-Message-State: AO0yUKVICl06N0BSg2BSCI0MN8x7XleCfTnTM+YrYMmr+NWruo+g7e1h
	CuBeN/AKUjqZnXw1fxsf4IEFXA==
X-Google-Smtp-Source: AK7set88fvpm7mZ/TBDrWIqtjTBm/K9NABW+jcJf7uWpwGFZ9Oh/xUoCN/DyAVGGqWyO2zpOiFJfPA==
X-Received: by 2002:a5d:65cd:0:b0:2bf:bd43:aacc with SMTP id e13-20020a5d65cd000000b002bfbd43aaccmr7088381wrw.55.1674812274879;
        Fri, 27 Jan 2023 01:37:54 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n6-20020a7bcbc6000000b003d237d60318sm3842947wmi.2.2023.01.27.01.37.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 01:37:54 -0800 (PST)
Message-ID: <7e941a2d-25d9-44e0-7438-13225c87d8ac@linaro.org>
Date: Fri, 27 Jan 2023 10:37:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 0/9] media: dt-bindings: common CEC properties
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 devicetree@vger.kernel.org, Joe Tessler <jrt@google.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-tegra@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org,
 Jeff Chase <jnchase@google.com>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org
References: <20221208103115.25512-1-krzysztof.kozlowski@linaro.org>
 <cd803c70-faf0-963e-fca3-0edd13fa8a29@linaro.org>
 <c092c11f-870f-6520-ad89-001468ed59dc@xs4all.nl>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c092c11f-870f-6520-ad89-001468ed59dc@xs4all.nl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_013758_384989_19ED59C3 
X-CRM114-Status: GOOD (  10.02  )
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

On 13/01/2023 10:04, Hans Verkuil wrote:
> Hi Krzysztof,
> 
> On 13/01/2023 09:59, Krzysztof Kozlowski wrote:
>> On 08/12/2022 11:31, Krzysztof Kozlowski wrote:
>>> Hi,
>>>
>>> Changes since v3
>>> ================
>>> 1. cec-gpio: Add missing SPDX.
>>> 2. nvidia,tegra114-cec: Correct path in maintainers.
>>>
>>
>>
>> Mauro (and maybe Hans?), any comments here. Can you apply the patchset?
> 
> No comments yet. I plan to review and likely merge this next week.

Hi Hans,

I hope they didn't get forgotten and you still have a plan to look at
these. Patchwork shows they are waiting for review:
https://patchwork.kernel.org/project/linux-media/patch/20221208103115.25512-2-krzysztof.kozlowski@linaro.org/

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
