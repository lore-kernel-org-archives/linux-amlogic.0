Return-Path: <SRS0=6csC=YU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0C5BCA9EAF
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Oct 2019 16:24:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7541A21850
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Oct 2019 16:24:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KCZEHCST";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="AoVinyap"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7541A21850
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oHRd9GGqbD7985dH9vZpSYNMVpS0eAZMf2QnSErVKKg=; b=KCZEHCSTgQmDul
	q6huXuTVT46T+nmAZHRcn4pP9irqTPXLKJMkh3Q0nFM+Qm3i4TWBft1mnG0ffAGaguou/WTuQ/03F
	BiPeCqV6MzDFMd2IYsr2Piib2ekO7FAMcK+QovtCxH4yfsyI+8qMqQ9nMR1OFkD0oY91owDI9LQD5
	7/xHbeiBIhbI1kAVET23Emc5V9ptQ7ArzzdcBgziKXVo1583Mvzl8KlyJhChSw0J5rgSatJ52PvsX
	FiaIz1wUXL7r7rgEhDBnONezYlNm2euOyWZJ+WQVX8sF3N7ork7jKGCPnA5F9qNaYsC8kqVYOUexY
	yhNEhxyprmt3COLpIEGg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iOlLB-0001q8-2K; Sun, 27 Oct 2019 16:24:29 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iOlKT-0001Dn-60; Sun, 27 Oct 2019 16:23:46 +0000
Received: by mail-wm1-x341.google.com with SMTP id 11so6985869wmk.0;
 Sun, 27 Oct 2019 09:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=27lV1jSL1pOmY52iA2rX2+BpQ+8jMOYRMeA1UyL2hfM=;
 b=AoVinyap5keVi8HvLp0UH+/Ax8BHjP5n/rdFXmYx38j237nX+kj3HaXZQ1by5mX220
 tbhKnbprieqkKl5RGbhI08Homxfu6hHLXTSXHVGCQAfIyb5MFCeV0SDRXAwfghtEAi7M
 uysvJW9p3hDN4TyOCkRWcCp0QvFzNBSkRtqcFroX/xV9y36BE6q8NW7cLFvv5f4THy2j
 ajNqdk3d+JaAnDtXSF7gqtE/V/uSWkVPYL8d5N1eCj+diuwnUhNd76H0Hw6o5YKd+KLU
 lyjsq17tzYK6Nez7LyXI73gX9Rr/GcgMjNIY72tocZ8x9J5g8xNeVhNdd++HXAoltdD6
 XDVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=27lV1jSL1pOmY52iA2rX2+BpQ+8jMOYRMeA1UyL2hfM=;
 b=YB3m+i9sUe3agt7O+/taFiEGhY3H4ouGX6SmDfE+N7Ebscqa8ayWHBDOhWYEMnNYCC
 1cAbfHOymLoEhqAhuejsBpXU96ut1cSJ8f5KABXN8VAWnKBB+ZDn2zfbXP2EjMx3XZ+t
 cSByZtu7Ev0rtJqtRJwDcvNqqYm1iAlDhO4UCRq0TyTDWQc+EEQYlo9kCTn1/lc9oqQ7
 9m4BSFgRvkTnSG93cGfV7Y5AK4odAlnkUhT2gwRzoQ4XQAIjphbOMqDloI0az5DMPDbD
 YnpNoxkXEGYtEuwSjxv0TxdFb8XwTz2C38SHiUUioIXamSw9JdLYdZ2LncuB9yJiZv/F
 i7XQ==
X-Gm-Message-State: APjAAAXjcdEsrUjDqgIiQxpkXC1J1/gQKoOA+WbO9/oMabyBCA/G9TPh
 OL1GdpvO4NL6S8gTmMUg5Dg=
X-Google-Smtp-Source: APXvYqwi3N77ux5v3XITqsvD7kw7Lzj/nkEw4EMddSAn2mY2cNYvaiD7bdCqGCK8e2C00e1OyUbxYA==
X-Received: by 2002:a1c:1fca:: with SMTP id f193mr5079801wmf.173.1572193423782; 
 Sun, 27 Oct 2019 09:23:43 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F133D01300428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:33d0:1300:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id 1sm8243299wrr.16.2019.10.27.09.23.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2019 09:23:43 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com, jbrunet@baylibre.com,
 linux-amlogic@lists.infradead.org, khilman@baylibre.com
Subject: [PATCH v2 3/5] clk: meson: meson8b: use of_clk_hw_register to
 register the clocks
Date: Sun, 27 Oct 2019 17:23:26 +0100
Message-Id: <20191027162328.1177402-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191027162328.1177402-1-martin.blumenstingl@googlemail.com>
References: <20191027162328.1177402-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191027_092345_264253_7158DF55 
X-CRM114-Status: GOOD (  12.05  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Switch from clk_hw_register to of_clk_hw_register so we can use
clk_parent_data.fw_name. This will be used to get the "xtal", "ddr_pll"
and possibly others from the .dtb.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/meson8b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index 70ac6755607e..306b809deb49 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -3696,7 +3696,7 @@ static void __init meson8b_clkc_init_common(struct device_node *np,
 		if (!clk_hw_onecell_data->hws[i])
 			continue;
 
-		ret = clk_hw_register(NULL, clk_hw_onecell_data->hws[i]);
+		ret = of_clk_hw_register(np, clk_hw_onecell_data->hws[i]);
 		if (ret)
 			return;
 	}
-- 
2.23.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
