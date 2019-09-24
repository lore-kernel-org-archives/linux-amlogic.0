Return-Path: <SRS0=mdkS=XT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9626C432C1
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Sep 2019 18:37:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A38CD207FD
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Sep 2019 18:37:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BQybQ8RW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="fecu14KJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A38CD207FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g2eRc8dK3Bv1VMjWD695TVzOO1BNO/qtxonGHZ/XZQ4=; b=BQybQ8RW2Y0quk
	FAl/xjDtXU0C/ixF+BVrAXKu4z/byaFcixz6QLJVYRpBKKYNby8R1mbE3wLo0yeYG8B3Di7KZTd8/
	C3u9Rp/qiDOJowH6WcfoEV0jruHukHbB8XyYpWfJtpSj1260mCuknhOArlEQyTDfqN4f3TVHw7BZm
	pNnW1SNyCOvYY2z8tUyHrI6EOqtPaiGxoZlKBArGsMmAWGQ68zoNpAhBI6Sa/0aIWvuk6xkEeKoGI
	fF+oZ1/wJFFHly4XpC9FKnPwkJ4H21LANE417fI+2AuyjXwASrbe9F9/4ktYEtQPcOyxnydxeu2Wd
	VciI2WJi4kEimCKHorig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iCpgK-0006DR-HX; Tue, 24 Sep 2019 18:37:00 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCpgH-0006D6-Cy
 for linux-amlogic@lists.infradead.org; Tue, 24 Sep 2019 18:36:58 +0000
Received: by mail-pg1-x544.google.com with SMTP id z12so1763706pgp.9
 for <linux-amlogic@lists.infradead.org>; Tue, 24 Sep 2019 11:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=qezDz9bspudrXAh4YzmNmsdn0fgIjx8hse3GBBdt44w=;
 b=fecu14KJIkEqCODinTGcjcMfGpRWzcjnZFogT0JUIu66bFQC7+q3cF+TSdz2tUBHVj
 fFZeKGbqEQ0gZlbZk6x76vdE4CG243uv7ZO5mnjbL0M21t6bj9W+TZkirqRhfIWl+2R3
 NKTqpZfjVK4lurojreAu4MZPBFoexZ6PKU7qEYt6Yku6GMh3zZgZ+td9CBcQ/LmRQXow
 nUpIN8KQl7L1BbI9xKd4zoSQLITcTOXqNuczc7HFJnToYmzc3xny21pWhN21/2m0D9w/
 aQqJ4YmdakJ7+6PyC2cTFa9YcebBvUBQpv4iD36RKymbFRO/BootG5dBQBQ686NWpkxq
 KuBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=qezDz9bspudrXAh4YzmNmsdn0fgIjx8hse3GBBdt44w=;
 b=s/+6TCrh/9OA364VcHu0v3YY9+q0qy38LrZygDjaYPecRk+WmDX8sG3eP0bfl+kf3k
 XLNKW9ngJWp8hPJX6ktbqNXMJMze04nC6cE4c0i9Fy/w1naiHMIO1U+pnUrZDzQNNkzb
 UH1nHTHQSOKV+HfFGDp204ajkn+vkCo7rI7tR4vpWTtA5d5F0BXoIal/K+VO4lbppt/X
 yISwKo6dgmgjcNjV5JDWZWleHXyVasE1e8+XBIE9eJiVBPygueYS6Q9J3HTGzTQ4vDHi
 CfoFCXCcAuVE/io+jcqlzwa9rRRtMqOEZt7BGKnIEtON5Xu0+7/m4AN009JlnLi/nize
 C0EA==
X-Gm-Message-State: APjAAAUybylrm07RHh/IqkHjfT4HQAVQc/pcvLho4SXaIauENn5W8OA8
 1iKdsWsEqIDsZdLzNndVE5bFOg==
X-Google-Smtp-Source: APXvYqxr2Opu6oYUEulaL+1hVz4ZRODiRh23zAlZPgvT6KnZjaIacvduxLwlgaFt8Ai95zGjaIFHdw==
X-Received: by 2002:a17:90a:5ae4:: with SMTP id
 n91mr1528924pji.143.1569350216705; 
 Tue, 24 Sep 2019 11:36:56 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id a18sm2429300pgm.25.2019.09.24.11.36.55
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 24 Sep 2019 11:36:56 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 00/15] arm64: dts: meson: add keep-power-in-suspend
 property in boards SDIO nodes
In-Reply-To: <20190829152342.27794-1-narmstrong@baylibre.com>
References: <20190829152342.27794-1-narmstrong@baylibre.com>
Date: Tue, 24 Sep 2019 11:36:55 -0700
Message-ID: <7hh8517d88.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190924_113657_444177_8AC8F69E 
X-CRM114-Status: UNSURE (   5.88  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> The WiFi SDIO firmwares requires power to be kept while entering a system
> wide suspend state to keep current connection state and eventually wake up
> on packet reception/new AP connection, thus add the keep-power-in-suspend in
> each boards enabling SDIO.
>
> For the record, drivers requires it are :
> - brcmfmac: drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c line 1125
> - mwifiex: drivers/net/wireless/marvell/mwifiex/sdio.c line 426
> - libertas: drivers/net/wireless/marvell/libertas/if_sdio.c line 1327
> - wl1271: drivers/net/wireless/ti/wlcore/sdio.c line 411
> and bcmdhd out-of-tree driver.

Queued for v5.5,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
