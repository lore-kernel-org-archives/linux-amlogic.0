Return-Path: <SRS0=5tHY=YK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA1D5FA3735
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Oct 2019 16:00:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE23220872
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Oct 2019 16:00:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KXALLj2+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="iHr4ZMt6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE23220872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N7zU/tB1xcI+cvCn7+IN2vKxeRAh9t0CUSjOvgXzVYc=; b=KXALLj2+Sfb65F
	R9FBI1/xFULnFAolj1Hs7IQxjA5fL9sjFy08616ZwogW2MPqMCuT3OohAQrJ4TUlcBYez1hJX9xBg
	ra4jRVW/JOu/lOU489icFlLFG+SgTVDsmhw4zFqCeyf+Idd2JvIn5mIjC87Ug1bXpsHByi9E09n+1
	SsH1NPGUrGsIktIAHOORjCO6chI1YiG2pkQmD/GifT34W+85sne5u+OVbfE1AC8OYB1kE1jjpE43c
	ptbLEz5+Q8/hYqN2a3sj8UoboiVQCfeNueqcSwQqHzIR4v58jKdrmv7RpKva6Aia3jq/xRQqQ6/P7
	4FK+wFMsLEsnWEEFWYdg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iL8Cq-0005yS-9q; Thu, 17 Oct 2019 16:00:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iL8Cn-0005xv-Bi
 for linux-amlogic@lists.infradead.org; Thu, 17 Oct 2019 16:00:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571328049;
 bh=UYVgsjG5SDQgZ44iz9rWuyVSVfrI4FVH5KZYSW1u1wI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=iHr4ZMt6Xx/GW+rVKj+FnE/YqyllYTqRpjHX/NOC/bM7Ajeipi7LnlOzDUxDlSHSE
 mLl1UbG3TmigRrcuy8BwHv4CvEmR5sg9zV0PiaXsM4opRVDzkrTGJzbcCw+T8QO+6B
 sVLl9cPePDeP5vaSzbhhYCFe3+8eSp8mDOPsVDIk=
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] arm64: dts: meson: Tronsmart Vega ir keymap updates
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <157132804905.17346.5095701092459904352.git-patchwork-notify@kernel.org>
Date: Thu, 17 Oct 2019 16:00:49 +0000
References: <1571245657-4471-1-git-send-email-christianshewitt@gmail.com>
In-Reply-To: <1571245657-4471-1-git-send-email-christianshewitt@gmail.com>
To: Christian Hewitt <christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191017_090049_420382_8EC11D45 
X-CRM114-Status: UNSURE (   4.51  )
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

On Wed, 16 Oct 2019 21:07:35 +0400 you wrote:
> The Tronsmart Vega S95 (S905) and S96 (S912) Android STBs use the
> same IR remote. The rc-vega-s9x keymap has been accepted for Linux
> v5.5 [0] so add the keymap to the respective dts.
> 
> [0] https://patchwork.linuxtv.org/patch/59434/
> 
> Christian Hewitt (2):
>   arm64: dts: meson-gxm-vega-s96: set rc-vega-s9x ir keymap
>   arm64: dts: meson-gxbb-vega-s95: set rc-vega-s9x ir keymap
> 
> [...]


Here is a summary with links:
  - [1/2] arm64: dts: meson-gxm-vega-s96: set rc-vega-s9x ir keymap
    https://git.kernel.org/khilman/linux-amlogic/c/14fd777c30b7ac36a95099fd936588c93fe652ac
  - [2/2] arm64: dts: meson-gxbb-vega-s95: set rc-vega-s9x ir keymap
    https://git.kernel.org/khilman/linux-amlogic/c/c8739b2b84677b310a4a4e1affd7e57b9cbbc9f6

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
