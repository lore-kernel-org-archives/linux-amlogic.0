Return-Path: <SRS0=I4qu=6A=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3BB0C2BB85
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 16:08:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CC7A2223E
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 16:08:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D2fTgj9p";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="tBLds0nB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CC7A2223E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ovPf/QdAglR3t7FbzTigalVUjsHr1fLWv+9KY+9zB8M=; b=D2fTgj9p3Oa8cI
	s2CZCMNhk7MUYSTLxCg3AstVSznVNJeHX/BflbfKKC+gvariMjF85pWsuGv0i+YjzKiFJxLlkGlWj
	+V4lrqrUiwBlFFjpK4un+HTGMDM4wKEk+jdkfO8nP7Q7++tdarrm3fIQ8nHk+g0osckZiTJauMJYe
	r4Be8Gi6zXZpOy3Qg5wJ4090hRNPS8UTRVjXXvctn4jNh+P6+d4gAm5o7bjkcIvEcCkYQ2+uJgWgF
	g9Ftvc1pZtyotWJ6Utsm0CmJ3SlaPTjakbHNH/sKrHQ5+T4KpS04mGisXL+hIEu4BmhFB/eHDTrUW
	ncjNA3TrHYb5NaDowtlA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP73g-000880-QR; Thu, 16 Apr 2020 16:08:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP73X-0007xi-My
 for linux-amlogic@lists.infradead.org; Thu, 16 Apr 2020 16:08:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587053279;
 bh=JBl/9WWP8yRJ9t1/CEqUw9tkPPegSOSQuerKtl7EsLc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=tBLds0nBhktrl/cscoigKvr6mljenXB8a6Tlju/XExOZQNxfCTJCdUAOj7I0zg2cH
 n1vs/LtCDKh4NodBuNuzdXn6dEM/XR3/ogk4kkpOia+bpT3gvhNMRyngG6POshmHD5
 KLCxUJgrCIACbwA9z2V/iVyCBvgEJwhVzzOqHChY=
MIME-Version: 1.0
Subject: Re: [PATCH] ASoC: meson: aiu: simplify component addition
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <158705327941.8629.15381170941039113613.git-patchwork-notify@kernel.org>
Date: Thu, 16 Apr 2020 16:07:59 +0000
References: <20200217092019.433402-1-jbrunet@baylibre.com>
In-Reply-To: <20200217092019.433402-1-jbrunet@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_090759_763757_0422E4E0 
X-CRM114-Status: UNSURE (   5.14  )
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

On Mon, 17 Feb 2020 10:20:19 +0100 you wrote:
> Now that the component name is unique within ASoC, there is no need to
> hack the debugfs prefix to add more than one ASoC component to a linux
> device. Remove the unnecessary function and use
> snd_soc_register_component() directly.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> 
> [...]


Here is a summary with links:
  - ASoC: meson: aiu: simplify component addition
    https://git.kernel.org/khilman/linux-amlogic/c/0247142233239dc235f8239aab5c7991250d4e66

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
