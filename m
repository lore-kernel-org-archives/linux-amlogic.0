Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F76DC05027
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Feb 2023 07:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Uw6OKyQVMRPtpnUsqRFn7dqYp6PtsTBo8+6IntOzBw=; b=qSXd1eJYOrDzzn
	xlq2gXUBQH0uD+C6C46ChF1C+wz5DFPMRdQnYdsqYby+UO4M2kWOMsWSjaMy++8OOUENz2U1G+OAn
	aamiuZ+9TsyClc42v7zQv79SVBpdDvpSghWQrbYILzWgx2kt4US4hmE/ka3I8cJEgaSi74uPkRo6I
	hlecaIPsr+dc2HU2bE2/JcMSfMOTuvksw8cisO2bsMPpBWFt8c7MUf94pgj2yuqP54ZTB6Rm5gTDj
	2PNgMVINtU08zAEc3H2vwSjEtixQ7mZbmZ0Vm2sNcexCHx1um1/Swte1eLh0AXOszfpwwgZ2m4kSU
	AUbfqKAEpMvXTmfuK/YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU0Rb-003DH5-1P; Mon, 20 Feb 2023 07:18:39 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU0RO-003DFC-AX; Mon, 20 Feb 2023 07:18:28 +0000
Received: by mail-wr1-x42e.google.com with SMTP id bk4so1738446wrb.9;
        Sun, 19 Feb 2023 23:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+TYrZcI8oZmBJI8gRHKnPvwWt4Ky2DBWZ4+TEcEBWbg=;
        b=RcBjSTMyU4bUL6GadSiyPG3lyr+fwiuarIyvIiS2KegkfuAHC6t2CrARADIWLLjOEh
         ckaQqS113vUNBgWODmcHl/oOFJ0ukdruArF0aP/Jik3onqjODzLh1ZKFKDCK5fMGMxNP
         35VqOwUCY2l8XoJia+zjVB5scbh7YtYkGdsBzei7FC4NE/6953Lgy1Tj6CC20dtkTh0I
         fJVhtFsboNMwRAb9RiSHCiznYEey38+yLQfsHHIugwzdgLNVLJqsjz33U2qJrKFOleg5
         8PMYS/GgfnRCMU9jPOA88kOgmrs1mQwUhPYBECTHLiIRfltBmbZd03Loxgd+qDS4fcXu
         4M8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+TYrZcI8oZmBJI8gRHKnPvwWt4Ky2DBWZ4+TEcEBWbg=;
        b=TE4QkZ3wORB/Q7HcCOGzqNjrLIAek7ygIR2zV7bcE8D5cMxoOqJzwbv5LhSkJkKvo1
         dgwj7GKjEoCi2tB2KS0JYzmQfRL5Xgnc7vhttuhNdv6lgu50tmCmOp4ThNWcr3PitwYH
         a/PcB8dtBzyvbtT1kIliY8SqpvmdB5o0SaoCqAgDS4XR8kIlVZ7Pr0d83JX89dPKuMsC
         7nG7pZY/K8XxTIIUVWtEVa50kDdkhnTJZgfFo9yAE7a92E9xA/O5ZSMPLSSnV23OFVr1
         O7/AiY3RjWZgdKxEru8ZyD42Vn6tsbhm/mwe0QxeV17WAjkShdeZErVEd4fpIziQQpBK
         fACw==
X-Gm-Message-State: AO0yUKXyDdSjl7D9c/fVLPSpPCuAFtPONUX71ZhloOh6dlThmZOkXpgp
	Ro6PgqnH+viKJZkFizu7+Ac=
X-Google-Smtp-Source: AK7set8u9kxAEpAQKgHwNoI6ElkWlxeNj36+HwGlKJtyqRZ+FljrZfUEdGxocK++KU4MDRFQ4kD7Mg==
X-Received: by 2002:a5d:4586:0:b0:2c6:e670:8867 with SMTP id p6-20020a5d4586000000b002c6e6708867mr1911727wrq.0.1676877501235;
        Sun, 19 Feb 2023 23:18:21 -0800 (PST)
Received: from ?IPV6:2a01:c22:77a6:b600:7c00:d16a:3ffc:2f37? (dynamic-2a01-0c22-77a6-b600-7c00-d16a-3ffc-2f37.c22.pool.telefonica.de. [2a01:c22:77a6:b600:7c00:d16a:3ffc:2f37])
        by smtp.googlemail.com with ESMTPSA id a17-20020adfdd11000000b002c6e81a7e5esm621333wrm.107.2023.02.19.23.18.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Feb 2023 23:18:20 -0800 (PST)
Message-ID: <426a526b-cd55-0bd0-1ab9-623832ef7417@gmail.com>
Date: Mon, 20 Feb 2023 08:18:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 4/5] hwrng: meson: use struct hw_random priv data
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Olivia Mackall <olivia@selenic.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <26216f60-d9b9-f40c-2c2a-95b3fde6c3bc@gmail.com>
 <4dafc70f-be7f-bfdc-8845-bd97b27d1c4c@gmail.com>
 <Y/L6E+7SmLha7Bp8@gondor.apana.org.au>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <Y/L6E+7SmLha7Bp8@gondor.apana.org.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230219_231826_442709_DDC02EDB 
X-CRM114-Status: GOOD (  15.49  )
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

On 20.02.2023 05:41, Herbert Xu wrote:
> On Sat, Feb 18, 2023 at 09:58:07PM +0100, Heiner Kallweit wrote:
>> Use the priv data member of struct hwrng to make the iomem base address
>> available in meson_rng_read(). This allows for removing struct
>> meson_rng_data completely in the next step.
>> __force is used to silence sparse warnings.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>  drivers/char/hw_random/meson-rng.c | 14 +++++++-------
>>  1 file changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/char/hw_random/meson-rng.c b/drivers/char/hw_random/meson-rng.c
>> index a4eb8e35f..bf7a6e594 100644
>> --- a/drivers/char/hw_random/meson-rng.c
>> +++ b/drivers/char/hw_random/meson-rng.c
>> @@ -17,16 +17,14 @@
>>  #define RNG_DATA 0x00
>>  
>>  struct meson_rng_data {
>> -	void __iomem *base;
>>  	struct hwrng rng;
>>  };
> 
> This is too ugly for words.  If you're trying to save memory we
> should instead get rid of rng.priv and convert the drivers that
> user it over to this model of embedding struct hwrng inside the
> driver struct.
> 
OK, then let's omit patches 4 and 5.
Patches 1-3 have a Reviewed-by, can you apply them as-is or do
you need a resubmit of the series with patch 1-3 only?

> Thanks,


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
