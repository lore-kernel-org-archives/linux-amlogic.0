Return-Path: <SRS0=4Wh7=NB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B1B9C4338F
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Aug 2021 07:59:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9501D60F13
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Aug 2021 07:59:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9501D60F13
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3X518UE0ej0RuzYBNhVP4XsGTn/f7i3nekyhIu4kvEI=; b=yaROESUY19QhDz
	gp+AwuDkEzZMiSOc/HCaY4SJAsGw7k8htXdreq00D9dUkYyU6Rvzmi2DIJ1aGP+5M8Ioon00Msxf2
	wkExDsAF3nk25S/5f8JW5tYPo7rEBUVlOqPq8grc2bzjWA3uBuF/jpjIlEC5BH58DF1iSjn6E2dOx
	85bFkYYaoAkyfSfo9W1+Yj/1A2Kz/G5E0EkdWdXIPfeWRl80aL0u/ulzOhWa9BmGAonm+R0I4DKRv
	AtJfg2/erCiDJKOgMMNUPKGiu9V7DzYZNQ0IsxWlRaYUZPrkkWBOyLZYiwPogbMFXsnUTkZidbeBS
	GZoE6tdDJRejt+lcb7GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDMfX-002qp9-U7; Tue, 10 Aug 2021 07:59:27 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDMew-002qWm-9C
 for linux-amlogic@lists.infradead.org; Tue, 10 Aug 2021 07:58:51 +0000
Received: by mail-wm1-x32a.google.com with SMTP id u1so2364274wmm.0
 for <linux-amlogic@lists.infradead.org>; Tue, 10 Aug 2021 00:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=az+6FbSVeQcfGxgUtfAori5lUKY+79GO47gVQy0HruY=;
 b=oHSnIxVK1R+pxluaznogtJUMVrSIlFuRXfYUMzUeGgoOkk6ypUuvTf5A2TcNYZRQKN
 mLIyMvSMRkceMA53LvBUjQepkis4FapdxtKMdlk+OanN9HdKL4K/7i6N1uhorIDv73EB
 FjBYC6a1cUgRlGQk1DPqDgdE1CNj85ArR7kppfaRSo6zPRcQnEe1MvpJcM3PtPLRy4E/
 ILQsBWfMTI9vjjb8PnMEtvl+FaqWuPNh35knUmPTiJ+vyZ+GiX8+q+dcLriIhtC/G2oK
 B1IZn+KDAmMLKMUR2zXqoe0W25tD3OI/3hnjtZPKj0lCfxdD5vBGXktUH8ojmprhqnG2
 7Ucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=az+6FbSVeQcfGxgUtfAori5lUKY+79GO47gVQy0HruY=;
 b=oETLlrbA/lm3Q65tEnXLuevc+SC3hJ3u55harsGwDfXvA+AH5aFFZs0rcwMffWTch/
 +n9ATYZOTqky2qa3/hYK6qX8frEmsszHC+H30NYM/TyblLQyko2PyijpH3E9OqLMJHbM
 6OCBPzautNJwFyP9nbyFxDm8xCXMhrn+3QMzjvIReotl0I8H0Rs1f3X6J7lnO2nVypIh
 4rVg2IwT2fKxxYh6Ifo8+Kop0yN2LNT2vJs77EiXDD2oGdI1n9ZSCKvqCOvEIvZVUuO1
 fbVSjWjT8A3Y+H/krFbHKU5qQdRe1lxRJ+oduZ7LilIwVUN2yOaEjkMaCP5T1/zi7335
 DWQQ==
X-Gm-Message-State: AOAM533iSZlZmMXd1Z0QpQKhylTN0J63+/9ukvnIw3Kx5r92ebZVdKy1
 mPGbrCzzQbNcn4rc38+5gEeLtL0gtcxnw4ll
X-Google-Smtp-Source: ABdhPJz8XCNayFApSfos4bR2F31+2QXn4+nRfP5W1mwgK39NBwUs+TU0oX74xTulywVs1cp4h0Ol0w==
X-Received: by 2002:a05:600c:3b12:: with SMTP id
 m18mr21387489wms.143.1628582328412; 
 Tue, 10 Aug 2021 00:58:48 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:b710:2b6e:27aa:f0a0])
 by smtp.gmail.com with ESMTPSA id d5sm22175380wre.77.2021.08.10.00.58.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 00:58:48 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: linux-amlogic@lists.infradead.org,
 Christian Hewitt <christianshewitt@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh+dt@kernel.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson: add audio playback to vega-s95 dtsi
Date: Tue, 10 Aug 2021 09:58:35 +0200
Message-Id: <162858223387.1486110.6330831652699678995.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210804140258.4666-1-christianshewitt@gmail.com>
References: <20210804140258.4666-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_005850_370833_A71C44E4 
X-CRM114-Status: UNSURE (   7.86  )
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

On Wed, 4 Aug 2021 14:02:58 +0000, Christian Hewitt wrote:
> Add initial support limited to HDMI i2s and SPDIF (LPCM).

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v5.15/dt64)

[1/1] arm64: dts: meson: add audio playback to vega-s95 dtsi
      https://git.kernel.org/amlogic/c/c6cf488e3bfdf92427686317d99e0342516753de

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
