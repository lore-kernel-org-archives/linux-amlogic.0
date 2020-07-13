Return-Path: <SRS0=9eFL=AY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCBD2C433E6
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2020 19:04:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BB812067D
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2020 19:04:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JJFntKVr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="BfpHJimG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BB812067D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5oZh5C8qQpIwo6jLAA6DlUy7fKI5cJkENTDLsaJyfgI=; b=JJFntKVr5tZiz2E2q2ZAyK6P9
	CCvC58UpTlCFJFcc4FOV/4tsiS7BBsQHWXg+8uh03Os3JqVIb4wv7KJr3KWMQ9tUMuxoFKRfcqjWX
	/psMnGftf+BqaSDtfPyQxL8wJSRR3rLbAmBtg71f3bU1sNhd9Frp+dP9eGtGj9OKAXiyg31AAlICc
	5V0ewwIIx3DuYLbew5rtKIobbmjxRKLGJOC8sYkEhJmh7kGRpNQSvPQoFLIJD1fBNddm7P9xAO1ub
	WYq66+PttUTFHuk/7Ca/YAZFjy0uw19F6fJ8I9rDEkQrTR7ueTHBeGv3PzoAh9puhzpesok/iOZjw
	oSqGEqyXw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jv3kA-00031l-SX; Mon, 13 Jul 2020 19:04:02 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jv3jn-0002sy-Be
 for linux-amlogic@lists.infradead.org; Mon, 13 Jul 2020 19:03:41 +0000
Received: by mail-pg1-x543.google.com with SMTP id t6so6444470pgq.1
 for <linux-amlogic@lists.infradead.org>; Mon, 13 Jul 2020 12:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cxvIt7oMcO1BT79Wsiw8Q1qnT5txfws4FlG9t77T9c0=;
 b=BfpHJimGE7qUmYJVs1EA7aE9Rx33XRBpTkMJ2V1aEgTbAV/h16a2cmRV2CGoHP657N
 qg9OgSyj1sAZVCOFFYipNALOiydy1xPOHjA28ab91/JUvnndU/jNzVXVCtNY4YAyQ8VT
 3ayLxkiHayuJMGBdy6I14+SHaTPyH0bWp/mY7We0iwdqeD5W2BEAJJLCI7YgFJO/QoDO
 EZjlxwQISbYqHHdHzi4kB0MPiEm2cpADsW6j3yAmCMkYZtg2vTy5rsYmLf6GxPfOV3sg
 d7VzCigAdIQ2Upitrm0qFKinv5oiPKUmzHCJi2JrR9ZfFmCGWe3tjbnz9lAsMNqqSEsm
 lUJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cxvIt7oMcO1BT79Wsiw8Q1qnT5txfws4FlG9t77T9c0=;
 b=MeYvt6QGPM6WB7+KJ24ZgU40gq+gcrNjqpIwIoDgrCb4+D5tAtJHqNoLdvp4IcXVA/
 XqB9l/BtxuNgqZLEQ4EbFv6kdM7qXtqYypfn9xbx8nsM4jXy2CspoBw1b4ED5pHwBS0o
 MRezGnITcky/gcFIbpG3XBnj9/R3HQIplTy7h7GlVMBHhVMNabmVg31MPMN7v1Wojg7i
 +6zI0y9KZiHosm+b3FQqWZCvUHvkSt4dVTCw+jb4H3jAjDm5rEaV044s3xQVZZc2H48y
 6/5TKqH3Ut1ZCxwfFdXs8Rry1Nj9Y8ijbLn1vOBMnUE/JR01VOy5CmHVykPcXT/RNS2J
 hKXQ==
X-Gm-Message-State: AOAM530RVN0x2XA0CtnB8UFvDiOVsuXUeBVe2OhUJc5HNJcyF0c2ofs5
 +CrvKI4bGzYSHbrUD568MCLzVsX4QbZcaQ==
X-Google-Smtp-Source: ABdhPJzkZfffeazfxUUKT/KX5KVZg/NU11I6xsUM7dCUL1k/5c+oHCs7ac26AzXT3No02tfuMMAdOg==
X-Received: by 2002:a65:6448:: with SMTP id s8mr416300pgv.405.1594667017044;
 Mon, 13 Jul 2020 12:03:37 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id w1sm14553021pfq.53.2020.07.13.12.03.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 12:03:36 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-amlogic@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2] arm64: dts: amlogic: Add the Ethernet
 "timing-adjustment" clock
Date: Mon, 13 Jul 2020 12:03:32 -0700
Message-Id: <159466696386.22745.2608870599482313734.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200620162347.26159-1-martin.blumenstingl@googlemail.com>
References: <20200620162347.26159-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_150339_465256_5D94A1A8 
X-CRM114-Status: UNSURE (   6.90  )
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
Cc: andrew@lunn.ch, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, 20 Jun 2020 18:23:47 +0200, Martin Blumenstingl wrote:
> Add the "timing-adjustment" clock now that we know how it is connected
> to the PRG_ETHERNET registers. It is used internally to generate the
> RGMII RX delay on the MAC side (if needed).

Applied, thanks!

[1/1] arm64: dts: amlogic: Add the Ethernet "timing-adjustment" clock
      (no commit info)

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
