Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19285C3ABC3
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 May 2025 14:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3Erik3XIyRR6BnQOOQOO66Ww2ohhyeaMMf9jK78MEkU=; b=GUUoLOrlTKfo9P
	OkYJDd/EwxicKy9MsXE/+AmLp1BWeCWg7p34+BHmiTTYQUGsC/lqWRR7k8gakxfqMPLiMrBhqH7KZ
	yDtBMDZB8vHzpaHyGuiD2SegiiWXmJBv+KlPRmZb+NhLClpT6uBVoWwmagdvPWrkuaaPljCflCUpl
	U5aghOFustXjkLSMda2pRHKb52mb+0wTEkeIpMQebwy2cIaSDbo2J95Yi0gYxoIlBVX+TVLI4KHwV
	tcUf6PLnAVRIm6cT1B3HAfuGjS7lAbaws7saD+QPqmXpg9o1j4ajPROuuMNQBUUzoSor3/dPE/L/+
	SOMe8zEv1YwGynDhxZ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEUc9-00000009ogi-2kJG;
	Mon, 12 May 2025 14:58:45 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEU7M-00000009j5E-3CAa
	for linux-amlogic@lists.infradead.org;
	Mon, 12 May 2025 14:26:58 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-6ecfc2cb1aaso51018826d6.3
        for <linux-amlogic@lists.infradead.org>; Mon, 12 May 2025 07:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1747060015; x=1747664815; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RKMd5G0cFDMucPOpi+tWbuy3t/lyFnn71icIWCgXypM=;
        b=CqkBG29zhpmE/M5FtIvKXpzPZtqM8vrIwCT/V++MzR8Nhtb0t2P7RvpEsBz5pGRR8N
         CG56T42k5U81rAnWWkdwCVWK+2Aaj8lD23ifnXy+6BpFr2SZUHc9TxbRq4t1VEYWdB8x
         /js3fYdyv5XazW6YmYZlF1OAnLaV0WkgFviX5op2Wa4sVNoim1rbceHchd/vQPBNwNse
         VqCZI7LInIJbWafujFxCh5SVK0mlqvUxmLL/VX4ZmZLEYUtqT2Bg4/mBqLkaEW34IXCG
         P9v0TC0blr5Wodn3FZCVGG0Nh1C9HjROO7UBXqR1g0lrGxZ4JGaVu3CVA3kpxP3dBFch
         8ThQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747060015; x=1747664815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RKMd5G0cFDMucPOpi+tWbuy3t/lyFnn71icIWCgXypM=;
        b=Y6JcGqGz8tW/hk7r+vNsOGfTYt3uyNJTOkp8aWGKMu4UX+59YNNaJaz6Q3gJHeT/7D
         0eR8p2Afj16GgHy59AK5LOLRAf3Q67NfJBp/0fMPBq3G2oQCvBy+1oTXHkEPIl9wHzSO
         R5IA8SABHAtcPUB27G6fVsmsRd+3HwH4Nv36dx+o1wj+JQTF3et8p65uMB1KQManCNn7
         sNYjgwtbOrBdL0nqUxgSTXxwPPdPmEknAEY/7cuh1pNN5Bl25Cf9GB4u3uRrX4k3TtNz
         VysPkjQvryKNcw0emZdImgM/GmdTrxDaRo44sjsHDy+36k00v+REFpHD3Ymtktt/XQcf
         kR6w==
X-Forwarded-Encrypted: i=1; AJvYcCX39bSkqVxfqH8SP/fefS732pI5EsOt93weLynXApNd67N5+vYWftDlzIVkkg21CTYc4GynoKrdBzU/oBFX@lists.infradead.org
X-Gm-Message-State: AOJu0YwiIytGdbcM7JZTI0JgZH9pV7zGPdvrSQP7n2VBrtK85b/MtGVW
	hn2xj8Bu2xGBwm+kLt4HILho5UajKHDSmIxh4Hhz/wn5GkMhZrTd/RhmKieFoQ==
X-Gm-Gg: ASbGncuG+8DucgXRIDi4ih0Dflx7Wl6p9WYzZLlWfa3owQXgnH+qY/ftOoDNkiFZYe3
	InREmhDVktsi7dGplNpUN8xEs3IYXyfjZ7PcX6iroZSlGbLS3HTYke+UJyAaGFp85R6efaER7U3
	Rv++2ZmX/+ZljPFxAZxhZg8M1Iifq/c+3ebuhV8mQ8pGrYCIAavqUBVrk7OEw4vOUNll6COfYPQ
	63nli35xpGCqvFi6tyOUt0HCK0itopjdjY+j8VHDQ/1vOrZL9rZ543bN0JHP/yoEqF7az85+jA+
	iTV0+ix75ieOTIOKyo2onX7PgX7ZOFGmBSq8wmLzeYsi8g4S
X-Google-Smtp-Source: AGHT+IHwLWxHT8fQlj2kksRDBg+A0JhtXKo+AreGOwt+ETP5hLx/Dy37l3apsuA9OkV+nl0kGKBq4w==
X-Received: by 2002:a05:6214:300e:b0:6cb:ee08:c1e8 with SMTP id 6a1803df08f44-6f6e47fa918mr229336596d6.23.1747060013390;
        Mon, 12 May 2025 07:26:53 -0700 (PDT)
Received: from localhost ([2607:fb91:214c:42a4:3793:dd95:dfa1:719a])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f6e393df31sm53362726d6.0.2025.05.12.07.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 07:26:53 -0700 (PDT)
From: Da Xue <da@libre.computer>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Da Xue <da@libre.computer>,
	stable@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] clk: meson-g12a: add missing fclk_div2 to spicc
Date: Mon, 12 May 2025 10:26:16 -0400
Message-Id: <20250512142617.2175291-1-da@libre.computer>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_072656_918919_34E91DD6 
X-CRM114-Status: GOOD (  10.37  )
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

SPICC is missing fclk_div2 which causes the spicc module to output sclk at
2.5x the expected rate. Adding the missing fclk_div2 resolves this.

Fixes: a18c8e0b7697 ("clk: meson: g12a: add support for the SPICC SCLK Source clocks")
Cc: <stable@vger.kernel.org> # 6.1
Signed-off-by: Da Xue <da@libre.computer>
---
Changelog:

v2 -> v3: remove gp0
v1 -> v2: add Fixes as an older version of the patch was sent as v1
---
 drivers/clk/meson/g12a.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 4f92b83965d5a..b72eebd0fa474 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -4099,6 +4099,7 @@ static const struct clk_parent_data spicc_sclk_parent_data[] = {
 	{ .hw = &g12a_clk81.hw },
 	{ .hw = &g12a_fclk_div4.hw },
 	{ .hw = &g12a_fclk_div3.hw },
+	{ .hw = &g12a_fclk_div2.hw },
 	{ .hw = &g12a_fclk_div5.hw },
 	{ .hw = &g12a_fclk_div7.hw },
 };
-- 
2.39.5


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
