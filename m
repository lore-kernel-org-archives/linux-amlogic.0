Return-Path: <SRS0=yQOf=LQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EF3DC2B9F4
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Jun 2021 20:03:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6742B610C7
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Jun 2021 20:03:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6742B610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dr4iw39c3USu+JIWn2Hua1RI/cN865RA3O61Imr5l9A=; b=THFQyC3u8PTuBC
	1KcPxo4924J4NbRHaYwuk2FMlRQvDZ81YLM2yb39NkAorVGjVEM/eJfU57sCvd7aW8fLyebAc/rZt
	i9rp5UvWgP1f+MsLQONKHnPPRpiHkUmUKqHN93vG+zP6k4iIkZYhF7YjDctzPaoRsuavR8pcck5ZG
	sHv3lYZUVczb2p0wh1BQ7Pg7bUG5IsX79LdCENQYfUDGhjn0Bag1lvkereegPDdEWVdyVikXth6T9
	4sVH3hrLbYWDuaSAbVx9Fq8Y7qNmTJo5VMwwpQSZ4ZGnlRjFSBGbLGN9NQAmkpjYyUIsHcLWK32Zw
	9oqfb8PmmvUdbBfelO4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvmcA-008Hmi-Fu; Tue, 22 Jun 2021 20:03:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvmc7-008Hm7-T7
 for linux-amlogic@lists.infradead.org; Tue, 22 Jun 2021 20:03:17 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 74EB1610C7;
 Tue, 22 Jun 2021 20:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624392195;
 bh=go77Z5qcOi92oqSCP0X3Wkf0SGvUNQ54cyTYeQXyxD4=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=a//JT9yhimRsFDeR2r2+xrMutFRxeGqB+0BaQxwRUrUqqLORNYvhri2w69ZwBaQQw
 XKBQTpBVtytBr7uyN0NwOIEuaz6SE9IWgx+7EKgkkCdpb1uhhHCksmKYorBKu9LMYC
 Ljx0lRfGjo4AbgbBDeWwABthKr8IZCaUpAT4PTSq860FN+tXPiaivaDsuA+WmF1C3H
 LqwH+RUQ9J94/eJWJWW6PX3jFYQnC6yNJjz7v0rgOSP5GuGRIir/ZKYdynk5ORrDfv
 RtGWcVdFwkeU+jaPLzht0JGqCGSh+iMicoRN1p+N8/jSx8/wjzTyqR76o8tn5qyxyr
 gQKJvaOcowDrg==
MIME-Version: 1.0
In-Reply-To: <1j4ke6215o.fsf@starbuckisacylon.baylibre.com>
References: <1j4ke6215o.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL] clk: meson: amlogic updates for v5.14
From: Stephen Boyd <sboyd@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-clk@vger.kernel.org,
 linux-amlogic@lists.infradead.org
To: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 22 Jun 2021 13:03:14 -0700
Message-ID: <162439219417.3552334.8471238257904070782@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_130315_996192_E69D312F 
X-CRM114-Status: UNSURE (   6.55  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
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

Quoting Jerome Brunet (2021-06-09 14:12:03)
> 
> Hi Stephen,
> 
> Here are the updates of the amlogic clocks for v5.14. Nothing out the
> ordinary. Please pull.
> 
> Thx.
> Cheers
> 
> Jerome
> 
> The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:
> 
>   Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)
> 
> are available in the Git repository at:
> 
>   git://github.com/BayLibre/clk-meson.git clk-meson-v5.14-1
> 
> for you to fetch changes up to 8271813e404cd0620f99fbccffd2746f85a17259:
> 
>   clk: meson: g12a: Add missing NNA source clocks for g12b (2021-06-09 21:39:50 +0200)
> 
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
