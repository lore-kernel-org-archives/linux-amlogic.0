Return-Path: <SRS0=Id+k=IX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A572FC433C1
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Mar 2021 15:55:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E1A061A17
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Mar 2021 15:55:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E1A061A17
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YxtvOTbPZy1vPrVI3XBAbnogaYW4T95AdPqldTv7JIw=; b=fB9ACPoN3KNxrXw3kFkNZuunA
	ytAx9xM09jBWA958DD8EJTO5MKyysys8BxVjo38NZhbXYzq6RXR0pUsbp9znnqkosZ9xFQtlBg0/P
	2VrcPs+2QIh6hEj53fVx77yTsFpLLi9z5IeapnIbc8zFKheargN6KvapNVovrEorcbBDdbOsfbJE9
	AJi+xBBCV7AgI8XL9xnwI2HBdinubxYvRR3S9BSx+KLkN0ykT1AgXXEP1JX2n5gX9vU5JPBc8U4GA
	0neNagSndMURV7HXa1b/uLLUAM1/+7z5NOw+8Z2VLO/V/33mEdGS/+TRfblVWVi2pPDG2ZUpOeJXH
	una7agDFw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPSKh-001msp-6U; Thu, 25 Mar 2021 15:55:39 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPSKa-001ms9-Li; Thu, 25 Mar 2021 15:55:34 +0000
Received: by mail-wm1-x336.google.com with SMTP id
 w203-20020a1c49d40000b029010c706d0642so4607636wma.0; 
 Thu, 25 Mar 2021 08:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oboscLOCxZgPatgZxost0Nu0mBSRwFVV2R3LjLZrcUo=;
 b=MJ9xUA5EilIcr5GB/BcGAmx4oL83UDWRk1LXyLn7TjliW/MyjxjxkyZ7U0laK9x5Ru
 HuHAO70jfbxj0pTbYyCn95GZxw0myGI1UeXILEMUBrkEMCPGS0iemJ6GCCQ1pKxFODo3
 II4jWHzYGQ5SPukhN8La7hVtkwS3HaYGObWczFN+0wPe5zQU4eVGg2LrVJNqpCfZ+dI4
 09iOIEUMK/LEx+D4xkc1g1WpnW7iyIsQckJ7KKJkfweJRGmTZ6YyeBKU+e/y+in8TygG
 n5BM4wHc4hspipi7/hWtIR9yJM7fy+6r3KeiYDoLuAPfhwQDE2QTv4l/Dy9u5d79ftXA
 +k9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oboscLOCxZgPatgZxost0Nu0mBSRwFVV2R3LjLZrcUo=;
 b=oslcAkm3IkTdlnfJkqFQhU0F2jBKFIQKGAqeLNVQGc9GA3DCbZqDJdj4s91gTnHS0v
 VaHiqNkyVV8FHznFMkZlWU8/3aYJMoG3CPGpJj+LSa/WAaVySqpjluea16bT+YlkXHuz
 jVFzaRIB4DGfA2wD5kzpDKJYCBixGdTJJ0O+MlNyMQlppsAK1f30e+7/dlbuGHCABmzl
 DOKuTmTz9TgTrd3jn4UUFsTGpXfXPT4xGUm0K8Es7yQRUSKdu578GL/7KOfF115P94FF
 N04JhF3R+letUYh8Ix9SEG9mAaOWMpG/n1Ob/YK6lJWb/SdmeD1AudgOpAvWpgy5/h2K
 orYg==
X-Gm-Message-State: AOAM530tIfR+P3XHiYPgbXqIo9oYNQTBMO3zcKWo4QZr7B+05UuFrb6f
 CZ6tk9wRj+EJenmZXGuWxT4BqUkiVZU6ew==
X-Google-Smtp-Source: ABdhPJyI2RAE5TJGA+zvTRGXh4WOYNmeTrWDqnM0X56nJCd5sepJrkCHc4KilK3GF6yhQKpaOOVugA==
X-Received: by 2002:a05:600c:198d:: with SMTP id
 t13mr8883725wmq.73.1616687730446; 
 Thu, 25 Mar 2021 08:55:30 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f1f:bb00:835:ce1a:dbdf:db93?
 (p200300ea8f1fbb000835ce1adbdfdb93.dip0.t-ipconnect.de.
 [2003:ea:8f1f:bb00:835:ce1a:dbdf:db93])
 by smtp.googlemail.com with ESMTPSA id x13sm210835wmp.39.2021.03.25.08.55.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 08:55:30 -0700 (PDT)
Subject: Re: [PATCHv1 0/6] Amlogic Soc - Add missing ethernet mdio compatible
 string
To: Anand Moon <linux.amoon@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Russell King <linux@armlinux.org.uk>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 netdev@vger.kernel.org, devicetree <devicetree@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-amlogic@lists.infradead.org
References: <20210325124225.2760-1-linux.amoon@gmail.com>
 <4ce8997b-9f20-2c77-2d75-93e038eec6d8@gmail.com>
 <CANAwSgS4SLdYwY9n6uNci+rgE1Q4UAzCy29gX+CL4patDgH15A@mail.gmail.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <41c4af19-cceb-c25c-2e11-cc9319cc42c1@gmail.com>
Date: Thu, 25 Mar 2021 16:55:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CANAwSgS4SLdYwY9n6uNci+rgE1Q4UAzCy29gX+CL4patDgH15A@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_155533_037556_117CE784 
X-CRM114-Status: GOOD (  24.30  )
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

On 25.03.2021 16:40, Anand Moon wrote:
> Hi Heiner
> 
> 
> On Thu, 25 Mar 2021 at 18:49, Heiner Kallweit <hkallweit1@gmail.com> wrote:
>>
>> On 25.03.2021 13:42, Anand Moon wrote:
>>> On most of the Amlogic SoC I observed that Ethernet would not get
>>> initialize when try to deploy the mainline kernel, earlier I tried to
>>> fix this issue with by setting ethernet reset but it did not resolve
>>> the issue see below.
>>>       resets = <&reset RESET_ETHERNET>;
>>>       reset-names = "stmmaceth";
>>>
>>> After checking what was the missing with Rockchip SoC dts
>>> I tried to add this missing compatible string and then it
>>> started to working on my setup.
>>>
>>> Also I tried to fix the device tree binding to validate the changes.
>>>
>>> Tested this on my Odroid-N2 and Odroid-C2 (64 bit) setup.
>>> I do not have ready Odroid C1 (32 bit) setup so please somebody test.
>>>
>>
>> When working on the Odroid-C2 I did not have such a problem.
>> And if you look at of_mdiobus_child_is_phy() and
>> of_mdiobus_register_phy() you'll see that your change shouldn't be
>> needed.
> I will check this out, thanks for your inputs.
>>
>> Could you please elaborate on:
>> - What is the exact problem you're facing? Best add a dmesg log.
>    1> I am aware all the distro kernel I have tested ethernet will work file
>    2> My issue is when I compile the mainline kernel with the default setting,
>        Ethernet interface will not receive any DHCP IP address from the router
>        Although the Ethernet interface comes up properly.
>       This does not happen frequently but I observed this at my end.

If the PHY wouldn't be detected, then your network would never work.
So there must be a different reason. You can manually assign a static IP
and then check what's going wrong: checking for missed / error packets,
running iperf, etc.


>   3> I tried to collect logs but I did not observe any kernel issue
> like panic or warning.
> 
>> - Which kernel version are you using?
>      I am using the mainline kernel with default settings.
> 
> -Anand
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
