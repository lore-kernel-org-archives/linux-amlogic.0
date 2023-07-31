Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF932C001DF
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Jul 2023 04:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ADkHpxQGUqQY8rAH/0hE9YIjf8oHdmDM48zf6XTjZgA=; b=r9TupVyeKeIDGG
	XjKIRJtn58pyHzJ//XIFqjh4d7OF1UiC//FlUZgiim98jVzua9m8/QYWy+5QPTrP4f+IkcGk5xo6I
	KW/rU78h6BQK8uFDSo0M4KtsR4fczHwCKTd5lo39tR+Z0nHb03N32m+lgZXbBDL2Df90YlgewmSl5
	Nahq0wCIUyqzISzhMr+6U6Ogb/pkJw7il7ryYGbvobmDOL1MIIth7h2715waJjE3g8l0Gr0t8PhtU
	z95rw/IMNzY5P5UuRYXHNzA8zyLKFxzzhYyzp6AFbT7/vV2mo9UURDhxeSgbQS75ldkfa/jJJgHl8
	jJ2bTd7DlraN0qQJAyZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQKWG-00DpvD-0G;
	Mon, 31 Jul 2023 04:28:32 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQKWB-00DpuQ-22
	for linux-amlogic@lists.infradead.org;
	Mon, 31 Jul 2023 04:28:30 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1bc0d39b52cso3588185ad.2
        for <linux-amlogic@lists.infradead.org>; Sun, 30 Jul 2023 21:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690777704; x=1691382504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5A36sJfoTWTZxxRtlkUpT4+tRtDcKRqPwRCEoULd4eU=;
        b=b5DQ6Rlyi7Lq9BXtLOOwalkREoNbb87b7unENttOCjxE8BVeLJiZVLColztFw+ksZi
         T5RO9eNtw8w4tbxo8yjiH8JdzdVbiLrXtczhvTfIZrpykQ7oQia1ZRmOGhd2hBXjrtZT
         V8fl0WKyk3tkCepVejzvfjyVLsuOV988AmZX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690777704; x=1691382504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5A36sJfoTWTZxxRtlkUpT4+tRtDcKRqPwRCEoULd4eU=;
        b=HdNBYCLOvQL3homssq/Ocgjn8R91BOLTnE7aO+0oKLWn1h/nwKxRYnImfdlbtj+jfr
         jdwBSIciAtPsbVSao7HP915WsDjR6Fv81wtcfhweEg16tbGfEvRTbFPWrUuaXV6RmeTP
         HfVi9ZtfhTf+hgjb6NeSMeZcRtZEWPra8Q181WXY4x0q+WYCxHNoebszWdncxXUcNzhT
         UnHRImlQ8o3GRfLjF72oq2AuvrGIv9gmT248dR96ysQjMA7Sw1y/Ri+/IeYTPxRNZNKb
         DmmCVGUOoVDeCA8EwngY6iTE89YwYCDVLt4z1WXb5hBUxhoHKs9JBscGYzoao1Xu2w5v
         Lcfg==
X-Gm-Message-State: ABy/qLaq+cKiHGz0Hbdr5srSZhoe7l9VuaAiSBu2E7BPkMJ23pqGlLY7
	K7gSsSy9WuwVnT9U8lGo7xP02g==
X-Google-Smtp-Source: APBJJlGW73mZDqZnkyjN83Bmi8SBbMUxpBxQv5ILrRrZFjgWoHlYdewLdEqjUMKHtrkbxW8SlUceaA==
X-Received: by 2002:a17:902:d4c3:b0:1b8:b3f0:3d57 with SMTP id o3-20020a170902d4c300b001b8b3f03d57mr9821918plg.31.1690777704531;
        Sun, 30 Jul 2023 21:28:24 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:fd7a:6af2:fca:ff71])
        by smtp.gmail.com with ESMTPSA id t15-20020a170902b20f00b001b9df8f14d7sm7349096plr.267.2023.07.30.21.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 21:28:24 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: meson: meson8b: Simplify notifier clock lookup
Date: Mon, 31 Jul 2023 12:27:53 +0800
Message-ID: <20230731042807.1322972-1-wenst@chromium.org>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230730_212827_741685_A5309AF9 
X-CRM114-Status: GOOD (  13.09  )
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

The driver registers a clock notifier by first getting the name of one
of its clocks it just registered, then uses the name to look up the
clock. The lookup is not needed, since each clock provider already
has a clock attached to it. Use that instead to get rid of a
__clk_lookup() call.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Found this could be simplified while looking through some clk core code.


 drivers/clk/meson/meson8b.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index 827e78fb16a8..c4336ac012bf 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -3793,7 +3793,6 @@ static void __init meson8b_clkc_init_common(struct device_node *np,
 {
 	struct meson8b_clk_reset *rstc;
 	struct device_node *parent_np;
-	const char *notifier_clk_name;
 	struct clk *notifier_clk;
 	struct regmap *map;
 	int i, ret;
@@ -3847,9 +3846,7 @@ static void __init meson8b_clkc_init_common(struct device_node *np,
 	 * tricky programming sequence will be handled by the forthcoming
 	 * coordinated clock rates mechanism once that feature is released.
 	 */
-	notifier_clk_name = clk_hw_get_name(&meson8b_cpu_scale_out_sel.hw);
-	notifier_clk = __clk_lookup(notifier_clk_name);
-	ret = clk_notifier_register(notifier_clk, &meson8b_cpu_nb_data.nb);
+	ret = clk_notifier_register(meson8b_cpu_scale_out_sel.hw.clk, &meson8b_cpu_nb_data.nb);
 	if (ret) {
 		pr_err("%s: failed to register the CPU clock notifier\n",
 		       __func__);
-- 
2.41.0.487.g6d72f3e995-goog


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
