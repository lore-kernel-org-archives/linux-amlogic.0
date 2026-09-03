Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02300C79F83
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Sep 2026 22:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jnPRDm8/dA/bXEdTL9KafZloPwcXU0+k2BmDmlfhiHs=; b=DareChMcuWDjc0
	BBt7ysY6TEBAzji0PfV+U2ynTYwJ9b8nVPJZQB5NGk3raJ2xA4hFllsAcdT8U5JATJr0icopu/Dg3
	T3MNWlS5JSYtJI10v/Edhl+j228yXrnI0tqd/ZexNfwGik0F1J04RA2fdoAV3I8cCT8+UlaAW/iZ/
	w3UiKcFN+t/tZghQUNz5Busw7QQbMCVsWwkkue8sTJeP3nKqyoUeQxbQI57L3AL8rwE+nGK16OTmN
	AnUVXRnc6uPmsrQWw9ngOXaTQwNH6M/H9MkAdKs750Z0tBz+AkJqSEKL1Wef7NMBgSF0hn6rMDIK5
	4Ok6pkgyBCAhv+ktAb2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2GPB-00000000k2f-0oEW;
	Thu, 03 Sep 2026 22:59:37 +0000
Received: from mail-wr1-f50.google.com ([209.85.221.50])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2GP4-00000000jwh-3DC6
	for linux-amlogic@lists.infradead.org;
	Thu, 03 Sep 2026 22:59:31 +0000
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48436216a98so281336f8f.0
        for <linux-amlogic@lists.infradead.org>; Thu, 03 Sep 2026 15:59:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788476369; x=1789081169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F1SiDePVmO2z41UWzhMW/dfuGDGSD2CkgizPnd7ksWA=;
        b=Of434cEyqtBaqCxKi05A4TuEqTZQKUjS5cBxQF5RG8WZmV0lmQ6WLe8MJMX33cxsQ7
         FYahCrO0l9gE/pDYb4zZQI8E09+AyOO/dslDVC/Pt1w/fZmo2NItOC4yspXBPWc6MT+V
         TZSkSLD8tbl4kn9SbeYruSCn9FxitQCp4hT/LkLCCAJPyzpzXF/V7kx+XbifF7f7Oi/q
         vZvlgLNRQ2uvyOIgfl0J7CsvLCsG/frC9kYSbXGlkcxogt6OLWDkYCOKzO2NexUSi9Uy
         J1M+mVSdfYJF/c3rNDH8BIEcNDVIiFxHOYQf0CNsxJYrUSKKYxoBcbaeNa6eKNd3kiGJ
         6tZg==
X-Forwarded-Encrypted: i=1; AKwUvBwcAiB55Lm9ZY7GaahBOk919C6YqoKKO30kIaGRdQc/Sa76erdeT185G3GV8yW2yXT/ElCQvy7HIeUcuIFE@lists.infradead.org
X-Gm-Message-State: AFuF++kxB9pAI7beNkIRTkDgeR4tFgjrSwGY1sgyuXn/RvD0iP6BJPXL
	dFQk9Tsg/o8r2bmNASgNSE8mMQyeX15LvZegc6O86Z1OIrvNLVJwezcp
X-Gm-Gg: AYBFou0M5vC7qZ+0+hbsFPNnZnKZyWAjPi1iSQgot7CtJfP7LsojUPItoCzxEqs21pM
	J+J2+lAJBbhoNH+9qjWWwTtLYdEwHXW421TqEVWKRRakPG37qMLlISUW7hslwbfjL27dm/zumMD
	N4a/9T+auaYuGO/rBMNo+whC5YB7SjOMIPSyP1um9YifV2/SHzoQ/SLL+ev8Pa8yT3MkV4mnm6x
	sr/Zz1pI84KCU/uK4nfUFre4cg8BY3UUoKyf/v+4O820DnW9vRZy9dGmWhnSKBOUHgq4BVj9eyp
	O5m0EzgxvIKWzVXG5p5xhleC4okJWnodZ/dsHH1396N2u2BkUfKXl/7WS3FvomYd9JIGvHz8wao
	FUuVq5ImM9vMivSPIy2BjTpLrsuHLEJKuNTtyE+fiJMdINYbOYuWOtLzm21EBPU7nomyGZWhcLF
	Jau+BmCc9gDI8StLex0Wm7/p+Rbu1zfB7vjSnTHDagmhvqCs3G1aqG3wR8qOeStjJysKlxTt6yb
	AMQyAvV1hrnecQOICnDW2Nr1g==
