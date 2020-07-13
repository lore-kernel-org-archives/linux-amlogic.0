Return-Path: <SRS0=9eFL=AY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57B75C433E6
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2020 19:21:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D05F20758
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2020 19:21:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p0o7Fnk7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="zct2lBLX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D05F20758
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dBSJnhB+e3UWcLe34DiMigKVFp3Kws5UWoTVKX+Y/Ek=; b=p0o7Fnk7E28sh8xyv0dyWs11B
	iH2AGlKiPip1VCKQHatuCBBQEMTWkFp+M/2ZwJ8YIislP1UhwLkU0aTa+AoJAznoSBigJNKlMQ+GK
	y6r13ex4c+Xfsq3dac8klJj/8lOvYU4tnWCRJqf4lcKTgJhjeu06ziX0b7/9/8pRuNBoBPN5hkeQv
	T2oknZSlmsPvaPEwwhYwCERHIlLbR4Az8QP+iHwgqtz85BWhVcbh1aKfAyg+GxAEL6ApNMjwbBQUM
	AH7yUARBhiFb9XE9mFXR9dTjKRVS8h7Z7kGACiDuaCf9+IyYFW/GeMOGQv/lMCX5CSEQsN5E2/ie4
	4LYJM9GxQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jv41H-0005XL-LG; Mon, 13 Jul 2020 19:21:43 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jv41F-0005Vh-7c
 for linux-amlogic@lists.infradead.org; Mon, 13 Jul 2020 19:21:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594668099;
 bh=5Cs52ra7a8unPefiTU0MPkKUsiH2PRxs6YzBkWJdclk=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=zct2lBLXMTbEpFGZz4nkmLMPazHetk/JxfLqH0oWhwfGMRQ56h7156Rw3IYanYwBq
 JqF+HtbNURPFsNlEzqinv7Cbrs8JjNJAZc/BO3xSSby/NTV5+MwrC0uEPao881lOCS
 6YHOVisIf/rtSw7zCWSQEGNg/+Uu+eKWBG3fqioY=
MIME-Version: 1.0
Subject: Re: [PATCH RESEND v1] drm/meson: viu: fix setting the OSD burst
 length in VIU_OSD1_FIFO_CTRL_STAT
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <159466809991.23057.8123984594154253149.git-patchwork-notify@kernel.org>
Date: Mon, 13 Jul 2020 19:21:39 +0000
References: <20200620155752.21065-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20200620155752.21065-1-martin.blumenstingl@googlemail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_152141_356217_17E34888 
X-CRM114-Status: UNSURE (   4.32  )
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

This patch was applied to khilman/linux-amlogic.git (refs/heads/for-next).

On Sat, 20 Jun 2020 17:57:52 +0200 you wrote:
> The burst length is configured in VIU_OSD1_FIFO_CTRL_STAT[31] and
> VIU_OSD1_FIFO_CTRL_STAT[11:10]. The public S905D3 datasheet describes
> this as:
> - 0x0 = up to 24 per burst
> - 0x1 = up to 32 per burst
> - 0x2 = up to 48 per burst
> - 0x3 = up to 64 per burst
> - 0x4 = up to 96 per burst
> - 0x5 = up to 128 per burst
> 
> [...]


Here is a summary with links:
  - [RESEND,v1] drm/meson: viu: fix setting the OSD burst length in VIU_OSD1_FIFO_CTRL_STAT
    https://git.kernel.org/khilman/linux-amlogic/c/17f64701ea6f541db7eb5d7423a830cb929b3052

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
