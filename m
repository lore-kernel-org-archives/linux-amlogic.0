Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E880C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Apr 2022 07:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aH6792JdrGf3I/c2/pKrTkf4RpJn4odu1NnBCmFqRb0=; b=LyTuYlPbtScdo8
	XJmBnqgSDiKv0+df7BgbBllXoTCR/LgQGbz+9q3szaKnv6shAFCJPcotE3fSI4g2O4z7exImortr5
	ALthZfzA0M5018fJlnUjpgTcll/4JwXdzPEOxXUutgP1i8zo8dMMm7ov80mB0cphNu2dUAtWZs/jG
	ZrgkVC1GfzYafjfC9Gi7wHmCTtVPc9c9vOGgs273rou9/v8kzfPNFJDnbZ1TZ6/x4wUKKB4ew2diQ
	36JQZNFKO5cEyOnTNZTVhtXE4FjeTPoZSy/l04XBqbG4d+fR87O6yiQedo18Oklx4KaxBXShK+XMW
	CrZfOY8PUtJeXivEQstg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndoXT-007GJq-Hl; Mon, 11 Apr 2022 07:32:43 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndoVT-007FO6-FO
 for linux-amlogic@lists.infradead.org; Mon, 11 Apr 2022 07:30:41 +0000
Received: by mail-wm1-x332.google.com with SMTP id
 m33-20020a05600c3b2100b0038ec0218103so228283wms.3
 for <linux-amlogic@lists.infradead.org>; Mon, 11 Apr 2022 00:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=uISV79NvLNC/cTXlwSWYKI9FmQgaA5KuUdHffG+BjtM=;
 b=xtJTG2AyZ6TVnMvpiP9AMoK5zkE2H+zCJg/Qzf9fsJJ5h/R7PHZJ/Vh+O78/tzzdav
 TsCBWxEN2UPcJNv8FVsNrnIzbzW/I0SoDjM3UCIDH+I5xr8VFlHXhKrJ+mznSvMWKP8v
 jVALcDYUM8PZRLkZlr3FiizhOmdQv69f8PbY/FhL1dzfnHjptOlVuwvABUbYk4KbrFFD
 jDLP3/zMWYap/myIa+OYEq2OeT44nB18NGMtSGz028/ppvYUV3xjKWoMnCdtemqITLa1
 aZG8MnDrSLBMSF7OEhbXsSqKsdSxdHA0FYztkyicfofIZbUe7XNoaZaSWCc3lA2vAwhS
 UGXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=uISV79NvLNC/cTXlwSWYKI9FmQgaA5KuUdHffG+BjtM=;
 b=GLGQ+Fv8Hf04HsMFP8v4eRBunMb9pyAL78PCqhRGIdMxnyFPOvD+JXP1yVbKn2LXXX
 vVRQVA/A1XP2lLu8MKUJtpczI3WbYK6LKcGUUhKQKMo1Bt8iLi/n4BFdDI73ECGUHriI
 AvDOWYc9MHRg63w7iq7KGpVH1g0dnJ1PMwZfmbW2JTPUmuX7OZMPFAYfk9SMO5RvCVuX
 E7YVBsAUzf+WW1a9LZRwPGp1X9AMEAp4L3rgAQYkJo9RPv1NIGkBC2ji+ibCZWaqcWnA
 dVO0KsZgMcRMRXnYTlnGyKV+AgrQ+FjMj6FBoGj5aN1XIuUaEbWwtM6uZXOrxQO3HPh8
 4grg==
X-Gm-Message-State: AOAM532kqhjt8lioAqu0K4CZdBXkAZfps0mTMSrBpRpXqQy/YoK+j9fj
 8rzqRTTWSiVFWkcnxKjROyWtAI9jHedcbbC3
