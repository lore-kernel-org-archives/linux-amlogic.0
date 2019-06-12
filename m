Return-Path: <SRS0=wFsb=UL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67F2EC31E46
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jun 2019 20:01:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3717B20B7C
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jun 2019 20:01:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UGE+YGgP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Q54uXWSO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3717B20B7C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7x0HS94/D/5rZI8YNQhFPSP/1MiIsK2xf/2ePQfeYfI=; b=UGE+YGgPPLbfv7
	InEeoRt7FOXrSr9BDIz/ENeszSbgtpkIHajZyLNJrkL4xNFffnVJ3JI+o7eT2pcQ2HDQaifAvVMbP
	Zfma/iZKj0fVLxAwefuMk6gLrQkItaId+z4Ol2CZbUxWlpJ3NleHewLME0B7OCf3RhcOBssgl9XzE
	LEEP02j8cBLNf/AVuwVu46E7T9Z/p/qeqbHjf+LskDgfQeYlrmvYTgRivMGdSJz/oPOtVPlxFyfqa
	LoLcC+YyoPR9MvVx8uewfZtE4KMyg3vCsD/+p55jaqutQiRNO9ZVnP4Xkj8POn9xGodf0mmUFFowt
	k6x/snLsxFegEVKSLzpw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hb9Qp-0007hv-RA; Wed, 12 Jun 2019 20:01:15 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hb9PE-0005GY-EP; Wed, 12 Jun 2019 19:59:39 +0000
Received: by mail-wr1-x444.google.com with SMTP id f9so18192915wre.12;
 Wed, 12 Jun 2019 12:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O2ZTxmecaI8j/nsEN2U3OFIk14R4Cf7/mfp7zpgoLfM=;
 b=Q54uXWSOBp86x8VIy7nD49eWrt7nKUUASANXF9km1DmsBhbyaAeGqKorOE3GG77GdY
 1b8zuz7QBFDif20RA39AvYgTbw9EqS1cZ84omHdCAaYuPezVE1afE5SkcI9/UOuM4mQe
 6aK9oArhU8EW2NLW/OnK6ulTCIeb19t+xYmobb2dA/r1ya56pxkV2ipcFoAG0JWS5Kz+
 yZ0/dx0N+2mf68CXrlV54vzW5GVzbzP9CoxoeBC0f0B7rJGcNiS6sX6WfkjrSbtBLADL
 L8M/R0KL71oi5Hd1bhAeXKx7GcDlGi9TqtmmpPzJ77OyZEOuQVnfXE/WRsGsnH2HnYl9
 gsuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O2ZTxmecaI8j/nsEN2U3OFIk14R4Cf7/mfp7zpgoLfM=;
 b=XfxcgGM3xhVx9zEHZ3j6w+cCgqeZ4U/Bw788MuwIZGl8xB4PrlazFsK+WsphaLxCfw
 ic1Wr8XJe9yPGBxVSy43JYcL0r5M2O9XkHDgt7C5O5J8Xh1Qt0CisCGDdwZwr30Iw/iz
 BIsIIu97C6iZkZQPToiHtmyeS6qfAsqK9QndvBGEzOp+9vj0J0QoyXF0m5r7Gy5xcax9
 2BI+W7h66CYWf5qunFr1quZaviWueF3sPqVvQDadonu/1aNi3QudNuVPa7NEJf42G6p3
 d/dDcO/8KcppJJ1HFfauvfsykFI1fGYn/eX8uYLb5fsC73eX1Cdm7x878QNsZF1OpDUw
 jKdQ==
X-Gm-Message-State: APjAAAXaf2kR+B8bzTq5lj66si/PzYL4MJcgbnbpyvRR5K4VHA6E+gVc
 T7IiZin9FOIhnRRsK6ZkprhLCS7w
X-Google-Smtp-Source: APXvYqyspO3oY8Ipnq8K2E0Xl8QIVawbGhRqNZsLBv7lCAtvqLpJOyYoNB7zK5F7Udq8+Q23sINe3Q==
X-Received: by 2002:adf:ead1:: with SMTP id o17mr10900777wrn.176.1560369574888; 
 Wed, 12 Jun 2019 12:59:34 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133DDA400428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:33dd:a400:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id f10sm1026745wrg.24.2019.06.12.12.59.33
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 12 Jun 2019 12:59:34 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, linux-pwm@vger.kernel.org,
 thierry.reding@gmail.com
Subject: [PATCH v3 04/14] pwm: meson: change MISC_CLK_SEL_WIDTH to
 MISC_CLK_SEL_MASK
Date: Wed, 12 Jun 2019 21:59:01 +0200
Message-Id: <20190612195911.4442-5-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190612195911.4442-1-martin.blumenstingl@googlemail.com>
References: <20190612195911.4442-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190612_125936_522214_3FDA14FD 
X-CRM114-Status: GOOD (  11.29  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, u.kleine-koenig@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

MISC_CLK_SEL_WIDTH is only used in one place where it's converted into
a bit-mask. Rename and change the macro to be a bit-mask so that
conversion is not needed anymore. No functional changes intended.

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/pwm/pwm-meson.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index c62a3ac924d0..84b28ba0f903 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -33,7 +33,7 @@
 #define MISC_A_CLK_DIV_SHIFT	8
 #define MISC_B_CLK_SEL_SHIFT	6
 #define MISC_A_CLK_SEL_SHIFT	4
-#define MISC_CLK_SEL_WIDTH	2
+#define MISC_CLK_SEL_MASK	0x3
 #define MISC_B_EN		BIT(1)
 #define MISC_A_EN		BIT(0)
 
@@ -463,7 +463,7 @@ static int meson_pwm_init_channels(struct meson_pwm *meson,
 
 		channel->mux.reg = meson->base + REG_MISC_AB;
 		channel->mux.shift = mux_reg_shifts[i];
-		channel->mux.mask = BIT(MISC_CLK_SEL_WIDTH) - 1;
+		channel->mux.mask = MISC_CLK_SEL_MASK;
 		channel->mux.flags = 0;
 		channel->mux.lock = &meson->lock;
 		channel->mux.table = NULL;
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
