Return-Path: <SRS0=3vaB=QP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 593C5C282CC
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Feb 2019 00:52:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AF4821907
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Feb 2019 00:52:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fVJLMLmz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="PkS72uz0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AF4821907
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KGxx/sZUjQUucZ9iaUe87DQtFKgsZM2MBrF6A80jw1c=; b=fVJLMLmz78UUMH
	APTvUmung44eGNZDsy1ZCY5HyuodJnVSJTjXTLKaywhyK7Wa9XDffVsUrMIkLQps3nepFbzEX30Wh
	5yv3jymVaMpdCSIcZ+E++oQZeFGwggXlQoRwi35N6oHhIhio/torv7XGEcuF4OiMu9hCWILiSiqPk
	oD431JKX4Y+5nE9l4QZHy+uT97Z4OqujIEjS86QgzG3uQGZ19noSUcAJj/Z3XKHBxhppig7NK8K3c
	30RxS9D234R9vzkoNiXAaO/2y2edSCXGsBn9oIqeJZVPL16HhpwRM0JdYE37p6/5LZWykcW+BlPm/
	2vm0Y1DC0VCeuh6m86iQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gruPV-0000p5-OR; Fri, 08 Feb 2019 00:52:53 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gruPT-0000oQ-1h
 for linux-amlogic@lists.infradead.org; Fri, 08 Feb 2019 00:52:52 +0000
Received: by mail-pf1-x443.google.com with SMTP id z9so853409pfi.2
 for <linux-amlogic@lists.infradead.org>; Thu, 07 Feb 2019 16:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=pna5PQ6isrBAB3aTHUhUZYVF371WUTwDp+BF/t+C/MI=;
 b=PkS72uz0uAWG9bbtkFXEezORMZnaKrTA2Cl6YK5aUB9E554Lxbc+YnhC97U0SDvUka
 ++Q5jT6FDVn5hCzD57z8pL/J7VW2Dy9Nh9Gl2UJMtt6vTYRjl+70J3vcSlkZr/nTDrzF
 K1JCDaVv6WYcOGRSwGxYNl66v3uQAc9tU/2bZVMwmeJ9HDCWs2Ezle0xY5fb4iKubKgr
 lkoU3uAjmxUEwHwE3b1Wb+g/wVOi/Ww6tOtMdIVvDbRm8UrMqPxPjQV5vrJfVvnpwE0p
 CvF/6tY/nAEjRSy6ocgIGSWYV61KO+70OtEa183CfX9J7nsabyz8eHCP1ecyZmH9llBZ
 NipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=pna5PQ6isrBAB3aTHUhUZYVF371WUTwDp+BF/t+C/MI=;
 b=EonfsrkunRL1qCOz+buavYMfuwCDPHuKGOWVTM1r57arqoRNFQRset2TUR6ljgcMjd
 /sdbbqwK3Qo7TfHwJigXE5ueRqCyDO2vVd3HDnIrU7srg/UvLIz8hcJqlp+R6xscfILH
 MztffXVyTXwIS2Rgrdwbs2vhuIwQR5LoxC3a278Ytr2HxTURnbHKIV+A87Aotlc12olB
 iyQbwEYXqxUHx85lL5r5dJjM4utcFp7OFT0PTbjvv3slKP+TKGZ9LB/+K+xTEKrJTClk
 5oMqy2rMvozy1LtqXv/GAR9PK2JSPxRfnCJ1Ml0Ot3aGvGuGomq1hRNmIZqwFQYoQyhm
 ppfw==
X-Gm-Message-State: AHQUAuZxS8DgFvB/BxubgwqJ6W87dazrRXABtf1e7MzvHO82A6rMWl3I
 Yy0oM+x8oWzIOZUhMGePJyVNeg==
X-Google-Smtp-Source: AHgI3IZtHELm0XiYrNwP8mgmR0kL4wFcUAoa43JPc9pnhrJ/OZ/bdUc6BdhffybgoCtHBrBlR1rkfA==
X-Received: by 2002:aa7:84c7:: with SMTP id x7mr10756119pfn.180.1549587170484; 
 Thu, 07 Feb 2019 16:52:50 -0800 (PST)
Received: from localhost ([2601:602:9200:a1a5:1818:ce94:f47:7c12])
 by smtp.googlemail.com with ESMTPSA id g11sm414133pfo.139.2019.02.07.16.52.49
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 07 Feb 2019 16:52:49 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 2/2] soc: amlogic: clk-measure: fix-up some clock
 definitions
In-Reply-To: <20190207132603.694-3-jbrunet@baylibre.com>
References: <20190207132603.694-1-jbrunet@baylibre.com>
 <20190207132603.694-3-jbrunet@baylibre.com>
Date: Thu, 07 Feb 2019 16:52:48 -0800
Message-ID: <7hr2cjf6e7.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190207_165251_094541_902B7711 
X-CRM114-Status: UNSURE (   6.03  )
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
Cc: devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> As pointed out in review, a few clock are not properly defined.
>
> Reported-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Fixes: 2a4c63e080cd ("soc: amlogic: clk-measure: add axg and g12a support")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

I squashed this with the original too.

In doing so, I noticed I (mis)applied this to my dt64 branch, so while
sqaushing, I also moved it to my drivers branch.

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
