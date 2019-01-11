Return-Path: <SRS0=DVbv=PT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAFC4C43387
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Jan 2019 01:28:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99CDB20879
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Jan 2019 01:28:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EgjFgx3H";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="PX0kpIsH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99CDB20879
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vhgBJ9BEy4pK2w29e5YhhSoI0KthH7y454ULlLtNHvo=; b=EgjFgx3Hdy04ck
	sr0Dp8jjq/r1dPFHY3upjOOo5jlDpaKMt7+VeDMvBWx2oF7i9iJOP/yKG5eYTtLuTttMJufCoBCti
	Z7ySlmm5rT5hSUL2ciSd8Tyobb34a7G4khpPl65/An4EpaZRnbINNai1ppNwG5sOfCO4v6/vtjLJk
	UwY8TIjgcV3nTuKV5Gh+kbRORZevHZiZzml46s46Xn83mCfpaOwTzD7PibZXVhbMk6yqHGdoHCBy0
	0yNl7adFCpxIs3GyUnDwl3yCp6/TXYIMNX7kOMpeGJ6jWI2mqGCbRTKpeMe00bpHqwNkfNxjNzWRl
	bs6nb4yOv7/4HCLRC+Mw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghlcV-0000Uz-T9; Fri, 11 Jan 2019 01:28:23 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghlcL-0000MJ-JE
 for linux-amlogic@lists.infradead.org; Fri, 11 Jan 2019 01:28:15 +0000
Received: by mail-pg1-x542.google.com with SMTP id z11so5607267pgu.0
 for <linux-amlogic@lists.infradead.org>; Thu, 10 Jan 2019 17:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=2P+pkq/TAVJfpx+QVUhCn9RikOPq88PivZzjtOGkCms=;
 b=PX0kpIsHZAopLUpTUOPcmSxdoYqWG3Yy2a/gSt4fMAnFTPMwwUZp9lvNX7iUhe0CEO
 mr97YQ7w7MATf/6pJT7ZjTp5xduZAHtwnnPdIDJ5cb3ltat7IkZXULfiL7Iz5aMqdKmb
 M1IPOaheORYcAz6PekI7TF5iRMtxmFJWNu6bHeQM56HEB3a+r/+zhiKS29cOuIjP50Dq
 +mv6Kn5EWfNVPwXwYrsIhj7tXR4JUNhGgkE3oiTS/CeZoxr5Nn/fVQjE6mC682Hrq1My
 arIrXEGnTS9VKPbcKRtVdYDn9EYVAKzl1Hk7q6W5/SPh8wZsW9V4vUCpsHs66BuSnPfj
 VqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=2P+pkq/TAVJfpx+QVUhCn9RikOPq88PivZzjtOGkCms=;
 b=NSHZ8q+HKMqP44shEdcutzt5Lj+5FeIIeZFsGD9xA/DwhE9rL8aIYxDfSeQQ2nWyx8
 J96PaT345DpTzYcwISepmkT5VgjQYx8J8GEQohKFTO3qRttUFNa6izRgmtah1RdFxIUb
 pwH4peCWtkc/I4zrOi75cY7iylxXkr7L4CdjQw0Oen0QUm8DETpbLSNRYyFoIZcTiRym
 UoCbnf7A31ZfZRWQeGCNi/r4eSOCsGnCNcOD3OAVW5iKVlUOhJlxWRPQ/mSokhYnorKR
 984/xX01MkEH/0pbfCUi7D0woKiZydx1aMlrpqcxVzFA3AW179HwwBQindju/4+CeTc0
 OmsA==
X-Gm-Message-State: AJcUukdnx9ZQYBLfDoO30uSA2xg6g2JT4vWgjhouO1JOo7qTqw1ypHE1
 s2hfhGdNt4r4LfRymA6jLjzORWlmusg=
X-Google-Smtp-Source: ALg8bN5IO4BJcANmQlKQXyWnapZsR/3IqoI/v9r4ESHNsrGTcIk1c3DNbMbLWi6X4V8xHzoCBXXJsQ==
X-Received: by 2002:a63:184a:: with SMTP id 10mr11378583pgy.81.1547170092711; 
 Thu, 10 Jan 2019 17:28:12 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152]) by smtp.googlemail.com with ESMTPSA id
 r187sm242710873pfc.63.2019.01.10.17.28.11
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 10 Jan 2019 17:28:12 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Loys Ollivier <lollivier@baylibre.com>, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v3] arm64: dts: meson: Fix mmc cd-gpios polarity
In-Reply-To: <1547134822-18498-1-git-send-email-lollivier@baylibre.com>
References: <1547134822-18498-1-git-send-email-lollivier@baylibre.com>
Date: Thu, 10 Jan 2019 17:28:11 -0800
Message-ID: <7hftu0oudw.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190110_172813_631427_F36A0F68 
X-CRM114-Status: UNSURE (   7.82  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Loys Ollivier <lollivier@baylibre.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Loys Ollivier <lollivier@baylibre.com> writes:

> Commit 89a5e15bcba8 ("gpio/mmc/of: Respect polarity in the device tree")
> changed the behavior of "cd-inverted" to follow the device tree bindings
> specification.
> Lines specifying "cd-inverted" are now "active high".
>
> Fix the SD card for meson by setting the cd-gpios as "active low" according
> to the boards specifications.
>
> Fixes: 89a5e15bcba8 ("gpio/mmc/of: Respect polarity in the device tree")
> Signed-off-by: Loys Ollivier <lollivier@baylibre.com>

Thanks for fixing this!

Queued as a fix for v5.1-rc,

I see that this is being fixed in the driver also, but I think fixing
the DTs is necessary also.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
