Return-Path: <SRS0=WrmZ=KN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DA67C433B4
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 May 2021 07:45:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D96361209
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 May 2021 07:45:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D96361209
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:In-reply-to:Subject:Cc:
	To:From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=o6x/jv54scnkVMhOoFLD4n9q6Edp2A0V2QkP7YtYwCY=; b=Ta3Bd0PWWL+REj3U+B5wHO2zT
	zeytDij/YGeQKcwaWt/iOgVC5zWlbcqUE0eKYtKyhvYyp4r7nZgg74ANSRizl0cTPwYYCmUsbOFqp
	P8l9i/pl8lYP1fR/1ZMRR3PINFhzZWmdj8daUDtZhWV+BnlcwUERCo8yq8YFSOzi+wWf+OYoU3aIP
	8iF8ZCYZoz7d5wYlNji+IAeqZ4HBAx2ix23PbB4QVzMktEO9ziQ9CSSRIHh4HJ+z8uXDbw6QqbcX8
	uO4aOXatS9FNb/Co6hHUcUzRxKGI96rY5aQFp1uYcPZz91NLhjtFhbCKWMbR1d8FMlADkM9E/P3F1
	F1VHBdFww==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liuPe-00HQZQ-PT; Tue, 18 May 2021 07:45:10 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liuPQ-00HQVo-OT
 for linux-amlogic@desiato.infradead.org; Tue, 18 May 2021 07:44:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Date:
 Message-ID:In-reply-to:Subject:Cc:To:From:References:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=HHcWoO4qJ8z0RqAAJdfXOss/jtjNrhOer7gnZ5JwlNk=; b=f1/ZpCZOMLEMASAGxeunGxlMv6
 57dGqWVRrLDWI/Ri1HZybyZtoealvvamYQ4jdXXA88YfecXXTcswkB6jylWBvEl0Ie0TbtWGagLdm
 1v++o1BXIF1Se7UUm1Lx5SsNQXZoMTfkEvxkeifkKwcY2IG+CR2lbaVUwTrZwOX1qcqlkJhIZIr5f
 eyKWWn9/s634s0j7Mn0SUrB+K6yHBJu18mIsSaj/FPaK3RQwYjwFcpe1bPK80acj/IhjMYYjahmZx
 tF3i0u2ZU19R3gwfK/WamHJwZeny7mPMjzrCUIBhl5ESV2wtpRNnhV5Ayxt/U0IHvJ910BjfRn9Gv
 2v3DK4Gg==;
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liuPN-00EQUR-I8
 for linux-amlogic@lists.infradead.org; Tue, 18 May 2021 07:44:55 +0000
Received: by mail-wm1-x32e.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso1045756wmc.1
 for <linux-amlogic@lists.infradead.org>; Tue, 18 May 2021 00:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=HHcWoO4qJ8z0RqAAJdfXOss/jtjNrhOer7gnZ5JwlNk=;
 b=cnHtN5ydl39hoEoQp12yh3wyRiuCSnUFSBcG7KUqsL0HqsM6P/fSCQvyqUYrqaDq4+
 dvn2coapU7/6HOoOjLlpLGrm3reiFq3qHgumlHMlKHupx4FIMkxrCX3+/lO1L8DF7hOb
 44NXrMYXogA17PtpMO5Z1MepdMUUvB/JCplVOi9CxRjs75JDVEg18Af9AkBlGKg+Gr30
 LC9ldVR5xcmpDjuSrnbjXmq3jevgjcnoBC3t0P9a4zK+TDOjnF78N98qSVLPqC1sDm1w
 bYswhfwojgADJ9SuflmWLtTw6Rfv+NGb+KrEX+xWAsrIMci2LNJCdjfsC3erxDEnGXNF
 YuIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=HHcWoO4qJ8z0RqAAJdfXOss/jtjNrhOer7gnZ5JwlNk=;
 b=OZ5D2ghUAxlT8h3mPxbqTJPirP8JY+LVvEYqlbqvA5ui3ly/r1HjFQy9sYAX9Ut4K6
 b18Iw/0jDetNlmG0trVCEeFemnGq1WvWTgpArqPYs9HCH8FctkYpbcj4DHepPziFi5yZ
 4m5UreWi7oejhP8aYkLZ3hlVCVi+8yBGEpKsDbXJVVvckYzuWdPLdpXBCoEEdRpjyzeJ
 CLpi7L5jimGllZwWQDXUE2poPo0e8VxFpTYpLMibk5knEB05RUdGJpqds87w3VKxmDpf
 MjHc8WTPYA4YSPzlJHLCev0KYLKhJxWihIafqtmhKD7/ZSwwrxub2yjpkjJQmp0kq6eg
 kxnw==
X-Gm-Message-State: AOAM532RqzoGXhufgFOtg22CIA+M9iJFm6WJ4I238uu3QwZSQV0GpSqN
 OAhiYicjml4j7iSo9XzH3yQa1Q==
