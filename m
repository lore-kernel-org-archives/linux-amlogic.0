Return-Path: <SRS0=fUxg=V2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D218C7618B
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jul 2019 13:17:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8FDF21655
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jul 2019 13:17:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V8sL+lGz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="CLMiw/2a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8FDF21655
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GsSltk+Lze0nojxRWnjqkLieGRgRh61DxXFoxJO92Rk=; b=V8sL+lGz7w3isf
	8RAPWPLWBepgOywrjE4+D42RS+D91fRDTZXVVzC+R8C7tuXGk9tyccrKPyznbcieilBKv2dhs/hBK
	nwg0vtTnvGIosxLSrRHAFFFXDI38Lxa14USCRFGf050DvGjeAFrLisyr+eMR8JL+bFwTPgyVudhli
	hYxs9WOcpL1UvvGlYCWTuEcl9AaE5Od0Ii45+Lk13vHyNlW0tD0q9CJmYzIqq9jAvOq1ltC3VDBd6
	Cz9fDxf/Y1nmUQsBfd7+wtc32u3c5OoiIDC1o8JKGi384kMkXZKD1QkEFjzUyOK5s9liK/xSBSfQB
	kOB95y0C3HHR6y6An7Iw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hs5Wr-0006pX-HM; Mon, 29 Jul 2019 13:17:29 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hs5WP-0006HX-IF
 for linux-amlogic@lists.infradead.org; Mon, 29 Jul 2019 13:17:04 +0000
Received: by mail-wm1-x342.google.com with SMTP id s15so32091581wmj.3
 for <linux-amlogic@lists.infradead.org>; Mon, 29 Jul 2019 06:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sLpjjKS1ce8bNQv8q/Qa2SJ22ctxx4jp20Vf7E5q7wU=;
 b=CLMiw/2aayuVDYeC8v+Hbs9eP9dRkSbExFD5+zaZD8XVZntLt21BOp69K1tnRRpjbW
 h1x6kbaocxmTZlgdkOUZgm3WJWxq1hMdlN8cTBLsyjebws2ydUOJ6ty5W1EE1SsdSXLC
 XDvlDjLNYQsTpJELOf5Goop1SSsDjIerBO2nq949ozhky/+DVkMb6ZCcqiAxOA+ulJ/m
 ddqoDYpU4+h9G1Jt9DOM6Ni4fwIoDJbAvBQyFiY5fLci9NEtaNz/LfRCK+zi4cjHTz/n
 tl2sSIZsHc1nOwvWY7yhIHw0wek4Pbo7+DYcXof7ZE7saR6s4hFgKhah7o+7+Bo1SpgV
 0W4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sLpjjKS1ce8bNQv8q/Qa2SJ22ctxx4jp20Vf7E5q7wU=;
 b=Mxfaw2LX0DWVnMIZXnpYb2tWmqZMmJNWNhyKMlIFY7E7HKJtwuQxEoTfgHtcqMwVu4
 Ro6q0aeTxraOeeyiubkqReJu/f4s9A8kg3TCAEX212pNW8UUZWRFx2/mlMt5phUahQ0R
 rITBsS8aPk5mC3svzShg28+yStO1fKi0Ge8XCNttPUG8HVrXYPLst2s+tguPyDBdXd/K
 inM1vXz0xkgpieAgrCCbUszYjHR46XXNmOTzzCv35Yhk/1gJy7StbjmgC3yUyz6wk3Ia
 4ti4S3FuNMq92YM7yJstPV9cZBnPLSruz5C4bBOY1fuR0Hk1Qe13908em5G9uy+ZAECp
 AoCw==
X-Gm-Message-State: APjAAAUZMwTKkb8hqGxPaoMSnfvhffKteK1PyPl98WaCY6Wq3A1LwaZt
 uerB4E1YiLRKB44CVUc0GJLlJcFPxwQ=
X-Google-Smtp-Source: APXvYqx9NaFkCsFk23eBGAF2Pv6Iu97a1Kl1E5TPuDeCk21lE8wkpH5qEfKm7if84d09Xzyl2Cz8fQ==
X-Received: by 2002:a1c:f418:: with SMTP id z24mr50475428wma.80.1564406220079; 
 Mon, 29 Jul 2019 06:17:00 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id b5sm52520490wru.69.2019.07.29.06.16.59
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 06:16:59 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: sboyd@kernel.org,
	jbrunet@baylibre.com
Subject: [PATCH 1/4] clk: core: introduce clk_hw_set_parent()
Date: Mon, 29 Jul 2019 15:16:53 +0200
Message-Id: <20190729131656.7308-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190729131656.7308-1-narmstrong@baylibre.com>
References: <20190729131656.7308-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190729_061701_598040_C2E80419 
X-CRM114-Status: UNSURE (   8.50  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Introduce the clk_hw_set_parent() provider call to change parent of
a clock by using the clk_hw pointers.

This eases the clock reparenting from clock rate notifiers and
implementing DVFS with simpler code avoiding the boilerplates
functions as __clk_lookup(clk_hw_get_name()) then clk_set_parent().

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/clk.c            | 6 ++++++
 include/linux/clk-provider.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index c0990703ce54..c11b1781d24a 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2487,6 +2487,12 @@ static int clk_core_set_parent_nolock(struct clk_core *core,
 	return ret;
 }
 
+int clk_hw_set_parent(struct clk_hw *hw, struct clk_hw *parent)
+{
+	return clk_core_set_parent_nolock(hw->core, parent->core);
+}
+EXPORT_SYMBOL_GPL(clk_hw_set_parent);
+
 /**
  * clk_set_parent - switch the parent of a mux clk
  * @clk: the mux clk whose input we are switching
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 2ae7604783dd..dce5521a9bf6 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -817,6 +817,7 @@ unsigned int clk_hw_get_num_parents(const struct clk_hw *hw);
 struct clk_hw *clk_hw_get_parent(const struct clk_hw *hw);
 struct clk_hw *clk_hw_get_parent_by_index(const struct clk_hw *hw,
 					  unsigned int index);
+int clk_hw_set_parent(struct clk_hw *hw, struct clk_hw *new_parent);
 unsigned int __clk_get_enable_count(struct clk *clk);
 unsigned long clk_hw_get_rate(const struct clk_hw *hw);
 unsigned long __clk_get_flags(struct clk *clk);
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
