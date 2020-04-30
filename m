Return-Path: <SRS0=G+6o=6O=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2096C4724C
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Apr 2020 20:01:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3C182072A
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Apr 2020 20:01:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LEhRsqYH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="s/i5z8nG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3C182072A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WYn+emf0TMzc2dDggANxylkcPBlm5tKK6jqH1YzhAXQ=; b=LEhRsqYHGyojIa
	BrDYiOnnurbSEWplZ+ja7bGDCjFwhXOBC2n1KQZuXxCjyvSvI0hFheFG8gk+D2RS5O9tX5bGRvucH
	E0x9x4vDx5W7fOAXbWWW8uv1lN0KLE9gTCzRRWwpc6SIeO2UsTGbRSZQKYG+7SB/BC8eiBR2eufda
	vLTYE3ahLytAlzERA5+XrtQcA74XfTd+ekLH8vI71lUn/To/Gls+nvqgGXrV+FA/914Ar8aXQROWU
	Cz5CdePoyyd5Gw6/zYtV7A5xjPqLQQkWRoEiY0/roNjP2ELgzeUxbPpAJN2PaEL+rZ5Yn1vzYtYaH
	RmnUK2eIwOzNESglgKeA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jUFMz-0001GP-PL; Thu, 30 Apr 2020 20:01:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUFMx-0001Fm-Af
 for linux-amlogic@lists.infradead.org; Thu, 30 Apr 2020 20:01:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588276874;
 bh=b2boFw0tjGkgAnpUkt4Dtdau3suzVmabF5AwEijO/F4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=s/i5z8nGs3fQ7lHSWrIj6R89pAgB7YpgKryM11C5nHfBSNCEApGqnV6BxJ639TT1N
 yPpnNvypzjGzZaTCyXiiMfp0DyV3+7Fpyi9jSdsjsPS8sykWTyr1z6ZNArUkuXFy7J
 1f39PZrZWw+qCizchCJ9ofDI1BDbKhxJ+htCt1pE=
MIME-Version: 1.0
Subject: Re: [PATCH 0/6] arm64: dts: meson-gx: add initial playback support
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <158827687452.5667.11044336092415563613.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2020 20:01:14 +0000
References: <20200421163935.775935-1-jbrunet@baylibre.com>
In-Reply-To: <20200421163935.775935-1-jbrunet@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200430_130115_392029_7D293167 
X-CRM114-Status: GOOD (  10.08  )
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

On Tue, 21 Apr 2020 18:39:29 +0200 you wrote:
> This patchset is adding the aiu support in DT and well as basic card
> support for the p230/q200 and libretech boards
> 
> I was hoping to provide the internal codec support with this series but
> this is still blocked on the reset dt-bindings of the DAC [0].
> 
> So far, things are fairly stable on these boards. I have experienced
> a few glitches on rare occasions. I have not been able to precisely found
> out why. It seems to be linked the AIU resets and 8ch support. Maybe more
> eyes (and ears) on this will help. If things get annoying and no solution
> is found, I'll submit a change to restrict the output to i2s 2ch.
> 
> [...]


Here is a summary with links:
  - [1/6] arm64: defconfig: enable meson gx audio as module
    https://git.kernel.org/khilman/linux-amlogic/c/001181951477582bf22c5052866aea261b211b24
  - [2/6] arm64: dts: meson-gx: add aiu support
    https://git.kernel.org/khilman/linux-amlogic/c/85af6cceda2dc8e98ed033bd869236d8592918a0
  - [3/6] arm64: dts: meson: p230-q200: add initial audio playback support
    https://git.kernel.org/khilman/linux-amlogic/c/443b057fef9a12130e2b4114d7bf580ab99f9e62
  - [4/6] arm64: dts: meson: libretech-cc: add initial audio playback support
    https://git.kernel.org/khilman/linux-amlogic/c/2835b92f1cb95e8b34bee491e0e0fbab02dee956
  - [5/6] arm64: dts: meson: libretech-ac: add initial audio playback support
    https://git.kernel.org/khilman/linux-amlogic/c/a5936b8ab40724e3088bdb7d629b923a5a96290f
  - [6/6] arm64: dts: meson: libretech-pc: add initial audio playback support
    https://git.kernel.org/khilman/linux-amlogic/c/962d9cc09c5423a9cdca7d7ac1907383b6365426

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
