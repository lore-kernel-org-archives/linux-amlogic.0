Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCDD6C54EAA
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Jan 2023 09:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7a1xCeG9KrX5CrnRG2EjHMAuwOdRY4G+9jTWEtnhQIM=; b=dscq9xWb1M52Oc
	GHF56R+3jvfbdM3ah6wbQw01SJ7wm3WdS2Iz1D7am7BC7w94dmRRfSxzvKQhBj8fFk93WA3dQrIvB
	i3FI4zZnGIbJaRRDCkGxak451yQFQDEZuJJEC+cwzn9A0H1A3H3mJpfqcnOB9ERQ5EIeZLNB4Am9S
	KcOYs0tznHtw/tv4ethNe+Envlmgw+Z0w296sdUjKy/wbATRSdooGokIOm6++0XqsmbwEqkCvR9TE
	NPnEZmz4vpXA2A/Xv87BgjTaMWn7e9aFxCwN5KyXIAeOCUryhFEBErT2H1Lm8Rl1s+pF9L4cAEkDN
	K4NPisSpkQgw5FN1cFsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLLE6-00DjSK-Rj; Fri, 27 Jan 2023 09:40:54 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLLE1-00DjOS-I1; Fri, 27 Jan 2023 09:40:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A5731B81F8F;
	Fri, 27 Jan 2023 09:40:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 126B7C433D2;
	Fri, 27 Jan 2023 09:40:39 +0000 (UTC)
Message-ID: <019f6407-a7ca-3129-d4cb-2cfed7519369@xs4all.nl>
Date: Fri, 27 Jan 2023 10:40:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 0/9] media: dt-bindings: common CEC properties
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
 <7e941a2d-25d9-44e0-7438-13225c87d8ac@linaro.org>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <7e941a2d-25d9-44e0-7438-13225c87d8ac@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_014049_785956_832685BB 
X-CRM114-Status: GOOD (  15.08  )
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

On 27/01/2023 10:37, Krzysztof Kozlowski wrote:
> On 13/01/2023 10:04, Hans Verkuil wrote:
>> Hi Krzysztof,
>>
>> On 13/01/2023 09:59, Krzysztof Kozlowski wrote:
>>> On 08/12/2022 11:31, Krzysztof Kozlowski wrote:
>>>> Hi,
>>>>
>>>> Changes since v3
>>>> ================
>>>> 1. cec-gpio: Add missing SPDX.
>>>> 2. nvidia,tegra114-cec: Correct path in maintainers.
>>>>
>>>
>>>
>>> Mauro (and maybe Hans?), any comments here. Can you apply the patchset?
>>
>> No comments yet. I plan to review and likely merge this next week.
> 
> Hi Hans,
> 
> I hope they didn't get forgotten and you still have a plan to look at
> these. Patchwork shows they are waiting for review:
> https://patchwork.kernel.org/project/linux-media/patch/20221208103115.25512-2-krzysztof.kozlowski@linaro.org/
> 
> Best regards,
> Krzysztof
> 

They are on my todo list :-)

I hope to get to it next week.

Regards,

	Hans

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
