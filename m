Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD00C3600B
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Mar 2025 10:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tnGyznG2xl78JxWbDQZIaMSEQ0WGH9HMs/FHUUawrww=; b=kb4zZJwW9tn0uC
	Pxmplt/mAte9YRqsg4IXrmfxKtf4t/hD1SrEsoZliY4t0HiTff4j3yl+anpPekc3Tlw5VyHiQ8Y4X
	nzH1xytqg3b4+uCqew2o7VpJuYh24JTDnkR7O9gwgRqx+MGcecJ3siwL2yCvcaKHCiuyt8oIp4juC
	3wR8M2BIse0A1QyF2ThnuEA2ULATG4f7+CFZkPnLR55C+6KWbsKpKNq/MJOJY+6MSmo2r4LipwkVk
	loJWX6KZDhgjXmoDOPw/JW6/O50GhT+wwmMZca9OO0QqV2eR3m9NG8wxbwsZMKqXtUxjML8/ZY73G
	ZcJNwmAU1FUx3K9cM//w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txk9X-0000000Af46-3hUz;
	Thu, 27 Mar 2025 10:07:59 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txk9T-0000000Af2L-1Utq
	for linux-amlogic@lists.infradead.org;
	Thu, 27 Mar 2025 10:07:57 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43690d4605dso5385525e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 27 Mar 2025 03:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743070073; x=1743674873; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2DA/Y2SrhYvb8JIGN8I8VFPVZFKVt4XN6zoT9arPV9I=;
        b=tV/F8UAVy2/eEEk2/sFZoYt0XQ8HMqDSDuyBgBIdVXvRM/S/7MlAQwEznrQR0OKpgy
         NEeP+VmWKxl/Es2CE/jij9Z6mm9Q38lftpQwPqWKQ5IePQuDD2wBqA6/Tlxb+plSbeOM
         OvwcR86+6Ug2DVWgdM9+TB4Ugz8X0VjHm7P+mvnNTMvXHZhBH3WLdwX+FoUxyJuNjuIS
         WebSCwWBb6Gc9qAOLaW0Lkn5h9jyKsypOgDX5zpuiOMq1Hy23vKEtPa1UrR+4vlS5QiB
         M+d1vqGAi2ZivyAcZC0BfBA6qoc5RQLANWsmEeA7g1vpwDC9olRlluTxVEvV2xkEgMw1
         C6Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743070073; x=1743674873;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2DA/Y2SrhYvb8JIGN8I8VFPVZFKVt4XN6zoT9arPV9I=;
        b=TiMxJ68v3dIvkU4HA+JIpMNXzesl8OvD1GEjrAohdm7k5ReHU6LayMoo/AjpTXBSEs
         iwY3vJdT+H0BiaY3evjcJWgmHTuJuXQtgHcFdVjLqM49O5l7ZK8bOMCTVPvTniTI5vUx
         BvDmJvd9ApRJBaIzV4pEpY3JF/Ahsc78ysajU9NqW6BeUJ97emD82oEmn0xGUHFPvYgO
         ogZZ4YFQGt0H3IL9TVOnT5KAATtV0xTXn05tIhcmrUf/O4oVHfLXncpoR0l4e8usqCem
         /BvhqhnGg/3LloHSfmqjGrTtscwKBBOPAb8IztRG7irx+O3YFsaWAGP1IXWnetOJ8IqE
         W81A==
X-Forwarded-Encrypted: i=1; AJvYcCU6kiB9+O9jUwTFs5EQ8wooIe9O/SPhgDgFBx8yCMzEvmG4EmGr0gCwfqHJVhVWYKnOs/USDp4b97lj1Edu@lists.infradead.org
X-Gm-Message-State: AOJu0YzM3T9KW3UZI4/78EfrsqAjNLBVYEqeDnLimY2Xk8ehJeaCFD1Z
	mPS6AavHZxJmUROS8I9uIAvrrD/KdW43P7HutDW/RqzB2Hy1q91Twzlb/xhq28I=
X-Gm-Gg: ASbGncvYaAyWP2X3Mb561yyUlxnk8zooIlxmDq+azayCI0mnpTQzUxbI5m4bQ8Lbvrg
	XqTh27UuITdJe34DqPWTzYvXTlTEhNCQ2kOESQ9C5rchjo8zjypMVlug7RCFxBZIPh037ft1gW4
	SJFgNpeyXtzjxhytJT/mFsrs0Ou999MDz3accaPhi3oiCv5InTUPuN2f/vqYXeBsgLJimCeYPKj
	rysl6lTKpggnIsfg6fk8wz+UVG5AuGbG1rcfqeKCMcPdHbLQXb2JPYOSQKtKEAUcLFFnIxHTw76
	3ayw2ZQhVM6gAjjQe1Si78T72M+vX5qytuAMmuzqjH7HIEhknsd0t/M=
