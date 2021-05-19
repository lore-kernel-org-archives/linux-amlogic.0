Return-Path: <SRS0=e9JL=KO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 201E1C433B4
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 May 2021 12:32:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 593466108B
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 May 2021 12:31:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 593466108B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:In-reply-to:Subject:Cc:
	To:From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eQF+YEX+8MTROgGMQvk+I4/4zxVld1B4JqqSLDaKsy4=; b=qv6GTRgZK5/E0DhYw597nzqaC
	ISSMZJ+cKE8qVQ2HN/oaP8xSO03RlSdrfpvOf1Ojq3aByd4IBKnxlz9ZeRt5Uu1jPOsqYx/Z9KbGn
	9f0Izw/vkaxT6yYboLaprn4o+AHPfyWInVOCZHvnX1sJu0kUX5ovfEhSr983isVglb0PpmzEB4G+1
	szHdHjgYa04ufWzBWGrzqL/xG4IIWlXSbo7oipJbKwNC1r82/wy6howrYVwvCGoxoMpEx2VlpOBKU
	D4KgZWpM7gosYPluZuCJevC2D024fzcHQioixbPsBY+9L/yZm8YNTWWba958WJp3df2vQEz4SbDkR
	Yl179j//A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljLMc-003uV0-Sw; Wed, 19 May 2021 12:31:51 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljLMa-003uUZ-5P
 for linux-amlogic@desiato.infradead.org; Wed, 19 May 2021 12:31:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Date:
 Message-ID:In-reply-to:Subject:Cc:To:From:References:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=bAo7Ei/TUi10dkjUS5XYUKLdKDhp8o5GDEEhLvW8E/8=; b=q3hAjQlL9zQgbuBVcjQm5clIT5
 Ak5oipbre0TxgdI/eG8T1ucgvS4EuJ29eP9UbJL3uCRmLS2bQNMl0M3J9ZYnjfFxmTqHrvKktnkkb
 OlC+vHRcOEDkUik5NHQNrOxr4rB6hizP8HqVSnHg56ZrvrIOqG3oIwJ7DNRK/bNIuikxSxIbIAxUy
 +juqzDzqWlmrOSkkJcSxWziEszJ3bQCFxpsvkesqgsuzDl9f3hEAdngkQwaqlz12Qx6pOmBpHcQ3t
 MEuO6dz9RB6WziAQs4NV29cZP4zl/9Z0oGX4GLSJOhJLrAfkp3nTEgU0pIPZYqsvuOk9rxfGpPegj
 c4cQ3Krg==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljLMW-00FSAy-UK
 for linux-amlogic@lists.infradead.org; Wed, 19 May 2021 12:31:46 +0000
Received: by mail-wm1-x336.google.com with SMTP id
 s5-20020a7bc0c50000b0290147d0c21c51so3225698wmh.4
 for <linux-amlogic@lists.infradead.org>; Wed, 19 May 2021 05:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=bAo7Ei/TUi10dkjUS5XYUKLdKDhp8o5GDEEhLvW8E/8=;
 b=oL1E6C3sCn5SHZuQHZQ4qSR511zUkj1ReiFbYY7jMF3nHEXzAwrJBxV5BlKQfH5J4o
 RP7yi+L6XxHJn7+zxVHoPJa0rOXsTP3b/bODa1ijp9XrcLFVIs8L0JGMjxcSSswU0LeS
 jybN7+Bw8gTm3Ru3oTvtzkLVn1YlrM0zMXUv0+mNX5NrcAFh9+W+stJKmRHzv/7xAqr+
 fmTYrsF+ZlDhafMfvFJTkjDOTLrYgCGMcCqASE96TXMJbuP7/CsJPZM07Tt889kaAskz
 QUctp0dN9NOVjtNLssocI3ukWFH6O/rSqk7dKPcnuProg7E/pu0p9okkQ4i2uXvEkUqv
 qJtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=bAo7Ei/TUi10dkjUS5XYUKLdKDhp8o5GDEEhLvW8E/8=;
 b=bOyOGKS9RLtp5ZI8SL2HEMBJvkHetEUTXlE8e6CB0u25zvaRMDxqc2REmpj+txEioC
 MAh6h7v8kwKWNCeAQDhZwdB4xBocMNmCjgYiYIc4tWp7IvM3ztRHVlvKPVEGAt5iaYsw
 ibN5+jVox00J0/9+S/UYaoDjXnhgmT+BYuyIa8QZmsBQM4vkfjkxfVMaXOMWTEnZbSxN
 P+Hkm/gjbl780/RjhzfbfVd+3tiy1+7/6KtSIIgmkf/U1gnFPdxdWssmIo7pP4Cdabje
 bKbszmWbnOxmnHQTutZlZLnfbqhNjSTbszw7iOQKm2a3dKy4+2JUZxc8CdbiWSL4k8Lj
 JnVQ==
