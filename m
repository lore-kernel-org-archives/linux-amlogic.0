Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9809C36000
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Mar 2025 15:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xuCQsdzGfZSUBbqZW6IpcOtwM/c6JuUtIaetHlc+es4=; b=PwarngwFEBmQTC
	vwPUjw7a8hqp7XZKGucZEEvfdkMJf09dydjJMIL/T+1HpgIkCRRL+Z9bHFWIIBDQBHfHkY2evhGEF
	yFpGK6bdcZhhPfSegCnDwhsr5FRKjhCtXJnGQul83fhC0bmtm5Yg6jnB7nzX4fAhvLcfRGw3AQ5F5
	SwJgcF8JAXy6jaPdraAR1iFkQL/0Z83u3Syt2K66AUeLGKaTe+le9r20EO6popiKX6E3w0j4IUvld
	vB9zqBLtj0Bk+ge272+Ja3YvTj4zZvYDEAH7qz/sQybrhEfRXt5FxMLDGQBCY8A3ZrvA1da0ZhDca
	h715e3soI3Pp5hGRxo7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvebI-0000000FLhT-0920;
	Fri, 21 Mar 2025 15:48:00 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tveZa-0000000FLKT-0ccf
	for linux-amlogic@lists.infradead.org;
	Fri, 21 Mar 2025 15:46:16 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso13675475e9.0
        for <linux-amlogic@lists.infradead.org>; Fri, 21 Mar 2025 08:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1742571972; x=1743176772; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sxyu4837xaBsPKdh19s14kC1VMDWEUK2aQpdlRhN9bY=;
        b=0D08T0anpurf6B/C3svR5RL/i4U7ltLQiVDvbMBikh8sbWtKdi5YTG7KlpLveN1Wve
         qC8Wbte3bEd5Q8RWDkXg/V5Z3KWnsq9FiFO7+8nCW79zZo6dS+so4jY1IethNaUQwT5a
         PCTAf+d1nhpARKIVinGtDxqV3pE7Br4MQnOBCz8UjzvIBX3odY7TNuJtRJCSuN/hl/SL
         qOD+lITTHBuev5VSZtCaiTWTGtOpwaHi5tjbwe0a79XXdbLPfbhxM1Nf6sd17/48hzDg
         +AcoyNPQyq6RN/ATV+GZnTrLzn6AvCfyaLZfUiReGZpQ6KzMRGEIzsT/sAA6gRVUlNjt
         NVyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742571972; x=1743176772;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sxyu4837xaBsPKdh19s14kC1VMDWEUK2aQpdlRhN9bY=;
        b=vV1NcRZxCJpLQz6syh8xaBzXvsMaiM87MGzfwu/TOMcfEGchrY8vgjqJMMcRo0oA3Y
         YQzR127cgnx+RlqvL4Isqp3dDSaFzrPgWXlFEF3jhwwnP515Bzb1dVdK7QWLS6Pa8daO
         An+MXMEVoGFyYS11EntvKSBwJkvC+htsRhNDYiiepDuyAlvM0MEvSCkQxNRwx51wjue8
         lNanaGi8DBGiJkS6PNxcYCjHMCsQ7yXZgzGi3/2e05GNQDseJIVjwPRSBi6Dt69TzF+V
         ANu1fWyIuNtOF9uoEGQ/E3Ts0EsLIpfyBRjqgOLff20/LUOO/r+E+FzGVhpxzzsWbmfH
         /FXg==
X-Forwarded-Encrypted: i=1; AJvYcCVbMbZ3PqBTyZrpn2oYq0ztGSD9yYrnnD6ZZUxLXQI1vxU6A8ySQrQlV6Pufa3SOEQK7vKAOth6KXpZz17Q@lists.infradead.org
X-Gm-Message-State: AOJu0YzaP1BFJG3u+dftpC+0bK673owAwug4tdqN0W0hxj1+/jmrtKsr
	Z90rlV/kiozNXJlTlJXJtatXCNDNlfYtkcFxYnUyFatR2NWGvK3L/nWqsMSzITk=
X-Gm-Gg: ASbGnctNEVL2DBX1jhM3jd5OeSv9mzg2QCUQZ1bxac4MZskZAMulB7EOSdO00DbVauJ
	F6nqkTfcR4bKvugpbF/HWEzqFetIWK+yB3ZKZz5A9PPCRQcuWei33iMjPk4hh+rbu5dKgoQQOUe
	RB57J2XYS2LljQxpT/Fcb2Ir/+ZzJP2WVvonYDFfJYtsLzvJJkIkka5cZGoYYi7+iLDteL14WH5
	HSiTQdJ33EKoZM69xrPpXBH7IjvkMHpbjBtQSrzvZQklnKhmCe+gAwyj6fEYOir+26p/GjGpFRX
	8h9MSrOE+BiC5Nsv+Zg7geEdPWdOCtSedgKtSoFxj6S0
