Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 346B1C77B7C
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Jul 2025 08:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e/qDTDMmEornflarinFWAL5+BHwjBLHEco5qCRT7s5k=; b=VVE0txl9X3bryg
	HL5n7bOt59RfNTWQCBWR6z3utNF3T3YDMvymR75d4I/MB4I1JoEkLDnPMrzfaNPGRmsycx1KzV8yH
	KKyoLYUL3wolklyN0q9Sht55CWypbJGzJScJBTbtlckFF3IBLycBr8k5Vs1ZlImfbSxm85g5u9N0p
	OMkS6MnmXl/gmIGvCjGfwzYxnn8E/biPdEK8oNJUBnnVww+HkJpyf5s8Orldsy+iTkUM3PMdiODi5
	k4GmwbniZsycOy+k6QFfjeZZaKuDmYvjxnWx4n9Ha/GjU/6J9sFSpOtSlZSbLkBoGKNcrZLVrJLCm
	eLoHuhNFuSxYZJN6/lSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXFQD-0000000Agai-3GUL;
	Thu, 03 Jul 2025 08:35:57 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXFQB-0000000Aga9-0sgM
	for linux-amlogic@lists.infradead.org;
	Thu, 03 Jul 2025 08:35:57 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a6e2d85705so4250590f8f.0
        for <linux-amlogic@lists.infradead.org>; Thu, 03 Jul 2025 01:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751531754; x=1752136554; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+Z/tFNKm/X+bKuxHPpGCjHGMiM6UDjlBSDIyMJdyoOM=;
        b=24MitgN1isQpcZ5nZjKe3QJwivOTE0G5FfIRQmNEF0md3+KTLVHL1ix7Eqea4WsOtm
         d6GgjDtY8ObtK1G39vgltf//v9iQlFtCW4IHnfVZnzo7OjiqWljPPczhMweIySNrtfLp
         OqA+7u5bpRkwLo5O8RmnoulVb9JYgQ+MYF2GvRPxVOz12AXvnxTMPLl0uFfPQWlARaCY
         p14ijer7718Fe9cFOCJ8xRcnV1tnoDMPmJH5wTSPGPdba8wWB1CRE4pZ7QhIAWyoQD7B
         41CmcYBa29LBVAvMXlGE2OQj17Hgm8sv63Hw6UrLmkp8LJOVxg1n3BXBCIn5/RuLbScA
         hqZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751531754; x=1752136554;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Z/tFNKm/X+bKuxHPpGCjHGMiM6UDjlBSDIyMJdyoOM=;
        b=hSFWPFV4o3bibJMc07IEdSRoxv4rw8LXAx40PKCi73FstKUptQywKrf6xWNyG1ycCa
         VDt2KoqCsR04Vey9JHJwPcs50s8+w+1JQBDYZlmOaTC5uxET/ll+yVGB34wt7KWGhW/n
         JXRVNDghaOTVLayqyFcXOMApxyWVQcseznQUzzLsKVzVbfTCuzBJWSjOC/da6vvR+gEN
         glgxXo5+0O0/SeUyUfkLG05jzceEcgOWymSqc9HBadflPJHuMGY4qtFRxcrM+wDU3J2w
         eJUk1D1N9d07pWUR/RqYvkg9qTkIyuXJHCjjEh1iJWvrihYndAiqMz9gUGgFGqJfgucr
         44fw==
X-Forwarded-Encrypted: i=1; AJvYcCVhpC/ZyZ8IR3BspQM/N2yPmzaUjlK5rchsH+gQBJoK0ZmBscaxOuZB9il9Be9SdF+efJpkc895Y3dv5cYn@lists.infradead.org
X-Gm-Message-State: AOJu0YyLu4uNNoXkonx/6SWY6Ciaw2T02yw9CxnFg+/FNmJMVcJfFEbf
	N91joVunOhHsehRTbU0HVay6/Ae6p3qWTUdl0wq3AtD5a+v1TvlpYnRB5HqsGOj4mcI=
X-Gm-Gg: ASbGncvgUNqG7Sn7gSzbFf3RjhisdL62iuLa19fI/RcIMBhxvDwA/zh4V/jGP2VXT27
	JtZ5eaFkwE/SPpvzz51hevPYU2tLQgYz9RLz2zrB9YRnVm4bdlKuCeL9ZGRDOE2jMgWsoP1zGb9
	01gBgyz4nzqkqWrzllp1wLII9Lsk1pPb15bRGcjlZdKiyk7IxefiRmTXU0W2TLrUdO4VlhYWjrL
	wJmOeJl0PwPSMYmC4WIYnW3J+AM8a3DxfTH+l4OVE+FPWNSQQfMVXLxfmGFCBCWv8QmSQ96FsPU
	IPTdn1JnOWEA6xfg3klrp+H8zD46OJOpqMArKpkN6C/oY8lsYYljc+jeLpCCUf2nK72qyqaQ
