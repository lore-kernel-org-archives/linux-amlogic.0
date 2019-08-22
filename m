Return-Path: <SRS0=N67E=WS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47922C3A5A1
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Aug 2019 20:49:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 117EE22CE3
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Aug 2019 20:49:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s04w9F9r";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Nt3rthPr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 117EE22CE3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0tIwIPts+Kk+haodUBWLTkcaKMicPIcKrbX9XxaFV30=; b=s04w9F9rpHwmLC
	xZRcSWBQgvf2iRu979bgSM/+179hIs6RYj9eGR3P8Jh2PgKwkt+ZDbv45ag9LmUIZhlDH08tnFJ4O
	ExwH6kUinNrkCi521rZcNUkuIZkHrq3tnYJPTcV+xU4jOfXsroihTZqifGFfQOnq95Kjp9mxk03ua
	urbqT+OdQV/1KUSeR2uui+RXDaA5QjisgrertRFFAlaWqu0wgYVRS5YM4UeAcLGARUPTJApJzSGOh
	KKVE7CgSXoOB0HmNVH9QlEWGb2vwSeksFfphxqDla/kAjJLA/6nFa0Xeqcpds3oJzOIezgTrfe47A
	i0LXew5koL2SkXebwISA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0u1F-00037s-BB; Thu, 22 Aug 2019 20:49:17 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0u10-0002tR-NK
 for linux-amlogic@lists.infradead.org; Thu, 22 Aug 2019 20:49:05 +0000
Received: by mail-pl1-x642.google.com with SMTP id 4so4125663pld.10
 for <linux-amlogic@lists.infradead.org>; Thu, 22 Aug 2019 13:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=PRyBdHjQx8YQuiWlWDuZaRk18ZPfvPfoxp9juAJhPE0=;
 b=Nt3rthPrwSqsNTxwWEFNc3alLqc2wECW4EsvmIl3hj6d8BU2kUpNDs5RWHcrvZ06Ha
 52lfo4PXNczdqV2WwSh7J71j1s9c2/Ird/b6f6N9/lKSXp1wyAiwpgq5ARNimV+FBJwv
 cL+uPV19RjKoXZFEHsh/wtmATmEuVokrT3eyx21oz/RoS6uwZNkGJWrW6uOyjEHcTS7i
 alC/R0Lz7KNgTCPha9tElM/8CQkIrGUCx+uDr6jKDLO0WS/BHxJ+xPSqDf3qIgmXI85b
 puBmPmgavEVgDXoUpxZ3OxLyXILsPEKWR37/0xyHymu6kVpnccpbfvneQBPPlwLEiaxh
 gOdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=PRyBdHjQx8YQuiWlWDuZaRk18ZPfvPfoxp9juAJhPE0=;
 b=U4tLGsqksMs9hGv10tz8CT9yfDLhmq73/jidDqdGF6swmCiKFo5FRgY2mRwylVJIx1
 x5kGRASSknz98d5NrodtTKK23OHrNJK1V+EB2waVLxHW7zQnu4EDh3Jn412ci3SJ+Ccu
 DaXsMVAhoNtrcZJZ/W4lcLq5HZaHrIaCmD2RXJ4PQSQZYIpNYmG475iktJVYvOtn4foi
 AlfdDMF+SKLmYlRuCO5E8mYoieBXN+XKdvnJuX9rU4U9wb6VtXH8ZiZ84CVTPBFb2uly
 0KcBfwohKSJoAgpznvyE7CWOZ01L4pbFp6qs/mvRYrBsmYbCP2hK6OuGSG0KBJutd6zJ
 93NQ==
X-Gm-Message-State: APjAAAXbOnoZHMXRFtMklocQhmyQODTutEj/u9qR4YowvE+4HAMDO3Zw
 UURQ1RcJ/3j+v0C8Kt2RVOhYCQ==
X-Google-Smtp-Source: APXvYqyBOZY+Y8qPyRTGoHFxY7bYv7/YpxBaX72z5hY0CRGeCbyY7yfKY2UAF99J0VAB5mBEbwC5xA==
X-Received: by 2002:a17:902:f217:: with SMTP id
 gn23mr774044plb.21.1566506941988; 
 Thu, 22 Aug 2019 13:49:01 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:89d4:68d1:fc04:721])
 by smtp.gmail.com with ESMTPSA id b123sm311081pfg.64.2019.08.22.13.49.01
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 22 Aug 2019 13:49:01 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: clk: meson: add sm1 periph clock
 controller bindings
In-Reply-To: <20190822142455.12506-2-narmstrong@baylibre.com>
References: <20190822142455.12506-1-narmstrong@baylibre.com>
 <20190822142455.12506-2-narmstrong@baylibre.com>
Date: Thu, 22 Aug 2019 13:49:00 -0700
Message-ID: <7hr25d2af7.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190822_134902_763658_7F9B4EC3 
X-CRM114-Status: UNSURE (   7.64  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> Update the documentation to support clock driver for the Amlogic SM1 SoC.
>
> SM1 clock tree is very close, the main differences are :
> - each CPU core can achieve a different frequency, albeit a common PLL
> - a similar tree as the clock tree has been added for the DynamIQ Shared Unit
> - has a new GP1 PLL used for the DynamIQ Shared Unit
> - SM1 has additional clocks like for CSI, NanoQ an other components
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
