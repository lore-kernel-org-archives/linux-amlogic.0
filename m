Return-Path: <SRS0=mdkS=XT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E06EC432C2
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Sep 2019 18:48:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47EB8214AF
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Sep 2019 18:48:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f9Cjw3Yl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="tmo/F6UU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47EB8214AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lP5femfuwvQU2G3P/25FPBQemQ9QWWk9L8OE0zppCP4=; b=f9Cjw3Ylli7iSe
	l2kdpDaUf7EJHV2rI2Pk8PWq4T6PhqaIVjcJVlIpzGalkEirtmZX/vtsWgiybUtUgwgH/i2wgpObm
	bA+VGfo7OgIgt18Y8vVMl+9T+09inPlIGR93Hb2xl3v3iwpAGB9t4GyCcXRdYXgRd34ebqMPaUT94
	Fjhw+h23W3hcFXsoS+ullfFwmLnpMiVe9YSUJFvS7ozlnffMU9vMO4MqujQoRUuMgAgY4oXgZfSsm
	je9/MYY7kOAY1p5K6Avd4kkTlnCm36lMV45LBTXMsHJWpQcASl4dM0EIfW8j0Ot94c5trl/J81CUx
	UjkbasFNSn4Frca8aRTA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iCprV-0001uz-UH; Tue, 24 Sep 2019 18:48:34 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCprT-0001u7-P2
 for linux-amlogic@lists.infradead.org; Tue, 24 Sep 2019 18:48:32 +0000
Received: by mail-pg1-x542.google.com with SMTP id a24so1803806pgj.2
 for <linux-amlogic@lists.infradead.org>; Tue, 24 Sep 2019 11:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=/Gs2SEVlSqePfjrkCoHnuDKQ33QOLsDsvKggi3UpzbY=;
 b=tmo/F6UUeLEahLahDCvoebK/q7O5V1CjVObgCdyyxdlHJJ36yVWKmQ9Qb4epsZkEzj
 jP1bUcgBFlkrFGN9j4tnepo/sbGzuexs4JQovch+YSRHV889VgA2lha6jDC1fFDmsbvh
 9tiQ55lqv9DD887G+rPkvGtjp9ZRT7QwJ73NYlaBkgDa6lvXrtlyNeT2acH4BI8pfO1e
 G2XevQqdLoqY87hm2eXU0BQ9fx/nbvkpBbFpjdJSBfG1HrWx67FCM5gkR9SlhjIP5j7s
 m+roYGfPssgtEMVPnGMRBiV92hAXOkWkYvYOrSKPV88jTD6ovJ6/v2+nTMRbCK7yTVhO
 hhaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=/Gs2SEVlSqePfjrkCoHnuDKQ33QOLsDsvKggi3UpzbY=;
 b=uZuMrXyGIvq6UYHmBifMQEzYz3NsOzqwOo8ClNDO6qsalC02kEGkWIiqoRxpkxSgcr
 Sfft9UjK+BtIOnBXH7t5RhnstD0Z67/0DRemyealMpL24N0X9aTYhwPQbBlby2hsey/N
 R226FFG6X6Sp2eKQpC7rUbySLZ+ae3ka2wucl7cxs1U3WyTPEak8AutjLTxRVJ9XJNYU
 6LKBzcAzz/lJKmM1JxpPIuWEwvo6VU6jHEvuaSOnl8TONzK7sKrET/g23blR4pd2KOad
 mw9Sz4BJUTHyUb7wPsPG8YS7tWJ/Lk5PUzPi40orWY5RHl/TNrzLj16b9L8inkMMbI3u
 qIqg==
X-Gm-Message-State: APjAAAVwC/vQZdCrS/BIugF1iviFEnDywfTTJWmCfh/MgfwCpPOIDyqc
 oZ42rP/aAwPEZStxPK8xpSAx1A==
X-Google-Smtp-Source: APXvYqxVWTilgmitrceJD9q3n0Mnr9/BCYQFBcLpT+/7r0uQ5kcFbk0uDh0PSwWsPNYGdqtRAI8fJQ==
X-Received: by 2002:a17:90a:b001:: with SMTP id
 x1mr1622471pjq.114.1569350911212; 
 Tue, 24 Sep 2019 11:48:31 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id x8sm2440739pgr.30.2019.09.24.11.48.30
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 24 Sep 2019 11:48:30 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v1] firmware: meson_sm: use %*ph to print small buffer
In-Reply-To: <20190904174835.77370-1-andriy.shevchenko@linux.intel.com>
References: <20190904174835.77370-1-andriy.shevchenko@linux.intel.com>
Date: Tue, 24 Sep 2019 11:48:30 -0700
Message-ID: <7ha7at7cox.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190924_114831_811989_79BCBFE0 
X-CRM114-Status: UNSURE (   4.30  )
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:

> Use %*ph format to print small buffer as hex string.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Queued for v5.5,

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