X-Google-Smtp-Source: AGHT+IHA8cRGoAIkPVPFNmZnRzpsn7R6Bm6hI1qPItBl8eiyD+ALObZwrN5Smom3mHRzHmPrld4JMw==
X-Received: by 2002:a05:600c:1992:b0:43c:f332:703a with SMTP id 5b1f17b1804b1-43d50a553f2mr30247065e9.31.1742571971921;
        Fri, 21 Mar 2025 08:46:11 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:2102:ce42:30c0:9b40])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d4fd9e96bsm30814545e9.25.2025.03.21.08.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 08:46:11 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Michael Turquette
 <mturquette@baylibre.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] clk: amlogic: drop clk_regmap tables
In-Reply-To: <5109de7fe1a1a8467118daf80c7b7f8a.sboyd@kernel.org> (Stephen
	Boyd's message of "Thu, 27 Feb 2025 14:55:00 -0800")
References: <20241220-amlogic-clk-drop-clk-regmap-tables-v1-0-96dd657cbfbd@baylibre.com>
	<20241220-amlogic-clk-drop-clk-regmap-tables-v1-2-96dd657cbfbd@baylibre.com>
	<9f1d69ebe1ddce5dfc170e986c9213f2.sboyd@kernel.org>
	<1ja5cp8f87.fsf@starbuckisacylon.baylibre.com>
	<88fe909ab182d1f17f6ef18161c7f064.sboyd@kernel.org>
	<1jfrlwb69r.fsf@starbuckisacylon.baylibre.com>
	<ed20c67e7d1a91d7fd8b921f156f56fb.sboyd@kernel.org>
	<1jmsg2adgu.fsf@starbuckisacylon.baylibre.com>
	<697b634770d789ef8ff0e05cec9465f5.sboyd@kernel.org>
	<1j4j205ark.fsf@starbuckisacylon.baylibre.com>
	<5109de7fe1a1a8467118daf80c7b7f8a.sboyd@kernel.org>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Fri, 21 Mar 2025 16:46:10 +0100
Message-ID: <1j7c4i2xq5.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_084614_184346_84CFD14C 
X-CRM114-Status: GOOD (  33.56  )
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

On Thu 27 Feb 2025 at 14:55, Stephen Boyd <sboyd@kernel.org> wrote:

> Quoting Jerome Brunet (2025-01-15 07:58:55)
>> 
>> I'd like to register controller init hook to apply on all the clocks of
>> a particular type. The reason to do that is to drop the big clk_regmap
>> table that are a pain to maintain (in addition to be ugly). I hoped it
>> would also save a bit of memory.
>> 
>> The solutions we've been discussing so far feels like we are moving
>> around the problem, recreating the memory saved somewhere else,
>> perhaps in a more complicated way. I'd like to find something more
>> convinient to use, which does not scale the memory used with the number
>> of clock registered. The point is not a different hook for clk_hw after
>> all.
>
> What are the goals?
>
>  1. Drop clk_regmap table

That my first goal

>  2. Reduce memory

Would be nice

>  3. ??
>
>> 
>> Here is an idea, how about list of hook identified by ops and controller ?
>> 
>> The node would look like this
>> 
>> struct clk_type_init_node {
>>        struct list_head         entry;
>>        
>>        struct device_node       *of_node;
>>        struct device            *dev;
>>        const struct clk_ops     *ops;
>> 
>>        int (*init_hook)(struct clk_hw *hw);
>> };
>> 
>> The change would be minimal in core CCF, just searching the list for a
>> match in clk_register. On most platform the list would be empty so there
>> is virtually no penalty when it is not used.
>> 
>> From the controller, the usage would be very simple, just calling a
>> function before registering the clocks, something like:
>> 
>> int clk_type_register_dev_hook(struct device *dev,
>>                                const struct clk_ops *ops,
>>                                int (*init_hook)(struct clk_hw *hw))
>> 
>> or the 'of_node' equivalent.
>
> Why can't we register the clk at the same time? I don't understand why
> we want to search a list to match something up to what could be another
> argument to the clk registration API. Isn't this the same as 
>
>  clk_hw_register_data(struct device *dev, struct clk_hw *hw, const struct clk_register_data *data)
>
> Why is that hard to maintain? Is that because the clk driver is
> registering various different types of clks and it wants to do different
> stuff depending on the type of clk?

Exactly

> Why wouldn't wrapping the clk_ops
> in another struct and then using container_of to find the custom clk_ops
> not work there?

For this particular problem, it still does not scale well. There is more
than 20 different ops (and counting) for that clock type. Those would
need to be duplicated for each different way to get the regmap. That's
really not ideal

Side note: That's very interesting idea for another topic I'd like
address someday - not having all clock as global, but the just static data.
That would be a nice way to attach an allocator.

>
>> 
>> I admit this is heavily inspired by how devres works :) but it does solve
>> the early clock controller problem and does not scale with the number of
>> clock registered.
>> 
>
> I don't know if devres is a good model. It's about tracking allocations
> and things to undo later, not really to track things to do when called
> initially.

My point was more the decoupling it allows.
Maybe it is me being too picky, but what I'm trying to do is related to the
clock type, so it bothers me when it scales with the number of instances
instead of the type.

More generally, something devres-like allows to register an attribute
and link it to a group. Then the group members come and just pick what
they need. Whatever manages the attribute does not have to track
them. That is pretty much aligned with what I'm trying to do.

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
