Return-Path: <SRS0=BTcE=EU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BC1DC5519F
	for <linux-amlogic@archiver.kernel.org>; Sat, 14 Nov 2020 21:04:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1D3E20A8B
	for <linux-amlogic@archiver.kernel.org>; Sat, 14 Nov 2020 21:04:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="08RpTHWg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ga2yr1ex"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1D3E20A8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5OjViIZGKy5RBIoBU0B7FBhrnZ5z+XA4h+bdqbh8g14=; b=08RpTHWg6RvJWjoHiIhCXZlI2
	18l77mYkID23+RryA1kOycklqiKpbiXh7qxkvRwjxQstLxCE2Ve6CMmAFYtHjB4GKOeozPhIC/qK/
	6mZSnj9vQ7J3DLtcQU1GY8rCGGvtyOdX6In/22YYByLb5yMPufYvOcF0l19nqZbA9+n7OtwGbue47
	JHbyyulYSUK68ldiFAj1n6zMhAaryjeRtaJN+8c/Ic1D+NbJOLN5XUJ2Jojg8x5lhE/imsCOXPbKr
	34a7hmLs/vskBV0B1fWtCv1kGyMPp0b3xn4EGywPwytvSjLLIZ/v31RZpVxNT/wr/3qGjmDOKT7yK
	FPs6/70yw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ke2iF-0000sU-23; Sat, 14 Nov 2020 21:03:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ke2iC-0000s5-HZ; Sat, 14 Nov 2020 21:03:57 +0000
Received: from kernel.org (unknown [104.132.1.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6FC8C20A8B;
 Sat, 14 Nov 2020 21:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605387835;
 bh=IPG9cK6wG+FANwXrrS4b1vVrKoyrmiwa9arq9y8TAuM=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=ga2yr1exN3Vix+cAR+Q0sxlketSNgkTweumvE7D09nhp7EgTqpDUgrNjhvObEw6xP
 cMYJT2vAhzB7rVTFOfZBJaRj303svmfIIWMzNvKKlKpVfvdzd6hDZOKh8deUkHR6z8
 95VCKHfHw5uoqGQbCZ2qWFA53Q2wGSDLajXEnCOk=
MIME-Version: 1.0
In-Reply-To: <20201109233622.23598-1-khilman@baylibre.com>
References: <20201109233622.23598-1-khilman@baylibre.com>
Subject: Re: [PATCH] clk: meson: enable building as modules
From: Stephen Boyd <sboyd@kernel.org>
To: =?utf-8?q?J=C3=A9r=C3=B4me?= Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-clk@vger.kernel.org
Date: Sat, 14 Nov 2020 13:03:54 -0800
Message-ID: <160538783425.60232.7165875065149441256@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201114_160356_649310_EEDC42C8 
X-CRM114-Status: UNSURE (   7.97  )
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Kevin Hilman (2020-11-09 15:36:22)
> Make it possible to build all clk drivers as modules, but default
> remains built-in.
> 
> No functional changes.
> 
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
