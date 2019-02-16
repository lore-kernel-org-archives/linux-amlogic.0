Return-Path: <SRS0=BRF8=QX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77DF5C43381
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 Feb 2019 00:01:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46C13222DF
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 Feb 2019 00:01:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RrykGxjU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="rKAdlTVM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46C13222DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:References:Message-ID:Subject
	:In-Reply-To:To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gpADHU6SUl360SQGQ7gMiY1HyWwpEdjtexLR8bZvijs=; b=RrykGxjUcCI8zK
	YIgMylMoWjZBCAyQsTcGOaekjbUOfq8hHBrJ3gr4fhvkf2hN+LfvJgbOnPIBU1/wfmoLyUuqGAGVA
	mKQtLP1+D/KMV47l/AibUK6rE1v+98ugbaCX/l9J+TLdS9Gr7vi+bYL2UcVFx6lD9uGz4ILoqNmEv
	WWYL9+LGqKxpqSk1Dzx8Vv3PabyzkPWUH5dLsPab560T6ieS8vPGFHqIU1fEktZTlpX52p8DwtVeZ
	t2X4cznqBLL98F3l55/fTkD5cFsv8PA90VLT7WXk2ZjzDdRrH1yHCW2yw5bhMjprhKD+XWLLk/KUh
	ZKaipysY8ksxexStnmBA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gunPp-0002CT-Qd; Sat, 16 Feb 2019 00:01:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gunPn-0002C6-0Y
 for linux-amlogic@lists.infradead.org; Sat, 16 Feb 2019 00:01:08 +0000
Received: from localhost (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A1727222E1;
 Sat, 16 Feb 2019 00:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1550275266;
 bh=IkITJA3qYhkHjsUactjLI8hvtJNr7oOBsNMoNQkN0HY=;
 h=To:In-Reply-To:Subject:References:Cc:From:Date:From;
 b=rKAdlTVMqqgjP9Tmkpch/jUV9XcCu2G9QVVebuA720n5A0Dtdt4a1Rokr2UxmDROY
 qbudKYqiJG+3GDsJlush9cQAXoqOtU35uxONCxBdx5n+w6KFA55xQKQpIw7H/Z/jh4
 rNqSeUP0KbOnpUlpw6rxrV9NDDWCo9pfPsSlliuo=
MIME-Version: 1.0
To: Neil Armstrong <narmstrong@baylibre.com>, mturquette@baylibre.com
In-Reply-To: <1c894e44-de4b-aef8-d3a3-f371bf2d2f68@baylibre.com>
User-Agent: alot/0.8
Subject: Re: [GIT PULL] clk: meson: updates for v5.1
Message-ID: <155027526588.115909.7947025741302263249@swboyd.mtv.corp.google.com>
References: <1c894e44-de4b-aef8-d3a3-f371bf2d2f68@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
Date: Fri, 15 Feb 2019 16:01:05 -0800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190215_160107_074535_AACF56A5 
X-CRM114-Status: UNSURE (   4.73  )
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
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Neil Armstrong (2019-02-07 05:23:49)
> Dear clock maintainers,
> 
> Below is a request to pull updates for Amlogic clocks.
> 
> It covers essentially refactoring AXG and GXBB drivers to easily add
> support for 32k AO clock support and G12A clock controller.
> It also fixes Mali GPU clocks for Meson8 SoCs.
> 

Thanks. Pulled into clk-next.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
