Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A014DCD3421
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Apr 2026 15:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wfmq/G+udZ3PwEVvil773xAEqJz+WWdQZgm1tmav+eg=; b=lcagQM5DnChF8o
	XPDNPzOlAqliaOio4eBgvocL5Ckah6A2H0R1dr7EWtK7zoRzuy9zrJFbBDdxP9i5g4tZ/RbkA5yU7
	c5+oPf7cOkWTa9P1Yt7mVtcGX5iZL/ArhnAu+MZtkhWHBfjsBAkm+c2gpsvEIqnEdU/mkJywrm2mR
	TUZtmIK+NZNpCJ9IVEPDOUCG12LN61hQqrx9Y2JR+6T3X24WVGVZJpIoCDDRm51MXRZNkUAv0zxJS
	+DMpYlettvauE2+SFgGNRll4JCMpM4bYTSI87uHonNCAota2oa4B2IeveU0Ytmm/9UI8AE492Y7/5
	EqZQVsmJbnrrwBga/v2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wITkD-00000005gHd-1pDl;
	Thu, 30 Apr 2026 15:56:05 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wITk1-00000005gA0-191q;
	Thu, 30 Apr 2026 15:55:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=3R
	JLw2ptESdkRgCOXOQZAx2lu7EpkksUmCtcT/1GfHY=; b=e3TjQ5NGBlPXmvA5IV
	nurBn0YnXKta1mNS0pgO8k08+Y8xuqN1h9QWr/g2qnQaSjkEMlDdg7BLA75NJWwm
	i4Urgz/F5psrtaeHqN2mfswAsWxCuygB60ENj7qioTDv68H5v/j5kZ7UKiuujnFA
	/hTOAhtwnuh/5+hMKkMsc2Pqw=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wAXyu5Se_NpHedTCg--.49548S8;
	Thu, 30 Apr 2026 23:55:06 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: broonie@kernel.org,
	sunny.luo@amlogic.com,
	xianwei.zhao@amlogic.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	han.xu@nxp.com,
	haibo.chen@nxp.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	lhjeff911@gmail.com,
	hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com
Cc: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH 06/10] spi: sn-f-ospi: Use FIELD_MODIFY()
Date: Thu, 30 Apr 2026 23:54:52 +0800
Message-Id: <20260430155456.36998-7-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260430155456.36998-1-18255117159@163.com>
References: <20260430155456.36998-1-18255117159@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wAXyu5Se_NpHedTCg--.49548S8
X-Coremail-Antispam: 1Uf129KBjvdXoWrur17Kr15JryDWFyUKFyUJrb_yoWfZFc_CF
	1YvrWxJrZ0k3yxC3WxWFZ5A3s09rn8uF4kt3Z7tasxAwsxWw13Ww1ktrW8Aa4UZFs8ur40
	9wsrZrW8Cr1akjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRN6pBPUUUUU==
X-Originating-IP: [240e:b8f:927e:5900:c497:d540:b00d:97f4]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6xpM72nze1pO-wAA3Y
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_085553_713159_FC3AF5B8 
X-CRM114-Status: UNSURE (   8.10  )
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

Use FIELD_MODIFY() to remove open-coded bit manipulation.
No functional change intended.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/spi/spi-sn-f-ospi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-sn-f-ospi.c b/drivers/spi/spi-sn-f-ospi.c
index b459d51cb3a8..f0320e96fe23 100644
--- a/drivers/spi/spi-sn-f-ospi.c
+++ b/drivers/spi/spi-sn-f-ospi.c
@@ -222,9 +222,8 @@ static void f_ospi_config_clk(struct f_ospi *ospi, u32 device_hz)
 	 */
 	val = readl(ospi->base + OSPI_CLK_CTL);
 
-	val &= ~(OSPI_CLK_CTL_PHA | OSPI_CLK_CTL_DIV);
-	val |= FIELD_PREP(OSPI_CLK_CTL_PHA, OSPI_CLK_CTL_PHA_180)
-	     | FIELD_PREP(OSPI_CLK_CTL_DIV, div_reg);
+	FIELD_MODIFY(OSPI_CLK_CTL_PHA, &val, OSPI_CLK_CTL_PHA_180);
+	FIELD_MODIFY(OSPI_CLK_CTL_DIV, &val, div_reg);
 
 	writel(val, ospi->base + OSPI_CLK_CTL);
 }
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
