Return-Path: <SRS0=/WbR=RW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F82FC43381
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 10:26:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2681720828
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 10:26:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uX9I28Mh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="iuHjRqUi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2681720828
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=beyVP1a1FvPF+vGZZKzfjv4eIky8e64XsMr2yUxE/rA=; b=uX9I28Mhcy/6dC
	DrLTfrrIZf/hXV/NhKGKPUgc+KQ+F8hO81+uO+FzoPByscGmj0uS+mrR4qjp2x9zzOxqM2d9NtQzg
	pt63l1lQ6nS2pZkYQgNzDEp3fIuoHWX+u5Z8kg/9DkitpKbFaj6yuYvcQnqwpzY+9UXL4oh7WqTlT
	eb6Gw7paSp6PuAm0Uaxk7aczeGBu13DocgzMlYyjOymQqS2ARnXmjuD2xuEP6WRozURKxvV6Q8gg9
	VAYoeNOXmCWFaEi9KtcONQ6Kdx0de4ortE8TJOqfRR+Aii4c+uaUvcA1Das/Q25rvjpGEvKoHIaMK
	hxQ2bhcDQ8niOCXw+VPA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6BwY-0006zi-SC; Tue, 19 Mar 2019 10:26:02 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6BwO-0006jt-Ic
 for linux-amlogic@lists.infradead.org; Tue, 19 Mar 2019 10:25:54 +0000
Received: by mail-wm1-x342.google.com with SMTP id 4so15970545wmf.5
 for <linux-amlogic@lists.infradead.org>; Tue, 19 Mar 2019 03:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TS6Bp01RXQyr4esHMRNtGtX76C+MJvKbjF1w90UiXHM=;
 b=iuHjRqUi4txOrBxs9g8C8PUywbvPNoE8UQ47omFdSQ3W7vudOSbzMcPRmsVByL4RjJ
 iYsw8pvBFU7OIw3QH9RWUUhm0ZakQtNPH3+9Ig8Di+ZKuDOY4S0Mq6fzV2Ch+ZmTBXDC
 EiiP2kvg1K1ecqh/0EPFp9lUh8xK21rLdIPmtVJ1kQc5X+qjYHoYkq07AUlZIulrW6ir
 8EgL+AIMg50gc249O1Tj3nRe7wIM+olm2zIuyzbxiMcyGP3E+F/XqmXD1IuqMkVzI/8B
 DSKGc6qmzp0VKX5gyNOg793JESy0jftS0gcI91HmldBhkrHTnNt56CH4Y332aUvVZT/d
 PaCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TS6Bp01RXQyr4esHMRNtGtX76C+MJvKbjF1w90UiXHM=;
 b=oXKNFbyYY7kDFKNqpv5DAxbSF6w3j+wKhuLYJLMRi0xtHNh7tnyXvfHGrPUUkDZQLj
 R0TPXgviO3IP50xeeg5Uzcwf+M/k9OCR3s0b2ftm+XP9v4LCABQW4IqCvii359mSzsmh
 d/7CrRuDqyTdQJLqkO0zI0gHDPYbZrQGsIT1D26BF27TUGejSHMhpNV/Rk+e8kuqQ3OJ
 wq9Ah3ZV9oOTK59WjRwGL28MBkkv4aP8PLyKSXlCTDfTqM7fblTlAgW2k4WmSzEh6G06
 Y/pij769mclujYsLoacXAqDQRpkV97Pns0I3qM2VhpoDY9+LIqF5XRQ36pDQaesFg7eh
 ytqw==
X-Gm-Message-State: APjAAAVJUyhCDPI+Vg7Qes01B/ekr57A3xDuWvpalmlDxvFUexU65vbP
 Vi46qdB03o/kU9T6iLTuBmF4Tg==
X-Google-Smtp-Source: APXvYqz1Ou7IK8JpmlA48b08hJAT3bnakQ3M/055FDx2qPgjUDECsFAioyPfjYnc/wXOIdqVllaIUw==
X-Received: by 2002:a1c:1a53:: with SMTP id a80mr2928569wma.15.1552991151213; 
 Tue, 19 Mar 2019 03:25:51 -0700 (PDT)
Received: from mjourdan-pc.numericable.fr (abo-99-183-68.mtp.modulonet.fr.
 [85.68.183.99])
 by smtp.gmail.com with ESMTPSA id v6sm2640680wme.24.2019.03.19.03.25.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Mar 2019 03:25:50 -0700 (PDT)
From: Maxime Jourdan <mjourdan@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH] clk: meson-gxbb: round the vdec dividers to closest
Date: Tue, 19 Mar 2019 11:25:37 +0100
Message-Id: <20190319102537.2043-1-mjourdan@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_032552_619160_582E2AD5 
X-CRM114-Status: UNSURE (   9.46  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Maxime Jourdan <mjourdan@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

We want the video decoder clocks to always round to closest. While the
muxes are already using CLK_MUX_ROUND_CLOSEST, the corresponding
CLK_DIVIDER_ROUND_CLOSEST was forgotten for the dividers.

Fix this by adding the flag to the two vdec dividers.

Fixes: a565242eb9fc ("clk: meson: gxbb: add the video decoder clocks")
Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
---
 drivers/clk/meson/gxbb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 04df2e208ed6..29ffb4fde714 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -2216,6 +2216,7 @@ static struct clk_regmap gxbb_vdec_1_div = {
 		.offset = HHI_VDEC_CLK_CNTL,
 		.shift = 0,
 		.width = 7,
+		.flags = CLK_DIVIDER_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "vdec_1_div",
@@ -2261,6 +2262,7 @@ static struct clk_regmap gxbb_vdec_hevc_div = {
 		.offset = HHI_VDEC2_CLK_CNTL,
 		.shift = 16,
 		.width = 7,
+		.flags = CLK_DIVIDER_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "vdec_hevc_div",
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
