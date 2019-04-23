Return-Path: <SRS0=V5Bc=SZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDBD9C10F14
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2019 09:16:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EABA20843
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2019 09:16:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lszQwQRY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="IV91+R20"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EABA20843
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kTiGEIBCI4G8ce0KB2hR6cM93QOFUh4snpawO/egl7w=; b=lszQwQRYKbAjQ1
	9xSXb8XrHSL8E+flejAHo0I5EI/2lWfWA78SoNtnYk6G6/Q0O7WopBF4PdwDlVYvvc1n5O0Q31kZr
	X3HqMRjXvm2GmzJYz4VzhodDmDZtZKN+P/X2GfbrWBFyDuEEQ48QqS1FqjzeS6ed0fafE3fy3dme9
	QrBBBDAaZF0FGSStiHeUjCdUhru1IsRZ5eahEZw8+Udk+6/xtrWUONVXGPO+q6YJ0drJwxJYebaf7
	1L/xni4yS8yN2z8CNJJWvuB7uP7vWzwc+kSSH1k6ivLurW8mNqRw1x7Dl7bDk69/prH00rEWziuJY
	yEexOSs2o3f7AWRQvXzQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hIrXA-000419-GG; Tue, 23 Apr 2019 09:16:12 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hIrWD-0002kf-Ev
 for linux-amlogic@lists.infradead.org; Tue, 23 Apr 2019 09:15:20 +0000
Received: by mail-wm1-x341.google.com with SMTP id r186so1765300wmf.1
 for <linux-amlogic@lists.infradead.org>; Tue, 23 Apr 2019 02:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kkUDwieGRa4xy6E/VKbLAgsfuBu2dxapI4Hsa3FktCU=;
 b=IV91+R20zWjSQlEuZrO3g8etfRHutsoozXzEdbqjIHZ3+Z6rWF9oPnf+U/q658HO5T
 sytBmgxsHjDanQiUrguBtqmlPygjyMM0BMModhWyUm6r/i+NMJQ1+4LsiV3LbQvW89DZ
 ruBl31h018yvKj+1F29cdpnhv5htWJ4t8GcIHjjsFC2NyOAbuR+59cv33o8U+nGsqwyq
 v7+N8EjghiwRWp9AY2yoeeQ67Dnc7HFudUGOqG6RBur6Opug0WfsNr6Tuq5g4lmU8nzl
 +3zI6CRUJgIc1WOX8JWr+SNyetTj34UB9d/4WX9YQ8IxW1vLSCBEVnCDA9EZzm1mesxt
 x47g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kkUDwieGRa4xy6E/VKbLAgsfuBu2dxapI4Hsa3FktCU=;
 b=fY3M8PJGSrht384Z25LEdwICgwlX+bW3oIS9CqaJeMC3/2IdsFN6WkRVg8t6pkcJaN
 pILQSOky0Mwd6KBBit1gT+Zw05sT993ZnlvTBSLNRgqSgqSNQAGhl7ObgNrWgUA42zIb
 9K1nG9k5NKH7W0clI4I3jmJD/NPLled5WSIRyuqt6sDEWpA7MQx0+SFVNkS27xQ55qFu
 ZesQsiD/B0eOKUpdN1gqXFY+m+7t43DsKPE+Hpgd2JsmQxqrO3teQLQ4g/9s+dC/o4ob
 02p6QfNldVcDNZGswUkb1Cl0X29F07xEahVQm4s/ybpFdukUXhN/kIJz7QaciepyKB0M
 TEMw==
X-Gm-Message-State: APjAAAVTvgZUj0FFBnOJ1jFHd48Ju1BAPpVf/spGcP9L/dPuqbdjPWi7
 Q/D1u0luadBJ64p8/1iSEBVX8ktYBjgspA==
X-Google-Smtp-Source: APXvYqw8xuKFpjTT8ePJ8vDEetCs3KVYsTTUTKEC8mDHO5jbufn4z3i3Slzi7myQ1Cb7mfg8m4oD3Q==
X-Received: by 2002:a1c:9c03:: with SMTP id f3mr1524336wme.67.1556010911649;
 Tue, 23 Apr 2019 02:15:11 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id t17sm12241272wrr.26.2019.04.23.02.15.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 23 Apr 2019 02:15:11 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com,
	jbrunet@baylibre.com
Subject: [PATCH v2 3/6] clk: meson: g12a: mark fclk_div3 as critical
Date: Tue, 23 Apr 2019 11:15:00 +0200
Message-Id: <20190423091503.10847-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190423091503.10847-1-narmstrong@baylibre.com>
References: <20190423091503.10847-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190423_021513_501536_9CA2B10D 
X-CRM114-Status: GOOD (  13.45  )
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
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Amlogic Meson G12b platform, the fclk_div3 seems to be necessary for
the system to operate correctly.

Disabling it cause the entire system to freeze, including peripherals.

This patch patch marks this clock as critical, fixing boot on G12b platforms.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/meson/g12a.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 4bc16868b471..2e16cdf71ab4 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -1060,6 +1060,16 @@ static struct clk_regmap g12a_fclk_div3 = {
 		.ops = &clk_regmap_gate_ops,
 		.parent_names = (const char *[]){ "fclk_div3_div" },
 		.num_parents = 1,
+		/*
+		 * This clock is used by the resident firmware and is required
+		 * by the platform to operate correctly.
+		 * Until the following condition are met, we need this clock to
+		 * be marked as critical:
+		 * a) Mark the clock used by a firmware resource, if possible
+		 * b) CCF has a clock hand-off mechanism to make the sure the
+		 *    clock stays on until the proper driver comes along
+		 */
+		.flags = CLK_IS_CRITICAL,
 	},
 };
 
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