X-Google-Smtp-Source: AGHT+IFSA/Q3nPbkXJU+wAh3bQb1BmYag2bXoUf1GCR7HVRK1VC002s/eBPHjEc50vV5ysPbU7o5kA==
X-Received: by 2002:a05:600c:198b:b0:43d:47e:3205 with SMTP id 5b1f17b1804b1-43d850a78d6mr28318015e9.11.1743070073134;
        Thu, 27 Mar 2025 03:07:53 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:e348:e265:be1a:2d30])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d830f5f56sm32976245e9.26.2025.03.27.03.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 03:07:52 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Michael Turquette
 <mturquette@baylibre.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/4] clk: add a clk_hw helpers to get the clock
 device or device_node
In-Reply-To: <4db0bf5937c6c2a480b89b11e841782c@kernel.org> (Stephen Boyd's
	message of "Tue, 25 Mar 2025 14:57:01 -0700")
References: <20250120-amlogic-clk-drop-clk-regmap-tables-v3-0-126244146947@baylibre.com>
	<20250120-amlogic-clk-drop-clk-regmap-tables-v3-1-126244146947@baylibre.com>
	<508a5ee6c6b365e8d9cdefd5a9eec769.sboyd@kernel.org>
	<1jv7s21d8y.fsf@starbuckisacylon.baylibre.com>
	<4db0bf5937c6c2a480b89b11e841782c@kernel.org>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Thu, 27 Mar 2025 11:07:51 +0100
Message-ID: <1jpli223d4.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_030755_591925_71B7A631 
X-CRM114-Status: GOOD (  34.89  )
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

On Tue 25 Mar 2025 at 14:57, Stephen Boyd <sboyd@kernel.org> wrote:

> Quoting Jerome Brunet (2025-03-21 10:53:49)
>> On Wed 26 Feb 2025 at 17:01, Stephen Boyd <sboyd@kernel.org> wrote:
>> 
>> 
>> >> +static void clk_hw_get_of_node_test(struct kunit *test)
>> >> +{
>> >> +       struct device_node *np;
>> >> +       struct clk_hw *hw;
>> >> +
>> >> +       hw = kunit_kzalloc(test, sizeof(*hw), GFP_KERNEL);
>> >> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, hw);
>> >> +
>> >> +       np = of_find_compatible_node(NULL, NULL, "test,clk-dummy-device");
>> >> +       hw->init = CLK_HW_INIT_NO_PARENT("test_get_of_node",
>> >> +                                        &clk_dummy_rate_ops, 0);
>> >> +       of_node_put_kunit(test, np);
>> >> +
>> >> +       KUNIT_ASSERT_EQ(test, 0, of_clk_hw_register_kunit(test, np, hw));
>> >
>> > The stuff before the expectation should likely go to the init function.
>> > Or it can use the genparams stuff so we can set some struct members to
>> > indicate if the pointer should be NULL or not and then twist through the
>> > code a couple times.
>> >
>> 
>> I'm trying to address all your comments but I'm starting to wonder if
>> this isn't going a bit too far ? The functions tested are one line
>> returns. Is it really worth all this ?
>> 
>> I do understand the idea for things that actually do something, such as
>> reparenting, setting rates or what not ... But this ? It feels like a
>> lot of test code for very little added value, don't you think ?
>> 
>
> Just so I understand, you're saying that this is always going to be a
> simple "getter" API that doesn't do much else? We're not _only_ testing
> the getter API, we're also testing the registration path that actually
> sets the device or of_node pointers for a clk. I'm not really thinking
> about the one line return functions here.

Oh, that was not clear to me. I assumed the registration path was
already tested to an appropriate level, so I did not consider this.
Makes sense.

>
> Writing tests is definitely a balancing act.

That's where my question came from actually. We are aligned on this :)

> I'd say we want to test the
> behavior of the API in relation to how a clk is registered and writing
> tests to show the intended usage is helpful to understand if we've
> thought of corner cases like the clk was registered with a device
> pointer that also has an of_node associated with it. (Did we remember to
> stash that of_node pointer too?) We have a bunch of clk registration
> APIs, and we want to make sure this getter API works with all of them.
> Note that we don't care about the clk flags or parent relation chains
> here, just that the device or of_node passed in to registration comes
> out the other side with the getter API.
>
> A little code duplication is OK, as long as the test is easy to
> understand. Maybe genparams stuff is going too far, I don't know, but at
> the least we want to make sure the clk registration APIs behave as
> expected when the getter API is used to get the device or of_node
> later.

Now that the goal is more clear (to me), I'll try to find a good balance.
I'll also split the helper from the tests, so I can progress on the driver
front while we refine the tests, if that's OK with you ? It is not overly
critical for both to land at the same time, is it ?

>
> I've found this google chapter[1] useful for unit testing best
> practices. I recommend reading it if you haven't already.
>
> [1] https://abseil.io/resources/swe-book/html/ch12.html

I will, thanks

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
