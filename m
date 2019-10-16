Return-Path: <SRS0=vLcw=YJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE9A9ECE599
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Oct 2019 22:59:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C2CA207FF
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Oct 2019 22:59:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FEVk4cxM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="QohKsXiJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C2CA207FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QFk1P7uyynlEfZnziJVGQ7/MLc0jcBho4gd6mrhA1hs=; b=FEVk4cxMGUze0X
	n7Erhc7HjGz6U/0S2uekxBPTLAKv6WMTppteHbLSKiIOC1ZDgGjh2ts3OdvwjcBKBGxa6cgEnBPC3
	4X2ys1PLy5I6ttd1991lYfS/jIcqZqxJTllcHUby8RBBLSBmAh4sTk2RV+AkT2w9aksNZwKI4+RC8
	xrXcp+5eUjD3bndOieZkmXJSMEFd4EKrysR92JkK6yikmm7gJH9PRO53fDCSXKDAJTb93/bBnr9gF
	CVJWOt+GC8YrTYcYQs+Da8RjCYq9gB/Hs2iGT8YYvZOAhhj2XktQ3oawau+d2QWddiEgiGX7aIHv9
	JqHCSQiVrZBAOk3zgQPQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKsFs-00045p-1Y; Wed, 16 Oct 2019 22:58:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKsFp-00045U-EX
 for linux-amlogic@lists.infradead.org; Wed, 16 Oct 2019 22:58:54 +0000
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 83D5F207FF;
 Wed, 16 Oct 2019 22:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571266732;
 bh=elH7+aHXNlJ2ye9AfFU/AXw75b+MBbTNCbo6rpbqtnQ=;
 h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
 b=QohKsXiJZslhg3jp+X4A5JVUwnLSIPMo36ArrQ+2mPwm6mPi2JpSuD1EshP+G80zw
 r0zi9zda9V+DxXgPgRluuEw3E7K6/Baozd4UMeAqN+7n3CFSG8oAKSjTy+7EtpyLuH
 dLamvDNp4LLdN3PBUE3rIbYRRd/tZ5raoeWFwYcE=
MIME-Version: 1.0
In-Reply-To: <1jzhibaeaz.fsf@starbuckisacylon.baylibre.com>
References: <1jzhibaeaz.fsf@starbuckisacylon.baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>
Subject: Re: [GIT PULL] clk: meson: fixes for v5.4
User-Agent: alot/0.8.1
Date: Wed, 16 Oct 2019 15:58:51 -0700
Message-Id: <20191016225852.83D5F207FF@mail.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191016_155853_509486_1915D234 
X-CRM114-Status: UNSURE (   8.05  )
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
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Jerome Brunet (2019-10-08 00:26:12)
> Hi Stephen,
> 
> Please pull these few fixes for the current release.
> 
> Thanks
> Jerome
> 
> The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:
> 
>   Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://github.com/BayLibre/clk-meson.git tags/clk-meson-fixes-v5.4-1
> 
> for you to fetch changes up to 90b171f6035688236a3f09117a683020be45603a:

Thanks. Pulled into fixes and merged up to next.


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
