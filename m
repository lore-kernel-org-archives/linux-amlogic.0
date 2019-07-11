Return-Path: <SRS0=f8Nu=VI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8700BC742A2
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Jul 2019 21:31:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58B66208E4
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Jul 2019 21:31:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YMQ3UpcJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58B66208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qGplpWulw40wlwfxs5xfclWTrhKTDubWEYV5SdN14cM=; b=YMQ3UpcJk8Rg1R
	KEMvnQ7ZZX0MrSk2JkE127LtrrnsGgaFkuqCpCdUCFrTe00NQASa12Rcfhx+1Voadk2L2Bl81D5l9
	cWQorNo50BUeRaV6NRUkp4B8NWxymYKYITgbDe/LUjXFnt+43v2vAQ/7zMZAleDk9jk8KDBE2NRuM
	npuyUAYndPMsqs0q4abCQV7yupxCXpkneTys7FjJr2esq09aMjY6B6MRHkp/vesXAZttjG3zMMvG9
	hLKrVsXoUblMNXeSNRP1LCOSPZm/Wz0NaJ1AEyTN5f/QmeeiYgvYR8nrYbrURu5ksdh50fT67CGWa
	XqN++8R8yvy4bVxlRJrA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hlgec-0006Gf-8r; Thu, 11 Jul 2019 21:31:02 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hlgea-0006Fz-EC; Thu, 11 Jul 2019 21:31:01 +0000
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 9B36014CFC090;
 Thu, 11 Jul 2019 14:30:53 -0700 (PDT)
Date: Thu, 11 Jul 2019 14:30:52 -0700 (PDT)
Message-Id: <20190711.143052.1773408891723438773.davem@davemloft.net>
To: joe@perches.com
Subject: Re: [PATCH 00/12] treewide: Fix GENMASK misuses
From: David Miller <davem@davemloft.net>
In-Reply-To: <cover.1562734889.git.joe@perches.com>
References: <cover.1562734889.git.joe@perches.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Thu, 11 Jul 2019 14:30:54 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190711_143100_478657_50B61ABD 
X-CRM114-Status: UNSURE (   4.61  )
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
Cc: devel@driverdev.osuosl.org, linux-iio@vger.kernel.org,
 alsa-devel@alsa-project.org, benjaminfair@google.com,
 linux-aspeed@lists.ozlabs.org, andrew@aj.id.au, venture@google.com,
 openbmc@lists.ozlabs.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 yuenn@google.com, linux-mmc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 linux-amlogic@lists.infradead.org, akpm@linux-foundation.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Joe Perches <joe@perches.com>
Date: Tue,  9 Jul 2019 22:04:13 -0700

> These GENMASK uses are inverted argument order and the
> actual masks produced are incorrect.  Fix them.
> 
> Add checkpatch tests to help avoid more misuses too.

Patches #7 and #8 applied to 'net', with appropriate Fixes tags
added to #8.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
