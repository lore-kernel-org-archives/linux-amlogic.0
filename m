Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA33BC77B7C
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Jul 2025 08:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6bFZEfJoHE8i4RD5qmDarOLexZ5PoYq+5DDV6Y8bkcI=; b=rgNVSER1WoH1Oc
	boU/dRxTYqiAcQkcQsz3apZ5j+egahmx1jihNhTQ74K0m98RmkmCe1ugqbuNYlYsird00UBn/f53Q
	d20lpbZjGPLI/Se6Zbl/BtS1UnhPd9pyWsqQnDt5tBXL6AOagtF7XqYl4jGpMVElJ2l7Bg0RBbG5g
	byZOEwaSmnJj+abARqWwpGgMoDJUHTYB9Wz8JNbHBNp9mVZRdNNohZFeDoBzcfzU8Ztz6PaGnQ5dG
	bi648x1+N003aEUMapP0jJTru4oMEZSnykze3IThszh9sp0wAmaM6043GfByAMt3Wn6vjGTJmIKU3
	d1r+MyF0Ao1hcIY6QMtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXFU2-0000000AhWF-20r5;
	Thu, 03 Jul 2025 08:39:54 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXFTz-0000000AhUC-3y6R
	for linux-amlogic@lists.infradead.org;
	Thu, 03 Jul 2025 08:39:53 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-451d7b50815so40978635e9.2
        for <linux-amlogic@lists.infradead.org>; Thu, 03 Jul 2025 01:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751531990; x=1752136790; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5c5DYGl47aYWZLPkSpLUyqJH150qyEt79Wo9rxFNQNQ=;
        b=U95UHpAz7ztyKedHpfnfRz31XesjIsv0U5kqYn0dUDN+UKWMHV7JpxvlmTannMQ6DU
         ir1477fD7wuGkNdE+KqdIFwDXatBF8vr95+pCvsnocCeQmAkBLjkw7IHYKKS4gSVd5Kl
         mUmSaWO4Id+x5Wmyb/Utzpv3qw4edp3TyspfNGkvKdNgKzVbkjWV+tZk90h6/bouoWkt
         y3PtFOqixVgKMjheFrtZveUrmyHNvByVoN+HAHKw30hMDnbpjN2TWs+ptT4uU4KCSUVe
         ODugnyedP0Md/0lLnAAqvl38Gbr4oWO2wkN96sXYAIOQy0g3+rNrXmtPwTf3jx4REr20
         dLgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751531990; x=1752136790;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5c5DYGl47aYWZLPkSpLUyqJH150qyEt79Wo9rxFNQNQ=;
        b=vs1aZKkFegZue891noBx5PrvDBevLODu1TvB4oJZKqdiIiciSnv5QjEIgtkROdGBor
         ZxnqkbBGu57/o//8KAUH/y3vJOwGZM6j2M4ACh8q3osY5UrgXQHKmm8hgI6PYx1B6k+C
         EC6EHJxUhK4QFTrYN/WXHhhNMtOIPTa+59NlncrrHJQBLaJG6DSjl4u+CuBzCP9sz9so
         FksPUQHN7z/WW5D7xmPVgogiNIK5SwOkAUqKIWt32cW8HqOvQNnoidC/2e//jot2dlKQ
         GUPO2ewH2lsld20yQtgntrWvCOT2H+SperOelyCz4cYbhVn+uqsEPKRIavk/ltrbvQ7y
         7oDA==
X-Forwarded-Encrypted: i=1; AJvYcCW0SOy1+PcNVqDVdnSfG1kkh7X9YuhMdmXAlZOh1zJc5nWdqblacZ8mor0VO575C4BAUnIYCzIZogAzTebC@lists.infradead.org
X-Gm-Message-State: AOJu0YxcEbsmm1wzZ9qF3XGB5z4fC6XkX8z7z64GuMe8joGmtq/tI8GX
	zHYd6Z3uuu49Bese+mbqTicPF/oQt7D2+z2w55fxqWUbWQiSiRbN6YmUAKCVXUBXU7U=
X-Gm-Gg: ASbGncsawYOQBUT4XcfQDI0gLpb6TcwtkJ8fm/lwg0kMkBd6LUwRlvQbWg7qj5ARA1n
	su8yJOK+aNuHtOUoE0ZLxkmnW4MXPX3esTPnCdqLHFeiRNW6OkcguZSBugVK8Ph8NbiM7E/EKMH
	fcspdb2/m5cIU9t/TlxYnCBHfSA+kM7kWQeprh7o68iv646Ra/KSlbCn5Nx9bD2YIqa0+jBx4I8
	jeyzpJSUHtAfWbnhWzXuJoePt5u0Jl2RUjzrBIJ/+dBC/6AbJPdDQ4dRsajxV9YAVbqR91zC2Y5
	WdCzHAwsnGF7XzQQ/sfxuuVyB8hpTF9DLGby27wMicZLmGwlJY2ce8Y4N3rL9Q==
X-Google-Smtp-Source: AGHT+IEM43hwgON08uzyYs0xx1I5VpWRjMLLXLPjH06b7O2PIIqRcDAeRfUfliYzvrSLOzEu/UQUYQ==
X-Received: by 2002:a05:6000:26d1:b0:3a4:f52d:8b05 with SMTP id ffacd0b85a97d-3b32db892femr2028812f8f.35.1751531990341;
        Thu, 03 Jul 2025 01:39:50 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1b4c:1be9:25d0:5634])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a88c7fab6esm18379133f8f.31.2025.07.03.01.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 01:39:49 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 24/26] clk: amlogic: add composite clock helpers
