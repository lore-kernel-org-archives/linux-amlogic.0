Return-Path: <SRS0=oj2F=KX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A038C47087
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 May 2021 18:32:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98D74613B5
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 May 2021 18:32:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98D74613B5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HifKxHv7wIxpFKPZJqQAO2rnWoZxSUPGR6kfsrSmJe4=; b=gQDv+sKqvM4C9N
	3Q/JguLt8YvL2Vb7xBI+ESD9ps2IDzFYndSCtmob7XFB2k4zvzNaggCPQKtQbr/3grveZJiGoZzQ0
	eaFEMMXhLR31jgbTt7p6+VAl+jlBpAEJFzgG3eCJCRH6LFrTMEPQuTR7jZFi3l/BVTlx/r7t6tHOP
	ZUbm0xUBbQH02Go0AggAHNkSudpWyR0P+bB1WKxHXn3OQcZhpAjApBCEOAdb8BwRje9Mj8aO1xGga
	jRJ3l5+CA8MGujNCyUneLib7xlNee+TPS8WZAJbDbvbD7HQb74Ja3hAJkJ1ocSjDrenE9WbIM3c4V
	mvQJdpKh36gFkiFDVxwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmhHD-000G4Y-Mj; Fri, 28 May 2021 18:32:07 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmhH9-000G2o-OO
 for linux-amlogic@lists.infradead.org; Fri, 28 May 2021 18:32:05 +0000
Received: by mail-pj1-x1033.google.com with SMTP id
 v13-20020a17090abb8db029015f9f7d7290so7691321pjr.0
 for <linux-amlogic@lists.infradead.org>; Fri, 28 May 2021 11:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=YV/BiPJXhGwSK1PzuBgArnxi+SlDKErcHallVmzy8OI=;
 b=oeIfKPwTYbdFzQnGWsbcMsrzvBZhq6DWLQce99NaYxtj/w88ZrQ/B8vnRXhivk3bHE
 gywmstMJZWJo+BKKpHRs+K9ccDl+xmbNbvXuFfjMNFHXoiOXlwUukS3Yd+uGJFRPhg1k
 tvyhtoiU0/TDw9x17Yf2IAHpZ9z8mCG+ivp8MTBNrmaZEZ+3PWl7a7eHcKsdBryf2VzP
 NHUTEJIvbNCW55olNDFolDrJUVhKAmDtsdKKLB/W5WNEEN5jyUM2WaRI0xONWVxFaQT8
 i4ZUfeRod4jnIyFmrd0j3vHYrwWF8goZaVmX2YELomWg5n1R9aw4rvH9QNeUs0inHNdU
 UiTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=YV/BiPJXhGwSK1PzuBgArnxi+SlDKErcHallVmzy8OI=;
 b=B8kp3qqgOjc7B/OfeIKdd7bFm7/cra5BSwesxV/yb3+MFfdbQKbkgZJeEs76Kw28iM
 DjCkBWF1j7NLdqIWbRHbNKttZu4OY79YEbNVAy1QbefSpfSU1lm41dztY31t0DJ1O5Lc
 d1qlUmPOgGrQw5ylIqts8faI/e8Y8qmmsSjBmarJwMnDMBnkI/Me+yhUcuXVFnWXnFKr
 OYxWo/zpmsx9uO5As2/ckqjsF3ew+3AebLpDAgUu9n3w8qlrQrgtsiBBw6+E7BEwUC8f
 IE+NxyZttGA0xMkdqMsVm9tUukpL0MDb7J6hs2ODJbi77I60p+tV7E5Z0GSlMqsW0Mu5
 wRxg==
X-Gm-Message-State: AOAM532ERG2A5GsSXHOQwI7qvK6QARrytWAfuU2VuwoEouJwDt/rqe+z
 KLzTbrYs3dwp7+6ZqFhU30N3ww==
X-Google-Smtp-Source: ABdhPJzShLm9qG/+ny4dx5TtLmdS2dbI51CA9eYDIpWdiO+juPnKFo3HhnqPYAdwL9ldDj/cKotdbw==
X-Received: by 2002:a17:90a:1c02:: with SMTP id
 s2mr5784634pjs.172.1622226722903; 
 Fri, 28 May 2021 11:32:02 -0700 (PDT)
Received: from localhost ([2601:602:9200:1465:b7b1:ebba:cf8d:434e])
 by smtp.gmail.com with ESMTPSA id r5sm4896984pjd.2.2021.05.28.11.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 11:32:02 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Carlo Caione <carlo@caione.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, linux-amlogic@lists.infradead.org, Neil
 Armstrong <narmstrong@baylibre.com>
Subject: Re: updated Amlogic repo used for linux-next
In-Reply-To: <20210528083821.72dda431@canb.auug.org.au>
References: <7hmtsgrpkt.fsf@baylibre.com>
 <20210528083821.72dda431@canb.auug.org.au>
Date: Fri, 28 May 2021 11:32:01 -0700
Message-ID: <7h8s3yso9q.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_113203_873196_8B9A2F3A 
X-CRM114-Status: GOOD (  10.39  )
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

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi Kevin,
>
> On Thu, 27 May 2021 11:36:50 -0700 Kevin Hilman <khilman@baylibre.com> wrote:
>>
>> Please update the tree used for Amlogic SoC kernel development
>> (suggested patch below[1].)
>> 
>> We've switched to a maintainer group for this tree which is now
>> co-maintained by myself and Neil (cc'd)
>> 
>> [1]
>> diff --git a/Next/Trees b/Next/Trees
>> index 2d22ca1d2911..1794b9144f3a 100644
>> --- a/Next/Trees
>> +++ b/Next/Trees
>> @@ -103,7 +103,7 @@ arm64		git	git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux#for-next/co
>>  arm-perf		git	git://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git#for-next/perf
>>  arm-soc		git	git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git#for-next
>>  actions		git	git://git.kernel.org/pub/scm/linux/kernel/git/mani/linux-actions.git#for-next
>> -amlogic		git	git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git#for-next
>> +amlogic		git	git://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git#for-next
>>  aspeed		git	git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git#for-next
>>  at91		git	git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git#at91-next
>>  drivers-memory	git	https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git#for-next
>
> I have updated the tree URL and added Neil as a contact.

Thank you.

> I still have Carlo (cc'd) listed as a contact, is that correct?

You can drop Carlo.  He stepped down as co-maintainer awhile back.

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
