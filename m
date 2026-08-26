Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08809C5DF97
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Aug 2026 09:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WR+aXN1DSkvr4fLAewqPeq/2JXdKoK6+srqPqA6qFhs=; b=eC/QYR6Q/PGX+H
	tbKpfnGwrDOwSpBckfB1/AW7S8uYYMcjXvTv9fIVjomRq2T6ydyhTl+vfXOhh5ROeJFIeC6588ryM
	dEi5V7UtZyyBql87Wn5TMGN/A2lOrf2C0FDKNm7LjnUTosbesKi2DxIsH3adCWAZbZoqTqhI/RPGH
	dbBwhKkUh7b2XXseMlCi+Pcikih1pW9850d0gjrl7lW/7B9bSBCV+XXcGQdT4ciKQ+TzsmTw+aFxt
	tMOp5nmiQ1DNN9dBl862+O68VPxq/olVHw82v87qfaIOBS6dTD5BeCIicQy0/fjRX+PoN/K2q1BX/
	zSnd7+ZQFjAMDqaXqJ/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzAMA-00000002F1y-06h5;
	Wed, 26 Aug 2026 09:55:42 +0000
Received: from mail-wm1-f41.google.com ([209.85.128.41])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzAM6-00000002F1B-2htv
	for linux-amlogic@lists.infradead.org;
	Wed, 26 Aug 2026 09:55:40 +0000
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4980dc26022so5612275e9.1
        for <linux-amlogic@lists.infradead.org>; Wed, 26 Aug 2026 02:55:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787738136; x=1788342936;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/QbukygbVrN8gnIcgkSWM0X9DmiBJ+CcZt8S0h2LL9s=;
        b=MzIcQU8nF1hhrt8EPhkPM/Vm9BXdtQEFP7yX88UeGpkY4fHAIpxizVFpI3RbjLaoXI
         qyaxOK1ZcD5FRrJjUKhlAhVGQAGwoPvCuhNHUa1s4zE4H4YHHOd1gS1biAzCrkfuSQ8+
         b7Jg9n+F+ew+iWCLf6jqsabGUZv9ZZNHEnAS0ZivW1SxyqglcUnxX1NmWgNvUVgqTus1
         A/lEi6uZXrwyLV6fPDEq+tBJsPhWfYyZjBrRzHxdICbICpGgdB9DBv86jCQQL5gFg6J5
         rOOGivzezHjJRwFRyMe9YSaeEBawobqNxW9vfSROr6MW3akwHKoqPKIm9DVlmg3UwzJD
         zpxw==
X-Forwarded-Encrypted: i=1; AHgh+Roj9zZobxbkYtyEgSBH6ZHLU9KnHReo0dSsJgg1Sqf0l85NmMDdJKKZ6dw/CSw8Ql3vTcfh+f8MmA9XmSqq@lists.infradead.org
X-Gm-Message-State: AFuF++mtpcum0bTdCgrwcM/3sD4UgUOs57gGLSpddZfDyz5/MGuL6PlR
	xXq/B41n+8V40QH5YXVpSnZxvhW7YMX3iAL2B9ErjMnoi4I2tKS0gMMm
X-Gm-Gg: AR+sD12OI8YeqnHdipzJimlE9esKvwXGYaar/pvcmsF57DRNqKePnLci+ozXmRFOwbh
	/WlWIvX5Rb8wRjdN6zCzRjr1wBNr+W9p4Gn37o0OqUke48CQpk1YMW494FTgfFUc2aqMdirmoQd
	/Gu2/3RLVZxBwRu8RN0Z9LJXu2s5RovzrsfObUXHVkJo+K9egWyg4jGBNO1sDipQwPwdUfkGII+
	Ub+Orf2KWnCbjDXnjPQ49XyXGV2GrWIviZGGipjo2o02+teuhbyJYINLd9J7ilD/6GmuMinxPph
	eIuDgO4gAUVIgPi+EnAL5BH9M1KWN91t4ZTOyAMZHngHzqsb80Ek6wQVikbF2U+NstgAhoZj+nJ
	z4CHJr+tk2l2Man74t74pD6+9HlaEFYNVt4rjolPdHif4xCPoa5r0xuM5ZLnIW0Qd1wrkvPPM1h
	B5FnVG1p8708t2AegIbwUqtxwrgwCKm14srORf2vHvKbV2ayy/UU5jiNVF5KEeZtx3X2q8WH+/C
	7VE7XC0aCHLXeT+gPQTOg==
