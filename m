Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE33D41C18
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Nov 2024 08:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G8X5wo+4Q3R6ZE6nzQNERX8XEqINWQoFRveh/BVz7JA=; b=SNmWXJo1iyPm78
	jFSnEXdMlvuMXOB37ntS15XC9jG/qBv7z5CmhXyLs/aDnH3O9Pw4cA2Mo6XETdJXPDKQSMEJzfCTt
	mk3pUOAsxm6ED2vHMZzLOB/gHf0dM5wmvmSz5RmD6ZPbjcpyhfJEroyWliy18EfBacUcAURhcZYDT
	AQXgqmeoiL2uSp57gA6OFXcnd6s1+khQ4Fb5oKXjj7fbjDXXYCXMfj/fDuCjGLocUtLwFKtGLHv4h
	BCXV4uMVI22k0Jt1FlNdkEDnZZxn9tiLOlFGeo8aR7H6wPFkil+GaYRIf8zrUQP1QpA8kUhKUMSbH
	epPNJVdsftSuUMQ3FKoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB9CM-00000006AQC-3bTJ;
	Wed, 13 Nov 2024 08:58:02 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB98t-000000069p6-2wel
	for linux-amlogic@lists.infradead.org;
	Wed, 13 Nov 2024 08:54:28 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2e9b4a4182dso377589a91.0
        for <linux-amlogic@lists.infradead.org>; Wed, 13 Nov 2024 00:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20230601.gappssmtp.com; s=20230601; t=1731488067; x=1732092867; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a/QQvBKfHWcx99S3MFyn6CIdzyDe++fvtDF8fIMsYbQ=;
        b=04EPWcvTEFOlFJCoX0mMU+5mXiEFOLDTzRzr+FahzvhEhZeZM8dqyfn2kl1mKar+d7
         c12ExC68czvWr3rKwMVqbWWPzhM5irADehXKYEATt6KMIu62OncyIahPmgpfroGygA12
         PHFB6quDl8jnd6oN3Kz6ERcSgSawpik90laGbGkN40/8BJCfd7Edf4LtKhSWcdg+HK7t
         v11BFtnG/RttR69Gs25K/jzc0msW6FTiypMamZzPhezSzzDCaFTBmrP5T2yLCCSqakRV
         zTPpbeod1oJE7TDVrHaRvZhKf/TVqKwh6E53NRU2Z6NliAmEKduW5DAS/uYeI2AiT5U7
         17nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731488067; x=1732092867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a/QQvBKfHWcx99S3MFyn6CIdzyDe++fvtDF8fIMsYbQ=;
        b=sI/YvEcwMAFy7vqXEzUnYvEncv/XNv6xoYmWzVkZ6PRlNcKCBCM9h7Os4hN8s/lxD+
         mk52vTDhe9yVK3zACCdB/kH6EyagxLavM60n3cIvuQzQxggnFydmGyoo3mkXVVGM4u1J
         z+SsADh0m5n215ipwluzk8SMNHYVT0hvSkRvfPzRNurbYsPfsgt2EW3njjDcoVXRQrX4
         B0M4cPUduA320jh+/hd5Zg4ctr7vOQYVQ3nwRC3Jp3aV0RTlgIseYOsDYzHsdaFpbsDs
         uUoTQkf1t02VUibnNAgUgTbYh4c4HXOjXIt3fdHx62i5bcOlF8TIh/VxJeVlJLLr+pEl
         80HQ==
X-Gm-Message-State: AOJu0Yyayyr+GMf7XXsvE4yIjzYok5IGdSwON+cUbjfA2kR0RjCN6T+Q
	mLjduZ0RLa+uZ9NeAJQshOfuc6GXQ+lcu6x4pNVTyChDKCMDnueHJycxbR3k
X-Google-Smtp-Source: AGHT+IE88wJlLPAh5zibBEt5ecTqueLIppGyqpsefbMEfjjtHXPO/LKkFBoqmw1dPbdImmuU0m0nWQ==
X-Received: by 2002:a17:90b:4b88:b0:2e0:f035:8027 with SMTP id 98e67ed59e1d1-2e9b1ec3ad9mr27550774a91.2.1731488066639;
        Wed, 13 Nov 2024 00:54:26 -0800 (PST)
Received: from localhost ([2405:6581:5360:1800:a83:68dd:5f1c:4ed9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9f3e94e8esm957843a91.3.2024.11.13.00.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 00:54:26 -0800 (PST)
From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
To: linux-rtc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: linux-amlogic@lists.infradead.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Subject: [PATCH 1/5] ARM: multi_v7_defconfig: Add RTC PCF8563 support
Date: Wed, 13 Nov 2024 17:53:51 +0900
Message-ID: <20241113085355.1972607-2-iwamatsu@nigauri.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241113085355.1972607-1-iwamatsu@nigauri.org>
References: <20241113085355.1972607-1-iwamatsu@nigauri.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_005427_765408_AD0DA042 
X-CRM114-Status: UNSURE (   8.77  )
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

There are many ARM dts that support RTC PCF8563 but are not enabled in
multi_v7_defconfig.
This enable RTC PCF8563 to work with boards that uses this.

Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 9a5f5c439b8791..139b1c6fa656fa 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -997,6 +997,7 @@ CONFIG_RTC_DRV_RK808=m
 CONFIG_RTC_DRV_RS5C372=m
 CONFIG_RTC_DRV_PCF85063=m
 CONFIG_RTC_DRV_PCF85363=m
+CONFIG_RTC_DRV_PCF8563=m
 CONFIG_RTC_DRV_BQ32K=m
 CONFIG_RTC_DRV_TWL4030=y
 CONFIG_RTC_DRV_PALMAS=y
-- 
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