In-Reply-To: <a9b6ffdc-489f-4be9-9005-e987df739901@amlogic.com> (Chuan Liu's
	message of "Thu, 3 Jul 2025 15:24:50 +0800")
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
	<20250702-meson-clk-cleanup-24-v1-24-e163c9a1fc21@baylibre.com>
	<a9b6ffdc-489f-4be9-9005-e987df739901@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 03 Jul 2025 10:39:49 +0200
Message-ID: <1j5xg9d5wq.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_013951_987022_3CDE6688 
X-CRM114-Status: GOOD (  14.71  )
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

On Thu 03 Jul 2025 at 15:24, Chuan Liu <chuan.liu@amlogic.com> wrote:

> Hi Jerome:
>
>
> On 7/2/2025 11:26 PM, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
>>
>> Device composite clocks tend to reproduce the usual sel/div/gate
>> arrangement.
>>
>> Add macros to help define simple composite clocks in the system.
>>
>> The idea is _not_ to replace all instances of mux, div or gate with those
>> macros. It is rather to use it for recurring and/or simple composite
>> clocks, reducing controller verbosity where it makes sense. This should
>> help reviews focus on the tricky parts.
>>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>   drivers/clk/meson/meson-clkc-utils.h | 57 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 57 insertions(+)
>>
>> diff --git a/drivers/clk/meson/meson-clkc-utils.h b/drivers/clk/meson/meson-clkc-utils.h
>> index 95d9f85f7ca22f63a16f8665d6f7a250b21bfdb8..ddadf14b4923781d8807546f35a1ba2e6a8a894a 100644
>> --- a/drivers/clk/meson/meson-clkc-utils.h
>> +++ b/drivers/clk/meson/meson-clkc-utils.h
>> @@ -48,4 +48,61 @@ struct clk_regmap _name = {                                          \
>>   #define MESON_PCLK_RO(_name, _reg, _bit, _pdata, _flags)               \
>>          __MESON_PCLK(_name, _reg, _bit, &clk_regmap_gate_ro_ops, _pdata, _flags)
>>
>> +/* Helpers for the usual sel/div/gate composite clocks */
>> +#define MESON_COMP_SEL(_prefix, _name, _reg, _shift, _mask, _pdata,    \
>> +                      _table, _dflags, _iflags)                        \
>> +struct clk_regmap _prefix##_name##_sel = {                             \
>
>
> Can we apply the same naming style to the '**PCLK' clocks? The SoC prefix in
> clock names looks inconsistent and awkward.

Replied on patch 5

>
>
>> +       .data = &(struct clk_regmap_mux_data) {                         \
>> +               .offset = (_reg),                                       \
>> +               .mask = (_mask),                                        \
>> +               .shift = (_shift),                                      \
>> +               .flags = (_dflags),                                     \
>> +               .table = (_table),                                      \
>> +       },                                                              \
>> +       .hw.init = &(struct clk_init_data){                             \
>> +               .name = #_name "_sel",                                  \
>> +               .ops = &clk_regmap_mux_ops,                             \
>> +               .parent_data = _pdata,                                  \
>> +               .num_parents = ARRAY_SIZE(_pdata),                      \
>> +               .flags = (_iflags),                                     \
>> +       },                                                              \
>> +}
>> +
>> +#define MESON_COMP_DIV(_prefix, _name, _reg, _shift, _width,           \
>> +                      _dflags, _iflags)                                \
>> +struct clk_regmap _prefix##_name##_div = {                             \
>> +       .data = &(struct clk_regmap_div_data) {                         \
>> +               .offset = (_reg),                                       \
>> +               .shift = (_shift),                                      \
>> +               .width = (_width),                                      \
>> +               .flags = (_dflags),                                     \
>> +       },                                                              \
>> +       .hw.init = &(struct clk_init_data) {                            \
>> +               .name = #_name "_div",                                  \
>> +               .ops = &clk_regmap_divider_ops,                         \
>> +               .parent_hws = (const struct clk_hw *[]) {               \
>> +                       &_prefix##_name##_sel.hw                        \
>> +               },                                                      \
>> +               .num_parents = 1,                                       \
>> +               .flags = (_iflags),                                     \
>> +       },                                                              \
>> +}
>> +
>> +#define MESON_COMP_GATE(_prefix, _name, _reg, _bit, _iflags)           \
>> +struct clk_regmap _prefix##_name = {                                   \
>> +       .data = &(struct clk_regmap_gate_data) {                        \
>> +               .offset = (_reg),                                       \
>> +               .bit_idx = (_bit),                                      \
>> +       },                                                              \
>> +       .hw.init = &(struct clk_init_data) {                            \
>> +               .name = #_name,                                         \
>> +               .ops = &clk_regmap_gate_ops,                            \
>> +               .parent_hws = (const struct clk_hw *[]) {               \
>> +                       &_prefix##_name##_div.hw                        \
>> +               },                                                      \
>> +               .num_parents = 1,                                       \
>> +               .flags = (_iflags),                                     \
>> +       },                                                              \
>> +}
>> +
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
