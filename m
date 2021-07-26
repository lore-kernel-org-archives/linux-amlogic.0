Return-Path: <SRS0=QpTa=MS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5973C4320A
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Jul 2021 08:15:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7357760F4E
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Jul 2021 08:15:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7357760F4E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3p07FZowRg4bLXqi0kim6nehAxdsjO5HUxbbXQy84Tw=; b=ozgr3QXb1ITLhz
	TQfSX9QULnMySViaChf//ULN16Qjmji+ykEuqoYD4scmn6L1OPjJATjDCKsoyWWO5WX7mivnDujlD
	QbUME0K35V77vUB4npxmWkIbFbct7OuM4NDI78pVlS9ro+j5LyJvDmLbTHgokzpBLE7CM00tNKoRF
	9JuQqJ428+1FJZCSjk5pCyV0WLJ12/dQXdK4/6AhU169/41OCpzCh1KsgAjrzYXyNW4YYNLAA/Bxf
	24GWtADcHd9DefdefJVK1NxsNhbfP0kjk6QSx90Dfsk8IWx0KaYoq5AyxCrmxDv3f1I7H1QQwhekA
	dSu0uCYyWrassAdbK+7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7vlK-00A7yY-MN; Mon, 26 Jul 2021 08:14:58 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7vjK-00A7Ad-E8
 for linux-amlogic@lists.infradead.org; Mon, 26 Jul 2021 08:12:56 +0000
Received: by mail-wm1-x335.google.com with SMTP id
 m20-20020a05600c4f54b029024e75a15716so4717526wmq.2
 for <linux-amlogic@lists.infradead.org>; Mon, 26 Jul 2021 01:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E1tqK1iTmNRLpcSNr0tub0A4uI6FbhV9kAz5unEaOR8=;
 b=qM+U7w3dxOkS3lq/Bekk4CYwU6QOPEr5DkUYPksSpVjVWCQkXUo+/IFShRFANUkqQz
 WZ+/szCu3z8L8ubAWqAcUHplQsA+lvs1GK8fwWrHyT1h2tOsRL0Kr55W1RAZG80/F00o
 EDrGOrH0FceaRBjGqeqqq51YsJw819KuikQk6wuKtED1dVdTpD3DudrkNIiJhGN17eJ1
 kw3bypQD4og+tzPPS0l5pLAiKR2owJLNZ+lrSbHX+2sEr02FnitRkqSNZiKYz8hCg64p
 hSjZo/y+Z+03h+3Tg4u4fZ5g9q2IRiacFTgI7AIkdY97utPoCpXWloTe3Dig6puuAYSu
 DbHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E1tqK1iTmNRLpcSNr0tub0A4uI6FbhV9kAz5unEaOR8=;
 b=Zh+lBowQihB5IqG3z2Oe/B7c5G5kxfZHHa0GNYHuzPIjV7Gg99U+JBhZNkBzKhgC66
 +O5o1nXrgPnfKrYRLFYdDjpMfc7mORJgOqbpQbs/hx8BB3P692lC8amegEOLr49P315K
 wwX8tBFDhe4U4m5GlQ+9ZFG6B7ccI1exmyR0ECvQT7M8WZwFtT9Yv3YD+gfRPE1n3MOs
 t5IrBSXas1LoPR35N+C4DfFhYl9tiTZ7s/qEdMW3M0cH85PZh5CrKBBKHuENDRFj+xbH
 EOqN5V4jH98zy1Ulo54AG0AonQtMr/TA89VN0C2yvwbkajQHsYYd0gkoIqrxnzeRrXVi
 qxeg==
X-Gm-Message-State: AOAM531s3050SodQ9gMtXs6WPyEy9Ogkn7/FWX4fv7zwHxcVKQavTXl1
 5Ok7S84xt1tcOJWTRYg7bp3k7g==
X-Google-Smtp-Source: ABdhPJz2/+Tf5eYCYct0tYno0IeJ3EoZiBJQ7jLZx/evy1F7uvBD3CbLodH4A1LLF0nDpgeY6bIdbQ==
X-Received: by 2002:a05:600c:4982:: with SMTP id
 h2mr16154472wmp.184.1627287173204; 
 Mon, 26 Jul 2021 01:12:53 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:32b6:aa71:d2df:4f1d])
 by smtp.gmail.com with ESMTPSA id c15sm646762wrx.70.2021.07.26.01.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 01:12:52 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v3] arm64: dts: meson-gxbb: nanopi-k2: Enable Bluetooth
Date: Mon, 26 Jul 2021 10:12:41 +0200
Message-Id: <162728713307.14205.377532057351030776.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210712135919.32059-1-wens@kernel.org>
References: <20210712135919.32059-1-wens@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_011254_569527_2F1A5896 
X-CRM114-Status: UNSURE (   9.71  )
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

Hi,

On Mon, 12 Jul 2021 21:59:19 +0800, Chen-Yu Tsai wrote:
> The NanoPi K2 has a AP6212 WiFi+BT combo module. The WiFi portion is
> already enabled. The BT part is connected via UART and I2S.
> 
> Enable the UART and add a device node describing the Bluetooth portion
> of the module.

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (for-next)

[1/1] arm64: dts: meson-gxbb: nanopi-k2: Enable Bluetooth
      https://git.kernel.org/amlogic/c/46f2735c17d215fd76c54d7bfc4d7ca5ec206eb2

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
