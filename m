Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 016B9C54EBD
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Jan 2023 11:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4NZ8NsRtHPu5OBLPBlcGE04NJWM1mRR6LW6+CtFc56g=; b=TLpiIW6mu4UVniPGBwZyHf380C
	BSmiYSOv9ejqKVI61mLlXmECdLb6tomknOrw+rqJ6uXp2MRjqX1V4y0a+avqLI6WtO76dPBPhbRYz
	DK7KKJzTrk28jo5lu7ePlf/Enp26F4N4BqqqL0SkjJv5CvT7aBXFndkynGFRluXF15SkJYkORgcT4
	K9F7IKIa2MLtv2BG285911k42SRK5JjQtshd83qmRBcwm2VtG983JUbMH9+F8rkeus47D3SkzDHNR
	Ci0vSMcWbqv9gwxOpMZa0amsfVomIWUrIP0BSmXgwG6hbV8Y9rUQ+wk5IlFEC6nGWjgAcX1qSSH2y
	N3eCvjrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEqXL-0014Dk-B2; Mon, 09 Jan 2023 11:41:55 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEqUG-0013qn-7j
	for linux-amlogic@lists.infradead.org; Mon, 09 Jan 2023 11:38:47 +0000
Received: by mail-wm1-x32c.google.com with SMTP id l26so6036576wme.5
        for <linux-amlogic@lists.infradead.org>; Mon, 09 Jan 2023 03:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uWRQwZU7Q5uXmRpQpJb8/BTaeDI/2pDdqBknaeuYMoc=;
        b=y1NBPAWB/5QSk15IQF0sayDsBGK9DTwzo64Fwhce+Wv3f7tVbPw++Vm7KjFJ/ePuIH
         alZSxq4wMtI3JYRZn3zmZrqmW5U+tcE/36mSZS+ao+PBouUNXkLt8uMAN3EDUZoM8y1Z
         V38rcAlr6k9TL1waTrhaRP8dMZcyQgFxWY3TRRWCtw3tASJlyK9l3O/MWYqVGJgAknVC
         jyzHq/yTgZ5C7OdYW+njoDU4LjZ+sYY1fS9XGuRSIkUPXzN3ekBZA31uKMfMGcdTnJze
         j7zyR4Zp7HBcTCJS529n0Jvj5PuGWJpqpZXzP6IkeqqXkPlbC7aVB/jHNAVTFf8RXMND
         S+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uWRQwZU7Q5uXmRpQpJb8/BTaeDI/2pDdqBknaeuYMoc=;
        b=7/pP2DGVURVAf2qYymbZnyrIFY42yrwV0ngOL+lG1lJBJcUqcEOUY+5CSQ599NTjmV
         dsjb6a/szVftmnRwETFHEpgOkdYQDAlfxCBmWPXuGAhyrE7d3J7J/b0gquK3KLHC3Ba0
         XioFHa5smVs32K6acNjdSKtdbrpS9tzhAtjCeI6s5JtrEeeJxmM4Bk6+N2mDRrFmxUWL
         MesMoZLp+KWfnbze4jbI1W4XyPAqE9fs2uf3sWh7jvIfatbFcm0SrtOPI+SdIapsHKG/
         dG1A6Gt3pB4d9UDCXtkdo7LsgPxCbbFVwh/sbX05CPh1WX8s0XtyPKKJbpo/e5uTA/Ut
         QcXg==
X-Gm-Message-State: AFqh2krr4ovkWyUgOhgrfmzx1nckqT+Q7y2bHBy7Pd1juNLyCZhwxtsM
	2yx+zi1DBoyhJRWmb8r5q1ZyOQ==
X-Google-Smtp-Source: AMrXdXsgKZSO61ZWkew6Daa4r2uBx8Xe/DlWi/W5u/PDxgxQsVfDr2oBgtSbr4LJo3JD2nU14fQRlg==
X-Received: by 2002:a05:600c:1f12:b0:3cf:8155:2adc with SMTP id bd18-20020a05600c1f1200b003cf81552adcmr47185923wmb.33.1673264319841;
        Mon, 09 Jan 2023 03:38:39 -0800 (PST)
Received: from [192.168.7.111] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id r126-20020a1c2b84000000b003d35c845cbbsm15439361wmr.21.2023.01.09.03.38.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 03:38:39 -0800 (PST)
Message-ID: <6c784b12-ea81-2ac9-ff99-e33f5c123483@linaro.org>
Date: Mon, 9 Jan 2023 12:38:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 03/12] dt-bindings: nvmem: convert
 amlogic-meson-mx-efuse.txt to dt-schema
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jakub Kicinski <kuba@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Alessandro Zummo <a.zummo@towertech.it>, Eric Dumazet <edumazet@google.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Kevin Hilman <khilman@baylibre.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Heiner Kallweit
 <hkallweit1@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Thomas Gleixner <tglx@linutronix.de>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Paolo Abeni <pabeni@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-media@vger.kernel.org,
 netdev@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org
References: <20221117-b4-amlogic-bindings-convert-v1-0-3f025599b968@linaro.org>
 <20221117-b4-amlogic-bindings-convert-v1-3-3f025599b968@linaro.org>
 <CAFBinCANM=AOw1bbGCheFy20mqQ1ym_maK0C1sYpjceoNH-dNQ@mail.gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <CAFBinCANM=AOw1bbGCheFy20mqQ1ym_maK0C1sYpjceoNH-dNQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_033844_304522_3A6218AB 
X-CRM114-Status: GOOD (  17.01  )
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

On 26/11/2022 00:04, Martin Blumenstingl wrote:
> Hi Neil,
> 
> thanks for your work on this!
> 
> On Fri, Nov 18, 2022 at 3:33 PM Neil Armstrong
> <neil.armstrong@linaro.org> wrote:
> [...]
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +
>> +        sn: sn@14 {
>> +            reg = <0x14 0x10>;
>> +        };
>> +
>> +        eth_mac: mac@34 {
>> +            reg = <0x34 0x10>;
>> +        };
>> +
>> +        bid: bid@46 {
>> +            reg = <0x46 0x30>;
>> +        };
> I assume you took these examples from the newer, GX eFuse?
> Unfortunately on boards with these older SoCs the serial number and
> MAC address are often not stored in the eFuse.
> This is just an example, so I won't be sad if we keep them. To avoid
> confusion I suggest switching to different examples:
>    ethernet_mac_address: mac@1b4 {
>      reg = <0x1b4 0x6>;
>    };
>    temperature_calib: calib@1f4 {
>       reg = <0x1f4 0x4>;
>    };
> 
> What do you think?


Sure switched to it !

Neil
> 
> 
> Best regards,
> Martin


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