X-Received: by 2002:a05:6000:4a1e:b0:482:9dc6:16c4 with SMTP id ffacd0b85a97d-485870870b6mr4790999f8f.1.1788476368800;
        Thu, 03 Sep 2026 15:59:28 -0700 (PDT)
Received: from threads.localdomain ([84.68.179.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885c5bbdsm1686142f8f.36.2026.09.03.15.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 15:59:28 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	Jian Hu <jian.hu@amlogic.com>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claude Fable 5 <noreply@anthropic.com>
Subject: [PATCH 4/4] clk: meson: t7: don't mark sys_ampipe_nand as critical
Date: Thu,  3 Sep 2026 23:59:21 +0100
Message-ID: <20260903225921.2290441-5-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903225921.2290441-1-tanure@linux.com>
References: <20260903225921.2290441-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_155930_907829_F8C76AF5 
X-CRM114-Status: GOOD (  13.99  )
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

sys_ampipe_nand clocks the pipeline stage inserted in the bus path
between the SD/eMMC controllers and the NIC_MATRIX fabric. It does have
identifiable consumers - the three MMC controllers - so marking it
critical was the wrong tool: the clock should be referenced from the
consumer nodes and claimed by the mmc driver instead.

Drop the CLK_IS_CRITICAL flag and update the comment accordingly.
sys_am2axi0..2 remain critical as they clock the AXI DMA bus itself and
have no single identifiable consumer.

This depends on the MMC controllers actually referencing the clock:
the dt-bindings, mmc driver and t7 DTS changes adding the "pipeline"
clock must land before this one, otherwise the boot hangs and memory
corruption this clock caused are reintroduced.

Fixes: 43e1705ecab9 ("clk: meson: t7: keep the memory fabric clocks running")
Assisted-by: Claude Fable 5 <noreply@anthropic.com>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 drivers/clk/meson/t7-peripherals.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/meson/t7-peripherals.c b/drivers/clk/meson/t7-peripherals.c
index 55d09e78593b..2f429ea86796 100644
--- a/drivers/clk/meson/t7-peripherals.c
+++ b/drivers/clk/meson/t7-peripherals.c
@@ -945,13 +945,13 @@ static T7_SYS_PCLK(sys_aucpu,		SYS_CLK_EN0_REG0, 14,	0);
 static T7_SYS_PCLK(sys_cec,		SYS_CLK_EN0_REG0, 16,	0);
 static T7_SYS_PCLK(sys_gdc,		SYS_CLK_EN0_REG0, 17,	0);
 static T7_SYS_PCLK(sys_deswarp,		SYS_CLK_EN0_REG0, 18,	0);
+static T7_SYS_PCLK(sys_ampipe_nand,	SYS_CLK_EN0_REG0, 19,	0);
+static T7_SYS_PCLK(sys_ampipe_eth,	SYS_CLK_EN0_REG0, 20,	0);
 /*
- * NOTE: sys_ampipe_nand and sys_am2axi0..2 provide the clock to the AXI bus
- * used for DMA between the peripherals and the DRAM. After the clocks are
- * disabled, a device that starts a transfer cannot complete it.
+ * NOTE: sys_am2axi0..2 provide the clock to the AXI bus used for DMA between
+ * the peripherals and the DRAM. After the clocks are disabled, a device that
+ * starts a transfer cannot complete it.
  */
-static T7_SYS_PCLK(sys_ampipe_nand,	SYS_CLK_EN0_REG0, 19,	CLK_IS_CRITICAL);
-static T7_SYS_PCLK(sys_ampipe_eth,	SYS_CLK_EN0_REG0, 20,	0);
 static T7_SYS_PCLK(sys_am2axi0,		SYS_CLK_EN0_REG0, 21,	CLK_IS_CRITICAL);
 static T7_SYS_PCLK(sys_am2axi1,		SYS_CLK_EN0_REG0, 22,	CLK_IS_CRITICAL);
 static T7_SYS_PCLK(sys_am2axi2,		SYS_CLK_EN0_REG0, 23,	CLK_IS_CRITICAL);
-- 
2.55.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
