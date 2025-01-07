Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1638EE77197
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jan 2025 14:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gzTUQnYx4As8m/YWeDEkULz+vVC46RVQvAfzqdl43gM=; b=BukikIbLMqmgOJ
	6cl8I3ugaCOGAGZx0i0/9LNOwNY+LKhe+DXogy/Sxh6ecbKAS/pUxHV1k626knUmBtFAZhkXpbk27
	kYopKM8S7Q2D/1PBL7yOCj5NXGQs061JUykr7mmCOEnKlJ+BTU/3qkH7ajhGHFCNjuYEp77k1fUSq
	RPM+/YU8FOux3HiBz6C5yxI6hY/SsivWgnk5HAfgqYPRYssWDqYuR/WCuRLi6skg9OlHLD4mTi9TP
	lpHKC2VKMbOPGvj4ogxipzdq327zPL7VUzB3tlFq6O5VfuFl9U8ydcYq/UngMnZK6x1wglROg3wPh
	XPp2B8gcAabIqov7NygA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVAwn-00000005JN8-1UdY;
	Tue, 07 Jan 2025 14:52:45 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVAqy-00000005HiR-2HBB
	for linux-amlogic@lists.infradead.org;
	Tue, 07 Jan 2025 14:46:46 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-385d7f19f20so6917609f8f.1
        for <linux-amlogic@lists.infradead.org>; Tue, 07 Jan 2025 06:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736261202; x=1736866002; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P8ozCYiYiGuUqL3zEljw8rKehpkF96Epq59O7WR0Gnw=;
        b=bkH2kcarreyURBUkq6Ew+/xHE6VLcvYbhBa9ExWWq/81OGHtZVGQtSVxtw4kd12O84
         5psVk/og8jqn+wycJdWoGGxTAhkm0lbWshCwjE6a3kSckuT2HpoGrhvnnQyR4cCbiGXw
         yL3aLiJ1fCmey/rVN8OIYfQE7qIBUFFJ2JM6G1ZF5ilTofJm7cjbboUdswR1GuRFNtjv
         7CyaY7YXcalxi9b9E6LXEVdpiksORWD3PqWPUAVWf8o1JUsyfAaoA9nq5wAQXYV1YmlK
         4hXx8CLiwrvIYAWHRybeV3HYp8jpkzywrsR2yqb/zSRd5ktp2PKvX4hsgdAlc/FvDtDt
         auiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736261202; x=1736866002;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P8ozCYiYiGuUqL3zEljw8rKehpkF96Epq59O7WR0Gnw=;
        b=OMSsEfOd0DAda3LA+0SVFf64fnpLHkCkQcmKPoc+IyFStIqeBoB820vhxllZEIN4fV
         JJTdefZyIJxCuSSQa/kQHuL9JT1V8B5ebSKxgMVHWOC+SKLtjiilvVNT0W317PVkNpvv
         51jbPidCzB8+JI0cwuv9h0P5nZ8ammoXmMKCTqgxAc4ASgD2o+GqlR5QO48YnpdtwUIp
         jKGqXk1SYy5eGw7nho0MH5ZBOn/lh5HPueeC4IuPj4fITSgkX+Q2KQHEOHNASzIOx6a8
         4UD9Dt56vVkc14Fccrm6qdt5qqROL6AVBBcSRJp8AtQFUKFn5HrkFEOgMqZgpLyD79rQ
         Xs0A==
X-Forwarded-Encrypted: i=1; AJvYcCXX/i0BktBNwYGJyJUINaydmmehhk85xe7cyr97IhvZ+jCp1oU9Nq3fNgGoywqmm5tYHC8k6umkypHYAEgv@lists.infradead.org
X-Gm-Message-State: AOJu0Yxw59doXRKvCPJUmJCB5WYxIZ2gf20TATZtFHuEWfGeUdHcgYit
	yUfDoBd6n4hKmQBupHC5F7X1f6WkKeXjtWRkti3c6y/atGDBsc4qGf9CTTACCiU=
X-Gm-Gg: ASbGncsRw3mJeiijh1xGNsL7vFi/ij9gntbwCjQty2aAZJs3paWd4TasnrHDRLqLGv3
	9fdI1Xk7k9HKue73ysoUaRO83MRLVDnUKH1LIffucMONq9w9NGxIPbJ3IsFHbHbILpKVaqMMlsK
	wUzT51yzjHEOZg++IVNb+A9mkfQ+ikVyy1QCcb1C4DdWUhoVjVOc4H9xOI7Jl4sSqx8Sh9yeECN
	tIxH1jrXZNYYWpE6jb0o0kMjF6cQQQR7uxOOfTdyLthGkmiqX7ybWj9
X-Google-Smtp-Source: AGHT+IHYnYuf79+TuNYGxdmun8sEw8I8CqkwmQhKmeo/6Hm3L1OAdm2lbtny8ghlT05plmgQdN9nhQ==
X-Received: by 2002:a05:6000:704:b0:385:fd24:3303 with SMTP id ffacd0b85a97d-38a221687cbmr52724901f8f.0.1736261202199;
        Tue, 07 Jan 2025 06:46:42 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:dcb0:c50a:35f6:d748])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8b874asm50554580f8f.109.2025.01.07.06.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 06:46:41 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Michael Turquette
 <mturquette@baylibre.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] clk: amlogic: drop clk_regmap tables
