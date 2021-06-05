Return-Path: <SRS0=xxsk=K7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_NONE,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20488C47082
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Jun 2021 06:27:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E16DC61246
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Jun 2021 06:27:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E16DC61246
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6NO8tPoqQq4VLPW9wh+w+fqZ2SOcHJTNpEJaWveWX0w=; b=EFKrYBbe0ChR+3
	C2+R5+qQeYUPY7iv8qUA+vHMKRZuTf1MJCN1VGx1JqdHcqMALLPY3CFE4SSjLtF/He+IRgoG6uH8n
	uEuLuiqq3Vh/6DN4utbkdCYFYgeQNJABmZmiLgAxKVF847cN+os2tAPVxjxZwpzwmGA3iXonPFeGp
	loraLFXtK6uEWmghpliG6nXdlBzcumOHG/W3NDN8o5pUImCNURX0ydCNYcS3dfPM0oM7knydEwBUV
	ch1s6XOP/lgLuXuBdVDOtsJA+A+ICyBxHzH50eRbHCMrBlMKITGj96EABPPO3Cw8/2nzikA1DDYJB
	/FUXF/QezlHddM7fN9bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpPlq-00G7od-7k; Sat, 05 Jun 2021 06:26:58 +0000
Received: from mail-pg1-f172.google.com ([209.85.215.172])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpPk4-00G6wn-65; Sat, 05 Jun 2021 06:25:09 +0000
Received: by mail-pg1-f172.google.com with SMTP id e22so9548966pgv.10;
 Fri, 04 Jun 2021 23:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r2xrOsoZZxRSqy6qqxdG6tTS5Reg+2W0VGzUs3SrOYI=;
 b=mX0ja+UyXWgWge+Nfd9JNZE2FWNPyXfhFLMZv8TiHr+JyS3IWaPGSERSU+I29OY3v6
 c8mKxeRP4OD+5RaXkbU5m1TRiQS2x8ZE4HTkZUvLc3vp+aoQ6xx0RzYDr11wGt9hrClV
 Hz8r44bIn734DK6qa97yY/2WFv1LKAGIl5lDHjNehyVuUXAaMdMKJKo1uHhDxbupjk3c
 as185e6R6/rn6rYQ48N9GnW/QjVH48BXifkEywxUoUAKxv0rzPQ+VxRP0aEuAa1k1sH4
 mOxTG5LHoSa3CW1YKBJ5+hDrrgy8DXsVTAQdyycEjm21oTzY5F57xF5mKrNx0rSN2HJs
 clgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r2xrOsoZZxRSqy6qqxdG6tTS5Reg+2W0VGzUs3SrOYI=;
 b=NE2jPzjt8fabhEjfvoSmhzDIS/dPwRn5vASU9ToMZfTvB0LHCnAWeuMsxaK1j1L2Na
 5sIpAoVTbMd7znCibaVcLfUQ8MuitL4xs7aSw6+oORAOtzQWspxS5bcSTiOygphKNxB2
 nOUrOd3kw0ZuZVZdsyZiZjdKO2g+U/tnxCFZQtTUN0OTM/PUHWQFWLxa4nVWA2ZyaoED
 VYzH1i3186uqPQAnu6g1nrGvl2CvAMZsMLES9niG/rGvohJZ1MsSphCJx9rby1PAPJr0
 TU0Wpene8w9dyo7UM4Lw82grTLRHoWtwPb6Fb8VMShHoXjNJ7u3X7RAea4jiOL5fyLSp
 m3Xg==
X-Gm-Message-State: AOAM5339KlN9vMZZTrw1UJ/rGiLSLKfEn6YxDDIbei9o+9HvzHnqEgLg
 YFruN8p1TzwwERRGc4Rh8UU=
X-Google-Smtp-Source: ABdhPJyPUtXlYrM7kZKxm8T97ZgicScU6t6VgaJweoC768ycu9GYxWV/unBxwusbRTNFNUhu8chhtg==
X-Received: by 2002:aa7:9438:0:b029:2df:258e:7f10 with SMTP id
 y24-20020aa794380000b02902df258e7f10mr7844755pfo.79.1622874247508; 
 Fri, 04 Jun 2021 23:24:07 -0700 (PDT)
Received: from localhost.localdomain (199.19.111.227.16clouds.com.
 [199.19.111.227])
 by smtp.gmail.com with ESMTPSA id v14sm2800870pgo.89.2021.06.04.23.24.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 23:24:07 -0700 (PDT)
From: xieqinick@gmail.com
To: robh+dt@kernel.org, narmstrong@baylibre.com, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: nick@khadas.com,
	artem@khadas.com
Subject: [PATCH 6/6] arm64: dts: meson: vim2: add i2c aliases
Date: Sat,  5 Jun 2021 14:23:13 +0800
Message-Id: <20210605062313.418343-7-xieqinick@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210605062313.418343-1-xieqinick@gmail.com>
References: <20210605062313.418343-1-xieqinick@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_232508_244782_536D8B0F 
X-CRM114-Status: UNSURE (   9.05  )
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

From: Nick Xie <nick@khadas.com>

Add i2c aliases for Khadas VIM2.

Signed-off-by: Nick Xie <nick@khadas.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
index 70488ae45876..3f3ea65df665 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
@@ -21,6 +21,8 @@ aliases {
 		serial2 = &uart_B;
 		serial3 = &uart_C;
 		serial4 = &uart_AO_B;
+		i2c0 = &i2c_A;
+		i2c1 = &i2c_B;
 	};
 
 	chosen {
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
