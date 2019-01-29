Return-Path: <SRS0=Lc8Q=QF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59B1BC282C7
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Jan 2019 18:05:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25A3221848
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Jan 2019 18:05:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HM8A8Cc3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="EuqlRJ96"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25A3221848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Message-ID:In-Reply-To:From:
	References:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k2reXRgJty0wQ0aqgpFgmw2IW9O+eo7kxNynm9s00u4=; b=HM8A8Cc3l8b7pV
	Sqg1Z448ooyOnUYxXB96IrgQ/lMRcvS0vo8UxcbFz7fNIQv3hVKEAbAiF94tx/1S1WMr07fdDbExZ
	DwCCOFRXN3MofJkeSGvVRXCtqThfIJCBbK0aKsPwJAVgfuBR/BKZLs2Hu08ke/YJbO40SErdA8SP9
	CY7WDTEU5kYdfCBqVmmvDpu+jFgF0WBxo8MUy1HI2Qx3XrgaPhXa+mXujlT8DD8l6yR3Mb+ikNXcA
	xE3/8d8saiCFE4XC4Ht9OvwN16w2YrDv8E1zKZ/397ufR62FsYX8P2u3Fm7J1l2gAB9L6Ggfd6JPs
	G/gcGH99gm2z17c5Mk9Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goXlF-00033K-Li; Tue, 29 Jan 2019 18:05:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goXlD-0002vf-0y; Tue, 29 Jan 2019 18:05:24 +0000
Received: from localhost (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 90DC621848;
 Tue, 29 Jan 2019 18:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548785122;
 bh=UXXKUNI73cmyYpz+wrJMrhKRCBo97XvqotD/XeWdvL0=;
 h=Subject:References:Cc:From:In-Reply-To:To:Date:From;
 b=EuqlRJ96SKeC2oksHrYcCM8ZFfc7UwICC6yXW4sLzxOwzr2yvIY5y2Nu2/yZrf/6V
 G1FQAeKGjsXfoIncT57cWlMKOa2UDS4YFvUtT9k2adrSX07jAnXt20N+owEHQ+vhXg
 pmObpHNNDiNvvRI2maVXX7iUJ+rTnxagGmKirn3A=
MIME-Version: 1.0
Subject: Re: [PATCH 01/14] clk: export some clk_hw function symbols for module
 drivers
References: <20190128180430.28689-1-jbrunet@baylibre.com>
 <20190128180430.28689-2-jbrunet@baylibre.com>
User-Agent: alot/0.8
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20190128180430.28689-2-jbrunet@baylibre.com>
Message-ID: <154878512192.136743.2997052288990015458@swboyd.mtv.corp.google.com>
To: Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Date: Tue, 29 Jan 2019 10:05:21 -0800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190129_100523_138923_ADF50203 
X-CRM114-Status: UNSURE (   6.19  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Jerome Brunet (2019-01-28 10:04:17)
> clk-provider.h provides clk_hw_is_prepared(), clk_hw_is_enabled() and
> clk_hw_is_prepared() but these symbols are not exported for the
> modules which prevents a clock driver using them to be compiled as
> a module. Export them to fix the problem.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
