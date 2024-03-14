Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6DCAC5475B
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Mar 2024 06:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lDbbJH10X7of/VCBM8U3SUKg94XxmnjzMvGbqowL4kE=; b=4/lcKKCxrAk6zc
	PFMeaNryfrMu99UE651Pr9MpEozqa5SmWcd9Vthxopn5jRlqg567fmZQv9q6fcCY/dbVrw2IFiWeN
	cc0vmfzDdg/15FJ8xQiZHX7Z2jBNLw3ePOSVObJq1mkpAXqsjcZOLMaF952ZfHrW5WTBVXGqU3RcC
	GPzn3BJvd47A//M0IgRKKE8//2aG/fthEC7emGMNa5vm5cvewQ0WmJttSueQwB4NfmRf/r3z1PyWR
	kKc7TJjc1WMZA8i6JuasPNXOEUdBU5YwrgzPd2+xO6Ok6/SnyKGmX+Rj8AR/lsWYJsvFYC6vI1AX2
	g2GlLoJTjxd4L6w09UeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkf3T-0000000DHky-0DMY;
	Thu, 14 Mar 2024 06:59:07 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkf3Q-0000000DHjF-2HUN
	for linux-amlogic@lists.infradead.org;
	Thu, 14 Mar 2024 06:59:05 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-413f1c0edb6so1678035e9.0
        for <linux-amlogic@lists.infradead.org>; Wed, 13 Mar 2024 23:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710399542; x=1711004342; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eMlXmtet+lMKP9MwdxiMqK7TmWez6CL4fiFRXib4iA4=;
        b=OY0KPbw043FJ0WkcBOWNkM4BuWEGjVaUXGhQBOmdN+ja55Gb4Yv6rqR5pUXFFrD2b5
         v1YpUaoROBqea10SW/aqBdAuyDJY0d74V3fha742ZmL4gGoP7XTHrIIoMhBWg/gyOYp9
         b9Hsi7m7nE1A1ZdAAAM+T78CJWt3X8E+jDxxCA837H/VjfxPXLCvE0G5vjMo5CM2NDoJ
         slAILfpW3FI8c/Y5DoJhCqS8LasaQ7h9sj/OIJcrrdEEmC1guD1DRvOo80PMHjDCiSoC
         36nky0FxrK/CDcEmyedwkXHTbD1jTk+q/oz4bk+8tfTgjDN9K8AorA+gZnAWaaDdIVHu
         t7Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710399542; x=1711004342;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eMlXmtet+lMKP9MwdxiMqK7TmWez6CL4fiFRXib4iA4=;
        b=BNOFPV0L4JTizkadtHjqGePWR8Uev0PlZEq/Z/IJz/ToyTH+DqQqhl65YFF5oAAc0l
         UMiflzSE+s0kDn/mryv6V4dQ2jRUO4DF5lta4wtC0FW07GGFiT8YZJUqniSdfAquHzn7
         ctCRckr966AicYtFFoBkN+R2us/JlOSlXR3oxcE4hxlIWo6qAqCHsBEOc+lTjbN1FREo
         PveniJ38oigPyUHBp6WsM0/GwmL1RZuLLGE7G5HVFVsthBEN3ctpO0hnbn8xGtly4pTc
         zX0QP+1x+CcxKhKud+1mok1TT3815fdhfiyfH1O58Zr+Y51ELM1c43sjFCcaKbT1rlEN
         FXtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKF1LJ5qUV0y09PrI3JmeLWFq5lBv0b/CJVXIE+pHXhJEyqXd+XW9QENLLnD5Jj5C2MMBzA1GrdnQQm3by2E5/WMkn+jTyNxfpDJJjGF7EU3o=
X-Gm-Message-State: AOJu0YxhvKSnjLZuFcQ1Ai9Lxozq3jluyw1o1+UwD0oztket0yvJW58q
	8xfEl+wsAmBQsB3X5gkqnAI0fYqnDNGX4uQiKkRnEuCZqf87hi7lomWjneTZeFY=
X-Google-Smtp-Source: AGHT+IGOsBQLhuuoMuHR8m2OSBz2b8kotaUpR3GF/pFWkyT2N1DWRMqNekfNP38jo/iUPW9o1N1r9g==
X-Received: by 2002:a05:600c:c8b:b0:412:ee8b:dead with SMTP id fj11-20020a05600c0c8b00b00412ee8bdeadmr672788wmb.34.1710399541831;
        Wed, 13 Mar 2024 23:59:01 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id n2-20020a05600c4f8200b004134540ae3asm1438824wmq.3.2024.03.13.23.59.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Mar 2024 23:59:01 -0700 (PDT)
Message-ID: <c0e564f1-bfd9-450f-8bce-835837719688@linaro.org>
Date: Thu, 14 Mar 2024 07:58:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [DMARC error][DKIM error] [PATCH 3/4] arm64: dts: add support for
 A4 based Amlogic BA400
Content-Language: en-US
To: Xianwei Zhao <xianwei.zhao@amlogic.com>,
 Dmitry Rokosov <ddrokosov@salutedevices.com>,
 Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
References: <20240312-basic_dt-v1-0-7f11df3a0896@amlogic.com>
 <20240312-basic_dt-v1-3-7f11df3a0896@amlogic.com>
 <20240313095311.dxrr7gvt4t3gwoho@CAB-WSD-L081021>
 <74f96887-572d-47eb-bce4-9d61ec51b88d@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <74f96887-572d-47eb-bce4-9d61ec51b88d@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_235904_631446_DBAC6666 
X-CRM114-Status: UNSURE (   7.86  )
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

On 14/03/2024 06:19, Xianwei Zhao wrote:
>>> +
>>> +             apb@fe000000 {
>>> +                     compatible = "simple-bus";
>>> +                     reg = <0x0 0xfe000000 0x0 0x480000>;
>>> +                     #address-cells = <2>;
>>> +                     #size-cells = <2>;
>>> +                     ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
>>> +
>>> +                     uart_b: serial@7a000 {
>>> +                             compatible = "amlogic,meson-s4-uart",
>>
>> If I'm not wrong, you need to create dt-binding alias for meson-a4-uart
>> and use it as 3rd compatible string.
>>
> On UART module, A4 and A5 SoCs exactly the same as S4. There's no 
> difference.

That's not really the point. You are supposed to always provide SoC
specific compatible in front of the fallback. See writing bindings document.


Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
