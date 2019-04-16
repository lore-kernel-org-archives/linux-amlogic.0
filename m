Return-Path: <SRS0=v2ss=SS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECB6EC10F13
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Apr 2019 18:52:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1874206BA
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Apr 2019 18:52:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q44p5hvw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="qSJBe03W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1874206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h/2/apsJOj3HcKYp30SNEE5OnXA6VZ04tQluQRuYkWg=; b=q44p5hvwy7YurL
	9h/c9gRO1EahZxvhCuhFR6j/942VcTFKmL2BA/1h4xVG5FXJjZ+1yMJVUeb7hJtMst4SBXS6u062v
	sMSle3e7H0F2HVEhpY95P16XmXUxoRvRJxHUpXh/Jlo4+6jn3wY8jHqak7EanEMYaIKp2qqqKCyqG
	GNAqJ/kbayOjE5mf7TOuqdq/Gk8FtARqUK/qB6+kNtaTTs5S1Q+0AlHF/PvY3fvtSsEcwGTVNyXxp
	3BKwTDAgoOcGZtAS1QSeMdSf4WczjXo8mxhzd+F0vM7yeD6fcYolB9Q7WQOalLhT9AJOr08AEGB/g
	Ljn4O/fzBQ5wqJEDIJVQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGTCK-00082I-S0; Tue, 16 Apr 2019 18:52:48 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGTCI-00081k-Jy
 for linux-amlogic@lists.infradead.org; Tue, 16 Apr 2019 18:52:48 +0000
Received: by mail-pg1-x542.google.com with SMTP id k3so10772027pga.6
 for <linux-amlogic@lists.infradead.org>; Tue, 16 Apr 2019 11:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=ZKHgNuLiACuudZS2vjl4WNa+63x+Q4ciB/rqWwwQ8ww=;
 b=qSJBe03WwEDqSAOa0QsC6PcLBsG1FI72M6LCj1t7tHS1jWXUnDCoWa8mSIHBrPriSV
 fHHsInWUn83XGjBksGIK9U9XsDNxb2pLCys6VIQ0xCpGrMH0l06W5VLNFmdIC8mLqA0H
 QxJckKyDPnYQzPQ0JfdMR6harraFljz7AgbgwntnIGaxFP5BA1ZESKA4oeciLKoMyfNt
 7w9TySAa6nky3D1Of9gZ/rfwS4MbyRo7eEd4cIElMC3b3Z2o79qE0tg4wJoGBIBfzFvE
 tgjvhR4Gc7oU/Oo+/WXrzB+JE8hjR4+6KYXpbosjfm4hvwyWxJUTzVxPSu/N+S908HuM
 U3Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=ZKHgNuLiACuudZS2vjl4WNa+63x+Q4ciB/rqWwwQ8ww=;
 b=R+Mh2LtdLoP3DaXcO9Bujrh/15UVV0FtcdIpgeW+n21Pjd3nqCM+YCDBqpTSkbntvK
 w5ZxrPUgjI3DiwaA+pIqgDQ7247jze3XSw+QEgIeKGbr6GxtMvDFbyOUR3nZ9+teHoyb
 H71Ga9mvSvcwgpEUFIF/SiAy9t6KgQfoZ9dRCTajJiJ0twursk4qc3daSjIJd0S8RWRR
 OJMqyKCUSPTPM08k6zYS8J2zgflMP7GaJqN/bmEH7xt1xJ3n9n8gyRRf3IEcaTXGSPJ6
 u/IQoREpbEvPmhSE6CBd7pdrJpTOneasCz9XhQSPhUQZuAa6vEEprzxdCWLPOAnlNes6
 ZNvw==
X-Gm-Message-State: APjAAAU+rVrkaPZ/8GEJcnsOfipncfMEQKY38Ze99Gel6BR+HdazQVUg
 iI53ZPQ0se9ClnYedwGsQVmO+g==
X-Google-Smtp-Source: APXvYqyTEVQMGDcMyr4GdBcXOoqeKCogr90iOlwDb0Bkxo159RFNuuF88m6wdt4vePNjRZtFM103Eg==
X-Received: by 2002:a63:8143:: with SMTP id t64mr76792640pgd.301.1555440764837; 
 Tue, 16 Apr 2019 11:52:44 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:c45e:7ed8:c242:3563])
 by smtp.googlemail.com with ESMTPSA id u6sm53222600pfm.10.2019.04.16.11.52.43
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 16 Apr 2019 11:52:44 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 0/7] arm64: meson: g12a: add audio devices
In-Reply-To: <20190412125136.28232-1-jbrunet@baylibre.com>
References: <20190412125136.28232-1-jbrunet@baylibre.com>
Date: Tue, 16 Apr 2019 11:52:43 -0700
Message-ID: <7h5zrdpytg.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190416_115246_657553_40058CC4 
X-CRM114-Status: UNSURE (   7.30  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 patchwork-bot+notify@kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> This patchset adds most the audio devices of the g12a SoCs.
>
> Kevin, couple of things worth noting:
>  * This patch depends of the new audio clocks binding recently applied
>    by Neil [0].

Was this supposed to be part of the clk-headers dependency PR I
received?  /me looks... It looks like it's applied right after the tag I
pulled, so I doesn't look like it.

If I should queue $SUBJECT series up for 5.2, I'll need another stable
tag.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
