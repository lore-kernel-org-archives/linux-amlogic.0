Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8071BC54EBD
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Jan 2023 09:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gzrPPyofRBnRTO5PvgQJ3vql5ClmWE9tPCgLvC0Imfg=; b=mJNP2TmttKF7oM
	TUN3mSaTOxAdbHBy9dz7kFu1WPYjGiaxAIn4B/1sh93wyf99Fjqcli+koI62CBVWn33YaWJmuzAff
	e5PIaNOGhrWvZCThp4Ggyh51QGNuAz2+VgxqDlQiN5od7csq9G9w60u1v6/jKgbRUX0gFRWmRInZv
	rSJq8x0lqrDl7s/Byq9yNz+HYKHXLSf9msSH0hf0v/1iYXsQsZnl9Xa2nEWgkxK6Zh1Hx6rAzUtwe
	c+z7kVZTuEHGJ9fOFCbo8vWlgVzDuDCnpkOcT5mY6ilYw/0ShLe4LsiY71XJfo6NG4UkIFkD3TSLW
	OEkhYowVLOr62bkFWBwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGFzD-001NN8-CN; Fri, 13 Jan 2023 09:04:31 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGFz9-001NJd-UP; Fri, 13 Jan 2023 09:04:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0F9D1B820F0;
	Fri, 13 Jan 2023 09:04:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EB8DC433AC;
	Fri, 13 Jan 2023 09:04:19 +0000 (UTC)
Message-ID: <c092c11f-870f-6520-ad89-001468ed59dc@xs4all.nl>
Date: Fri, 13 Jan 2023 10:04:17 +0100
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
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <cd803c70-faf0-963e-fca3-0edd13fa8a29@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_010428_159505_BF2F0532 
X-CRM114-Status: GOOD (  11.87  )
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

Hi Krzysztof,

On 13/01/2023 09:59, Krzysztof Kozlowski wrote:
> On 08/12/2022 11:31, Krzysztof Kozlowski wrote:
>> Hi,
>>
>> Changes since v3
>> ================
>> 1. cec-gpio: Add missing SPDX.
>> 2. nvidia,tegra114-cec: Correct path in maintainers.
>>
> 
> 
> Mauro (and maybe Hans?), any comments here. Can you apply the patchset?

No comments yet. I plan to review and likely merge this next week.

Regards,

	Hans

> 
> Best regards,
> Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
