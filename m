Return-Path: <SRS0=3lRj=B3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3131C433E8
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Aug 2020 17:49:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A18B420758
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Aug 2020 17:49:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dac6LYqT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="cXT5TQX0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A18B420758
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=N1KhFlQYz6NqXK7nO9Y3fuReKZnG0ZWhqaochUz9+/M=; b=dac6LYqTwoTj6mfGOdvPkCRbo
	Be6phx3at+7iVqeJbPFBv8ggR557ix6BI6neZv7bOp02xXvDcIYjvfCgV+MphKZKKvvq4c/JiwrYo
	AXxv8T7pDue6LVMuTnP8Wf+PpXXqCXV5EdLS7mA8251cPl7/FpTiVcSGZASI6bxx5j02vKvyIpCzE
	klVPXqQgWBNv6nMZ9lJAyAgoD636tATvcPr5TKVrOvCtUuTVybMw8Qxl9DSqLV/yL/mpB01qnec9T
	I7MtxUKRsbhbcG/nO0QvOg3CDT4KRTOsWm0xIFI0KwBRxcj+M5n/dB8FrF9OuGJjTG+sBOO9dzacI
	NgXEUbW0A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7jFm-000246-AC; Mon, 17 Aug 2020 17:49:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7jFe-0001zC-OF
 for linux-amlogic@lists.infradead.org; Mon, 17 Aug 2020 17:48:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597686532;
 bh=GNfKLCMxQqgnGTtpDYk4zjrzYXiJUnvhFm3f6p4n2J0=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=cXT5TQX0chsX3JufGQfryvKqTwW+mfVUlJeQImzFo+4xRnriAllNWC/F8Tnm6w+1C
 dluzPJSlLOuwYP6CLBkSLqENhauLQgczyl9YbFkwzQD/+gZNEJ4hAMn5L3JXCVP5BB
 +FAUc9OLE56nrAw7Sfi2DQMLTv7akWbyTr4WZvnA=
MIME-Version: 1.0
Subject: Re: [PATCH v9 0/6] drm/meson: add support for Amlogic Video FBC
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <159768653258.32160.605245020544571256.git-patchwork-notify@kernel.org>
Date: Mon, 17 Aug 2020 17:48:52 +0000
References: <20200703080728.25207-1-narmstrong@baylibre.com>
In-Reply-To: <20200703080728.25207-1-narmstrong@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_134854_934054_35DB7F3D 
X-CRM114-Status: UNSURE (   5.73  )
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

On Fri,  3 Jul 2020 10:07:22 +0200 you wrote:
> Amlogic uses a proprietary lossless image compression protocol and format
> for their hardware video codec accelerators, either video decoders or
> video input encoders.
> 
> It considerably reduces memory bandwidth while writing and reading
> frames in memory.
> 
> [...]


Here is a summary with links:
  - [v9,1/6] drm/fourcc: Add modifier definitions for describing Amlogic Video Framebuffer Compression
    https://git.kernel.org/khilman/linux-amlogic/c/d6528ec883096e7ccdb08257bcc45670bc878519
  - [v9,2/6] drm/meson: add Amlogic Video FBC registers
    https://git.kernel.org/khilman/linux-amlogic/c/1d4eff87878977fde110f311c4fa123e93ba2b3d
  - [v9,3/6] drm/meson: overlay: setup overlay for Amlogic FBC
    https://git.kernel.org/khilman/linux-amlogic/c/e860785d5730665e04e0ac301aa14ed3779c4d92
  - [v9,4/6] drm/meson: overlay: setup overlay for Amlogic FBC Memory Saving mode
    https://git.kernel.org/khilman/linux-amlogic/c/376b1391d9e99f24b8d9461a08c4735ba9d5495e
  - [v9,5/6] drm/meson: overlay: setup overlay for Amlogic FBC Scatter Memory layout
    https://git.kernel.org/khilman/linux-amlogic/c/be26a04bb70b6d4f4fb66ce4ed149153133aaef9
  - [v9,6/6] drm/meson: crtc: handle commit of Amlogic FBC frames
    https://git.kernel.org/khilman/linux-amlogic/c/bc84ee948124868e2affaf0492225a365f3943f0

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
