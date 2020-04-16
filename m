Return-Path: <SRS0=I4qu=6A=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D09D7C3815B
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 16:08:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B7F62223E
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 16:08:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JEqCDdF0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="w0FNOOX6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B7F62223E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QYqLZX68n5q1E2kjQSFcPgVFG1+5Dz4yhmtfmhhtnDU=; b=JEqCDdF0xq2M7y
	f63U5m9t/Oak1wQFOLPHcahDOwl8OWtFp0y+bGblpArGl+cbYgxTfm6+7w/NmgeKDdS2XlQA4LAfU
	36Y8/30chOMl19Jd1Xx3w6aE0EE3O2WruUDUqfCdfHbik33hGd4fVE5+yy/LKYML06MZhO/o31gSR
	2kiT7XUI2PGXZ8ZGN7fg37/WgjapgcHqxGm1KhyW43gP3MPGOZjVJqQTl0GuFOClBass9H2zNXBa7
	YQPhgPYJEuvp8KzCkQCkZ0wMuybiZY4pvIumNSr6lXcalqUSY32biaer6AQ/lQkM6AYWdZCGPy39L
	huXFvmSHMguPr173q1SA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP73k-0008Cn-Sy; Thu, 16 Apr 2020 16:08:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP73Z-0007yW-2v
 for linux-amlogic@lists.infradead.org; Thu, 16 Apr 2020 16:08:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587053279;
 bh=WdZxC1x61/XQWDMIUVKiEI2B8WiWGOlEw5lx80sZoVQ=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=w0FNOOX6d/yEkgdtp4Jso0KbF191yfSaQDXjpicDDEt0zYkZ6ZU/BIC4MReMhL6ox
 N3jiEMyf4syrUkmk3W3KmU+BO/QRZu1LDbCq6ggHbYmOIyopjD+rEES6XaxCx6q0SU
 wlQI3hJXGXrTmYhvMGv1O81tpkQQKXuhFpCvajLo=
MIME-Version: 1.0
Subject: Re: [PATCH v7 0/5] media: meson: vdec: Add VP9 decoding support
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <158705327976.8629.1355942258079376564.git-patchwork-notify@kernel.org>
Date: Thu, 16 Apr 2020 16:07:59 +0000
References: <20200304094625.2257-1-narmstrong@baylibre.com>
In-Reply-To: <20200304094625.2257-1-narmstrong@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_090801_170722_51E1F6F2 
X-CRM114-Status: UNSURE (   5.59  )
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

On Wed,  4 Mar 2020 10:46:20 +0100 you wrote:
> Hello,
> 
> This patchset aims to bring VP9 decoding support to Amlogic GXL, G12A & SM1
> platforms for the amlogic stateful video decoder driver.
> 
> With this, it passes v4l2-compliance with streaming on Amlogic G12A and
> Amlogic SM1 SoCs successfully using the stream at [1] with a fixed
> pyv4l2compliance script for VP9 at [2].
> 
> [...]


Here is a summary with links:
  - [v7,1/5] media: meson: vdec: align stride on 32 bytes
    https://git.kernel.org/khilman/linux-amlogic/c/7624c9cd5b26417648d3b5fe50f5bdef4d057199
  - [v7,2/5] media: meson: vdec: add helpers for lossless framebuffer compression buffers
    https://git.kernel.org/khilman/linux-amlogic/c/09b455d1daf570457d076c5c0e9fa52103a67aed
  - [v7,3/5] media: meson: vdec: add common HEVC decoder support
    https://git.kernel.org/khilman/linux-amlogic/c/823a7300340e36ee2c1941e672f33c9419928d1c
  - [v7,4/5] media: meson: vdec: add VP9 input support
    https://git.kernel.org/khilman/linux-amlogic/c/e9a3eb4819caf9d1408d61af059a21c535294824
  - [v7,5/5] media: meson: vdec: add VP9 decoder support
    https://git.kernel.org/khilman/linux-amlogic/c/00c43088aa680989407b6afbda295f67b3f123f1

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
