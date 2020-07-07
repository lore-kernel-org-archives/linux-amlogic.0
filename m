Return-Path: <SRS0=38i7=AS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C711C433E4
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2020 18:51:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54AD220771
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2020 18:51:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RSIMOGq6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="z0qAVq8h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54AD220771
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aawwnBmRZxl5fiHqDHrA4+N086jnFXk/bKRuEG5lhF8=; b=RSIMOGq6lA87LTI4kIMNfKAs/
	MtE2eeGsojh6vkaYqLM3GzX/iwFpikS3ML+G69wr4M3/HN/oJmf0XPwDqrHekqMzLlYbm7nuxUEs4
	AvYLG4Gt7qDlGhgL4CNA3vg6DroZw1mvNMD95y/3raTSmMNxfi+IwFLiUpBv0Supdd61M0nJG04ZR
	CUzPIAJQvCT2pBtbPK4Kois2tYjlnRkpOklcflMppbSV0wXPpIzNJrCzgDqsNzeMR/WQyrxaFni4V
	dG9m/YbN8Uq1+BnmwEnquEjHoNiYSlzyzQ78+rZJ/Nv9495anyMSMsgfellzzbcabXoK86i4yjArI
	6uvob5C/A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jssgY-0003Kd-7D; Tue, 07 Jul 2020 18:51:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jssgS-0003Fq-72
 for linux-amlogic@lists.infradead.org; Tue, 07 Jul 2020 18:51:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594147870;
 bh=99zoz3vCimgtZQE9kQzJMp3RY3m3dkhaJi0zsOcxisI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=z0qAVq8hz8HvjDWDO1QYKrX01H9Vd9HzNnxx3AUa7ctpCw1WjiXxu3FLxZayAtfDx
 TeE0luFjJWDpyaNs/JE+lIa6ogZpwVuHgjgKH3HlITG4rnval2XhTKAarfeON4Uhhw
 gbkYulb3+Uamr1oECgFH5PRW6d0ULcm2IzLU8KyU=
MIME-Version: 1.0
Subject: Re: [PATCH for-5.8 0/2] dwc3: meson-g12a: two fixes for v5.8
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <159414787093.3387.14947342979354657073.git-patchwork-notify@kernel.org>
Date: Tue, 07 Jul 2020 18:51:10 +0000
References: <20200526202943.715220-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20200526202943.715220-1-martin.blumenstingl@googlemail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_145112_392078_0BA65A4A 
X-CRM114-Status: UNSURE (   6.83  )
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
Cc: linux-amlogic@lists.infradead.org, khilman@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello:

This series was applied to khilman/linux-amlogic.git (refs/heads/for-next).

On Tue, 26 May 2020 22:29:41 +0200 you wrote:
> I discovered the problem addressed by the first patch while I was
> investigating a Kernel CI regression: [0]
> It is unrelated to that regression but should still be fixed.
> 
> The second patch adresses the actual regression. Testing was focussed
> on GXL and GXM for the previous patches. Unfortunately one of them
> regresses USB on G12A, G12B, SM1 and A1 SoCs.
> 
> [...]


Here is a summary with links:
  - [for-5.8,1/2] usb: dwc3: meson-g12a: fix error path when fetching the reset line fails
    https://git.kernel.org/khilman/linux-amlogic/c/be8c1001a7e681e8813882a42ed51c8dbffd8800
  - [for-5.8,2/2] usb: dwc3: meson-g12a: fix USB2 PHY initialization on G12A and A1 SoCs
    https://git.kernel.org/khilman/linux-amlogic/c/347052e3bf1b62a25c11f7a673acfbaf554d67a1

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
