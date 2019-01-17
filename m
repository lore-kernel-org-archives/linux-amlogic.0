Return-Path: <SRS0=bSlY=PZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA7C6C43387
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 20:03:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 799C220851
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 20:03:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TXm2UFzN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="aD13Kdz2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 799C220851
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rjicOwK752+ZPqKadd4AQu7ZeffDA5TeBDmDdis8pFA=; b=TXm2UFzNZLx/wU
	QhVle0d0arCr4hrlZAb0BHV0D5/TqLUPKJiKCTTwi+paaS1A6ww22UamKZqSuJESZgYqw2+hCo08R
	/WOWUy8VVKqQoGjqNOLUTzb//9rbKWMkPrV3t/jM/pfoilRVmSvY61BH4o4v8KgqG0kJgfHR2G59r
	K4rZof2feRDMoG+zxfSDUgFUkSdn6ISz+e/ytroiVyH7WTowfq/A88Vs0/bEYUy0jqztawKXBMseL
	WaoRfKbmXb5Ba08RGAelGv9aY7ukAz+OgJOUgBxjg6TD5RdnpvGzAzexAi52KR3Hivghnwhs2/Tpp
	V73nJ7aYAVT1aKCQnvUg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkDss-0005e6-0p; Thu, 17 Jan 2019 20:03:26 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkDsp-0005dj-K5
 for linux-amlogic@lists.infradead.org; Thu, 17 Jan 2019 20:03:24 +0000
Received: by mail-pf1-x442.google.com with SMTP id w73so5330916pfk.10
 for <linux-amlogic@lists.infradead.org>; Thu, 17 Jan 2019 12:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=hIlhBjUpNVmhVeFqkagr6YgEYKL0wp8AtqQdEiDvviA=;
 b=aD13Kdz2grJBnVSGAPgVuYWonzn1LgeA2Y/mmi1YZyVxF3RnXxeLsnTqwCtukb113+
 RaZFtIVNohstxLc+1v0uVmfkJ6t6iV9RzbYUxjiOuxEFLQmIdd9C5Szn1uMMXGnItvsi
 V/zxrmjYomi5yaUWDvBdDQ/tU7x6TcymiIxzhYnaP3SMxRXmK/QalAzBKmbOiASk+Yzu
 rwG+NwWY1NjOX2mxsIwYlZb2NRflyVgS96phoP6HvXMmuWd9Z+aoL/dDkjDAF+Cjto/C
 Ut8U0cih1ppLucimxxzHcjvmvyNsIaDuMsU8+YxZeHExv8vyehaZbq+8SLfWB4GXGqP8
 8TnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=hIlhBjUpNVmhVeFqkagr6YgEYKL0wp8AtqQdEiDvviA=;
 b=nYgu2+qya4OOQorX9rS8YYvLpvnIwywV+WWUZDzb5Hzb13tsEY20AO4qGlc/e58Ws1
 J8btUeDtNghu+RBIVgZ8+dECvVJJabfASpe39qMWZ4v1UFqYfSZNAkb/DiM6P9LmM2lW
 i/V6QMvLghLPFIYWL/Un5FvembC5SIa0tfRDXvjbnVrSX2MOyJyYYOJn9wgQbWGmS7cf
 6xdwANOnzs/HLskKBSNXmRXkjeKlFDgxVdhXFWKd6/cJqWRr+UY8cS67/mtWenFoZan8
 1fEdLMleQLAKUKOQkbWc1OKRfgxlsyDjDLRlxSIg7NKxoOXLilxoMekR7vpXO/6qoQyr
 k8ug==
X-Gm-Message-State: AJcUukeXItVAv+IlAV//Rdkk6YNjKeUbgZp/JZdrgXhe+qv+mXHQ+lAb
 6TxFJ7sosUtitvI8IC/ZppW+BQjG9vg=
X-Google-Smtp-Source: ALg8bN5vHwVvegLMW8riGwQ5aIJB820UMJaxf1UPeLZIlfWDYTSMw5WKAtjJ9HexCFrpZMfLtc575g==
X-Received: by 2002:a62:1542:: with SMTP id 63mr16368299pfv.230.1547755402881; 
 Thu, 17 Jan 2019 12:03:22 -0800 (PST)
Received: from localhost ([2601:602:9200:a1a5:e076:9fe9:59e2:1e0b])
 by smtp.googlemail.com with ESMTPSA id y5sm3191723pge.49.2019.01.17.12.03.21
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 17 Jan 2019 12:03:22 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson: s400: enable sdr104 on sdio
In-Reply-To: <20190116175913.5907-1-jbrunet@baylibre.com>
References: <20190116175913.5907-1-jbrunet@baylibre.com>
Date: Thu, 17 Jan 2019 12:03:21 -0800
Message-ID: <7htvi7aw6u.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_120323_656134_0FEE35DC 
X-CRM114-Status: UNSURE (   5.97  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 patchwork-bot+notify@kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> The bcm wifi/bt device on SDIO support SDR104 and it seems to work
> well following the recent mmc driver update, so enable this
> ultra high speed mode
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Queued for v5.1,

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
