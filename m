Return-Path: <SRS0=TeeN=AW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C10DBC433E2
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 Jul 2020 00:15:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A123206E2
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 Jul 2020 00:15:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U3WpjjlT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="R2TwNkDs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A123206E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QjnrR8KWrkbnMZh3pb2byh4bFMP3e1d6Umz6jNIN3IU=; b=U3WpjjlTLGfomAr1K3srXSEJH
	kKluHMy8Bg6EVbEuAULe9CdV4KOkxdl03c35LXJbgRmAg/1zydTw6CIfCvuPusLIvlTFFHhdqaNYD
	43z70gfEabN6PY0Dtk08J0xwf8KnpIzi/Vk3bwNlUEYjfuCBUW58T5mIM8fCFf4ovWIfsRyb/lUGJ
	y6zKip0XTkvTWYDD28QPfbHkqURkA6E40TUWmtz7jKWVxlGPmaji1XUFJNhdzbDN20AHufLWmBCjm
	eWX4nbwMRIANEGYtsMgy+0O5+ewy1xU3qWzF84uSx4xdMLy8pwsUTYvPdeQBMF4w2uFj1KMmwT7Ty
	de+grh7mA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ju3B7-0001dI-FN; Sat, 11 Jul 2020 00:15:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ju3B5-0001ct-6g; Sat, 11 Jul 2020 00:15:40 +0000
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DD0E1206E2;
 Sat, 11 Jul 2020 00:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594426538;
 bh=JZIk80UP4v0ttNFjHG0i3wUg8SjjNGxJlfYgxJLP91g=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=R2TwNkDsJgap1br9Oh6oU+3pp+fCI2PwqktSIZl1hta/vISTHc+z1ZAGKcdvNDW6Z
 ErEeu+8JodwKJkm7vMdqM0H3aCX/9Lfp9DR628v7qvU27kEmYmWyKJxevaYzWoXmlx
 bFKL8qF8TK1Y+3yS2AmbhFx8wmLKZaR8fX+stKic=
MIME-Version: 1.0
In-Reply-To: <20200703175114.15027-1-grandmaster@al2klimov.de>
References: <20200703175114.15027-1-grandmaster@al2klimov.de>
Subject: Re: [PATCH] Replace HTTP links with HTTPS ones: Common CLK framework
From: Stephen Boyd <sboyd@kernel.org>
To: Alexander A. Klimov <grandmaster@al2klimov.de>, devicetree@vger.kernel.org,
 jbrunet@baylibre.com, jcmvbkbc@gmail.com, khilman@baylibre.com,
 linus.walleij@linaro.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, mturquette@baylibre.com, narmstrong@baylibre.com,
 nm@ti.com, robh+dt@kernel.org, ssantosh@kernel.org, t-kristo@ti.com
Date: Fri, 10 Jul 2020 17:15:37 -0700
Message-ID: <159442653716.1987609.11345174466202511332@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200710_201539_473194_ADEAC97F 
X-CRM114-Status: UNSURE (   7.58  )
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
Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Alexander A. Klimov (2020-07-03 10:51:14)
> Rationale:
> Reduces attack surface on kernel devs opening the links for MITM
> as HTTPS traffic is much harder to manipulate.
> 
> Deterministic algorithm:
> For each file:
>   If not .svg:
>     For each line:
>       If doesn't contain `\bxmlns\b`:
>         For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
>           If both the HTTP and HTTPS versions
>           return 200 OK and serve the same content:
>             Replace HTTP with HTTPS.
> 
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> ---

Applied to clk-next

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
