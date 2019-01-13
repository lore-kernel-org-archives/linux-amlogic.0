Return-Path: <SRS0=Cs6g=PV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7F52C43387
	for <linux-amlogic@archiver.kernel.org>; Sun, 13 Jan 2019 06:11:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 869D82086C
	for <linux-amlogic@archiver.kernel.org>; Sun, 13 Jan 2019 06:11:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZP6QBnbz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="j/gmDPpL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 869D82086C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h3mpP8NVWbQnQlypWCcS2hTiGs8WEtFJM1DsTw7XNhs=; b=ZP6QBnbz7CXvDk
	zOhXrgAv9zVfgkNHlR54rJT6vevHabpMeOM+UpwOPp0wyrU2pddlT6EuUfLj55Gq8x3wgaG+cYsfW
	HUb5iOrm5bF5Ohu18YCLjecM7YJdYVMO5fZ94+ifvgaYZK88RqdlXDKTvb5vlnKGBxnubgs8zmSEl
	hGOO0fmMnVWccjaGDoEuwJNUnOPYkj/3WDUJDfZVaOUxKeVx4/nFXUPufx4V9/NgYcTRE0/bRDmF6
	TyIJrQvryRPH5axv8HppFw1wK4DiYAl/RO45sHEQJRtjRx9nbPqUroRvO9gez0w2HPrUcQMSrk5OZ
	rDUSZgW9tLoOz7jfzirQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1giYzQ-00044c-HE; Sun, 13 Jan 2019 06:11:20 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1giYyx-0003Zh-Rj
 for linux-amlogic@lists.infradead.org; Sun, 13 Jan 2019 06:10:54 +0000
Received: by mail-lf1-x142.google.com with SMTP id v5so13501343lfe.7
 for <linux-amlogic@lists.infradead.org>; Sat, 12 Jan 2019 22:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=tkT4os5suOolX0+9adPZc8OhELYJ5AMG9HIWviL6xyU=;
 b=j/gmDPpLkaiwt6BWqVkEHMeXhWIWJvh/T/syCwOy06crZnOaAmhGKuhvw4f2xbfmLc
 nc60bYRpZQKBvpgcjeu9gtzd++rJShAXlAw8//t2/NvDBEFnEg/zspT33/mGlBnTKuqt
 MLA16Zb/dDHQC+p6e+XhKL/7lwq13WGb/7WoO4B4b6W0+dE9Fee4X4GX0QOUka0P/RSU
 oSIyN00otRbObA1U4CxVgRak6HU2yw3vf8VYt0Eejk475Wg3tKJ/Lg3eR62RNZ9Rua00
 JGRBiZ77JcZDxKHRew+h5oY1382lQgd5GCpMs6evDzd5zsFim4razntH49bZJ6JB0rHJ
 FAVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tkT4os5suOolX0+9adPZc8OhELYJ5AMG9HIWviL6xyU=;
 b=ukGs5r0PnVknfW9eEeC+PvF8xzXud564L3+VntvKw22doaVCqP7yhJ2OtDsAsoubW2
 NhTg2bpQSQr3zTHggPKX9yGWM8G35JKmz3QPkGCLtesXw+nc70iWKIFfTEYpzyUeBldb
 DiXVOU68fkDCSNLtz3TWaHKjjePxkmc9MF3y8JLS9eHwYYE1h7tvvWgQiIjFBd/KtL9W
 k6xgMP2QJchL9lXbjKtKgMoWz9ZN9j/NPuEDcDzyXN8DeEG8gsPEhFnmyGtlgPAu6Tav
 ZYMQblvgNtMpAqTyK0Gr76QPoZBDXLDJEJBgQmPhiUSf/kQh2zOXGOT7mxyAYTqcNgm/
 vE7w==
X-Gm-Message-State: AJcUukfvCeG331r0SegNsjOZpk0/kozGz8RvVZJSjbVkHpWx8FTA6yEw
 aGAKGUoCgYoixLDSo73FKuhqLisM5KY=
X-Google-Smtp-Source: ALg8bN6JZENAqs0Smd3CAoDKyTZELCQMFw1njtRI0BUYIvRjE9K/DfEN84yGL9mLwduAjVP1cFISNg==
X-Received: by 2002:a19:cc46:: with SMTP id c67mr10737263lfg.145.1547359848738; 
 Sat, 12 Jan 2019 22:10:48 -0800 (PST)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
 by smtp.gmail.com with ESMTPSA id r26-v6sm16982455lji.25.2019.01.12.22.10.47
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 12 Jan 2019 22:10:47 -0800 (PST)
Date: Sat, 12 Jan 2019 22:02:45 -0800
From: Olof Johansson <olof@lixom.net>
To: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [GIT PULL] Amlogic fixes for v5.0-rc
Message-ID: <20190113060245.gxa7m5e2vzfplsa2@localhost>
References: <7hzhs8qcdq.fsf@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7hzhs8qcdq.fsf@baylibre.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190112_221052_217464_25A28908 
X-CRM114-Status: GOOD (  12.22  )
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
Cc: linux-amlogic@lists.infradead.org, arm@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Jan 10, 2019 at 04:14:09PM -0800, Kevin Hilman wrote:
> A single fix for the early -rc.
> 
> This is actually one that I missed including in the defconfig updtes for
> v5.0, and fixes the out-of-the box sound card support for the newly
> added s400 board.
> 
> Kevin
> 
> 
> The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee500c:
> 
>   Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-fixes
> 
> for you to fetch changes up to 19a220dd1e8a1b1d8e5e2f8f4a25313c4b02d527:
> 
>   arm64: defconfig: enable modules for amlogic s400 sound card (2019-01-08 15:27:50 -0800)
> 
> ----------------------------------------------------------------
> Amlogic DT fixes for v5.0-rc
> - arm64: defconfig: enable modules for amlogic s400 sound card

Merged, thanks!


-Olof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
