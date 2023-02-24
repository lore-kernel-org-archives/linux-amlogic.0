Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73418C61DA3
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Feb 2023 08:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FBF1gmcTHR+IKx/JSEDOPaqAFUkGGb+7j0feFPq2qXA=; b=jEH+csrsrIGoN3
	ZNYLhBwjPN77nue8+8rdoeXjrSym3MBd9epU1HU8g3eT8Sj4s1+VbNQLMrvtzuvx/FLamOd5bVyDN
	buqTH6mwxDa1tBT6JPvOy3g9wo+IZbxQrryWUWsk9/BJMWZoSaIIy4n2Dj+mvM2MW1iP+CylmO49U
	9ATznMbY0ej6Q0JXuRzuSbaWiZGmH1MNSTSOZNQQSSL4jS0m/XFhP7lrtAT0WgMq3gsTP6v69XIoS
	DkRJ+kgfpTyeQXxPyJdYGAjlSoCSE4IsN9ghv6EmU06DkgsMjTSXbGgsvOl6w+KIeobcz74NwFosb
	6e1Tb4bD+LZwXLXvHNZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVTPr-001Wao-Ms; Fri, 24 Feb 2023 08:26:55 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVTPp-001WZx-81
	for linux-amlogic@lists.infradead.org; Fri, 24 Feb 2023 08:26:54 +0000
Received: by mail-wr1-x42d.google.com with SMTP id h14so4389522wru.4
        for <linux-amlogic@lists.infradead.org>; Fri, 24 Feb 2023 00:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=20HSJ4cZiz1ZFE5KUxXCoL1/F63Z40FI6i46iunMviM=;
        b=NTqbSe62Go6viyiO4ZwzUupAPiCjLsExc9KZXKxsqqfjtDrrf6zadY1feivikLSuSm
         xdsU6hkB0q4Wwj76G4hU5XbsIHZASz98ukFuWjPit+GV4tVoNsfKKssx5MQhDn108HMB
         1sDeS5XyDpuAeNrYPCA5GBOIvYzBLuorNjejhJo6iOXoikwWQWWqXbKF0ub0MT4oYIu5
         U4lBkXJgZs8f/65SC4mylOQIsi/Zuh6Wz8PD7CmaPjk8QNlcP/0ulrgefkqPkrehVwxc
         MsGwz9+DztmmJPgiFz/JE6jenjifR1Ih3HgveTC4NmmrJ3eVpg3tDGJVmrwDqyspyuop
         cbLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=20HSJ4cZiz1ZFE5KUxXCoL1/F63Z40FI6i46iunMviM=;
        b=uMRhxiQLhI6WdERwnjNb/mPKIzvdXJanE6z90VmPeqDkV4ByySuL/vC5A/P/RUW3/+
         dva3dlUfyMKiEiIhZ2WHnpU7rqmBajkTkGVOHTg1KTFLQ78+Zq5JDERE/SrNFNOuixLK
         9kn1oLkIAErJinZW2eenpddV4ZcczhJWAOJ1mQ425Ix9BCjiRE3jzAMz1LOypT37SaBp
         177t3RsDZSvdDk+17y0yvJC2j0iumqdPasCGPdaiLWUQlnmxOhophjoSK2WHXXiS0S55
         QxqNGIzk2yxJu1HklVxHz1qWuBdHphIPhYkByUbUKbJhcEi7ajgb35rwqaa43D5d+L24
         Pvwg==
X-Gm-Message-State: AO0yUKVweSZciYjgsZe/bfAI88036uGU+7TkIe1nB/rpTLBSza1Z0zSh
	NJiG0d0VaDgOCfr4vCVDTKV/OQ==
X-Google-Smtp-Source: AK7set9rHT6bdvWZ9cPUv6MiyXkEMic0nOwTw04SmYHBplCQQmMCTlSsZFClsEGBFOxYyzlXefcX8w==
X-Received: by 2002:adf:ce0b:0:b0:2c6:e827:21c1 with SMTP id p11-20020adfce0b000000b002c6e82721c1mr11334525wrn.50.1677227209333;
        Fri, 24 Feb 2023 00:26:49 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id l17-20020a5d4111000000b002c558869934sm3438615wrp.81.2023.02.24.00.26.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Feb 2023 00:26:48 -0800 (PST)
Message-ID: <29db87ce-94b4-7106-aae6-a122c979d5d6@linaro.org>
Date: Fri, 24 Feb 2023 09:26:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1 RFC 1/3] dt-bindings: serial: amlogic,meson-uart: Add
 compatible string for G12A
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20230222210425.626474-1-martin.blumenstingl@googlemail.com>
 <20230222210425.626474-2-martin.blumenstingl@googlemail.com>
 <319cb654-51f6-6241-802b-22ee0d5b0aab@linaro.org>
 <CAFBinCCzXb2Ty3TaZatEKQyxJmYPhHDL7SeLfF5-3PsDKBznWw@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAFBinCCzXb2Ty3TaZatEKQyxJmYPhHDL7SeLfF5-3PsDKBznWw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_002653_325288_DB90C410 
X-CRM114-Status: GOOD (  12.81  )
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
Cc: neil.armstrong@linaro.org, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-amlogic@lists.infradead.org, jirislaby@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 23/02/2023 21:14, Martin Blumenstingl wrote:
> 
>> The question is whether the devices can be made compatible thus keeping
>> DTS working on older kernel. This commit suggests they are. Your DTS
>> commit is written in different tone - something was broken and is being
>> fixed.
> If we keep "amlogic,meson-gx-uart" as fallback compatible string then
> old kernels (or other .dtb consumers - like u-boot) would still work.
> Without the new "amlogic,meson-g12a-uart" compatible string we're
> unable to make use of a newly added clock divider within the UART IP
> block which allows baud rates such as 1500000 to work without (a lot
> of) jitter. Old kernels - with the new .dtb - would still be able to
> use serial (thanks to the "amlogic,meson-gx-uart" fallback compatible
> string) albeit with limited divider support (so not all baud rates can
> be used).
> Is this a valid plan?

Yes.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
