Return-Path: <SRS0=nSb1=BA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 825F2C433E5
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jul 2020 21:21:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51B8320717
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jul 2020 21:21:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zriD95gF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="tBStlDD7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51B8320717
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lxyWKmt/B50eFfqpX5LsBGrwo4t3NvPVrKc1Jz5h8+o=; b=zriD95gFY6dpFjAtKVtCEdyHo
	NuOGs1jyubTx6XXvONqw03AMrVe0IZbsgWX9zLMiKVvzQF8FvlNwedORBi/t2g7yYlclHXlgHv26Z
	kmouEWNeSq8zHy7f4TeGNfnIaLrlTQ2DHkbKakARiCxw168mjSy8dooBQFRD7fFkD5C3IJN30ajoN
	22G1i69MaLKWM/kX2p6goBVUkxIiIeHaW4N9zde2UdIrXkAfBoAUCwa4lXQeaK2bCmpiqAoQHp0Lr
	oXNRMFng6JU2Csy5X7Zwf2FkUlR9mUsb11pPZ7PrVk5ikgzywNZAIAkgYX29/b4Bud4vyV+14xQRs
	v4uehyXmQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxzhZ-0004Q6-Qh; Tue, 21 Jul 2020 21:21:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxzhW-0004OM-16
 for linux-amlogic@lists.infradead.org; Tue, 21 Jul 2020 21:21:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595366484;
 bh=N9JQf5Ltcvbh8lEA8WRRowqjcpWRIWtgIDTQuexJ484=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=tBStlDD7InfysB5Io9u09raalK7LJS2jj8SJynq60jR+SqLvKA3BhAT2nxzh7a4m6
 eTPVEyCAuFDH6Nx9Anhdc56wr0/4JvIdN2eZzxoXHkdr/oGiQ3lGvLsjp87IZnzZcR
 XScIGrNa7lYLZlbUET8ScslaG3p5y+XOgrcx/LnE=
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/2] arm64: dts: meson: add support for WeTek Core 2
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <159536648469.12155.7985483710082567687.git-patchwork-notify@kernel.org>
Date: Tue, 21 Jul 2020 21:21:24 +0000
References: <20200719021421.7959-1-christianshewitt@gmail.com>
In-Reply-To: <20200719021421.7959-1-christianshewitt@gmail.com>
To: Christian Hewitt <christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_172126_178564_77374CA7 
X-CRM114-Status: UNSURE (   5.93  )
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

On Sun, 19 Jul 2020 02:14:19 +0000 you wrote:
> From: chewitt <christianshewitt@gmail.com>
> 
> This series adds support for the WeTek Core 2 which is a commercial box
> device based on the Amlogic Q200 reference design.
> 
> v3 changes - fix BT node (enable-gpios > shutdown-gpios)
> v2 changes - simplify ethernet disable
> 
> [...]


Here is a summary with links:
  - [v3,1/2] dt-bindings: arm: amlogic: add support for the WeTek Core 2
    https://git.kernel.org/khilman/linux-amlogic/c/8b6f53d7b94b8d23860ae44a56b0af404a6c7e4c
  - [v3,2/2] arm64: dts: meson: add support for the WeTek Core 2
    https://git.kernel.org/khilman/linux-amlogic/c/ea232b9ccccf2f55fe231441f3908c31c7136c4f

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
