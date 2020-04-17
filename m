Return-Path: <SRS0=ZPw0=6B=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43137C38A2C
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Apr 2020 18:42:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15DFB22240
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Apr 2020 18:42:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PydEQHzi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="tR8/oPjB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15DFB22240
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gcOOJ05eS18vf3gKfA6dcCC7LxQNSW1pSi+crA2Bkzs=; b=PydEQHziKoEQEM
	p1ZuCwFXbUvEMp4mDgWChBfkZbthDzikxg/PLDN+ox3wpkvHbtVknEYllwQmjn4sg+Chk6oIy9nd0
	d8nyI0wMcuE2S554sgCwKDKw6Zvg4yvXJAkKrrqb0QbVqeBRCUE1tZcZtD2Zy4giaWtTw7nzVAFhh
	9GhyRJfK/kg3PgwbDq+4Y8GgM7MR3HzWCXckSSSxiLycIKYaLnn93YF501CdETLM8zKaPlOuuRGSQ
	sLsnLQjh0R65GILq6Fe46vvczJ1m51N/JQ/ZppfHV3FpszUKntPmIBOXRpVeoIQb3eMi6hRk5Ncpj
	ptT5CGOv86G94oI3xvNg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPVw8-0007EC-IG; Fri, 17 Apr 2020 18:42:00 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPVvp-0006uu-Bj; Fri, 17 Apr 2020 18:41:44 +0000
Received: by mail-wm1-x343.google.com with SMTP id r26so4074192wmh.0;
 Fri, 17 Apr 2020 11:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pDfj/QraDSKRnuL+EP//h6wcVnH2S8rr57iQRcR8OO4=;
 b=tR8/oPjB9/ARC6Hww1D9hRyK/54LWHuBJ+pEdpKCepWwuReRyO2Nuab4w0rvaaHqK4
 u8layFvzbJh1hpiDg2tCv5gBb6ylIeBOmfJM5ixjUs+Jro8434qaruah3qBH8byFQcva
 Z8U2c/Fx3YrJu7x5fA58+yphQvt4/frOW6854zyDxZvbSvcu0aqEFeoUQMTTvSJT3jOm
 l+zq2hQBC94+pkeNQrCTKmRE4lPv1e3iTsWVlXmy4FwnDdPY65zHBIEQt12kJRRiCN7F
 0JAW3rLLWtskqYGDRpKtnZdseu5z5rLUSFUXpmvaxYbIc/w1yLBPrFcWTbeDsTCRw30i
 Ui4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pDfj/QraDSKRnuL+EP//h6wcVnH2S8rr57iQRcR8OO4=;
 b=CB2z0UbvtKBlW7sl0dx3w3pWcgUf99WRuLbt52lW6e28FAckXpe44R36x8EzMr89Js
 eoRcQcd/BrERqElXcrFGkkuJLSje5Y1OYA4Dpd96Bl/GI3ZPRBHuZJ4NPJ1/Y9jwNpDg
 +KHbnXC0t+OU2Pn2+PzpHJ2iWzlFowYo2NcrXQsq5C9nRS/X7inK25VGpFslH1Ftzhc0
 hSQg4HSvx9AEEZDtT0EdzOseclHpzXfLlMC26i4QhlS1Y65fI3N7Lj/YcFXHuHh9e6iT
 QA5Jom04Yukvj5T7cp5jUZwEt0zVGvLn9/rYVq8Rh21eb8kcMjXGQoppzxSOFOqurFf2
 svYA==
X-Gm-Message-State: AGi0PuYgSvAjBdJjdbAxu4rJllPCWxUE97vEa/h+bMZz2nMqHuJoTZ0u
 BarkA//FiPsAQIvXQbljrsg=
X-Google-Smtp-Source: APiQypK5zOAKZQ5Jv4qR6V0MqyvU1fbrwrOUGQZj8hr390Y8FhwQ0Ia7fSUa6KYL6mXnV95wrrnNkQ==
X-Received: by 2002:a7b:c20f:: with SMTP id x15mr4506759wmi.2.1587148900114;
 Fri, 17 Apr 2020 11:41:40 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F137142E00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3714:2e00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id c17sm33237391wrp.28.2020.04.17.11.41.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 11:41:39 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: jbrunet@baylibre.com, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: [PATCH v2 1/4] clk: meson: meson8b: Fix the first parent of
 vid_pll_in_sel
Date: Fri, 17 Apr 2020 20:41:24 +0200
Message-Id: <20200417184127.1319871-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200417184127.1319871-1-martin.blumenstingl@googlemail.com>
References: <20200417184127.1319871-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200417_114141_433312_7CBB2C11 
X-CRM114-Status: GOOD (  13.66  )
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
Cc: narmstrong@baylibre.com, sboyd@kernel.org, mturquette@baylibre.com,
 linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Use hdmi_pll_lvds_out as parent of the vid_pll_in_sel clock. It's not
easy to see that the vendor kernel does the same, but it actually does.
meson_clk_pll_ops in mainline still cannot fully recalculate all rates
from the HDMI PLL registers because some register bits (at the time of
writing it's unknown which bits are used for this) double the HDMI PLL
output rate (compared to simply considering M, N and FRAC) for some (but
not all) PLL settings.

Update the vid_pll_in_sel parent so our clock calculation works for
simple clock settings like the CVBS output (where no rate doubling is
going on). The PLL ops need to be fixed later on for more complex clock
settings (all HDMI rates).

Fixes: 6cb57c678bb70 ("clk: meson: meson8b: add the read-only video clock trees")
Suggested-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/meson8b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index 7c55c695cbae..90d284ffc780 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -1077,7 +1077,7 @@ static struct clk_regmap meson8b_vid_pll_in_sel = {
 		 * Meson8m2: vid2_pll
 		 */
 		.parent_hws = (const struct clk_hw *[]) {
-			&meson8b_hdmi_pll_dco.hw
+			&meson8b_hdmi_pll_lvds_out.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
-- 
2.26.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
