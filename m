Return-Path: <SRS0=jO5x=WZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C668DC3A59F
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Aug 2019 15:28:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98F602077B
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Aug 2019 15:28:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BT0FQ1uG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="B3ZGPqjT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98F602077B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BYeuImKx0ZUnIQ8mzO9TrHGOuEoRTrciXdGL9UH9Pqg=; b=BT0FQ1uGLtFUIr
	rbKhavY3dubk2rx0ulMozO1djjOSDLWC+RSzuRSb77sti2izHcdwKp7K812tN68G4ibHOKfj+sLZG
	Ew+8x0TzwiNWZE9AEeKTF+iMbt3DYMu98JA3otl2zezoBGFlJhu7QVwnpNc0gPvgxI02ZO8YC1y+3
	D8sPnohSP7KJerIJ22syeDoGK1aHPgW8AijVwzR6EKEZAsTzqYPSeYPzEDz/XFge6+3HxuJFddpkF
	nkjLFrg6H4Me+7/MSxx3bapFxl7I/ryZNnRJbae2/0qyaogVdu/OGZ0KbxAwqKRBxY1ZnAc6xCIuN
	qs4LB/zE2LRkrZUFQjqg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3MLn-0001Hk-2R; Thu, 29 Aug 2019 15:28:39 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3MH8-0007Rv-TE
 for linux-amlogic@lists.infradead.org; Thu, 29 Aug 2019 15:23:54 +0000
Received: by mail-wm1-x341.google.com with SMTP id p13so4315429wmh.1
 for <linux-amlogic@lists.infradead.org>; Thu, 29 Aug 2019 08:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GGMiOymgVde3bgRb+DG9WorFnJ3h5/TfeAtHJfoWjlE=;
 b=B3ZGPqjTyaCWvlxDHFPBBGVhYkZNze/okso9J4FFdKcmGYWM+M3hBtt8WlUbxOsGMl
 Y4CDy+UqQ1yaEKiONf5+OyfRCgU8hxdZ9zCTCdAZTHZk6tqdA9974t67ns1s1MO03/jN
 UiEYoREge9K1WCIX8aAodDh9pvdTfGJwFL9hUjwYYYd5+hkAtI4BKgzquk43GPyXEG+q
 Uv5TSnXXQEROzP93N2JhJALRETIRDbGprFiWzSERHyL2usBfPqgLxwEl4lvARzzwLK9g
 9Cuv6tTMbcZzw6xGXOKuZd3d/D268t+Jo4guN2YWvkUkzlgtPF7lUi9T3rP1CbdZA06J
 XrVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GGMiOymgVde3bgRb+DG9WorFnJ3h5/TfeAtHJfoWjlE=;
 b=BZvyr2pbBxDF3L7jhiPWHJ6MFggHdzxcwb1zY5J36vi/EDEVbPh0ORF9gjQ55ncc4p
 J2scpzGdRX/lFfsVfK7dYy51+15ZsjZIXujvTLh9s+0y6JuWZ2cx+6+E1xP8kaP/MUYR
 YsaaidgTgtJ5ZmleCwmrYVh4w6L8KcfHifIju0ZkW9e3UivYuETFKgChNRuNeXX6NGOf
 yGSajKdy/5tTnaPvNvfFCHyHv1bmibVbuRtaM2LWrpQNNFfGIAJYfGtcz5pL1r8avLf1
 8gaWVgKpevWTIRS84k+s7OTLNwNXOn5Dq9f8BZhQVbYF4sjaMc95XC9e62INzXx8ONuO
 UifA==
X-Gm-Message-State: APjAAAX5tGogrUL3Z8TUHZRUindJT4clIGmphqU6qE5NxswcOPnBe7TU
 o3E4SzqYQp9rJkwyGSuIVuiTWw==
X-Google-Smtp-Source: APXvYqwRSgUqZVgf8FcfNwRbtUbHqSqrNKXZhIUwvNA/2Nzi/56ye1nAZMRQFiYvOjmXmn7DudBoUQ==
X-Received: by 2002:a7b:c7c4:: with SMTP id z4mr12183286wmk.13.1567092229200; 
 Thu, 29 Aug 2019 08:23:49 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id d17sm4866871wre.27.2019.08.29.08.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 08:23:48 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 06/15] arm64: dts: meson-gxbb-nexbox-a95x: add
 keep-power-in-suspend property in SDIO node
Date: Thu, 29 Aug 2019 17:23:33 +0200
Message-Id: <20190829152342.27794-7-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190829152342.27794-1-narmstrong@baylibre.com>
References: <20190829152342.27794-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_082353_443510_C69C8CAD 
X-CRM114-Status: UNSURE (   8.47  )
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

The WiFi firmware requires that the power is kept enabled while in
suspend mode. Add the keep-power-in-suspend property in the SDIO node
to specify that the power must be kept when entering in a system wide
suspend state.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
index afcf8a9f667b..65ec7dea828c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
@@ -220,6 +220,9 @@
 	non-removable;
 	disable-wp;
 
+	/* WiFi firmware requires power to be kept while in suspend */
+	keep-power-in-suspend;
+
 	mmc-pwrseq = <&sdio_pwrseq>;
 
 	vmmc-supply = <&vddao_3v3>;
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