X-Google-Smtp-Source: ABdhPJzZRuey5G4igcKlxuyw+V6B6t+IcAlmcEYLPisqKqdq6MRdavqmGNDg+CvK4/J5B8Xh6v0K3A==
X-Received: by 2002:a1c:7901:: with SMTP id l1mr3449311wme.98.1621323891914;
 Tue, 18 May 2021 00:44:51 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id m9sm20557689wrq.78.2021.05.18.00.44.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 00:44:51 -0700 (PDT)
References: <20210517203724.1006254-1-martin.blumenstingl@googlemail.com>
 <20210517203724.1006254-2-martin.blumenstingl@googlemail.com>
User-agent: mu4e 1.4.15; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 mturquette@baylibre.com, sboyd@kernel.org, narmstrong@baylibre.com,
 linux-clk@vger.kernel.org
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v1 1/3] clk: divider: Add re-usable determine_rate
 implementations
In-reply-to: <20210517203724.1006254-2-martin.blumenstingl@googlemail.com>
Message-ID: <1jtun01o5p.fsf@starbuckisacylon.baylibre.com>
Date: Tue, 18 May 2021 09:44:51 +0200
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_004453_628962_C53F76EF 
X-CRM114-Status: GOOD (  19.03  )
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


On Mon 17 May 2021 at 22:37, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> These are useful when running on 32-bit systems to increase the upper
> supported frequency limit. clk_ops.round_rate returns a signed long
> which limits the maximum rate on 32-bit systems to 2^31 (or approx.
> 2.14GHz). clk_ops.determine_rate internally uses an unsigned long so
> the maximum rate on 32-bit systems is 2^32 or approx. 4.29GHz.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  drivers/clk/clk-divider.c    | 39 +++++++++++++++++++++++++++++++++++-
>  include/linux/clk-provider.h |  6 ++++++
>  2 files changed, 44 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
> index 344997203f0e..24c94d2a3643 100644
> --- a/drivers/clk/clk-divider.c
> +++ b/drivers/clk/clk-divider.c
> @@ -377,7 +377,6 @@ long divider_ro_round_rate_parent(struct clk_hw *hw, struct clk_hw *parent,
>  }
>  EXPORT_SYMBOL_GPL(divider_ro_round_rate_parent);
>  
> -
>  static long clk_divider_round_rate(struct clk_hw *hw, unsigned long rate,
>  				unsigned long *prate)
>  {
> @@ -399,6 +398,44 @@ static long clk_divider_round_rate(struct clk_hw *hw, unsigned long rate,
>  				  divider->width, divider->flags);
>  }
>  
> +int divider_determine_rate(struct clk_hw *hw, struct clk_rate_request *req,
> +			   const struct clk_div_table *table, u8 width,
> +			   unsigned long flags)
> +{
> +	int div;
> +
> +	div = clk_divider_bestdiv(hw, req->best_parent_hw, req->rate,
> +				  &req->best_parent_rate, table, width, flags);
> +
> +	req->rate = DIV_ROUND_UP_ULL((u64)req->best_parent_rate, div);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(divider_determine_rate);
> +
> +int divider_ro_determine_rate(struct clk_hw *hw, struct clk_rate_request *req,
> +			      const struct clk_div_table *table, u8 width,
> +			      unsigned long flags, unsigned int val)
> +{
> +	int div;
> +
> +	div = _get_div(table, val, flags, width);
> +
> +	/* Even a read-only clock can propagate a rate change */
> +	if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
> +		if (!req->best_parent_hw)
> +			return -EINVAL;
> +
> +		req->best_parent_rate = clk_hw_round_rate(req->best_parent_hw,
> +							  req->rate * div);
> +	}
> +
> +	req->rate = DIV_ROUND_UP_ULL((u64)req->best_parent_rate, div);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(divider_ro_determine_rate);

For a final version, could you factorize the code with the .round_rate()
variant ? It would remove a bit of duplication. 

Maybe determine_rate() can also replace round_rate() in the generic
divider ops ?

> +
>  int divider_get_val(unsigned long rate, unsigned long parent_rate,
>  		    const struct clk_div_table *table, u8 width,
>  		    unsigned long flags)
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index 162a2e5546a3..d83b829305c0 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -629,6 +629,12 @@ long divider_ro_round_rate_parent(struct clk_hw *hw, struct clk_hw *parent,
>  				  unsigned long rate, unsigned long *prate,
>  				  const struct clk_div_table *table, u8 width,
>  				  unsigned long flags, unsigned int val);
> +int divider_determine_rate(struct clk_hw *hw, struct clk_rate_request *req,
> +			   const struct clk_div_table *table, u8 width,
> +			   unsigned long flags);
> +int divider_ro_determine_rate(struct clk_hw *hw, struct clk_rate_request *req,
> +			      const struct clk_div_table *table, u8 width,
> +			      unsigned long flags, unsigned int val);
>  int divider_get_val(unsigned long rate, unsigned long parent_rate,
>  		const struct clk_div_table *table, u8 width,
>  		unsigned long flags);


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
