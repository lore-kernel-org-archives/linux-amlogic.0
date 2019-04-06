Return-Path: <SRS0=b9va=SI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 225E6C282DA
	for <linux-amlogic@archiver.kernel.org>; Sat,  6 Apr 2019 06:06:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6E8421855
	for <linux-amlogic@archiver.kernel.org>; Sat,  6 Apr 2019 06:06:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LrFPemNB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6E8421855
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:
	References:Subject:From:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=4EVHeaK+jwPAOFIxu75yb4fKJJLZfdJFJMchMvBzfHE=; b=LrFPemNBXy2bB30A83LB8HUqGd
	jRnfdIUckLUemeV7r8N1CAA+JmGzluZsaCzrtbTol9hKeYhogqqKlyazk26XOWQGbgEq6Ui9Rr2CU
	FHmn0ZAGZD2DR54LhAbSuguH6cyj7aKdu9+OthpTfZftPEx79LIeA7PzRThytEKJOQ7YbDHtznzaV
	xUvE6/6aDTp4fKfiPxOKUcHN/IMEJ+SadFzTuGrwRDRKKbTj0o/kpToVBrKINiEczAa0trcGVP3yr
	8NRwnxMEs5Z925m1t2ybao+6x4qDeh/mVJbq1rcuBFJmmhO5cL21ajYKAdYEfjzdwKV0alfR6Jl//
	jbpK3N0w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hCeSo-0007rU-Be; Sat, 06 Apr 2019 06:06:02 +0000
Received: from mail-pg1-f196.google.com ([209.85.215.196])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCeSh-0007kR-9z
 for linux-amlogic@lists.infradead.org; Sat, 06 Apr 2019 06:05:56 +0000
Received: by mail-pg1-f196.google.com with SMTP id q1so4179189pgv.13
 for <linux-amlogic@lists.infradead.org>; Fri, 05 Apr 2019 23:05:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:from:subject:references
 :in-reply-to:cc:cc:to;
 bh=Y2LNPDDgAWFMTxjrphq8l1ZkmN7zBDhbLgoLv2GUpQI=;
 b=RIJJasVOcVQft7bOhv1U5nAHCFIO97P3e6vP4/4bakd/OzZcIGd0lldcIHjs8gJuza
 8veWMfX6UXWvhaKkYJejPKQR6n1UT4dj/18DalZj2RdO8Ba8OzqagrBzVgf19uNvoBBf
 4Zit/2Nm+vjdmuKTcf/YUCZvaDBXZWKUjPwD5l6RiIHbjyqHxAN5DXgADe/F89wJC1An
 3ZTsqqow9F0V6CkIXxJeA0UjISRUyBJB2Y368JS7ILn0SY4HtsQxIcBY+7Ack1cOZpEL
 FBpvBQXIKS8MsgHnr/IQBYu/v0tSxJRe5DKFzq8KKlPlfx9Ei24zOlD9idZ0Cegv7PUw
 LnJw==
X-Gm-Message-State: APjAAAXrQ2Y38zFlKINacrbbdHkFPFNTe5U7+b7FN34jyaBTj6Ne5/T8
 L0MKkJjHkeZowkuEr/zfL/IonWheHg==
X-Google-Smtp-Source: APXvYqzxH1SLJcGx7X0hbQGNI/T13FsW1H6PxA4ICO1KCBgoxCNQBOen/bGkVuwDPeTOEjmbWr9oVA==
X-Received: by 2002:aa7:8719:: with SMTP id b25mr17011728pfo.90.1554530754485; 
 Fri, 05 Apr 2019 23:05:54 -0700 (PDT)
Received: from localhost ([210.160.217.71])
 by smtp.gmail.com with ESMTPSA id v82sm56318833pfa.170.2019.04.05.23.05.53
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 05 Apr 2019 23:05:53 -0700 (PDT)
Message-ID: <5ca841c1.1c69fb81.44d14.3a88@mx.google.com>
Date: Sat, 06 Apr 2019 01:05:51 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: clk: axg-audio: add g12a support
References: <20190329160649.31603-1-jbrunet@baylibre.com>
 <20190329160649.31603-2-jbrunet@baylibre.com>
In-Reply-To: <20190329160649.31603-2-jbrunet@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190405_230555_340057_4B0BEB86 
X-CRM114-Status: UNSURE (   6.79  )
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
Cc: Maxime Jourdan <mjourdan@baylibre.com>, devicetree@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, 29 Mar 2019 17:06:46 +0100, Jerome Brunet wrote:
> Add a new compatible string and additional clock ids for audio clock
> controller of the g12a SoC family.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../bindings/clock/amlogic,axg-audio-clkc.txt          |  3 ++-
>  include/dt-bindings/clock/axg-audio-clkc.h             | 10 ++++++++++
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
