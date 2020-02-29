Return-Path: <SRS0=pdBZ=4R=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E03CC3F2CD
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Feb 2020 18:22:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0712124677
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Feb 2020 18:22:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Szo590+k";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="DmlgGudd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0712124677
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UhIU8OnGqhApOrVAcS+dnaz5oA/FbXoz27tFZplWE+E=; b=Szo590+kqY9GMm
	pUdGo13QbdqynUQ6z4Ui0rDoF1YWlS2gywQorveM4ExcTQkSA9wSua8R5s/uDP4Uq1nOzwq25aVOT
	eAQ2frjR/vCzW1P1BZYFIuf8HusNaVUr7iiavsfmaEXOt80zj69dbdMAmJvNjIUczZ2zuy0LQG7iR
	O3AUA8Zlwwd8rmkRAvjxFi8XHJmQwUz7dc9Ky2mJp1kmN6xu8sz+axkR+0hBhnFr2o1P2LHkpHhxV
	CBXOEAXm5Tn8IsfFCQ6oGKe0Uv9stJG07BJHv5e1fyOc6Y2/vBKwjACARU96aY5pf0E3w+URp1i/0
	GdofHG9yErSi7XYc82WQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j86kS-0007z3-1E; Sat, 29 Feb 2020 18:22:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j86kH-0007r3-QE
 for linux-amlogic@lists.infradead.org; Sat, 29 Feb 2020 18:21:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583000509;
 bh=9ea4JyyC9s2nGzpUmUzNEDrofPvh2+xs2J0kqKj8/9o=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=DmlgGudd/EMkx7bdQifw3lUrlJGdDR2d/6MWQWY+1DxphXSYPHmVDNn/JOJGDaBHk
 YN/h7QDzPLbVDYATKYnUAsfmt8HGe+jd0Lz/aqVhf80rQ/XYf9c24U8ShOkHTwK9MJ
 Crm5maWOUJlJ9aaQL52Rv9XJvJxr6hDsKMmlDkvw=
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: meson-gxl-s905x-p212: add bluetooth nodes
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <158300050925.2726.396392500060112919.git-patchwork-notify@kernel.org>
Date: Sat, 29 Feb 2020 18:21:49 +0000
References: <1582216366-12964-1-git-send-email-christianshewitt@gmail.com>
In-Reply-To: <1582216366-12964-1-git-send-email-christianshewitt@gmail.com>
To: Christian Hewitt <christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200229_102149_869600_EC84C60B 
X-CRM114-Status: UNSURE (   5.31  )
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

On Thu, 20 Feb 2020 20:32:46 +0400 you wrote:
> This removes the uart_A alias (no longer required) and adds the bluetooth
> node to the P212 device tree.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)


Here is a summary with links:
  - arm64: dts: meson-gxl-s905x-p212: add bluetooth nodes
    https://git.kernel.org/khilman/linux-amlogic/c/026c20e7b05f6a6a91720feb7492c0d9b90a9b8c

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
