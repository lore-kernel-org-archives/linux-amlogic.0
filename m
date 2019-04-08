Return-Path: <SRS0=BDF+=SK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26E4FC10F14
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Apr 2019 18:46:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE72020833
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Apr 2019 18:46:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iB5TA7EV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lWio+D/I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE72020833
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bmCyFI8utKmuPirsNPKevEW8u+VKiYI2nUXAafypeeg=; b=iB5TA7EVLgW/+D
	uvMZ2uHGb2QVZnS0Sn3+JE3fDtPApjbS8fmUe22G11zs1I3NtX4MC0MpQB175DsM9XTvly+UkLwVO
	aAuzWMqWnaDBw4kvLnKf08tYyPoezfRllzoxjjMWHCYkEJ0bRMHozAZU3LajRxdL9YelTdERxBgzB
	96aBNi7DP70qUItt9nw42k6mXplOE19Jl4e8iBxn0m3tynG6IV7K0o3s5flQG9AFLXbfhTpD+9W76
	cw7tlFaYbRW2T7Op7uRoDnEI0NGz+SL3mA5R1rFUzD1MlBHrWmKmOZX1etfBy5awpc98U4D8MvtV8
	mz5+Je3gNedBn0zqgQaA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDZHK-0000ol-Cp; Mon, 08 Apr 2019 18:45:58 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDZHG-0000nn-Uu; Mon, 08 Apr 2019 18:45:57 +0000
Received: by mail-wr1-x444.google.com with SMTP id y7so2040744wrn.11;
 Mon, 08 Apr 2019 11:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DRsXw8vdqlaU16GH1AIOETT5ndN2KlmK3ANCQcIujFI=;
 b=lWio+D/I8wk7C3mPjrTwQVZcLVb/FcTh99lVq5BuqDcCWQFHGPywD8WxvFRCHvsPX+
 mHmoc4YOm6dKgqHTsymo5616syiSo4rmsUnqln+5RvwKAtnCT/MO7asnHLK+M/RvzNAm
 apw+XgoMHifRF5ERnhQl71EaqMi9MI+RTlYILOzaOeYjWit44T8N9v79/kIxcnaLXmSK
 /b23g9ZYu2YKGFxdoJHvi0cL0P1fGPdZRrzMCV7YEnwAjwFhCFjsDlmj3sHMy1VrH5On
 oAyVtBcV8koN6FJaRgvnq9OjorHbqVbx9cE6ofyjBIodHhZKrDEkxtCTmLbTEmss9+bQ
 AzGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DRsXw8vdqlaU16GH1AIOETT5ndN2KlmK3ANCQcIujFI=;
 b=ZKneZdhWc9tEfr1/6RZaM6kMsECcS2MxIzdhaVhhMPXhXeAk+VA97W7tneU2MdsOhZ
 FrhU72iAaMH1H4ZCKyJ+zGVd6DleKDY5THoRBiVIR0MousaFK/2WTvf6YckdeQhpjXIt
 Hopw8zbxS2pi9NAWbNbBkGvrbUp0NfJhmDVfQOu/5ms4Cv7tJ+ayKLSWZZT3c7ALmBJ5
 xSRKJpd/AAmKHAyS2rMxRZABu0u6thbUpvVcW4LrL2Tg3cWBVw4J4Y9uth2aZRwDeIPF
 0jo9B415Q+B5QZ9VYpX+cfTDMsbxDLCPqcfBH4Z3DRD4imWwoTRpb/osNjvNotc+bCdd
 NxuA==
X-Gm-Message-State: APjAAAWRSN20K9mi4CZM1A/kfZ24egTJ5EdbsILLAVcGKTsoAiZXKhL8
 gFicYiZyBv6pUgWf54DDs3rV+Fzi
X-Google-Smtp-Source: APXvYqxZ6/QCjFdeo1IpahAZCPAc1l1JhXWZ6NIG8bVNPaMlHgV7/VwcL/DyQScGa0n5Byt/1JHuGQ==
X-Received: by 2002:adf:f80d:: with SMTP id s13mr19462154wrp.38.1554749153176; 
 Mon, 08 Apr 2019 11:45:53 -0700 (PDT)
Received: from ?IPv6:2003:ea:8bde:d800:1488:bc0a:4c8c:6b35?
 (p200300EA8BDED8001488BC0A4C8C6B35.dip0.t-ipconnect.de.
 [2003:ea:8bde:d800:1488:bc0a:4c8c:6b35])
 by smtp.googlemail.com with ESMTPSA id s2sm12832600wmc.7.2019.04.08.11.45.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Apr 2019 11:45:52 -0700 (PDT)
Subject: Re: [PATCH net-next] net: phy: switch drivers to use dynamic feature
 detection
To: Andrew Lunn <andrew@lunn.ch>
References: <0cc96fab-e102-c0d1-ade0-90e3e06dc9f1@gmail.com>
 <20190407221312.GA14347@lunn.ch>
 <bc5c192e-78ce-89b1-eeae-541836f5f0fb@gmail.com>
 <20190408181249.GH15267@lunn.ch>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <3bc293a8-5966-fb40-e0b1-636f3a3dfe77@gmail.com>
Date: Mon, 8 Apr 2019 20:45:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190408181249.GH15267@lunn.ch>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190408_114555_791245_03381137 
X-CRM114-Status: GOOD (  15.32  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Richard Cochran <richardcochran@gmail.com>, linux-rockchip@lists.infradead.org,
 netdev@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 David Miller <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 08.04.2019 20:12, Andrew Lunn wrote:
>> Splitting the series and waiting for a Tested-by, as proposed by Richard,
>> may be problematic because most PHY drivers don't have a dedicated
>> maintainer, and we lack the hardware to test.
> 
> Well, we could split out those we know are likely to get tested.  I
> have a number of boards with Marvell devices i can test. Florian has
> Broadcom boards. I also have a couple of boards with Micrel KSZ8041,
> which would be interesting because they are Fast Ethernet. Bootlin can
> test some of the mscc PHYs.
> 
Great. Could you also test based on the series and the provide a
Tested-by for the PHY's which have been tested? Even if I split out
let's say the Marvell PHY driver, most likely just few of all the
supported Marvell PHY's can be tested.

> We also might want to get some targeted testing. The microchip_t1.c
> could be interesting, since it is a T1 device. There was another T1
> added in the last year, but i forget which.
> 
The T1 PHY driver isn't included in this series. It uses another
feature constant: PHY_BASIC_T1_FEATURES

> Just doing this testing might give us an idea if we really should
> expect problems.
> 
Sure. I tested and applied this change to the Realtek PHY driver
already.

>       Andrew
> 
Heiner

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
