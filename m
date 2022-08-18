Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 944E6C00140
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Aug 2022 11:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fmb+7Ekgaol46fY8tvUV297/UjiQ2R13OyAYl92CKyQ=; b=2f8t2dZCxDX9mL
	vyBBEqKiEAQxD8XhC6EEEGZtZvm8QMEeIldL8z/yOuSV9eNs0n7gbz4GPUx4vCrGCCKdu/FGgg515
	VVV8HdnYYWTq7e2d8YfW95R0fSfDyHB3vfpJjbpK4KRsMhi1LxN4UVetVOp4/mFQ/iISRCKnlJo6/
	YJOh8fVxbxIqXTf7YXkOWcF+9PFPpfDDyFbq9NJA3lg8Y4d0aT4t1mugF26rooebVJcns7wNBnVzN
	JGu0l1/ZEzvE5KiCzigzWkToOiDlF5tbHecrLjDGRUSh7aL9MuF79C48IfVcgqHnLl7rSaN3IAWBJ
	3LIX7+yinkY73NITb8HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOdmj-003mrq-TQ; Thu, 18 Aug 2022 11:34:01 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOdmg-003mo9-5i; Thu, 18 Aug 2022 11:33:59 +0000
Received: by mail-lj1-x22e.google.com with SMTP id bx38so1423551ljb.10;
        Thu, 18 Aug 2022 04:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=XV7o6VoA/foYENhSlwcR9LzNfzuZL9zSnfMTcBdlzkU=;
        b=DLLTtzRMoFSzlvDXNfWAs/5b6nkGZeYQQBFmtNHPM77XjF/MNDQTGJgCecdRKoXUXN
         tzQwxQZ1Minx4+qxe+GDvMjSQIYH49V6JCsZ3KlWyBmwtJG2AHcWIGimOZnagojXqp5U
         xFZbxiKQ0y+BPviS4vBVpSzoQl9MQSUS1MpH0G7pcS0TcxA61A9FEdSYYIXKui87zisL
         P9atfk3nRnh7wTq4O1w1SCzLh1UwKabAx222sHPJ8+2CeJNFVXEBSatzKqX8A1zUpOpc
         KO/taku9ptszlejU7vGtoXm9jXp2hrf88vsRUCWfJNMc63tQOXJoaDxnHGgJtazzuTuR
         k/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=XV7o6VoA/foYENhSlwcR9LzNfzuZL9zSnfMTcBdlzkU=;
        b=M2DMboWyHlqIivas8JSFvQaLYFN+ljQEq8uHX05HwRvethcFJh+LGVs+a03sWTtyuo
         JLwMn79+Ef1clTeCsSNXEUrtkyBTtKwSk6iU9FF5nDG75VFQhrST3StdzwnO/lmgO1Gt
         hNZfAcQM1ySfB/s07briGn2GUpPPA49FXc/X17xMP9HkZrI9nEL7bN1f9Q4WwgXVLK8H
         /GyyvHHUMrd20Ftv2LZSdTtKg1RL4+HMDDMnqKvLMU6GSyzhKIjdKKHX3D1RLmqpJD4k
         Bn6Ra7AdCoWrrlmt+1troEE310lgCNq4xrCzfsAsp3DrjnGaFo7BcVNcpb0Ri5qbT/zy
         qaBw==
X-Gm-Message-State: ACgBeo2er7/kJA0JIaGWN6y/EHL3s3cQSc8mVBJJ3hGBv/gzGHFkFkPN
	HrjIRxK7RXPNJdV2jbtwVDM=
X-Google-Smtp-Source: AA6agR4Vh+SHdQBIyBHvoqdFckErTl5MnC7H2o375cqIoP3U2g2zgTH9t3HaTX7yjMvi9hGCS1viPw==
X-Received: by 2002:a2e:a4aa:0:b0:260:5889:95f7 with SMTP id g10-20020a2ea4aa000000b00260588995f7mr755509ljm.530.1660822435325;
        Thu, 18 Aug 2022 04:33:55 -0700 (PDT)
Received: from [172.16.193.151] ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 18-20020a2e0912000000b0025e08d58e75sm190940ljj.133.2022.08.18.04.33.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Aug 2022 04:33:54 -0700 (PDT)
Message-ID: <52d307d7-04f2-89fd-ff4b-9a6c0d247350@gmail.com>
Date: Thu, 18 Aug 2022 14:33:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: (subset) [PATCH v2 0/7] Devm helpers for regulator get and enable
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: dri-devel@lists.freedesktop.org, Johan Hovold <johan+linaro@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-amlogic@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Miaoqian Lin <linmq006@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Alexandru Tachici <alexandru.tachici@analog.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Guenter Roeck <linux@roeck-us.net>, Jonas Karlman <jonas@kwiboo.se>,
 Stephen Boyd <sboyd@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jean Delvare <jdelvare@suse.com>, Alexandru Ardelean
 <aardelean@deviqon.com>, linux-hwmon@vger.kernel.org,
 linux-clk@vger.kernel.org, =?UTF-8?Q?Nuno_S=c3=a1?= <nuno.sa@analog.com>,
 Robert Foss <robert.foss@linaro.org>, Aswath Govindraju
 <a-govindraju@ti.com>, David Airlie <airlied@linux.ie>,
 linux-iio@vger.kernel.org
References: <cover.1660292316.git.mazziesaccount@gmail.com>
 <166057828406.697572.228317501909350108.b4-ty@kernel.org>
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <166057828406.697572.228317501909350108.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_043358_290354_31190A79 
X-CRM114-Status: GOOD (  14.83  )
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

Hi Mark,

On 8/15/22 18:44, Mark Brown wrote:
> On Fri, 12 Aug 2022 13:08:17 +0300, Matti Vaittinen wrote:
>> Devm helpers for regulator get and enable
>>
>> First patch in the series is actually just a simple documentation fix
>> which could be taken in as it is now.
>>
>> A few* drivers seem to use pattern demonstrated by pseudocode:
>>
>> [...]
> 
> Applied to
> 
>     https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
> 
> Thanks!
> 
> [1/7] docs: devres: regulator: Add missing devm_* functions to devres.rst
>        commit: 9b6744f60b6b47bc0757a1955adb4d2c3ab22e13
> [2/7] regulator: Add devm helpers for get and enable
>        (no commit info)
> 

I was planning to send out the v3 (where IIO patches are no longer 
squashed into one). I didn't spot the above mentioned patch 2/7 from 
regulator/for-next. I'd just like to get confirmation the 2/7 was not 
merged even though it's mentioned in this mail before re-spinning the 
series with it.

Best Regards
   --Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
