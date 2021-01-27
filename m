Return-Path: <SRS0=O9cP=G6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 613D7C433E6
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Jan 2021 18:04:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FF2E64DA0
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Jan 2021 18:04:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FF2E64DA0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=D9kE9EWDo9xjPxWwQgjnoHDPtAEAHR/fBf1NAmGDCYM=; b=CraWz5dgy9+ZdZMG9nj/Oldi1
	VJIm/Zs8/JqPFiG3fskoSt7K5ibLTtSSaahuKxh+Kz6FR6TQ4x7k7gKw3jp/SphW3RSZ107kdTJeM
	g386p2wTcN4tfZRyVV2kc78RK2PlIElj44qE8SKx/c8w7I/tf8bIMWfakVC07XcCG+m3vNwdIJy+W
	ivlZOv6FjQefnB6MRSJKhqLeDl5H/ocTmyMO4BLOwIy66xkr//Ow1rGf7SGjiVg1fDGPnTT8jhW7P
	E8gRvXyMiwAHlncPvBQa31d6DhrArM+uFfju9kTw6idhpgtDFt/wFWrwEqbGU+fkF0eMLuY34avm2
	cC2sIG1Nw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4pBN-0007or-Ki; Wed, 27 Jan 2021 18:04:45 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4pBL-0007nf-OQ
 for linux-amlogic@lists.infradead.org; Wed, 27 Jan 2021 18:04:44 +0000
Received: by mail-pg1-x52c.google.com with SMTP id b21so2108658pgk.7
 for <linux-amlogic@lists.infradead.org>; Wed, 27 Jan 2021 10:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QwsWwt6yAHjK9HfVabcgNu82UtKfBUdWpM4ef78ZV3I=;
 b=wiO+ivWvSpUYWfyfpPlSXStix3+/FQAsTydsfiZm3SbqcNtYhazTuwG5Qt2a492wJn
 yDIk5PUDdqhOe7D2C9EPIyhnH9B2WdZ5X5jDnNRul99E4zf7xq9YDFn5gF1xoY+IzlE7
 OVoKFu64Y0XHXZelv7Hr/N6S91NBZwIgh0reZEE4/TmwgAJhEbXkqj3tWBVPkA2Kq/5G
 //MkxqAoUtFRzPZO8cKe3/eeq3FaJhWNZN5aV07rLbtQsD1jD9EBqkm8BwfcWnI2EeM3
 JM4HYC5+MkuBsBxxR9y8dl+UabTVtH5zP8SZTLdjUrlYrNJyPju2trfXyCB2RQM0U4gR
 /36w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QwsWwt6yAHjK9HfVabcgNu82UtKfBUdWpM4ef78ZV3I=;
 b=X+/QMPK16QmJZMIVvG6ir/+4K3OCeMOsCCFmrakzJdIaCgNyKuBjo3xTl0e6zp2Ui7
 o+4KKjTf+AQF9qdv5U34GTepDwRn9OOXdBzcds5635xEJsA200aF3jtYqRsF9Jg5ggMR
 3DKNcr2VDW4cWtmoTyNEQ+OMnEnOJony3WULs+hC4ixeh4eSlerYLTKzrKLiYa5JZroY
 5lA680I3vbCWqAC5mlqlvUzuU3MIPE20UaDKICI5Kadw1IaanLZIWvUh5yfjG4vrkRyW
 8T+E3UVeLCba8DYi+D1XF6PqutOL2RRVwlRLDXZjk0O3ZOkzVzj91nrLYhPkLRLpJUdv
 27bQ==
X-Gm-Message-State: AOAM5339thDgLVtsaX8bRXtz2FXaZ0rIl32eRUwMvyjJinIBb29tFF+D
 HrhxhN59Bkz24dvw8TQBD+izDA==
X-Google-Smtp-Source: ABdhPJzbBLxWLKPHKRPU1ciU8xZx1TLCFPLX6mwn7aVtDJ0xSlZbVVNDhmsBQJzTfKE+z3t0A+lrJA==
X-Received: by 2002:a62:aa03:0:b029:1b9:7cb5:bbde with SMTP id
 e3-20020a62aa030000b02901b97cb5bbdemr11756431pff.14.1611770681170; 
 Wed, 27 Jan 2021 10:04:41 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id kr9sm2693998pjb.0.2021.01.27.10.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 10:04:40 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] Revert "arm64: dts: amlogic: add missing ethernet reset
 ID"
Date: Wed, 27 Jan 2021 10:04:40 -0800
Message-Id: <161177067430.24026.4667361379559642494.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210126080951.2383740-1-narmstrong@baylibre.com>
References: <20210126080951.2383740-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_130443_848711_AF11871D 
X-CRM114-Status: GOOD (  11.14  )
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
 Corentin Labbe <clabbe@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Brunet?= <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 26 Jan 2021 09:09:51 +0100, Neil Armstrong wrote:
> It has been reported on IRC and in KernelCI boot tests, this change breaks
> internal PHY support on the Amlogic G12A/SM1 Based boards.
> 
> We suspect the added signal to reset more than the Ethernet MAC but also
> the MDIO/(RG)MII mux used to redirect the MAC signals to the internal PHY.
> 
> This reverts commit f3362f0c18174a1f334a419ab7d567a36bd1b3f3 while we find
> and acceptable solution to cleanly reset the Ethernet MAC.

Applied, thanks!

[1/1] Revert "arm64: dts: amlogic: add missing ethernet reset ID"
      commit: 19f6fe976a61f9afc289b062b7ef67f99b72e7b9

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
