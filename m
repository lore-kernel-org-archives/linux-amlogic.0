Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30BB7C04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 18:50:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F961204EC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 18:50:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XWTM7m3r";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="LzRo5Nb6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F961204EC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o6Uvykq8IyrEkAVF7jSIt9NRfj7uNZp1eQc4LP6NeKY=; b=XWTM7m3rIyQ9Ug
	bxIvwAX3K6wVOH4N/12UXEJrdiUr+rsh8Q7UpnuIpBzAanm6uFpPQ/OqLHWCfvWQWqDn058sOT5Bl
	s3u1U194nwyWnFinDxavcHnb2CCyOE7M7xx6aPq4qllI83QU0bZao4OvNt5ShSmgHkmTMWVXL8xVK
	lpcA5yEYtsXGr4KQe7D/FyubbFgI1fCNXxOZw4TvrdeNFjBRRVgAzOqCwuoRSWkhWJd+7zyWVz1PQ
	pmAuwKu7dmTD/lQSqi3ill9nTjCqzAGhdEIbysPr4kXzUvCvFolnfGpvCGatT3dm6gsac1dPmZlzW
	GFc9KYhod9/Gk3uT7msg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSnMn-0007S9-Fy; Mon, 20 May 2019 18:50:33 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSnMk-0007RJ-2x
 for linux-amlogic@lists.infradead.org; Mon, 20 May 2019 18:50:31 +0000
Received: by mail-pg1-x544.google.com with SMTP id z3so7191567pgp.8
 for <linux-amlogic@lists.infradead.org>; Mon, 20 May 2019 11:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=Mv8Qa01JCZ4+I7YNJRvGCUwkERJCFxGoPpOGVqFUsYA=;
 b=LzRo5Nb6F7TFwyy5bp3FMP6UKmKwdrKZBYV8OY2LiLicrsrHoaULjsXjHJUAzLZd8k
 akZ3bPYdZmgJHme2EODuIbrNd27cGXCSVd3r9GC7LhchRa04f6VzMH8AkZpMUIT4rm/g
 aZ20HGwlSiT8tpEYkKhXuRRoqPdu6dO1WOBM/xXpenFNiYXmu2wsIMYj4eGk9ecb4gCv
 tExdPIBkotN5XCXJpRIP2iv0ohdLdY4JCioDie7Bb/G3f3M2PsZA1faLwLJ3J8hIS5gE
 CC/1Wqmcu34gckeSxDEtpR4JXa3n7ubgRnvoeysbbPATSjhpkHNwLJi8CQqwC/kjvEBg
 a2ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=Mv8Qa01JCZ4+I7YNJRvGCUwkERJCFxGoPpOGVqFUsYA=;
 b=fZ1Bk8TGtBhpfZhge5uwg90TzW4fO8VHipAmNfLxbbTnECGfZ2oxV+KaEePl2Dm1j1
 J6Qeam19+OEpjVIrFGrxyV73AQJfwCzENqW+X3YqAA1lEVCC1xggLVyf3wMPcLgfSnaD
 sOG9Z6XMyXoxXxYONiZnebF3mi2H4AyzkNjeYHEGXyST4Vz/vwTLJDm5fbo9/NQ97YhA
 pSJaucUqEFKLTUSOwCgpqup6WD8NNmfJM4KxJ34pXl43eSSOciui2BffWAP9GBrptkG+
 Tx3K93WuVCnBw3YQUYwCMnaoFZ6oXZBbyuwHAkIGe17GdoUVMyNHE3duV6cgwa9hHENM
 YD5g==
X-Gm-Message-State: APjAAAUx2OeYQmUgp+HC9wxoZd3MqIEJ+lgLSG5jtzeVRZE3fePCdB6r
 UlYDMpQywXIHu4ALFiXwKZzrf7DG2pWc6w==
X-Google-Smtp-Source: APXvYqyeVgJuq88BvtgUgTuL8byweGUANYm5SR4s6iLuwa5yxXyYVn/e5ZPLOh/EoEtmF45cm1pG+Q==
X-Received: by 2002:a63:5964:: with SMTP id j36mr76640076pgm.384.1558378229131; 
 Mon, 20 May 2019 11:50:29 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:e483:1cc0:e2c2:140d])
 by smtp.googlemail.com with ESMTPSA id
 n184sm25492567pfn.21.2019.05.20.11.50.28
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 20 May 2019 11:50:28 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v2 0/5] arm64: dts: meson: g12a: add ethernet support
In-Reply-To: <7himu58195.fsf@baylibre.com>
References: <20190520131401.11804-1-jbrunet@baylibre.com>
 <7himu58195.fsf@baylibre.com>
Date: Mon, 20 May 2019 11:50:27 -0700
Message-ID: <7hd0kd7yfg.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_115030_176420_F21D848E 
X-CRM114-Status: UNSURE (   8.13  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Kevin Hilman <khilman@baylibre.com> writes:

> Jerome Brunet <jbrunet@baylibre.com> writes:
>
>> Add network support to the g12a SoC family
>>
>> This is series is based on 5.2-rc1 and the patches I already sent last
>> week. If this is not convient for you, please let me know, I'll rebase.
>
> Could you apply this on top of the "consistently order nodes" patches
> that are already in my v5.3/dt64 branch?

Nevermind, I mis-read the above and thought it was on v5.2-rc1, but now
see that it's on -rc1 + all your other series, so it's all good.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