X-Gm-Message-State: AOAM533+jaLC7qGgTgXjRrBh2CO2s4kGA7rsl01cuXRlA3sPlHy4SZvt
 jXWUhHMsuvP1LBRbIAtAv5OFcQ==
X-Google-Smtp-Source: ABdhPJxuxG5efFOAKNN/YpLS+nSoJ6UYkSczlvIdgyrB9oZNqJ9617YPnFDTyRH3uyrAmV13niYQGQ==
X-Received: by 2002:a05:600c:19cb:: with SMTP id
 u11mr11538782wmq.185.1621427502264; 
 Wed, 19 May 2021 05:31:42 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id u19sm1185904wmq.7.2021.05.19.05.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 05:31:41 -0700 (PDT)
References: <20210517203724.1006254-1-martin.blumenstingl@googlemail.com>
 <20210517203724.1006254-2-martin.blumenstingl@googlemail.com>
 <1jtun01o5p.fsf@starbuckisacylon.baylibre.com>
 <CAFBinCB+5bFH0LW4rqYGCiO-X-xmer67cp5kXpyU0d-OfxiOvw@mail.gmail.com>
User-agent: mu4e 1.4.15; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, Neil Armstrong
 <narmstrong@baylibre.com>, linux-clk@vger.kernel.org,
 khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v1 1/3] clk: divider: Add re-usable determine_rate
 implementations
In-reply-to: <CAFBinCB+5bFH0LW4rqYGCiO-X-xmer67cp5kXpyU0d-OfxiOvw@mail.gmail.com>
Message-ID: <1jv97eaor6.fsf@starbuckisacylon.baylibre.com>
Date: Wed, 19 May 2021 14:31:41 +0200
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_053145_047210_5C0FFD11 
X-CRM114-Status: GOOD (  21.25  )
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


On Tue 18 May 2021 at 22:33, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> Hi Jerome,
>
> On Tue, May 18, 2021 at 9:44 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
> [...]
>> > +int divider_ro_determine_rate(struct clk_hw *hw, struct clk_rate_request *req,
>> > +                           const struct clk_div_table *table, u8 width,
>> > +                           unsigned long flags, unsigned int val)
>> > +{
>> > +     int div;
>> > +
>> > +     div = _get_div(table, val, flags, width);
>> > +
>> > +     /* Even a read-only clock can propagate a rate change */
>> > +     if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
>> > +             if (!req->best_parent_hw)
>> > +                     return -EINVAL;
>> > +
>> > +             req->best_parent_rate = clk_hw_round_rate(req->best_parent_hw,
>> > +                                                       req->rate * div);
>> > +     }
>> > +
>> > +     req->rate = DIV_ROUND_UP_ULL((u64)req->best_parent_rate, div);
>> > +
>> > +     return 0;
>> > +}
>> > +EXPORT_SYMBOL_GPL(divider_ro_determine_rate);
>>
>> For a final version, could you factorize the code with the .round_rate()
>> variant ? It would remove a bit of duplication.
> my first idea was to basically let the new _determine_rate code just
> forward all relevant parameters to _round_rate
> however, I discarded that as it turned out to be less understandable
> for me as parameters need to be mapped in both ways
>
> while writing this mail I noticed that the opposite direction
> (meaning: _round_rate forwards to _determine_rate) will probably work.
> I'll give it a try in the next days
> if you had anything else in mind then please let me know

Yep, the idea would be to use the determine_rate() part as the common
implementation. AFAICT, all you need is to build req_rate structure in
the round_rate() part.

>
>> Maybe determine_rate() can also replace round_rate() in the generic
>> divider ops ?
> sure, I'll add that as a separate patch in this series
> note to myself: testing can be done with the MMC drivers as we're
> using the generic clk_divider_ops there
>
>
> Best regards,
> Martin


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
