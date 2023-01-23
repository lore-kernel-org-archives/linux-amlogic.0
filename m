Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62063C25B50
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Jan 2023 09:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NtcUXW/DdhJ5x9iRuo6T5dsl+hBPw1MzxwcW8F/BhHQ=; b=1WH49QWR2+QqJ+tw9c2btKKfLC
	44ICFC30kPIwP1ylW15tvp5/Hz7JEfgxEsZ9G70QPdjf2R+etUvocWhHl5w0qpkE9Hye/sf0gTufF
	qsUliyyXH2nPeVBjoc7H1abEFglHiSS824n3rdBoABpslPZlRPfnk3c7yufjppVOPvYQvzJVlEAKn
	Cn25sScpSzyQjR+lQD842CqYnbEkNKCLFv21KzbShksAJxvmahe75MhWUxCoPYfvBHHhch6eb8NBC
	8XDE3zif3S3zttxWY8a1+1J/pwn2BlH+r18r9JBqXX0PGcNixz2Ued1Uk8Wu2ws66hZUwR0NkfrdO
	rnr9UMGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJtLN-00GYUN-RA; Mon, 23 Jan 2023 09:42:25 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJtLK-00GYSp-RU
	for linux-amlogic@lists.infradead.org; Mon, 23 Jan 2023 09:42:24 +0000
Received: by mail-wm1-x334.google.com with SMTP id q8so8479631wmo.5
        for <linux-amlogic@lists.infradead.org>; Mon, 23 Jan 2023 01:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bb3ehCbsmnDNOeIeuOp9X6FACVdZxwB9flFsEny7tkU=;
        b=dV+vmkhPJupVDkDKPKw/2uJe9dhCfz2931ZZfmSlTiTucpZhV2Dz+B6f9Fv3oiI5Qg
         xdALFShfLxjvVlVQ2K1bLQ5/4uPa6Q7gCQlFkO7bDQBoW/r8L1iBLX9dM/ZknvefkDGC
         6iJRk6CRvJJo7qipP+9FC4RrGHDwX//qae/qj8wJurKg8c+1OHYsm56cHw4p7MWRyk1K
         nfquz3KQcfaO9EzCTs/SUKrcWz3tEvEos7SFv6WhgRiugJpJ3DnoGoOyT8+BCgVZIzQS
         gVFXE4RIK7gcAlT4NdXcPy1iZVBPSkMbc+B1+QYLkW51SQ6p0ODeYa+m2ek55Zj8+RQZ
         DWEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bb3ehCbsmnDNOeIeuOp9X6FACVdZxwB9flFsEny7tkU=;
        b=qnC3fPz9anZAD1DG0HLI0D4UF88z9f3UGVyxpHx8YxhNj59KBfDKtcYdE1uH2+A+8t
         GDJg64PPFyH0qTN8NXQ1lLwULwv7KqMM/9hORYNtivuMQZCpuMgptzo+weh/WpYXt3Xo
         MJpQqqQrgNzKaTavkEU6Nj6jTqhVn/1sMZRDOgUd4FgjONawL541Ck9NlcYjWc4yEzPA
         QtgU8idLFLKnP9qEJuyQ2YdE8v/BMrjGTKWGWVsME3D0rb0loQ91zZXreQYL+ttVw2a8
         eXcET69zrLHjktr7DuOLZ2lQmw9o7NE0GUOJg/2UG1wUcvB7FHPCdMIPwCnC6SUDbM59
         ERFQ==
X-Gm-Message-State: AFqh2kriEGb3TOyssbxMRfq7PDl9jgKTkRH0JJ/ZnJv0nXQKEz8aT6Bx
	iMtcxItnyi3cyslhQ0YIYW7yUQ==
X-Google-Smtp-Source: AMrXdXsm6TcBoxPPxS02VMNxznfImdfA7EnRpT/eJPmFB8AVCLXvlWQuATnvGBXA13pmaGAeWzaHKQ==
X-Received: by 2002:a05:600c:1d12:b0:3db:53f:baea with SMTP id l18-20020a05600c1d1200b003db053fbaeamr23030706wms.6.1674466941329;
        Mon, 23 Jan 2023 01:42:21 -0800 (PST)
Received: from [192.168.7.111] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id t13-20020a1c770d000000b003db1ca20170sm9963482wmi.37.2023.01.23.01.42.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 01:42:20 -0800 (PST)
Message-ID: <d8f78a24-398c-8bb0-8964-778d8a0e8998@linaro.org>
Date: Mon, 23 Jan 2023 10:42:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 04/11] dt-bindings: watchdog: convert meson-wdt.txt to
 dt-schema
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-media@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-pci@vger.kernel.org, netdev@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20221117-b4-amlogic-bindings-convert-v2-0-36ad050bb625@linaro.org>
 <20221117-b4-amlogic-bindings-convert-v2-4-36ad050bb625@linaro.org>
 <CAFBinCDd1MJEmSHR1XPsfBoRasBq+cV1F+66sCBXALtCCmoyUA@mail.gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <CAFBinCDd1MJEmSHR1XPsfBoRasBq+cV1F+66sCBXALtCCmoyUA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_014222_941790_F8543BDE 
X-CRM114-Status: GOOD (  19.41  )
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

On 10/01/2023 22:48, Martin Blumenstingl wrote:
> Hi Neil,
> 
> On Mon, Jan 9, 2023 at 1:53 PM Neil Armstrong <neil.armstrong@linaro.org> wrote:
> [...]
>> +  compatible:
>> +    oneOf:
>> +      - enum:
>> +          - amlogic,meson6-wdt
>> +          - amlogic,meson8-wdt
> Technically this is not an identical representation of what we had
> before which was:
> -       "amlogic,meson8-wdt" and "amlogic,meson6-wdt" on Meson8 SoCs
> 
> We're not using the "amlogic,meson8-wdt" compatible anywhere at the moment.
> In the meson_wdt driver it's defined with the same per-SoC data as
> "amlogic,meson6-wdt".
> 
> Long story short: In my opinion there's no need to change what you
> have right now.
> If you have to re-spin this then maybe you can add a note to the patch
> description.
> Please add my:
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Sorry I was distracted, I'll add a node on the commit message.

Thanks,
Neil

> 
> 
> Best regards,
> Martin


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
