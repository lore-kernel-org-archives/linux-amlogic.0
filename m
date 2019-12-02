Return-Path: <SRS0=PXou=ZY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6D84C432C0
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Dec 2019 18:59:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B86DC2084F
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Dec 2019 18:59:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H3WVGUmH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Wz/HrpXp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B86DC2084F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=NnrxBKkqL4DN5YdsHBUUOn8YixNaWuXW3xWLumqDOXE=; b=H3WVGUmHbmVs8OXjMAX2akyj1H
	kFLyQZWxvya9/MWrJqXaTfj60P2K7B3it5QsJ2kzcVhWWZWnm+Jw6pZePAxm15KX4c05BwbZ2+gQw
	2rnPJ/2uNdsFzw6CCzZT45pOymszo2m+wn5Z0y4tv4RutGxEpIhfogYtCai94Rv7EQlTBbnBZ6yuk
	agNOp8JBSz06kVN0FkhWc3BXzSe/q61jKMKQQsf7xXpBGwYpZY9iejLPFle/zgU/XeVpZwhGascVQ
	+pYUGsTEj6cO6V7c4lJV8z495ZgtAEwGRpVa4Snh9N7RsO9Ol9mj3AB2bO2neio38X5gMBHLxCK2J
	yqef7cmA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ibqv5-0001lA-2e; Mon, 02 Dec 2019 18:59:39 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ibqv1-0001k7-3n
 for linux-amlogic@lists.infradead.org; Mon, 02 Dec 2019 18:59:37 +0000
Received: by mail-wr1-x443.google.com with SMTP id c14so481104wrn.7
 for <linux-amlogic@lists.infradead.org>; Mon, 02 Dec 2019 10:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=unQTULTp6sAiG48yHS2yhT/Mb1KShE6yCF9NxnRbumc=;
 b=Wz/HrpXpI9EidUbftYCVFgDYmqn47264Tr7ylFDuLsrDIpJf0hjv3lRQOwtjP3Yww8
 Z48ehC2r8dousMCklB+fs6PWssXD4/5k/f0aNSwcqnMZuuAwar68mwFVtGg09Bu6287E
 7m3b3kDb3hFcziNommbxQcoJM2bBxBCQgiVPtPkBGRQi7Lcq8MXtkZsshKu0m2au1iN4
 RnwzxyNoGetxVUzxEpc89778wB7lvisgV1vfKWOEBP3tD7w0K9SZg3IM2MDm19qPOKn+
 o5602GFlgDoV8PCOIjm1vUSqGLrJ+fAnPykRZkLc2LQvFtUpEnr2Zl6+xqWGn/X9PqeS
 AKUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=unQTULTp6sAiG48yHS2yhT/Mb1KShE6yCF9NxnRbumc=;
 b=EFVTwQtDLyyFnTXCip6FqU7cDbnaixC3GsgAdNMmch3XxVLud9xgxL7uaH55fwoN8a
 i7yVmJXCthHUegzkPxcVO0YjY3r5WtPOzvZ5+EeYiF97TyEk+selTy+Pdc1bv8+ddHFs
 eJ17T9CDW1S82V3km99z2voajy76QNX9v8gl2cqcFpxtAQvqsJj+tF++EmxQZlH6rMwT
 WwfxSVD7pjTIP52OQ5zWEuT+qJyJy7F5Ca0RHzXV47C7e9571fxdCJC8fXaa6hX1xplK
 8H+ri/25ikOGjN007hOg2OqlxRzmjPvJ/8Y4HurmLdQUjNXXKh90zh6t4iDH93g7hlFU
 8nUA==
X-Gm-Message-State: APjAAAVn9zFYBhXxWr9VHRHul+OWHKsGoI6lhA7B7J3M+8mlshR0/nX0
 Rgy5o3REjEzZsihQWkVoLERCFg==
X-Google-Smtp-Source: APXvYqwF3V6A6/ZmoJopXwSQgsb+/y5UMG/e7168Qb4THtCwU66DB7QwmneInenq2eC7frlHkGWP2g==
X-Received: by 2002:adf:de86:: with SMTP id w6mr480167wrl.115.1575313166088;
 Mon, 02 Dec 2019 10:59:26 -0800 (PST)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id w22sm347094wmk.34.2019.12.02.10.59.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 10:59:25 -0800 (PST)
References: <20191129161658.344517-1-jbrunet@baylibre.com>
 <20191202181923.4D26D20717@mail.kernel.org>
