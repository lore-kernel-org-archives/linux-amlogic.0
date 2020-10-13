Return-Path: <SRS0=MZ2k=DU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2C91C43457
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Oct 2020 08:11:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A56D214D8
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Oct 2020 08:11:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N/oJEFqz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fastestway24.com header.i=@fastestway24.com header.b="wMKGtFIU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A56D214D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=fastestway24.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vBBMlQckyI/7upf3X9QbvcUdcYdJsXR+XPcp7XPvLVM=; b=N/oJEFqzhZog4l3RXTcRB0+O0M
	dbyx+u6r2/u7LJl3WajNrJFFhMvQERiBCZt9WVdFuIijHZdHCBQnAkwph9dlxy9uKzIww6s/Dzs3d
	DUmflihUrTjBHVzcLHyDAOduzxVOxuody6Bg+R/xb0n6RgBuvC80ZLu55GqoNe9iDgrv5xmCKx8lY
	U/z2yv8iSW7vmwW8ex28N12x5VWAtaLVoQGSeyJRRbMtU6ZS2I0h8gQcRZlcsheRwSGDYfTcoTjKL
	UKBbGCMvv5wX42GEmKZ2Tyjah/i2fuv3/P1utKnguovhqIFnESo86rB1eXqfIDYOHEAWgla/IYOhA
	cpZTmGRQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSFPL-0005sG-3p; Tue, 13 Oct 2020 08:11:43 +0000
Received: from mail.fastestway24.com ([5.249.159.217])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSFPH-0005rZ-Ui
 for linux-amlogic@lists.infradead.org; Tue, 13 Oct 2020 08:11:40 +0000
Received: by mail.fastestway24.com (Postfix, from userid 1001)
 id 46417A2F08; Tue, 13 Oct 2020 09:11:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fastestway24.com;
 s=mail; t=1602576698;
 bh=YGOlxoddnI3PXnh41XMWUfU0z9xsorZLZcAPNbcZr/c=;
 h=Date:From:To:Subject:From;
 b=wMKGtFIUtDSYfkdgHSZib+KRKv1yvdq3Z+qDkeYu0UxaGvYJ67fhNQ7LYepL8Kluo
 zOIuet6XtflCIVzTAAyohuTWcbUuRTDVljsSZYnBeaxf5bTkTCZ1DHYaKnu+ASgxOU
 rQJSQ8z6CdNlFqKHZuBLbZlnIJN2QLToLT/CVLvmwzLl1BIeEvsBNoGtOoNoj2qqgN
 tRWlmHrroiKwxSR3cai27QgCS0zZARfMQdQNc4bwz4xjK3WqQZbm+J+cCTVKb68PRR
 Ks/YNn9KAI8jEmqcn1rNvLTIkdN9T2Wa/YMxSWawEidz9LGhN1nkn8YPXBxj59ORSN
 9yer3ACOTsCyQ==
Received: by mail.fastestway24.com for <linux-amlogic@lists.infradead.org>;
 Tue, 13 Oct 2020 08:11:18 GMT
Message-ID: <20201013074502-0.1.4d.9kl3.0.g6hnphdjcf@fastestway24.com>
Date: Tue, 13 Oct 2020 08:11:18 GMT
From: "William Jones" <william.jones@fastestway24.com>
To: <linux-amlogic@lists.infradead.org>
Subject: Disinfectant
X-Mailer: mail.fastestway24.com
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_041140_126919_7C3C3E73 
X-CRM114-Status: UNSURE (   1.09  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Good morning,

looking for companies interested in raising additional capital by diversifying their offer in soaps, liquids and gels for hand disinfection and cosmetics for body and hair care.

The distribution of innovative products corresponding to the current preferences of customers in the field of hygiene and preventive healthcare allows our partners to gain new markets and achieve better economic results.

In addition to products with bactericidal action, our range includes shower gels, shampoos and hair conditioners, as well as efficient, concentrated detergents.

The versatility (suitable for all skin types) combined with an affordable price means that customers make an informed choice of a product among others available on the market.

Are you interested in cooperation?


William Jones

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
