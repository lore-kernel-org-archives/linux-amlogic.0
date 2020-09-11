Return-Path: <SRS0=cGvQ=CU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CC7FC43461
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Sep 2020 17:10:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CC2B206BE
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Sep 2020 17:10:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Lf7frZYd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="PJHJwRXr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CC2B206BE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TybP3ubK73+3k+h+lwKR+CVLjddXTXTPpLSa0KuvQXk=; b=Lf7frZYdXQVGCxJ9OYXsAMFwL
	7v5nsl3CIjW7GekLdcb1URoxP7fBIlPs+pnNkniw/8E5DtrvYTWsY08HKPLyzNwhEuzEd9PG/EjMT
	P0ovebKtuQRbb7RRBjAFAOLYkXitTwafzO7wte++NUlOj90miF+J6eCwsWiNK/d3aG1Oi5/JIEJUv
	H69EnIx+YFjBpyyQPS3k1wZmoyZsfJVWeE8odEx2JVXsSRZ1gh/t72fzXGcZrMU0jhFCK7SPWilR2
	ydx7+wH5pi7/P24xousRLgOhkaqPuJWxAHLi0bI1MBKIkjZX9MLFCB4qVumArXaC4MjWd5BGEkQPz
	Q0EyGTnxg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGmZL-00082J-Gd; Fri, 11 Sep 2020 17:10:39 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGmZI-00081Z-DQ
 for linux-amlogic@lists.infradead.org; Fri, 11 Sep 2020 17:10:37 +0000
Received: by mail-pf1-x442.google.com with SMTP id o68so7982507pfg.2
 for <linux-amlogic@lists.infradead.org>; Fri, 11 Sep 2020 10:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=i2W71MrrzMNYcyB/z7lfhjSe/syd2lqbfSWnk+mqe6k=;
 b=PJHJwRXr9q+ni6PIu74aQcOfM/Gl7Qd/RuGgGPBdnIh4ZmUSrOh9BEI/iTWgtvVFHl
 nRj+qkLuIElk8sldSasPp/NSKofad/GikGmmlQ+rQHDNxxLPJOQ5gQw/qJaAuFKtU+xS
 i/DW3GLj2V1MfalSaa3iJNvwxCWEmQReah/J3+C+VqFxbCQeD4pucFyb3WrDldANR8HA
 8YWWkFVg+7TTaPVL9ay2wrJZUZOeou50SMQDK5t7e4VqNWozSj0d+rT0unmUK2WfMgLw
 5UAQ8WT9x8QScwXmP5aPjOQdbP8FW2IVwvPfcIJi+KRFFcszbfBtvxo9jLlhRNsH1yi9
 KZ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=i2W71MrrzMNYcyB/z7lfhjSe/syd2lqbfSWnk+mqe6k=;
 b=rdtlTPN92nE3inDWWXndnNrxTyBymYw3nfaw31EQ84tIgGY3YOMCbPejf8srXmaHJb
 HsQZlJ48dTlS+Da6mv6O0rm3ffF0Cp9ir7wdlE7QN85sUkgWsmYbmznM5+DC4auu1+2v
 J5b0mtsGp20cMvSdW9ZiRm/pQwbLKPilB16gmDFE0DjmWejgkwALG3FNXqG9spnsWTl4
 dJUfBaQHmcU7cjqJsDqAz8A/CQ/9fnQT3OKp8/x/S6LgwgUmniDcjrZMj8jdqF30lyGj
 G3tsqW/iS3xAVyi11qk+YXKtgpr7icJwgwn3PGtWlfLBRWarYjD5vNjB7EIQhnmB1VwQ
 guVA==
X-Gm-Message-State: AOAM531wygernrVCY+ynuia3ew2yoKXtLMzGWJI4vOqMLm3jGX6QmlVQ
 DzTR4yz3ehZwYNNs7HvVAYrDWQ==
X-Google-Smtp-Source: ABdhPJycx615a/xlcejhPU3i6TW6bxV5D53F0plZu7u8/oXnECZBgQgnYzPAAWChPwnxp/0WDO63qQ==
X-Received: by 2002:a63:ff06:: with SMTP id k6mr2295126pgi.321.1599844232413; 
 Fri, 11 Sep 2020 10:10:32 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id z28sm3161139pfq.81.2020.09.11.10.10.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2020 10:10:31 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 3/4] clk: meson: axg: add Video Clocks
In-Reply-To: <6132edc1-0256-8eca-d5fd-8870aed5bb60@baylibre.com>
References: <20200907093810.6585-1-narmstrong@baylibre.com>
 <20200907093810.6585-4-narmstrong@baylibre.com>
 <1jy2li9bym.fsf@starbuckisacylon.baylibre.com>
 <6132edc1-0256-8eca-d5fd-8870aed5bb60@baylibre.com>
Date: Fri, 11 Sep 2020 10:10:31 -0700
Message-ID: <7hr1r8xmrc.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_131036_557583_57C16216 
X-CRM114-Status: GOOD (  13.62  )
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
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> On 10/09/2020 12:13, Jerome Brunet wrote:

[...]

>> Why is NOCACHE ? Is there something poking behind CCF back ? if yes, why
>> is this required ?
>
> I'm surprised you ask this since the situation hasn't changed since I pushed the
> video clock for GXBB, then G12A.

Even if the situation hasn't changed, providing context is very helpful
for new reviewers or reviewers who might need a reminder of that
situation.  I for one had already forgotten the video clock context so I
had a similiar question as Jerome when I saw the NOCACHE and UNUSED
flags.

As you know, new usage of those flags is always highly scrutinized, so
providing the right context and explanation, even if it's repeating
stuff you've stated elsewhere, can help preempt any questions.  

> The switch to CCF for the VPU is still planned, but until now I was unable to allocate enough
> time for this huge rework.
>
> Since I'm the single DRM driver contributor and lacking any other reviewers, I must deal
> with new features & bugfixing before moving to CCF.

Not at all a blocker for this patch, but just curious do you have a TODO
list someplace for this driver in case others might have some time to
help you with the migration?

> The clock situation is far from perfect, and I'd also like it to be solved at some point.
>
> I'll add the same explanation I gave for GXBB in https://lkml.kernel.org/r/1541516257-16157-5-git-send-email-narmstrong@baylibre.com

Yes, that's perfect.

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
