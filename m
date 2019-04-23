Return-Path: <SRS0=V5Bc=SZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0940C282E1
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2019 18:25:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1DA5208E4
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2019 18:25:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kxu+24BG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="zcYFIFI1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1DA5208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:To:Subject:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iCF7/HL0QBhbA5+L+NSjV5KBRX33byoEhQ+59R0G4rk=; b=kxu+24BGc+lngz
	hXaHRMOGzSgHeAUKcJXg0y7bg10GTKhKOcIY276K+fb6aOdSmhkXLQj7/FsVnvMg0Hp7JeEpyNVVP
	qR88aqv93me0vMCENnS8UvZkpyfh3wXgEuiTVqtHuS5Dew926G44GsQ8Y5fw0uzfkRipfjXvUgsbt
	Tt5F2EQmxldR6z7/Suxrc/1VM/ftH7z8FReZf8RAFBTzD4H28+GaaU4SAbAOhV0LqwqEfgQgojoMI
	6iQXFiKWAIMaDnpWX637AhG3r12Kl60ev1dfH6U33jHbdDLVYFsqiu0evBilrgA8C0zmn3oVQieyz
	8Toe5t6J8XS+z8bBouHw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJ06R-0004tM-LU; Tue, 23 Apr 2019 18:25:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJ06O-0004r4-Fk; Tue, 23 Apr 2019 18:25:09 +0000
Received: from localhost (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EE776208E4;
 Tue, 23 Apr 2019 18:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556043908;
 bh=mUob3HIl3gndsyR1iLcVzKL4U93DGYlMUnnCuNGylyY=;
 h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
 b=zcYFIFI1I2s8fZg3JyG3iueGgqtwdECfgGu4Wd9Bqy04UasCOf2zzxu33lMY+X/W0
 iRdX0bM7n3zJHSM5DYLxLgJnMJKY5yMDKYA5B2GUDMGeWbQ4hMiBgYm/rCpkowYXI2
 aNRW9Osrp2khw8vEE5pXULiBEizqtBneWpX1R408=
MIME-Version: 1.0
In-Reply-To: <20190423091503.10847-4-narmstrong@baylibre.com>
References: <20190423091503.10847-1-narmstrong@baylibre.com>
 <20190423091503.10847-4-narmstrong@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 3/6] clk: meson: g12a: mark fclk_div3 as critical
To: Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com,
 khilman@baylibre.com
Message-ID: <155604390724.15276.2042141881910266821@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date: Tue, 23 Apr 2019 11:25:07 -0700
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190423_112508_551152_1185041C 
X-CRM114-Status: UNSURE (   6.49  )
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
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Neil Armstrong (2019-04-23 02:15:00)
> On Amlogic Meson G12b platform, the fclk_div3 seems to be necessary for
> the system to operate correctly.
> 
> Disabling it cause the entire system to freeze, including peripherals.
> 
> This patch patch marks this clock as critical, fixing boot on G12b platforms.

s/patch//

Usually we don't say "This patch" because the voice should be
imperative. From submitting-patches.rst:

 Describe your changes in imperative mood, e.g. "make xyzzy do frotz"
 instead of "[This patch] makes xyzzy do frotz" or "[I] changed xyzzy
 to do frotz", as if you are giving orders to the codebase to change
 its behaviour.


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