User-agent: mu4e 1.3.3; emacs 26.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH] clk: walk orphan list on clock provider registration
In-reply-to: <20191202181923.4D26D20717@mail.kernel.org>
Date: Mon, 02 Dec 2019 19:59:22 +0100
Message-ID: <1j7e3eft9x.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191202_105935_158020_197EC18D 
X-CRM114-Status: GOOD (  17.07  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Mon 02 Dec 2019 at 19:19, Stephen Boyd <sboyd@kernel.org> wrote:

> Quoting Jerome Brunet (2019-11-29 08:16:58)
>> So far, we walked the orphan list every time a new clock was registered
>> in CCF. This was fine since the clocks were only referenced by name.
>> 
>> Now that the clock can be referenced through DT, it is not enough:
>> * Controller A register first a reference clocks from controller B
>>   through DT.
>> * Controller B register all its clocks then register the provider.
>> 
>> Each time controller B registers a new clock, the orphan list is walked
>> but it can't match since the provider is registered yet. When the
>> provider is finally registered, the orphan list is not walked unless
>> another clock is registered afterward.
>> 
>> This can lead to situation where some clocks remain orphaned even if
>> the parent is available.
>> 
>> Walking the orphan list on provider registration solves the problem.
>> 
>> Fixes: fc0c209c147f ("clk: Allow parents to be specified without string names")
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>
> Sounds right. Thanks for making the fix!
>
> I suspect there should be a reported-by tag though?

laboriously, yes

>
>>  drivers/clk/clk.c | 59 +++++++++++++++++++++++++++++------------------
>>  1 file changed, 37 insertions(+), 22 deletions(-)
>> 
>> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
>> index ef4416721777..917ba37c3b9d 100644
>> --- a/drivers/clk/clk.c
>> +++ b/drivers/clk/clk.c
>> @@ -3249,6 +3249,34 @@ static inline void clk_debug_unregister(struct clk_core *core)
>>  }
>>  #endif
>>  
>> +static void __clk_core_reparent_orphan(void)
>
> Maybe drop the double underscore. clk_core prefix already means "private
> to this file".

I've done it this way just to keep coherent with __clk_core_init(),
which the code was extracted from

In the end, I don't mind so I'll drop it in the v2

>
>> +{
>> +       struct clk_core *orphan;
>> +       struct hlist_node *tmp2;
>> +
>> +       /*
>> +        * walk the list of orphan clocks and reparent any that newly finds a
>> +        * parent.
>> +        */
>> +       hlist_for_each_entry_safe(orphan, tmp2, &clk_orphan_list, child_node) {
>> +               struct clk_core *parent = __clk_init_parent(orphan);
>> +
>> +               /*
>> +                * We need to use __clk_set_parent_before() and _after() to
>> +                * to properly migrate any prepare/enable count of the orphan
>> +                * clock. This is important for CLK_IS_CRITICAL clocks, which
>> +                * are enabled during init but might not have a parent yet.
>> +                */
>> +               if (parent) {
>> +                       /* update the clk tree topology */
>> +                       __clk_set_parent_before(orphan, parent);
>> +                       __clk_set_parent_after(orphan, parent, NULL);
>> +                       __clk_recalc_accuracies(orphan);
>> +                       __clk_recalc_rates(orphan, 0);
>> +               }
>> +       }
>> +}
>> +
>>  /**
>>   * __clk_core_init - initialize the data structures in a struct clk_core
>>   * @core:      clk_core being initialized
>> @@ -3259,8 +3287,6 @@ static inline void clk_debug_unregister(struct clk_core *core)
>>  static int __clk_core_init(struct clk_core *core)
>>  {
>>         int ret;
>> -       struct clk_core *orphan;
>> -       struct hlist_node *tmp2;
>>         unsigned long rate;
>>  
>>         if (!core)
>> @@ -3416,27 +3442,8 @@ static int __clk_core_init(struct clk_core *core)
>>                 clk_enable_unlock(flags);
>>         }
>>  
>> -       /*
>> -        * walk the list of orphan clocks and reparent any that newly finds a
>> -        * parent.
>> -        */
>> -       hlist_for_each_entry_safe(orphan, tmp2, &clk_orphan_list, child_node) {
>> -               struct clk_core *parent = __clk_init_parent(orphan);
>> +       __clk_core_reparent_orphan();
>>  
>> -               /*
>> -                * We need to use __clk_set_parent_before() and _after() to
>> -                * to properly migrate any prepare/enable count of the orphan
>> -                * clock. This is important for CLK_IS_CRITICAL clocks, which
>> -                * are enabled during init but might not have a parent yet.
>> -                */
>> -               if (parent) {
>> -                       /* update the clk tree topology */
>> -                       __clk_set_parent_before(orphan, parent);
>> -                       __clk_set_parent_after(orphan, parent, NULL);
>> -                       __clk_recalc_accuracies(orphan);
>> -                       __clk_recalc_rates(orphan, 0);
>> -               }
>> -       }
>>  
>>         kref_init(&core->ref);
>>  out:
>> @@ -4288,6 +4295,10 @@ int of_clk_add_provider(struct device_node *np,
>>         mutex_unlock(&of_clk_mutex);
>>         pr_debug("Added clock from %pOF\n", np);
>>  
>> +       clk_prepare_lock();
>> +       __clk_core_reparent_orphan();
>> +       clk_prepare_unlock();
>> +
>
> Maybe make a locked version of this function and an unlocked version?
>
>>         ret = of_clk_set_defaults(np, true);
>>         if (ret < 0)
>>                 of_clk_del_provider(np);
>> @@ -4323,6 +4334,10 @@ int of_clk_add_hw_provider(struct device_node *np,
>>         mutex_unlock(&of_clk_mutex);
>>         pr_debug("Added clk_hw provider from %pOF\n", np);
>>  
>> +       clk_prepare_lock();
>> +       __clk_core_reparent_orphan();
>> +       clk_prepare_unlock();
>> +
>
> So we don't duplicate this twice.
>

Sure.

>>         ret = of_clk_set_defaults(np, true);
>>         if (ret < 0)


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
