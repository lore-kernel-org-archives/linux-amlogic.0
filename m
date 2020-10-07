Return-Path: <SRS0=JUPl=DO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93ABCC4363C
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Oct 2020 11:33:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D8B420782
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Oct 2020 11:32:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RCxkLjC6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="risRhOIo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D8B420782
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JO8NvlisgYpnXHNCqSJvAGO0f+zlu0wqn3c7MkUdL2M=; b=RCxkLjC6DOtu6aP30+QdMC3Fu
	o+vYZoWCvQRWiLtXyQgNzspW8HHlVusUqErWco8+mc0OW84h4tSzGySLlOxog0fIylV4iCwrh/HZz
	7p8MRCJumEOJoXdvW5ZRI9raKEpvNEek8PV3Pcz7n++SVqXdp+3Y7L783PnSsIqMZwqNkvrXllw/w
	Z8C/6vwRB8IpL33v51tWw869NBW4475ZC09XXvJXmv3yARYf6QkBcC07ND7wpf5TMkbP5F8kNs7Wh
	ShErv1imbJ1kE3h1sjAIb09c180hSbAIB8HHIZLiJHjGQF+32VpbYGQxSzqaNmauPwS4HjxLwpxY3
	iLjj1V7pA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQ7gk-00040R-6B; Wed, 07 Oct 2020 11:32:54 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQ7gh-0003zf-JJ
 for linux-amlogic@lists.infradead.org; Wed, 07 Oct 2020 11:32:52 +0000
Received: by mail-ej1-x642.google.com with SMTP id h24so2422973ejg.9
 for <linux-amlogic@lists.infradead.org>; Wed, 07 Oct 2020 04:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=UUAtMhUEk/jz98adLLh/kvHWU+87rtZfg/cfL1Bdfv4=;
 b=risRhOIo118pkONLYVu23luhqGeB5jDgqxnxSf8q8nSEGVRzYNHLnpk2xI4o3/akUU
 9iJ6UYN7xRVB6xO1iGDKwIVdnFC9+YmYxobpCvE1XSqJ+cvYrf+pTLuXxhKmXlWLlprA
 TTdRdlIfq520FIItzRxnEZWOQCMPmdw3K35VxMPxnCsDuXYDb9YGLQZhanD4WxwvJdHi
 mA7xkitMJo0Y4VP220+O5aYm7egOe1ATbMWxcjquK+uIBEYsd1S/wc51/Svfj0MgD2Ha
 fsebz/VLQU6nBgdx+OaKjCQScS41zAuJ2om5xUSZAOts9h6bfEIXRCCN+qU9UifNURbj
 aI5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=UUAtMhUEk/jz98adLLh/kvHWU+87rtZfg/cfL1Bdfv4=;
 b=D7vEhkPOWtVDba2GeDsWI+w2zEwxVYrOPl9XJ6aoKeqlcWR7IhCjEP5WQ8iKeI48VY
 kxx1Xg5BVIyemsj8Ce1dipTmb8LBPAyaefwb3dw2hKb9WnmJCDNFH62LtATpruYIcCwv
 jQJ3lYYErfW9MEABnzBWRLuUMxgNaoShszNmUkiX+XtGYimQnHOJxqlWWWsFdmum+Juc
 q/S6EEYZ4elgyUfZTDifg+tBkdYBwIbUhUq3OFxJhg6M6SfQSNE8OhaBkRZpiRzPCOj+
 V0U6AawgJQOuvr9nTxexkFMl4fzVKThTiXaz96V8K5tbZ0m7F6VjQJcgu8RnUyYaFCa5
 8l4Q==
X-Gm-Message-State: AOAM530pOQUqg/8378g3hLUFG80PAcWBv3ZR+H44ZiSg7gHrhtLm4DDV
 9l3AlV10dlkFACIjymI5CEjHxQ==
X-Google-Smtp-Source: ABdhPJwevDhhFb3fbE81queKzB5zgztjuRr7Aq9efuwPUXqmp2hDPvc+PUbX3Xnkw0p65sb/EPunjQ==
X-Received: by 2002:a17:906:c1d4:: with SMTP id
 bw20mr2859064ejb.91.1602070370261; 
 Wed, 07 Oct 2020 04:32:50 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id d59sm1247111edd.74.2020.10.07.04.32.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 04:32:49 -0700 (PDT)
References: <e4e6cc45-bc18-40ec-035e-fdb45b9a8f46@gmail.com>
 <87o8lf74j5.fsf@nanos.tec.linutronix.de>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Thomas Gleixner <tglx@linutronix.de>, Brad Harper <bjharper@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH] mmc: meson-gx: remove IRQF_ONESHOT
In-reply-to: <87o8lf74j5.fsf@nanos.tec.linutronix.de>
Date: Wed, 07 Oct 2020 13:32:47 +0200
Message-ID: <1jy2ki1db4.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201007_073251_770001_3EBCE8F4 
X-CRM114-Status: GOOD (  17.76  )
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
Cc: Kevin Hilman <khilman@baylibre.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Marc Zyngier <maz@kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Tue 06 Oct 2020 at 17:33, Thomas Gleixner <tglx@linutronix.de> wrote:

> Brad,
>
> On Wed, Oct 07 2020 at 00:45, Brad Harper wrote:
>> I'm happy to test anything on a range of amlogic hardware with standard 
>> / rt and  multiple mmc devices.  Ill test Jerome's patch in next 24 
>> hours to report the results.
>
> please do not top-post and trim your replies.
>
>> On 6/10/2020 11:43 pm, Thomas Gleixner wrote:
>>>       We rather should make interrupts which need to have their primary
>>>       handler in hard interrupt context to set IRQF_NO_THREAD. That
>>>       should at the same time confirm that the primary handler is RT
>>>       safe.
>>>
>>>       Let me stare at the core code and the actual usage sites some more.
>
> So there are a few nasties in there and I faintly remember that there
> was an assumption that interrupts which are requested with both a
> primary and a secondary handler should quiesce the device interrupt in
> the primary handler if needed. OTOH, this also enforces that the primary
> handler is RT safe, which is after a quick scan of all the usage sites
> not a given and quite some of the users rely on IRQF_ONESHOT.
>
> The below untested patch should cure the problem and keep the interrupt
> line masked if requested with IRQF_ONESHOT.
>

With arm64 defconfig on Khadas vim3, no obvious regression. Looks good.

Tested-by: Jerome Brunet <jbrunet@baylibre.com>

I did not test with RT. Brad, Could you let us know is Thomas's patch
works for you ? Thx

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
