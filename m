Return-Path: <SRS0=Wall=TX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49781C282DD
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 May 2019 15:47:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BAD320862
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 May 2019 15:47:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kfOleRNf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="KXEg/r5c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BAD320862
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wEahb+8pyVdEVUI5d1PO1aG7XMZQeTWFQWVkGk8RF4E=; b=kfOleRNfr8DS1Q
	KZ0/x9AB9yACw8Pm9znEsShOpJqYN0xREgcXyqIAdIKapilTEZrNJn72vRmmz5IjEvo8ZZYvMaWq5
	eFreOLek+66c4hDzAoz0cCMFMc096lHfrJIu05Te305CfCwa6PGvE6rUp6LlAlmUnwFecDzLCXc3G
	R2Y0L2sRkxxPLrt3ZnX9kwMGNUcFyQcXGTvARlQFk47LXZaSye5UQd1f7wqlgg44AccB0QhbvxT9N
	OctGeEaoP5LyQa04ALXZvATHyGW282MAjojXEoUkeMV47cDv0IU7LAbC33rZG+16Vn9n/UeT0Godw
	bmJGUCv4reQNXpifEGeA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTpwN-0006Bp-8p; Thu, 23 May 2019 15:47:35 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTpwJ-0006Ay-DJ
 for linux-amlogic@lists.infradead.org; Thu, 23 May 2019 15:47:33 +0000
Received: by mail-pf1-x444.google.com with SMTP id z26so3465018pfg.6
 for <linux-amlogic@lists.infradead.org>; Thu, 23 May 2019 08:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=jv+ZMbc1I98Kfuw0Mvc1m1vrwyGUlcd3bpE/jqp7bS0=;
 b=KXEg/r5cqRllmZVEG6qwVqCZ9yxdY79ciDsmC/wq73qmEkq0HJzU0pbMFvT8pyOOMC
 M1UTsQ+2P8noymytOkYDBQQKI0XdRCSx2LeIifJkiOu6m8N21sILr6+Ps4pbjTJvL1VL
 HssSLUOOnz4YrbEenbqPmEsu6qZ4d/ZUReNHcY7wNTI9OVGWBPOirHS74rSSwsXE5W0m
 9pM6F9+0iwNHMZEVpKMAAYuVcbsh3JiTHLDVoZ4iwRW5ZlJaIkDyf1TwujS67RlCWQ7E
 k2qqzXQHZGoTX2qUbg+yNFo/egvQnf4HxtcKgOUbVPMO7u2BWjGzPzkhcTGTF7Yta08K
 OFiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=jv+ZMbc1I98Kfuw0Mvc1m1vrwyGUlcd3bpE/jqp7bS0=;
 b=smQtiANG03mcdQm/5OzIS2GVxxb1UHvF82/yUT1V1n9XaCzZKhf47falVFf6e0twsq
 Hg9vpJTIxCvI7Oa+BUPs449ZizrWiHkD1SwSoE0YtJrLcnIsiDbH8+0GXotjtaGfHC+6
 TfI6g0zY2UDyzz25aHnbjGhwt+5oHlT3fBorX/gtEzkG9bzoTBATJVcxmBO8omScqJ6H
 yxPh4HJJskonX0/xFf/W8TLGmRRDqARYe6uM93XCDn6SL0nb2lA0jEXeI/g2+G1yDxqK
 eBpWfRiyTIOIZrPB10KCDt/7vRB4u3Ma481yFGBBk50i2xpslNEW9B8TuNaCX3dtMur+
 MbCg==
X-Gm-Message-State: APjAAAVUDpxxi4+BuqajC5VKDlWVoxzgyEnotOq3y6eikLGWvCyrHAT6
 x+O/yR/5bLjLp0bfgQgN5rRJRs6nOcRx+Q==
X-Google-Smtp-Source: APXvYqzydErEWSZnvbFfkefvdicgMunWwZk7nzF43XkELRH/ke8RkJbMW+oZH025cjCAYMNFEwVIbw==
X-Received: by 2002:a17:90a:e0f:: with SMTP id
 v15mr2093710pje.140.1558626450657; 
 Thu, 23 May 2019 08:47:30 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:ed4f:2717:3604:bb3f])
 by smtp.googlemail.com with ESMTPSA id u6sm40276897pfa.1.2019.05.23.08.47.29
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 23 May 2019 08:47:30 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH] mmc: meson-gx: fix irq ack
In-Reply-To: <20190523145950.7030-1-jbrunet@baylibre.com>
References: <20190523145950.7030-1-jbrunet@baylibre.com>
Date: Thu, 23 May 2019 08:47:29 -0700
Message-ID: <7ho93t41gu.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190523_084731_447790_89951C01 
X-CRM114-Status: UNSURE (   9.27  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> While cleaning the ISR of the meson-gx and acking only raised irqs,
> the ack of the irq was moved at the very last stage of the function.
>
> This was stable during the initial tests but it triggered issues with
> hs200, under specific loads (like booting android). Acking the irqs
> after calling the mmc_request_done() causes the problem.
>
> Moving the ack back to the original place solves the issue. Since the
> irq is edge triggered, it does not hurt to ack irq even earlier, so
> let's do it early in the ISR.
>
> Fixes: 9c5fdb07a28d ("mmc: meson-gx: ack only raised irq")
> Tested-by: Neil Armstrong <narmstrong@baylibre.com>
> Tested-by: Kevin Hilman <khilman@baylibre.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

And to be clear, this fix should go into v5.2-rc.

My Tested-by is already above, but just for the benefit of the
archives... tested this on mainline, and also on a v4.19 backport with
Android and it fixes issues see there.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