In-Reply-To: <ed20c67e7d1a91d7fd8b921f156f56fb.sboyd@kernel.org> (Stephen
	Boyd's message of "Mon, 06 Jan 2025 13:09:06 -0800")
References: <20241220-amlogic-clk-drop-clk-regmap-tables-v1-0-96dd657cbfbd@baylibre.com>
	<20241220-amlogic-clk-drop-clk-regmap-tables-v1-2-96dd657cbfbd@baylibre.com>
	<9f1d69ebe1ddce5dfc170e986c9213f2.sboyd@kernel.org>
	<1ja5cp8f87.fsf@starbuckisacylon.baylibre.com>
	<88fe909ab182d1f17f6ef18161c7f064.sboyd@kernel.org>
	<1jfrlwb69r.fsf@starbuckisacylon.baylibre.com>
	<ed20c67e7d1a91d7fd8b921f156f56fb.sboyd@kernel.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 07 Jan 2025 15:46:41 +0100
Message-ID: <1jmsg2adgu.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_064644_585862_253EF6D2 
X-CRM114-Status: GOOD (  42.06  )
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

On Mon 06 Jan 2025 at 13:09, Stephen Boyd <sboyd@kernel.org> wrote:

>> 
>> I admit early clocks is a low priority for me since I only have one
>> controller like this and I do not expect more.
>> 
>> If cleaning up this particular case is important, then I could add
>> another level of init:
>> * A callback passed along the init data of the clock to get the regmap.
>>   That callback would be called by the .init() ops, if set.
>>   That can encode any quirks without polluting the ops.
>> * It will grow the init data so the change won't save memory anymore.
>>   This was more a bonus so I don't really mind. Maintainability is more
>>   important.
>
> The struct clk_init_data _can_ be thrown away or reused, but it isn't
> always done that way.

Yeah, I was actually thinking about using struct clk_regmap for a
start. It is much simpler

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/meson/clk-regmap.h#n23

>
>> * If the callback is not set, then it goes through the default, as
>>   proposed here. This would avoid patching all the clk_regmap clock of
>>   every controller.
>> 
>> 
>> > Furthermore, the name of the regmap is
>> > also usually device/clk controller specific.
>> 
>> The name registered in regmap_config itself is device specific, not
>> controller specific, since it can come from something else in the
>> platform (syscon or even aux devs), that why I think an independent
>> namespace is desirable -- Same goes the generic solution Conor is
>> working on I think.
>
> Alright.
>
>> 
>> > The regmap assignment
>> > doesn't really fit with the clk_ops because it's not operating on the
>> > clk hardware like the other clk_ops all do.
>> 
>> I see what you mean and I agree. It does not operate on the hardware but
>> it does collect the resources it needs to operate the HW, and ideally
>> it should do just that - without controller quirks popping up there.
>> 
>> Anyway a callback passed in init data takes care of 'io vs syscon'
>> controller too, same as devres. I can go that route if this is what you
>> prefer. I thought devres was a more elegant solution but it is indeed
>> restricted to 'device enabled' controllers. 
>> 
>> The change will be a bit ugly in the syscon ones but I don't mind.
>> Is that fine for v2 ?

Just before discussing what seems to be a very generic solution, I'd
like to go ahead with a temporary solution to remove the clk_regmap
table in drivers/clk/meson, if you don't mind. Something simple.

As I have pointed in the cover letter, I have a significant number of
other clean-up on top of this. It's not necessarily complex but it is a
pain to rebase because of the amount of code involved ... and I have new
controller waiting. I'll circle back to the final solution afterward.

>> 
>
> Sure. I wonder if we should make it a 'const void *data' member of
> struct clk_init_data so it can be anything and then either take a flag
> day to pass that to the struct clk_ops::init() function or set the
> struct clk_hw::init member to NULL after the init function is called. If
> we're concerned about bloating clk_init_data then we could introduce
> another two registration APIs that take a data argument and then pass
> that to the init function.
>
>  int clk_hw_register_data(struct device *dev, struct clk_hw *hw, const void *data)
>  int of_clk_hw_register_data(struct device *dev, struct clk_hw *hw, const void *data)
>
> or we could wrap the init data in a container struct in the drivers and
> move the setting of struct clk_hw::init to NULL after calling the init
> function.
>
> 	struct clk_driver_init_data {
> 		void *data;
> 		int (*driver_init_function)(struct clk_hw *hw);
> 		int (*regmap_driver_init_function)(struct clk_regmap *rclk);
> 		etc...
>
> 		struct clk_init_data init;
> 	};
>
> Then the clk provider can use container_of(). If we did this we could
> even copy the contents of struct clk_hw::init into the driver specific
> wrapper that lives on the stack, repoint the struct clk_hw::init pointer
> to the stack copy, and then all the logic can live in the clk provider
> driver that registers the clk.
>
> This last option may be the best because it saves memory by not
> increasing the size of 'struct clk_init_data' and doesn't require a flag
> day to change the function signature of struct clk_ops::init(), even if
> there's only a handful of those right now. What do you think?

I think I see in which direction you want to go. The problem is that we
have been playing the 'container_of()' trick quite a lot. Embedding
something around init_data is not straight forward for me with the way
clocks are declared in drivers/clk/meson.

I'll have to separate the init_data out, which is desirable but it
brings another set of problems. One mess after the other :)

So, if it's OK, I'll resend this series with a temporary solution to
remove tables. Removing the table simplify the other clean-up I have
already line-up and avoid some unnecessary diffs. I'll circle back to
reworking the init_data afterward.

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
