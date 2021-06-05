Return-Path: <SRS0=xxsk=K7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA7B2C47082
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Jun 2021 06:25:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7294C6121F
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Jun 2021 06:25:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7294C6121F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kyCI9I0sndTDHYGaSmN/Heu/NDlqxqzsrDdA4YSdrUc=; b=bynYLdt64Hqc2L
	ZGgr9xVTcTUXJSUOoLqvVP7wLcZa0xjPgN/3J/XXvMsN/kB+C6OtL7S9XgjAaypzKiTb+ppLkH7fn
	Apxquu4U0tgNlaF9hapj2HttQIVK1HaZQhTNoL2Kst9399Nyz5Tti0m33KTiGdytHXM15H1EU1Pdq
	XaVNX1g3k79IX+nhPiEidZSQAofL8oxZA193fY0KhRWGygWPaKd0sQp5r7rXCKIPp3UOZ1eWzjF0f
	zyc3cQnyzu5hHaG58a4qbcvREoyXCs3tJLmG/e1+vfBC0pTvZ/GfaCV7xQV8IbmNy0cQakvr+jSJa
	xJ4vYTvB5BakrlZPu+fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpPkG-00G71j-Fo; Sat, 05 Jun 2021 06:25:20 +0000
Received: from mail-pf1-f179.google.com ([209.85.210.179])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpPjr-00G6st-UG; Sat, 05 Jun 2021 06:24:57 +0000
Received: by mail-pf1-f179.google.com with SMTP id f22so9083227pfn.0;
 Fri, 04 Jun 2021 23:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9YWDGtwFEazMTgKTgnhtKVsR9Lwj2c+5ANH5SB580b0=;
 b=VU4xUvxj8Ka6QbKD5Z8P/ZTYBq+bi0uhn/OBxmqhK09ENRS7GQaO3mD2QbsRorzUHD
 kcRgXoI17RZNV339weqOAhYVX8jhf3JV1EzrI2AsSb+cm2xlB92IIAbpDVcBLsxoWTLq
 0oVIMxsLv+Bxl438VaMqyA7+gjMmW2DKE12jJTNlwTU31K1NJkQqJq6jLQiXE58KiOYJ
 roRG3duuuZS0VEXKRQZg0ZttpgIQlkRClHeJz6r9wdLSqBNmmfByWPuUc6+23rgMKOx2
 KWmayYhL42H1olyOvnJNkrd9AGZpXS/wrpygWapmezeWgSn/tL8xitBwjfuzWeh5Wwkm
 pciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9YWDGtwFEazMTgKTgnhtKVsR9Lwj2c+5ANH5SB580b0=;
 b=Qnoi/S+zVXjGUA/17SY67HLvDRX6MFjoGFZ9NwXzSKQxoKqfAIm1bo1eyw68WD0Wr8
 JH69t1kQ4K3LbkHvpaJM52M2GdmUOT94R6EPakEYj4Mdw+bnBrOeA2UO1V0tOnqWMXNC
 ANvCimZxNw1hifXBCRQEQ/qZwZdVQeq6a4RL5RIfCb9InSnVD2X23EM7s9iO5nfrZE8G
 0HxjV2/8RLIFYK+g9sCdIckkRvZJzo9Qjj01L3bCnuim7LBZm/JsWbf0ukZe4UZoojTg
 h42geM2MpzHtBHOpOFAi9SD3BP+u2EuyoVR2M5iofTLHW3x+0vU+Y3+H5jgfz0aVNiyv
 DM0g==
X-Gm-Message-State: AOAM531BmRwffRTMncxNpkIaKcq88CUfjFzsIEGZYck9gpSUF8zE+vZE
 I5sy8Qu821g/EMsU2jNS6yw=
X-Google-Smtp-Source: ABdhPJxzjyCLmeG7YWzhB4ygUvxNMzHtzR2iTYMCJCHuKnOungdYiNLMgC3rh5xTGwy2/15OBJPQIA==
X-Received: by 2002:a63:4c66:: with SMTP id m38mr8471520pgl.157.1622874235243; 
 Fri, 04 Jun 2021 23:23:55 -0700 (PDT)
Received: from localhost.localdomain (199.19.111.227.16clouds.com.
 [199.19.111.227])
 by smtp.gmail.com with ESMTPSA id v14sm2800870pgo.89.2021.06.04.23.23.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 23:23:55 -0700 (PDT)
From: xieqinick@gmail.com
To: robh+dt@kernel.org, narmstrong@baylibre.com, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: nick@khadas.com,
	artem@khadas.com
Subject: [PATCH 2/6] arm64: dts: meson: vim1: update serial aliases
Date: Sat,  5 Jun 2021 14:23:09 +0800
Message-Id: <20210605062313.418343-3-xieqinick@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210605062313.418343-1-xieqinick@gmail.com>
References: <20210605062313.418343-1-xieqinick@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_232455_991922_ED14EC54 
X-CRM114-Status: UNSURE (   9.61  )
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

Update serial aliases for Khadas VIM1.

Signed-off-by: Nick Xie <nick@khadas.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
index 60feac0179c0..f116a9d91633 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
@@ -27,7 +27,11 @@ button-function {
 	};
 
 	aliases {
-		serial2 = &uart_AO_B;
+		serial0 = &uart_AO;
+		serial1 = &uart_A;
+		serial2 = &uart_B;
+		serial3 = &uart_C;
+		serial4 = &uart_AO_B;
 		ethernet0 = &ethmac;
 	};
 
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
