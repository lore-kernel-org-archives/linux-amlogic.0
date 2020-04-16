Return-Path: <SRS0=I4qu=6A=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9612C2BB85
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 16:08:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7F7C2054F
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 16:08:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LaDFP5Ts";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="e7m7Micv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7F7C2054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L5kg3C6IhvXAcDANEHVOM8ROjwXdo0hedLAwSixV7VU=; b=LaDFP5TsI9NG1U
	CF4604cdPvlPfPl50KGYTtbd+AMkv4hHJlWFcODb3FfNcACrvMxtDrIpFt269QDAFS5glwdVaQtU8
	3ghfEAekmDgfHYKyvDaCKHdNKGMFyT+6DiWFrZpkW/zApYfmRUvxg4Jq6/x9zgeSUchjon5H7azJ9
	2kd2u9f9E6JindX2LMbTn2y/Q+LSuwZe5kv5HFTNKaHEIaYneO81hv4ADVxmL9mIz8ExJL4ql89fc
	AA4KZuEFlbstxtrtEU55jNhrd6zJLJaUcGZympBI7SMH728GnyrPqdi9BAw8rabE6gIAESg+KpZgT
	5EaOCqbAJl/18+FP3l4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP747-0000DQ-0M; Thu, 16 Apr 2020 16:08:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP73a-00080Z-VT
 for linux-amlogic@lists.infradead.org; Thu, 16 Apr 2020 16:08:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587053281;
 bh=vGA2uaVUa11irtVDakxo78oTctbjDSvto1GU2onOa9Y=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=e7m7MicvbtdT120XVo4aVoA83mrWqgceY6YQi9q1S/WsGj1nN01/79ntLOnSb7358
 bCgXW5dBT7bp7g6pu8PUwaHgf8IfkYcOS2c6Fb93n8hsnpK0CUVUS/HQ8VFCXwtOT0
 ang+15HGavycWbBOh8Y2NPjvWimzVRTco1GdY3dM=
MIME-Version: 1.0
Subject: Re: [PATCH v7 0/4] media: meson: vdec: Add compliant H264 support
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <158705328141.8629.1724563241382109292.git-patchwork-notify@kernel.org>
Date: Thu, 16 Apr 2020 16:08:01 +0000
References: <20200303143320.32562-1-narmstrong@baylibre.com>
In-Reply-To: <20200303143320.32562-1-narmstrong@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_090803_093294_C69562DC 
X-CRM114-Status: UNSURE (   6.31  )
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

On Tue,  3 Mar 2020 15:33:16 +0100 you wrote:
> Hello,
> 
> This patch series aims to bring H.264 support as well as compliance update
> to the amlogic stateful video decoder driver.
> 
> The issue in the V1 patchset at [1] is solved by patch #1 following comments
> and requirements from hans. It moves the full draining & stopped state tracking
> and handling from vicodec to core v4l2-mem2mem.
> 
> [...]


Here is a summary with links:
  - [v7,1/4] media: v4l2-mem2mem: handle draining, stopped and next-buf-is-last states
    https://git.kernel.org/khilman/linux-amlogic/c/2b48e113866a6735de3a99531183afb6217c2a60
  - [v7,2/4] media: vicodec: use v4l2-mem2mem draining, stopped and next-buf-is-last states handling
    https://git.kernel.org/khilman/linux-amlogic/c/d4d137de5f31d318ed9acdcdf359b9bd3920808b
  - [v7,3/4] media: meson: vdec: bring up to compliance
    https://git.kernel.org/khilman/linux-amlogic/c/876f123b8956b455a89a172b905f9ecbb6fc5b67
  - [v7,4/4] media: meson: vdec: add H.264 decoding support
    https://git.kernel.org/khilman/linux-amlogic/c/d7647e7c90f5f8990ee64d3a51af63b57faff5d5

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
