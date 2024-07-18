Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A305DC3DA63
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Jul 2024 17:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r14Uccjh3LkJTTQmkaiLXwdDCuv6flJROwzXNoGKz44=; b=PAfovvx3pOsPAN
	9HEQs1p3mXoBL2b2NMSjo7E/58mouY9U05g1emlWijCtvzsx1cvkMYbkYd0/FxPeaICIvqygwjxNr
	aLg5csk6+gehngBl3VE2JvRBCJdAwuIFuNQvkK2ltKyje/v6cvjXze0n1mzxUEqqP3eAqaasmsxur
	mHBuBkGmZZujFxf4NrdI2TXr1stH5BKx9SnlL4T4Qa/tEOUy5lka3iA5V5S0q6NV8S6451k8l1paL
	csMU8e5VXkZvmTFuGbCMXBPZvVv8mwwlf8D6U1Brilgf4nF8Tutz/Mkw/3VFqoXyAVGXgNAEcxWhv
	9k/fIcedAeFthDnLLDOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUUme-0000000057A-2j9J;
	Thu, 18 Jul 2024 17:19:12 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUUmZ-0000000056X-3XlD
	for linux-amlogic@lists.infradead.org;
	Thu, 18 Jul 2024 17:19:10 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4279c10a40eso4763345e9.3
        for <linux-amlogic@lists.infradead.org>; Thu, 18 Jul 2024 10:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721323146; x=1721927946; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7uR+g2yKHQtKWUoZd9oU/bblecyRnWgI3idxDPFwBF0=;
        b=LJB8p83m9ise+jMhwc3Bs2rdVc1Lic3NdzpfUtdOYP3aaKiyESFTa+ixyYIFVbP5O1
         YRE5z44P7zhfmMvBIA+MdlZ13JTVQqBY5AHAWA3UcvFVcmlr0KYJS8DjdxnuQfN46E69
         Q22WtgZ0xjXUyIEs+F5HnMT4XENdGrLvfspaE6XPlHdEzaB0pbJSkLwyA5jFWEk6OAts
         7zzi0aDv4ZkMfu5RAJnG2kSDQ7KbUsys+4ykQPYZVzhVNmSJ84uqJW0/JIWSE7HTUQuu
         Aeg5NL3DiFjgiGW8eGsB4zElFBmGWOmxZs/OSr8UoP1QptbhTW1yqfoEEOC4DG+FWpqy
         9tbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721323146; x=1721927946;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7uR+g2yKHQtKWUoZd9oU/bblecyRnWgI3idxDPFwBF0=;
        b=m4iZPhXAAZebz967fJaLPTSJZOfD9L30/U2DF3YyUmLHRhLy2WyfFyr2cFkPaZcxCb
         tfQoqO1txr0UKaaFJfQAStsvcFU0fN0gm/omK/CwRD+SkfYVlDf+qR5KjEKsdv3RQoSE
         WlP36gXxcKfzH/3gLCq3yzsJyTwu+19A63M4Q9gzELJHODHI4vqcpefTOB3UFRUtGsNU
         ftLZ3gCHrgLv8cSBis7Kvhbob+PHarU01//odd8bl4VJqCfCEP3YEyOmpITVovGdkvRZ
         mlQkrghYoloUCzstx6teCDdQ0wMZutSqgc1BM3/HHGLzv56XKcnphGbbLNg9uHIiP2v5
         jtww==
X-Forwarded-Encrypted: i=1; AJvYcCVQ+arSTaJ87wRBjkXl7g2iTFbZEv0SHzWFVx8JorIw5WW0AWcyruv7uNQ73XNahv5MRYisTxHhJEIwhYYUuwmzRF5AjY7rdo/NsnfYwWOgENs=
X-Gm-Message-State: AOJu0YyiqK2DTRcoAKxOHes6CqCSkrZB5KH2HCCcQVQtvf9nH7bYZSTO
	QNETl6NO5WNgkBi3DL7cG3pZ02Lk6ogww7gIElSTEH8vPNqu1lYcfGoFAoMxj4A=
X-Google-Smtp-Source: AGHT+IH5+9L9pwlWaj+Zw1XCZJjBadwkEba4ZohfVAwFN+aRmCq+OzHkIaw26350GTJ565KkhbpaZA==
X-Received: by 2002:a05:600c:3b0f:b0:426:5ef5:bcb1 with SMTP id 5b1f17b1804b1-427c6ba30b4mr30710845e9.6.1721323145735;
        Thu, 18 Jul 2024 10:19:05 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:bbf5:bf25:4f46:2ec8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d2a5c34bsm22577015e9.16.2024.07.18.10.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 10:19:05 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,  Stephen Boyd
 <sboyd@kernel.org>,  Jan Dakinevich <jan.dakinevich@salutedevices.com>,
  linux-kernel@vger.kernel.org,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 1/9] reset: amlogic: convert driver to regmap
In-Reply-To: <2f094b21-aa55-4a81-b9af-ff06c34c5a67@linaro.org> (Neil
	Armstrong's message of "Thu, 18 Jul 2024 14:45:35 +0200")
References: <20240718095755.3511992-1-jbrunet@baylibre.com>
	<20240718095755.3511992-2-jbrunet@baylibre.com>
	<2f094b21-aa55-4a81-b9af-ff06c34c5a67@linaro.org>
Date: Thu, 18 Jul 2024 19:19:04 +0200
Message-ID: <1jr0bqmxdj.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_101908_068203_9A67458E 
X-CRM114-Status: UNSURE (   9.84  )
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

On Thu 18 Jul 2024 at 14:45, Neil Armstrong <neil.armstrong@linaro.org> wrote:

>> +
>>   static int meson_reset_reset(struct reset_controller_dev *rcdev,
>> -			      unsigned long id)
>> +			     unsigned long id)
>>   {
>>   	struct meson_reset *data =
>>   		container_of(rcdev, struct meson_reset, rcdev);
>> -	unsigned int bank = id / BITS_PER_REG;
>> -	unsigned int offset = id % BITS_PER_REG;
>> -	void __iomem *reg_addr = data->reg_base + (bank << 2);
>> +	unsigned int offset, bit;
>>   -	writel(BIT(offset), reg_addr);
>> +	meson_reset_offset_and_bit(data, id, &offset, &bit);
>>   -	return 0;
>> +	return regmap_update_bits(data->map, offset,
>> +				  BIT(bit), BIT(bit));
>
> Here, you're converting a:
> writel(BIT())
> to a:
> reg = readl()
> reg |= BIT()
> writel(reg)
>
> so indeed you should use regmap_write(data->map, offset, BIT(bit))
>

Ok the trouble is this particular register which is write only, not
some writel vs regmap problem. The read value is probably undefined.
I should not have changed which the migration anyway.

Thanks for pointing it out, I'll fix that in v3

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