X-Google-Smtp-Source: AGHT+IE3U4A+14gN1VsA8pGM9HPiNTu4gifAOlHAGEBIiYxAf/3iGRWCVM2COik1DJdkjDU8qXICew==
X-Received: by 2002:a05:6000:4a01:b0:3a5:8cdd:c174 with SMTP id ffacd0b85a97d-3b32d4d0ab9mr1866465f8f.26.1751531752716;
        Thu, 03 Jul 2025 01:35:52 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1b4c:1be9:25d0:5634])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a892e59884sm17658899f8f.80.2025.07.03.01.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 01:35:52 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 16/26] clk: amlogic: add probe helper for mmio based
 controllers
In-Reply-To: <68134d81-e15d-41e9-933d-95190af9b989@amlogic.com> (Chuan Liu's
	message of "Thu, 3 Jul 2025 11:29:07 +0800")
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
	<20250702-meson-clk-cleanup-24-v1-16-e163c9a1fc21@baylibre.com>
	<68134d81-e15d-41e9-933d-95190af9b989@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 03 Jul 2025 10:35:51 +0200
Message-ID: <1jh5ztd63c.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_013555_249212_0DED94D1 
X-CRM114-Status: GOOD (  13.33  )
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

On Thu 03 Jul 2025 at 11:29, Chuan Liu <chuan.liu@amlogic.com> wrote:

>>
>> +static const struct regmap_config base_clkc_regmap_cfg = {
>> +       .reg_bits       = 32,
>> +       .val_bits       = 32,
>> +       .reg_stride     = 4,
>> +};
>> +
>
>
> Since 'base_clkc_regmap_cfg' is only referenced within
> 'meson_clkc_mmio_probe()',
> we should move it as a local variable inside the function. This would be
> more
> logical and may optimize code size (During compiler optimization, only
> critical
> data needs to be preserved rather than the entire structure?)
>
>
>> +int meson_clkc_mmio_probe(struct platform_device *pdev)
>> +{
>> +       const struct meson_clkc_data *data;
>> +       struct device *dev = &pdev->dev;
>> +       struct regmap_config regmap_cfg;

Actually a partial init would do the job nicely. I'll refine this on v2

>> +       struct resource *res;
>> +       void __iomem *base;
>> +       struct regmap *map;
>> +
>> +       data = of_device_get_match_data(dev);
>> +       if (!data)
>> +               return -EINVAL;
>> +
>> +       base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>> +       if (IS_ERR(base))
>> +               return PTR_ERR(base);
>> +
>> +       memcpy(&regmap_cfg, &base_clkc_regmap_cfg, sizeof(regmap_cfg));
>> +       regmap_cfg.max_register = resource_size(res) - 4;
>> +
>> +       map = devm_regmap_init_mmio(dev, base, &regmap_cfg);
>> +       if (IS_ERR(map))
>> +               return PTR_ERR(map);
>> +
>> +       return meson_clkc_init(dev, map);
>> +}
>> +EXPORT_SYMBOL_NS_GPL(meson_clkc_mmio_probe, "CLK_MESON");
>> +
>>   MODULE_DESCRIPTION("Amlogic Clock Controller Utilities");
>>   MODULE_LICENSE("GPL");
>>   MODULE_IMPORT_NS("CLK_MESON");
>> diff --git a/drivers/clk/meson/meson-clkc-utils.h b/drivers/clk/meson/meson-clkc-utils.h
>> index 26cd47544302b28ca1a342e178956559a84b152a..b45f85f630d7190fb6509b088f05f17ca91fa1c8 100644
>> --- a/drivers/clk/meson/meson-clkc-utils.h
>> +++ b/drivers/clk/meson/meson-clkc-utils.h
>> @@ -25,5 +25,6 @@ struct meson_clkc_data {
>>   };
>>
>>   int meson_clkc_syscon_probe(struct platform_device *pdev);
>> +int meson_clkc_mmio_probe(struct platform_device *pdev);
>>
>>   #endif
>>
>> --
>> 2.47.2
>>
>>
>> _______________________________________________
>> linux-amlogic mailing list
>> linux-amlogic@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-amlogic

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
