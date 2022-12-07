Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55516C47089
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Dec 2022 09:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YkS97RmHW9gR2let+QUYvsP/si9JT+cKAL0ePyRnAsg=; b=nssW9RM+M4ST47
	sY1tisnElgBwew31UJzfDCP8eQpzEZ2JBESkfJvGFtjJUNftrI9vosBrnY6K/Ej/0gswz+F9lpZUG
	R9aucJs7KMgx1hjtxaMhRZWR8y3Uc9HG7RC1GPeV0+dzA8KP7XvnwQqB1bl89i5FXC9ORvYA9Gv64
	SwzbwIbvuMIdM6zX5efDdJsf3w3lSGHElDwPBBBVO3vFQmWOdV/+ey9u/uoMPRJ4uVmlDXCxfeUub
	8KK0VerKRwwdBs0pegCjCfp55KTDVRx3YH/r2iWcND6e54ndCg+M4edL3NPYxZxebP/E/0PMFnwfZ
	xE/RctOfdsKajNdkvJWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2qQ2-00Fq4y-LT; Wed, 07 Dec 2022 09:08:46 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2qPz-00FpvZ-6R
	for linux-amlogic@lists.infradead.org; Wed, 07 Dec 2022 09:08:45 +0000
Received: by mail-lj1-x236.google.com with SMTP id a19so20210901ljk.0
        for <linux-amlogic@lists.infradead.org>; Wed, 07 Dec 2022 01:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8WyD6+4TOtnUZ3buZrfTvZlmLnV/84EmqHh/FS/HaPA=;
        b=L51sXgM7Hxi4SbUu1GAGwaWH8+oChEaG+fH/OfL9hIiFxjSBSLXKFotpowsHk3SDhN
         p4cZ9Blp6YSzDOgACKD9avjX7BW17+aEsZ3QYKvjRXFuZp75GP7SmTGJDzFOnsShyeDj
         11UruWJXKsGl029Y26Lg4SX+I2DtKEoj5FTQFMCWtF3/Z1KuUX3gM0t7OuDl12x3tc+j
         /1IvglKFAGAeHBnwqkQne+a7jkoBQfQ6jVctZJsAT1zyYX5oj/Wev1yD4YvQfff/nUh8
         p//ZmuGEqWgyIBpjMAU1ix+krZXB5tg9XLOL6SGmrshHF3sfOrGuBANw9h9OADYmOT2g
         6cmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8WyD6+4TOtnUZ3buZrfTvZlmLnV/84EmqHh/FS/HaPA=;
        b=jOBLNk6ouQtAIFiirKgJIPpNpmJauZu1b4YZTvSzzZAbnvUiB6u7HzMjBDCnmYV2B5
         iCIop5rusjOl5zxMTm2sanvFNClwpfN1K/BVjm0HmpiVFk0NdRnPrvASSXhvaiMGz4kN
         73qQVUo72aBQ7OXWYCw73KVa401iCBrQLtzOsBBg3Yl+s8r+4g5Xd97VWGD+wxdsKlnA
         UMuP1XTJO7GcOKok9ZBALg1icQSJELOZoGVcEfcuvbfLQaWcdPpfSzrCLSd+faR0FtTe
         kKBFhVWqGp84xJmo80XUVeIcbV2siZGeBHWHIna0NQYJvh6YuLQ32nCTa9sB+UQbaw3c
         DDHg==
X-Gm-Message-State: ANoB5pnf3T7xMwsni8TvjyKl9t+8O4xaSHroxoU2i8CaLk7xK8KldnT/
	f/7XwxCV4Q7HN3Cy8TXWCTWGmA==
X-Google-Smtp-Source: AA0mqf5csyV+ZQkovsgzCNVOH5rNxgnnX0/bj5YjAEE7jb/b2fXvUxMbfi0o2/X1/JDCViBzm8O8bg==
X-Received: by 2002:a2e:96d6:0:b0:279:dcde:84b2 with SMTP id d22-20020a2e96d6000000b00279dcde84b2mr7575311ljj.207.1670404120162;
        Wed, 07 Dec 2022 01:08:40 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id 142-20020a2e0994000000b00279a5b85791sm69308ljj.88.2022.12.07.01.08.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Dec 2022 01:08:39 -0800 (PST)
Message-ID: <ebd963e5-fc27-b70d-8cc4-b18978a5de39@linaro.org>
Date: Wed, 7 Dec 2022 10:08:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 8/9] media: dt-bindings: nvidia,tegra-cec: convert to
 DT schema
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Joe Tessler
 <jrt@google.com>, Yannick Fertre <yannick.fertre@foss.st.com>,
 Jeff Chase <jnchase@google.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20221205151845.21618-1-krzysztof.kozlowski@linaro.org>
 <20221205151845.21618-9-krzysztof.kozlowski@linaro.org>
 <Y49vm34cwgilAA33@orome>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y49vm34cwgilAA33@orome>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_010843_304443_78D71B9D 
X-CRM114-Status: GOOD (  17.95  )
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

On 06/12/2022 17:36, Thierry Reding wrote:
> On Mon, Dec 05, 2022 at 04:18:44PM +0100, Krzysztof Kozlowski wrote:
>> Convert Nvidia Tegra HDMI CEC bindings to DT schema.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>>  .../bindings/media/cec/nvidia,tegra-cec.yaml  | 58 +++++++++++++++++++
>>  .../devicetree/bindings/media/tegra-cec.txt   | 27 ---------
>>  MAINTAINERS                                   |  2 +-
>>  3 files changed, 59 insertions(+), 28 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/media/cec/nvidia,tegra-cec.yaml
>>  delete mode 100644 Documentation/devicetree/bindings/media/tegra-cec.txt
>>
>> diff --git a/Documentation/devicetree/bindings/media/cec/nvidia,tegra-cec.yaml b/Documentation/devicetree/bindings/media/cec/nvidia,tegra-cec.yaml
>> new file mode 100644
>> index 000000000000..9a4025ff7fad
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/cec/nvidia,tegra-cec.yaml
> 
> For consistency with other DT bindings on Tegra, it'd be good to name
> this nvidia,tegra114-cec.yaml since that's the first generation where
> this IP was added. Not a big deal, though.

Sure, I can rename it.

> 
>> @@ -0,0 +1,58 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/cec/nvidia,tegra-cec.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Nvidia Tegra HDMI CEC
> 
> Again, for consistency with other bindings, NVIDIA is the preferred
> spelling. It's not a big deal and could be fixed up in a subsequent
> patch, there are a few other cases where the alternative spelling has
> been used.
> 
> The rest looks okay, so either way:
> 
> Acked-by: Thierry Reding <treding@nvidia.com>

OK

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
