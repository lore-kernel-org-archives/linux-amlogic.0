Return-Path: <SRS0=EYbA=WB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67C71C0650F
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2019 20:57:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3322D2147A
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2019 20:57:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PyrxpAjK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="dI55BA8R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3322D2147A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GadkLodFH2UTUZWKh2i93lcHK2cNN9dCcUzyE/Gjrzc=; b=PyrxpAjKlD+ccB
	/jJceTQRCogJCHFw6JRk35w/H3ZQQ9Fi2coUTxlRWVwAWbgTRFHMtOEdtyO6uN/b3MsdYGVGxnjxG
	j30l89xUSbxW4bjI8XAXxVr7RLUzUHW0J2tgklrMssXIO4MvHUQeHu/mZENpQY8NPx2WRzPI5gLVd
	Iv2UVvMdCeJg27ZFcZbe3f93dkSguNuLfeFSlaxuTP3OUMHYtkFEVqwKxn3GCvX2kFcERjKx1wV82
	5HKUAaq5U3H+4pJJpvFvRC7UkGITCnq3AWE/t2UrC9bX+lhnsr7izbV4q9MuF/BF4h/AcwD2PrJQ+
	v+w6gwuO4On0i3jBpgdg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1huk2p-0004kR-1J; Mon, 05 Aug 2019 20:57:27 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1huk2n-0004jM-8U
 for linux-amlogic@lists.infradead.org; Mon, 05 Aug 2019 20:57:26 +0000
Received: by mail-pf1-x444.google.com with SMTP id r7so40243719pfl.3
 for <linux-amlogic@lists.infradead.org>; Mon, 05 Aug 2019 13:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=MBL6QC5vlpzt5AngG/FRA3lcAQRQn0eH0TwH8QaWuhM=;
 b=dI55BA8Rc5L0QSs0H4asppkLBJnET85ehWDm3dOabaNPcD1tC57hPZW2xlBbrdERdW
 OHHgMQWNrOou2yw+G6GbBnHgHZ2R4uRBYW5UKBrvsZYCVRC1PJEREcnTkKsLYggHyB0C
 dwqSZI5UjSBK8z0e9PBQ+cOAnoVi3HeVuYuQIu8l2sV8Va0ma/a5HOWocV4d5Q835vcj
 hciHn5PxKIER5+hSQoZ3MWizab63fyIunxhFUmW522/kQ2Cx0Mn1RGyni6sJEqv2r7tV
 R/zDWe2jsVp0LAxgE+ZNLdvQ6WQw03tS6lk1RNuNVzNa8k9rpYlRTkISf6G0wo1R51kU
 YK6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=MBL6QC5vlpzt5AngG/FRA3lcAQRQn0eH0TwH8QaWuhM=;
 b=jXfdOFTiWZh94hKGGI3F1wrHtYYUpmP6G6JofyQIeSgfLzhtlT3KoKNdSU+nlNS5Mn
 vORhostno9mzD0H7miGb7n0ig17tGEP9qfSJBwdKBZ5cUJjQmASLnOHVBPnRmXxsqw2r
 5DrYCyf/fGpnPvNH4jF7bqpjSh2hP0rICE179rdV1A6MHj1IY3ejjqxV7qqe3QfQicVd
 ac8YRqfNQXEvKDayySBpQtaRtrDbDwTmBMRDJeJNbgh+jgQhm+GekIuMY1VEnQ7tE8ZE
 jMxoXAiGWoFYmG+VwsKIb8zpdEci+oWgrB6HvoPWzUifzqKsgy8ZckHVkqAo7PfKhw4V
 gXlQ==
X-Gm-Message-State: APjAAAVVXZIJk12v+hHaBQxQLQJT5Q+wkC27fZTjwBW7mBJvJ2Dv2z0V
 iteS1QrP8jjt8OXFfNmGWVuEVQ==
X-Google-Smtp-Source: APXvYqzpNga1cFOZRQehsL3w0s7LtZw+r6OECWH41h2VT7tp/iCGiPCuVTQUq2IXEBnZ8xJz7SRYXg==
X-Received: by 2002:aa7:8b52:: with SMTP id i18mr76135064pfd.194.1565038643597; 
 Mon, 05 Aug 2019 13:57:23 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:7483:80d6:7f67:2672])
 by smtp.googlemail.com with ESMTPSA id q7sm96589013pff.2.2019.08.05.13.57.22
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 05 Aug 2019 13:57:23 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] ARM: dts: meson8b: add ethernet fifo sizes
In-Reply-To: <20190718093623.23598-1-jbrunet@baylibre.com>
References: <20190718093623.23598-1-jbrunet@baylibre.com>
Date: Mon, 05 Aug 2019 13:57:22 -0700
Message-ID: <7hr25zgwjx.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190805_135725_299566_F5518796 
X-CRM114-Status: UNSURE (   7.66  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> If unspecified in DT, the fifo sizes are not automatically detected by
> the dwmac1000 dma driver and the reported fifo sizes default to 0.
> Because of this, flow control will be turned off on the device.
>
> Add the fifo sizes provided by the datasheet in the SoC in DT so
> flow control may be enabled if necessary.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Queued for v5.4,

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
