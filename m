Return-Path: <SRS0=0xNA=W6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4490C3A5A7
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Sep 2019 22:01:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8829122CF7
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Sep 2019 22:01:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FHFPWQIT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="DnjYb9Yg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8829122CF7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7znrlBcgDaHKHaajMQfuC/IO5IgQGE3x3fqIWJYBJRE=; b=FHFPWQITELG62+
	x5LXxZWw4Clo4HloX3xOhTvSgT9HeyUF7RSy21duJHONGxC/oLt1jiUAQ51W9msbzow2gx0E/5YiQ
	EZShUnb5Jte0DKEMsm9iogburlbZ1Av9LVauDmyAZz68EgpT+TqYqPR5p1TRKsi0Xv/M411JeMCuE
	/5iMqJtKJSTDenng0t5gG7QmzLFL4sIU2+XqsrmU4VWLlOYXgDZ+YVe7Z/doF5cNO9rSsybHm8DsT
	q6aiT/YhIFW+miMycvmHbqXcGJYKNzkY2CV7ciDH6NpvgKn+u73eTPJjqllStyUTaMhhkDWpAKEDs
	GUHWBWlCbSmJUw09CZ5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5GrS-0003vI-A0; Tue, 03 Sep 2019 22:01:14 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5GrO-0003tc-VW
 for linux-amlogic@lists.infradead.org; Tue, 03 Sep 2019 22:01:13 +0000
Received: by mail-pf1-x444.google.com with SMTP id q10so6703564pfl.0
 for <linux-amlogic@lists.infradead.org>; Tue, 03 Sep 2019 15:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=J2n5WaaTL54/rFZLKGGh9tzxeFO4kiIUE0UdYkV6TDY=;
 b=DnjYb9YgdsBJx9uO26j7T9uZFuqzZGpQWVzIOqXvXGsbmMJfslSaFHsnCiitkx9CY0
 MY22m1RGIfXOdcayxWRR93Xi2CqF/Ppmy0scqFi0FT7JWsF3uhaX+fOHzmYTITZTaBdn
 5mtl/Ca+FnmRv9f1fzPj2go5V+WA1WROGo5YZjCg+tZCMAH6rIVDFdtx3woVwfQT04dE
 JfePI61SwyJWifYbS7xYYsimLx02Oyqs0h0RpRLkKLqmBcCUcz9NztSijUti+sogl+JQ
 BmiMpefyPca6dBxNoeOAZNUaCZjQPrv6KpUIpOAmly3MrbGIJ2X1DzGbfB7+8ZXBDJJ2
 s2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=J2n5WaaTL54/rFZLKGGh9tzxeFO4kiIUE0UdYkV6TDY=;
 b=XMS25J/8/Q+6xxGp4cA0dBqP2aBlYaHIgrwUTZJTChYHD9Gl0leaQbtM+Ru+2FSpBs
 FNHs8CzYsnA0eGF2IIxzIZuU9lkKebvSbCXPPOoZXD9hMfVNtPGlvnNBKCi1IMxbsVKZ
 wj4vTsLrl2iDrBqSehQW6y138M+M6ES6uGbHKRh9l5aLONsIhze5PleRZh8b2yHuhZ7w
 cOS3CGtFLOGcwVJL5ibyk0IRvkuJuHhSP7HtWaONIcRf1ov3OhcAxlk4kDxZinmYm5OS
 KxGD1YI6Jtgc+iraxpm5I7VyBmc55MC4RkFhkcBHwz8kcl3eZ7sJbpS2/ZHZ16LmQ8E6
 lCnA==
X-Gm-Message-State: APjAAAV2TNEJ6Mn/9QwQIU24EyIAJppPhhI/Lv2wNKheJLbIMdr/1nsU
 CIF2eNUcGo4elUrlaaqjHYOzSQ==
X-Google-Smtp-Source: APXvYqxNDrTxDv0Q0qLNo2jLxjkedLDi+bNzYxHBpg9CdGO4n6KYv7fBWOvF072F4TqfiWhDl2f5NQ==
X-Received: by 2002:a65:5003:: with SMTP id f3mr32414212pgo.335.1567548069351; 
 Tue, 03 Sep 2019 15:01:09 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id s186sm24287884pfb.126.2019.09.03.15.01.08
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 03 Sep 2019 15:01:08 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] soc: amlogic: updates for v5.4 (round 2)
In-Reply-To: <CAK8P3a0_HEhvVk8Onk-9MBhnaBQT9B39+t6AGA3FRrH-_yMqVg@mail.gmail.com>
References: <7ho907rfsf.fsf@baylibre.com> <7h5zmfo8au.fsf@baylibre.com>
 <CAK8P3a0_HEhvVk8Onk-9MBhnaBQT9B39+t6AGA3FRrH-_yMqVg@mail.gmail.com>
Date: Tue, 03 Sep 2019 15:01:08 -0700
Message-ID: <7hpnkhm44b.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190903_150111_045527_87FFCB35 
X-CRM114-Status: GOOD (  14.75  )
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
Cc: "open list:ARM/Amlogic Meson SoC support"
 <linux-amlogic@lists.infradead.org>, SoC Team <soc@kernel.org>,
 arm-soc <arm@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Arnd Bergmann <arnd@arndb.de> writes:

> On Fri, Aug 30, 2019 at 1:34 AM Kevin Hilman <khilman@baylibre.com> wrote:
>>
>> OK, here's the respin (round 2.1)
>>
>> The previous version was missing the bindings for the new driver, which
>> I had mistakenly put in the DT branch instead of here.  Without the
>> bindings and associated headers, this branch did not build stanalone
>> (found by kbuild robot.)
>>
>> All that is fixed by this branch.
>>
>> As a result, I also needed to respin the DT64 pull.  Since I moved the
>> bindings/header patche here, the respin of the DT64 pull will now have a
>> dependency merge of this branch.
>
> I've pulled round 2.1 into arm/drivers, but it seems that the
> patchwork integration
> failed to deal with the way this was sent:
>
> - https://patchwork.kernel.org/patch/11122205/ shows both the original
>   pull request, and the updated one. It was meant to detect both pull
>   requests as the same thing and mark the old one as superseded, but that
>   did not happen.
>
> - Using pwclient to get the pull request only shows the original one
>
> - I actually tried pulling that after looking at it with pwclient instead of
>   the email client. Thankfully, you had removed the original tag, so that
>   failed and I took a closer look.
>
> I suspect it would have worked the way it did for
> https://patchwork.kernel.org/patch/11119171/ if you had specified
> the subject as
>
> [GIT PULL, v2] soc: amlogic: updates for v5.4 (round 2)
>
> i.e. kept the subject the same but the version inside of the [].

Ah, ok.  Good to know.

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
