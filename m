Return-Path: <SRS0=Q7B6=2D=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 824A7C43603
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Dec 2019 22:21:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F76F2073D
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Dec 2019 22:21:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kj/QWKiT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="CCJOiJu+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F76F2073D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VmbeY096D5Bo/Z4ufaAPA+/ZjpOcVto8VofqWymRT4I=; b=kj/QWKiT2FV/6R
	s2OYJWxQKjH751A3t8sb1J30yqylTAM5Hl+mLH77V/BQIRiBRzLWi4ci7fHrZgrpVhRs41Svkmg7V
	DwXZaWGDNK58CbSkVrMCwXzERiWy80ARRGGRNlPgE1OSg+jdzSvpRTYL3Wpud4h9GRgeWCcJrh5TM
	IdSZIoezlo6YZAM9YGOX7lLyEnR3TScRdP+6T1nqwNyOMpIaamg1JaggylhZ0FmQ1XfBFrtlryPYx
	4t1u4Qus+5xNl80+ZA+P9G2y8NIGmYgTscyaHHsoZrZX2p6aZH3fIrN6U7lVXc5YVsn0D+Rh906jO
	6vGfHbUtGmNHF3Ha/ZGg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iftJB-0002HI-52; Fri, 13 Dec 2019 22:21:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iftJ7-0002Gg-BK
 for linux-amlogic@lists.infradead.org; Fri, 13 Dec 2019 22:21:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576275668;
 bh=QwV+rei94UqxRJG4nwHsO0xk2eRKUzhTPWLQqVa1FiU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=CCJOiJu+I1o4eHOIOZekcNmreELtEumJ5TXowpDJoSQK9Tkqpst/6Xv5G17636yP9
 VGd2iB452hvtTZaG8R11KoGfEaVMgpnKwVHuNXEcx0ifC/ipcp19mqYszfhR0I2rOy
 a3+IWeTjbU3I2SNYM02PzbcDrbY74An+7/iHB4IE=
MIME-Version: 1.0
Subject: Re: [PATCH 0/3] ARM: dts: meson: clock updates
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <157627566854.23333.5192495307369932108.git-patchwork-notify@kernel.org>
Date: Fri, 13 Dec 2019 22:21:08 +0000
References: <20191208180525.1076152-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20191208180525.1076152-1-martin.blumenstingl@googlemail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191213_142109_409282_D4D5D011 
X-CRM114-Status: UNSURE (   5.65  )
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

On Sun,  8 Dec 2019 19:05:22 +0100 you wrote:
> This series moves the XTAL clock out of the main (HHI) clock controller
> because it's an actual dedicated crystal on the PCBs.
> 
> The last two patches add the DDR clock controller whose output is used
> as input for some of the audio clocks.
> 
> 
> [...]


Here is a summary with links:
  - [1/3] ARM: dts: meson: provide the XTAL clock using a fixed-clock
    https://git.kernel.org/khilman/linux-amlogic/c/630ea3108adf0446b6b4194f3f42bc0bfe245d1d
  - [2/3] ARM: dts: meson8: add the DDR clock controller
    https://git.kernel.org/khilman/linux-amlogic/c/c4ac5c37a4a5c5ce94f70542d006568bd4b7d685
  - [3/3] ARM: dts: meson8b: add the DDR clock controller
    https://git.kernel.org/khilman/linux-amlogic/c/6d549ff55c3717c4f5b0202a22c7404395559cec

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