X-Google-Smtp-Source: ABdhPJwOXW+WzVKvrz3aqfcwW9FTHjL6+X6jqzSqvA+Ks+EoDztLWLgGezxyGTYlTNb1sSKh7vawwA==
X-Received: by 2002:a7b:c155:0:b0:38e:b840:c99e with SMTP id
 z21-20020a7bc155000000b0038eb840c99emr5336807wmi.201.1649662238098; 
 Mon, 11 Apr 2022 00:30:38 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:d1:e096:d183:1bc5?
 ([2001:861:44c0:66c0:d1:e096:d183:1bc5])
 by smtp.gmail.com with ESMTPSA id
 n8-20020a5d5888000000b002079f95ca87sm5593940wrf.68.2022.04.11.00.30.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 00:30:37 -0700 (PDT)
Message-ID: <7458df77-2721-71a5-893f-8247f05be765@baylibre.com>
Date: Mon, 11 Apr 2022 09:30:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 0/2] Ensure High and Low periods of SCL are correct
Content-Language: en-US
To: Lucas Tanure <tanure@linux.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220409164334.157664-1-tanure@linux.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220409164334.157664-1-tanure@linux.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_003039_561319_83806A64 
X-CRM114-Status: GOOD (  14.53  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On 09/04/2022 18:43, Lucas Tanure wrote:
> The default duty cycle of 33% is less than the required
> by the I2C specs for the LOW period of the SCL clock at
> 100KHz bus speed.
> 
> So, for 100Khz or less, use 50%H/50%L duty cycle, and
> for the clock above 100Khz, use 40%H/60%L duty cycle.
> That ensures the low period of SCL is always more than
> the minimum required by the specs at any given frequency.
> 
> I did a few measures on the Khadas Vim3 board:
> 
> i2c_AO (i2c@5000):
> 
> Before the patchset, I got:
> - 100KHz: 3.338us HIGH, 6.746us LOW, 33%/67%, Freq 99KHz (Not Valid tHIGH < 4.0us)
> - 400KHz: 860ns HIGH, 1.734us LOW, 33.15%/62.85%, Freq 385.505KHz (Valid)
> - 1000KHz: 362ns HIGH, 732ns LOW, 33.09%/66.91%, Freq 914.077KHz (Valid)
> 
> With the patchset
> - 100KHz: 4.952us HIGH, 5.134us LOW, 49%/51%, Freq 99KHz (Valid)
> - 400KHz: 966ns HIGH, 1.628us LOW, 37.24%/62.76%, Freq 385.505KHz (Valid)
> - 1000KHz: 372ns HIGH, 720ns LOW, 34.07%/65.93%, Freq 915.741KHz (Valid)
> 
> i2c3 (i2c@1c000):
> 
> Before the patchset, I got:
> - 100KHz: 3.348us HIGH, 6.704us LOW, 33%/67%, Freq 99.5KHz (Not Valid tHIGH < 4.0us)
> - 400KHz: 864ns HIGH, 1.69us LOW, 33.83%/62.17%, Freq 391.543KHz (Valid)
> - 1000KHz: 360ns HIGH, 690ns LOW, 34.29%/65.71%, Freq 952.381KHz (Valid)
> 
> With the patchset
> - 100KHz: 4.958us HIGH, 5.092us LOW, 49%/51%, Freq 99KHz (Valid)
> - 400KHz: 970ns HIGH, 1.582us LOW, 38%/62%, Freq 391.85KHz (Valid)
> - 1000KHz: 370ns HIGH, 680ns LOW, 35.24%/64.76%, Freq 952.57KHz (Valid)
> 
> v2 changelog:
>   - Keep the previous calculation for Meson6
>   - Use I2C_MAX_STANDARD_MODE_FREQ
>   - move the comment before the if()
>   - use FIELD_PREP for setting div_l
>   - Drop removal of meson_i2c_data
> 
> Previous versions:
>   V1: https://lkml.org/lkml/2022/3/26/109
> 
> Lucas Tanure (2):
>    i2c: meson: Use _SHIFT and _MASK for register definitions
>    i2c: meson: Use 50% duty cycle for I2C clock
> 
>   drivers/i2c/busses/i2c-meson.c | 111 ++++++++++++++++++++++++---------
>   1 file changed, 82 insertions(+), 29 deletions(-)
> 

Thanks a lot for the timings !

I think it's ok to be applied,

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
