Return-Path: <SRS0=BTcE=EU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F67FC5519F
	for <linux-amlogic@archiver.kernel.org>; Sat, 14 Nov 2020 20:54:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 018F32242B
	for <linux-amlogic@archiver.kernel.org>; Sat, 14 Nov 2020 20:54:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RV7edeHw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="BORxj4my"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 018F32242B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=om91JSpYy02V1kTiyXqQ96BclN/vxSHcwGhaYGwJQZc=; b=RV7edeHwxLfxVFQWR2AfLLrH0
	VKnAdu8Ahe6RMueaZ8hMnMXYRM4zeCUPKFQ3W46zclMIXgRvuGsTOKu5eKhyJ90QUeR+cDh8uyAzX
	NcKWAkvBpjWYGMTDMHBYxN2DTLot/D8FmWP7N3DrlzKza9h0F86Xw5SNtZ+MSrK0D98zW0u4VyWn2
	12JxOGbXpvU93w3XsC9vbgf60Fk+wCWeQAK2qX3sVQVyn5UQF/X1YXhOIfNw+PFrZYJ74Aj9NKijE
	JqzWmMcoIbn2SfDnNOerGzxv9IfwEB1CBaqju7FvgY6E9COPEunUYEiPA6KvmuwWZ6bOCuNcRH9lp
	ECkiV06IQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ke2ZP-0008Gp-3k; Sat, 14 Nov 2020 20:54:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ke2ZM-0008GD-FZ
 for linux-amlogic@lists.infradead.org; Sat, 14 Nov 2020 20:54:49 +0000
Received: from kernel.org (unknown [104.132.1.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AB16622409;
 Sat, 14 Nov 2020 20:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605387287;
 bh=cE3qj2/4CwlQNpuMAyK8r2L5qjswJHbnUptf9S9E3Io=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=BORxj4mynClyqsmCszaZu++rmmXi3S4gROmc/wjqY1aimmqnwzswL9WQqrY5AErX8
 qbX4IZNpH704ff00fsSb0grksSvbKgPEgWqKcJVHNpDdWr20rnV/8/2ZwM3+qKg7gI
 j8sCpPJx6LLj1s5Ov0Ic7JGuOjDYM2z0G40/A0qI=
MIME-Version: 1.0
In-Reply-To: <20201021162147.563655-4-jbrunet@baylibre.com>
References: <20201021162147.563655-1-jbrunet@baylibre.com>
 <20201021162147.563655-4-jbrunet@baylibre.com>
Subject: Re: [PATCH v2 3/3] clk: meson: g12: drop use of __clk_lookup()
From: Stephen Boyd <sboyd@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 14 Nov 2020 12:54:46 -0800
Message-ID: <160538728665.60232.8766919681942166161@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201114_155448_608801_28434698 
X-CRM114-Status: UNSURE (   7.82  )
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
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Jerome Brunet (2020-10-21 09:21:47)
> g12 clock controller used __clk_lookup() to get struct clk from a
> struct clk_hw. This type of hack is no longer required as CCF now provides
> the necessary functions to get this.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---

Applied to clk-next

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
