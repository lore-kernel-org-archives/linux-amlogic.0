Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23562C001E0
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Jul 2023 16:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FUjqI5sW8URWgLxA9Wl34fkKdaEgQBtf98u6DIPjen0=; b=EEYvbpdfPXgi58
	QBr41P64/6Kntj1OBClSQ1paa4efrV6Do5RN9HWT2B4MzdXSlDU2noCBewA/FeZemzvlfPF7CoILh
	iOCWCNdrm+jjZMIysXo/xMYKns+Lvw4BkoE+eu0L7oEbvbTPcWiYNBYRMh2cnt8Qp37XAD+3ncneZ
	AW4Qs7ZMsvj28jNb1hfXvU5/NzpPs9pO7Ul0tKBIAU4z4NCMtSQfaTr0jKWAqmhRpb7xa2P34R/Tm
	tFTgKt+UjwtxJD+kRcMnldXCP/PMU1Qp109gTKUneFKbvNMPWbRBbBE+6FH6Ms4IUy5ebBu2Bw4/4
	f0o2qtXhnHt64TSb1FoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPQWF-0044EZ-0G;
	Fri, 28 Jul 2023 16:40:47 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPQWC-0044DP-1a
	for linux-amlogic@lists.infradead.org;
	Fri, 28 Jul 2023 16:40:46 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3fbf1b82d9cso23360775e9.2
        for <linux-amlogic@lists.infradead.org>; Fri, 28 Jul 2023 09:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690562442; x=1691167242;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vHUNO/IrnfFN0MhhDh/0mFjdxBVg/OLd4PkUkNG7FnI=;
        b=ZGdTtBipas8Fy5PIhI/L5R3iS9ZPXGscxN4xBXd6FBdKqKbV0JJJysUIYY4sFfVdOu
         Mpw3cAvkDHFxP769McZZH2VRi3SQB7vCv7zE+PblnNc9Sat7NOp/agTaNpTEdNcihR+D
         aaDdXIXpyWHSU2bamemLdDUMV6LN65U2QC1cp/mlPHs89xo7qEmRCj45XR/Qa+jD9bsG
         u3oXvA+Rn3UUxA0rpB+zlsRxrsawNxdN3pvJCysyFlVeiuZ/MQ343VdrSWLc2TavimaX
         Ynh+Ati5bMSuJ+rm1qVy7ZfEOYqaZXQ2+PxscO0AbdPkpFx+3eJiRZCQlBsfpoPmX+Y8
         1TKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690562442; x=1691167242;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vHUNO/IrnfFN0MhhDh/0mFjdxBVg/OLd4PkUkNG7FnI=;
        b=dK6mXBSWhJIAqdPTCJj3SKikOmnylxzrcQY11xZ/h1qIQSw+uw9VJGGPUwbxeDcrrj
         yP4DY4BhrheMsqGigz24LCpBC0EhmtXdLTHyeHXV7xQ0HmNjK+wanyOc7Kvq1BH2TA+S
         IKBss7d3Fq6LZz9Wmu6LzkLcC/Dq9MDoaUwzgUNMEcUy64j9xDnAvaPsJBgKqX0WlpUM
         THQpgULBWMQyYsP/mUqew7mokbWOlokJmJvPPB17zERXfPt9Khc2WuUqcNTKu2qao8/V
         dCrRfbpfCVjHLZ694CTWn4osK8dKLd7dMjBwnWcMqL3lFiE/J7rN1aP6pYdOPM0uYKQl
         /nRA==
X-Gm-Message-State: ABy/qLYn2IUJWR0IxBZfR8xKrG1KQ1gpA7PioTagwbLc45CX0IqchbYk
	vO5VvwtA7PM0zLEowPyw19P6gA==
X-Google-Smtp-Source: APBJJlGShlM1dO3+fMhExjYv6Dh8m7h06nmIvJBTl25b1p7ACzbItvuCgoGAcNo1XJsyv0g0/4Kb5Q==
X-Received: by 2002:a05:600c:3789:b0:3f7:678c:74b0 with SMTP id o9-20020a05600c378900b003f7678c74b0mr2106898wmr.12.1690562442214;
        Fri, 28 Jul 2023 09:40:42 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id n5-20020a1c7205000000b003fe11148055sm1185888wmc.27.2023.07.28.09.40.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 09:40:41 -0700 (PDT)
Message-ID: <68b7d772-8dc4-a781-031b-ea33dae41751@linaro.org>
Date: Fri, 28 Jul 2023 18:40:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/3] dt-bindings: reset: Add compatible and DT bindings
 for Amlogic C3 Reset Controller
Content-Language: en-US
To: Philipp Zabel <p.zabel@pengutronix.de>,
 zelong dong <zelong.dong@amlogic.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, kelvin.zhang@amlogic.com
References: <20230719060954.14864-1-zelong.dong@amlogic.com>
 <20230719060954.14864-2-zelong.dong@amlogic.com>
 <f7b72ee90009f6749700a7bd79a3a63786a82a32.camel@pengutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <f7b72ee90009f6749700a7bd79a3a63786a82a32.camel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_094044_539078_279E6EC8 
X-CRM114-Status: GOOD (  10.73  )
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

On 28/07/2023 17:49, Philipp Zabel wrote:
>>      maxItems: 1
>> diff --git a/include/dt-bindings/reset/amlogic,c3-reset.h b/include/dt-bindings/reset/amlogic,c3-reset.h
>> new file mode 100644
>> index 000000000000..d9127863f603
>> --- /dev/null
>> +++ b/include/dt-bindings/reset/amlogic,c3-reset.h
> 
> Given that this is only included by
> arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi, should this header be
> moved to arch/arm64/boot/dts/amlogic ?

I think there is ongoing work or at least plan to use the IDs also in
clock/reset drivers for all Amlogic platforms. Do I recall this correctly?

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
