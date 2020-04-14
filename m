Return-Path: <SRS0=FMGI=56=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8162C352BE
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Apr 2020 20:00:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7942B206A2
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Apr 2020 20:00:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s1aVygVw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="YG+qtu4x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7942B206A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MOrc80J5cDa1llcmzKEqE1DFd6PDLXEcmvwKF1Jpx5g=; b=s1aVygVwP3Vbx1
	d/SOCjVES1svRm19rwwc+2N56On9DtFlWFcUxu7EHAjvwecLaDysP+shB1Mbmq0rQsxU5xorcWjd6
	qrPsRO+FKOqIZS9cWZLhQjjj1o/ToBARlUaUhRy3OQvdub8kV8RxbhiLfO0CthbeN/632Vi/sB96B
	0oqrlya0TWMA2ohYC3+3Y571xsYpHXocSmG5gkH43YlWLrfLj7vTZJ+VLH6xPoMkc/j0kVmzD4nmC
	Ztxr6wSF7TYtccrN/Q8Y/gMUDiS2aY7AnJlHbwgZcOjeesE2Ps0MDAWD79y2sgmtgM1tz8ZLHYq+f
	QIJUCJq+VuBerrtyi+EQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jORjf-0005e8-1t; Tue, 14 Apr 2020 20:00:43 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jORjR-0005QH-Pa; Tue, 14 Apr 2020 20:00:31 +0000
Received: by mail-wm1-x344.google.com with SMTP id g12so7875455wmh.3;
 Tue, 14 Apr 2020 13:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Da7NFvYzDzumUirR7CSYfPXMxNhJVSYGrnWvejA0pP0=;
 b=YG+qtu4xnl/AbsvRm0ohemLRp2AW4jp55XsMOYdlmAQTLLOiq2okcy32Ix2mbUmI4V
 Cd2noAAYfWLR8jmkMjdkFCw/Ptc/ZDpNClLlPcnsMi4d2WbSZ9NMqEMx4/UZSW+zaE4A
 95uZEKSe3OTZwbZ7vCYAU+R5XWzm5RBsvk9nCEya16U7xLG16bYaX9usX6HH6mFFe9Ur
 vI6m+KSM9xq48zWa+mY1Rv52CgDdzLW/g67FnfPcxui8wdMDGMZosXpDqoQIEkZFrg8u
 T6dcfpoeXlCFrY6BCSvBY23UoVWRKVUR5pEe9k9QSvv4p7dfDFDm61nqmxjXe3jgGCLU
 cpmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Da7NFvYzDzumUirR7CSYfPXMxNhJVSYGrnWvejA0pP0=;
 b=b9WtIyBwb/LIskBgJl0JEtKhkVeHVLpJP/7VAIaxDMjw1UZpXIkYiq8jIpCjyUOPyB
 iBw74jEOgjzkrO+Iu3YzEAq6UtmHLPTz/B/Nofu2jxhWJ8piP3kliLs+CVGewetKikN4
 +Q4Vt5C/eShk3715iMmnTRFutxihiRxUWfVZZ6jAk0LxKkALunxwUTaN9ZGw3Xg+gZCK
 VdfpCHCyvR/RgXrne4wnu21MWOGo04Prdh4QQYgJYOY5h1tuT4EmRKFDuPPs9QGl9rXQ
 Of2NFe+7/9LHP4PfXeFY+9hb8hiCb9wvVNJnmGRwVpaD5Rks8CA0GKMGZwl+TPX/+uT1
 rXJg==
X-Gm-Message-State: AGi0PuYJCYKXGZa7G4HXdoHzsUQMFQ14VW37P+frpUIpmNv7+6YR+hdO
 iHMKi2XEScP25LQc3qWwHho=
X-Google-Smtp-Source: APiQypJBZbyV5J+rMhvq+Cc2aow4TKafhtniLnwvhkFqYb8Fbg15FSgd1n+x2Q4VYMNJYzOzhmEf5Q==
X-Received: by 2002:a1c:f205:: with SMTP id s5mr1446383wmc.101.1586894428240; 
 Tue, 14 Apr 2020 13:00:28 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F13717DF00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3717:df00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id b4sm15540253wrv.42.2020.04.14.13.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 13:00:27 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: jbrunet@baylibre.com, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: [PATCH 1/4] clk: meson: meson8b: Fix the first parent of
 vid_pll_in_sel
Date: Tue, 14 Apr 2020 22:00:14 +0200
Message-Id: <20200414200017.226136-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200414200017.226136-1-martin.blumenstingl@googlemail.com>
References: <20200414200017.226136-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200414_130029_828614_B52FD411 
X-CRM114-Status: GOOD (  13.45  )
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
output rate (compared to simply considering M, N and FRAC).

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
2.26.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