X-Received: by 2002:a05:600c:474a:b0:499:8aff:59b6 with SMTP id 5b1f17b1804b1-499dc82ad0fmr40013725e9.14.1787738135905;
        Wed, 26 Aug 2026 02:55:35 -0700 (PDT)
Received: from [192.168.1.135] ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dcad25ffsm20206255e9.9.2026.08.26.02.55.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 02:55:35 -0700 (PDT)
Message-ID: <57d796bd-7a3c-46b9-bd65-d6860adbd355@linux.com>
Date: Wed, 26 Aug 2026 10:55:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] clk: meson: t7: Intermittent boot instability and memory
 corruption on VIM4
To: Brian Masney <bmasney@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jian Hu <jian.hu@amlogic.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <3930906f-783b-4d72-9260-ba25cc8081cb@linux.com>
 <aoxjX3HabY0brgXk@redhat.com>
Content-Language: en-US
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <aoxjX3HabY0brgXk@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_025538_771856_C78A3123 
X-CRM114-Status: GOOD (  16.64  )
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

On 24/08/2026 16:29, Brian Masney wrote:
> Hi Lucas,
> 
> On Sun, Aug 23, 2026 at 04:40:42PM +0100, Lucas Tanure wrote:
>> While testing mainline Linux on the Khadas VIM4 (Amlogic A311D2 / T7), I am
>> hitting intermittent system instability, storage loss, and memory corruption
>> during boot, unless I append clk_ignore_unused to the kernel command line.
>>
>> Because the failure is intermittent, I am running 100-reboot test campaigns
>> to bisect the remaining clocks and isolate which clocks are critical and
>> cannot be safely disabled.
>>
>> As testing takes significant time over serial console, I wanted to check if
>> Amlogic or the maintainers could shed light on this:
>>
>> Are there specific T7 clocks or hardware domains that must remain
>> critical/protected even without an explicit in-kernel consumer?
>>
>> Current clocks being disabled that don't kill the board on a test run:
>>
>> [    0.380313] clk: Disabling unused clocks
>> [    0.380413] clk: Disabled unused clock: rtc_dualdiv
>> [    0.380718] clk: Disabled unused clock: rtc_duandiv_in
>> [    0.381377] clk: Unprepared unused clock: a73_div16
>> [    0.381972] clk: Unprepared unused clock: cpu_div16
>> [    0.382605] clk: Unprepared unused clock: f50m
>> [    0.383174] clk: Unprepared unused clock: fixed_pll_dco
>> [    0.383786] clk: Unprepared unused clock: hdmi_pll_osc
>> [    0.384416] clk: Unprepared unused clock: sys1_pll_osc
>> [    0.385056] clk: Unprepared unused clock: earc_osc
>> [    0.385652] clk: Unprepared unused clock: pcie_refclk_osc
>> [    0.386323] clk: Unprepared unused clock: eth_pll_osc
>> [    0.386961] clk: Unprepared unused clock: pcie_osc
>> [    0.387548] clk: Unprepared unused clock: mclk_pll_osc
>> [    0.388187] clk: Unprepared unused clock: usb_pll1_osc
>> [    0.388826] clk: Unprepared unused clock: usb_pll0_osc
>> [    0.389465] clk: Unprepared unused clock: tcon_pll_osc
>> [    0.390105] clk: Unprepared unused clock: top_pll_osc
>> [    0.390738] clk: Unprepared unused clock: aud_pll_osc
>> [    0.391361] clk: Unprepared unused clock: ddr_pll_osc
>>
>> I am not forcing any clock to be disabled; I am forcing all clocks to stay
>> on and letting them be disabled if unused one by one.
>>
>> Any guidance or hints on required platform clocks would be greatly
>> appreciated.
> 
> I have an outstanding series that disables unused clocks via the
> sync_state callback:
> 
> https://lore.kernel.org/linux-clk/20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com/
> 
> Be sure to not have clk_ignore_unused in your kernel command line.
> 
> I suggest comparing the list of which clocks are disabled with that
> series against your list of clocks above.
Thanks for the input, it did not solve the issue. I am going to produce 
the list with a diff in disabled clocks with and without our change, but
it did not solve the issue.
> 
> Brian
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
