Return-Path: <SRS0=yQOf=LQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D126C2B9F4
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Jun 2021 09:57:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E56E761360
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Jun 2021 09:57:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E56E761360
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hquPXmUFcH+JXxmRy58Ciha+m3XeG7MBeUAGpjDf028=; b=Ta7AyRBNOd74cu
	bPF/AN3H891bH1F5HuaOWbUakbO8Zh1fRnmhHy8pTEFAWCO1GfWqnJG9UhmUGCsT+gNdrqT38Vt2F
	czWQgSB0Jtzba8nQ266qxScP539+qb6/XmMP1DO6y+/QgJV7RUVOrP1BT1MAlJaZjOfPWMq5igp2W
	PlNqGL2PldUgxBBLfzl2U2MYlrN8xZamJS8wdvj+xZzl/17r4BI+M8FWxE/bukxIFp4hgmXnvDofV
	mYHvMDifjJ/hxLGUI1OFSwDx0mtsLQBT2S3PdMegagDIer2EiluO5TOk8TyiuKqtgFZ3AqwwG/HiD
	qQPCJDYQLtyzBtUGeruw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvd9k-006XdF-Jr; Tue, 22 Jun 2021 09:57:20 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvd9X-006XaR-OY; Tue, 22 Jun 2021 09:57:09 +0000
Received: by mail-pl1-x62d.google.com with SMTP id y13so4064669plc.8;
 Tue, 22 Jun 2021 02:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3QVfQrgRh33gEx5r7I5h3yOocpWLrCLFyDdaL4+1GCE=;
 b=VM5YgDYUgK3990wD5dI7ibB5zuh39GX3+g/li/Q5+fME3BpI1T80vL8QGyh2JQjfY3
 5gyOoe7EVHQ1zRMPbkmJ3oIz5k/9iIjofxixyxaymFazHI4DGflvNfJS5MGjMHNawCCa
 L55G7UVT9rGDrnWqwIP9hiCO3LGtul9yb/d9aaSeq+/LZ15yODiArs/vx0w9MdMt4WU2
 IKbcVV/kCHuWoNXrt1127yfA8w5IkD7PQQmNyATk5iqt27+lkyOenL7hRuZbkmqGkWOG
 WJqqyAnEEuWm5w2u2UDMCg/xso3r/+TaxwL9ir4I9NUkngbcH/WqgPjytQUrRO2GYFoM
 Nnfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3QVfQrgRh33gEx5r7I5h3yOocpWLrCLFyDdaL4+1GCE=;
 b=PutHT/QgtGuw0+bekCVhDbNqpQ1UlzP0gpvyu0wBbLQMtnNBxkoidD6tOZxyfCFaVp
 4U1cJ7YlQs1MEObelpG1ARjHZXGZwQumaPIDUpXwirb+nkqTWyq4Rqt11eQAZFxvPBT3
 l9Oq0WpWIEPBnxLtxsEsX+Mbmt5RZGdjSJaMcfVXC+HRRcgpAz7DGCoi6xJci7Ahtu9C
 zqeM4ZYvIPo5kGioGVF2lWngtk8Lxmh4KxkgewodcgepFRCKT05zWiSBgFkhBukcLWu+
 n9ZpBTj44XQxMVhTAHDPkguOVsra7m/0MY/Hz7jBQRk75A5EzTWwbzMLZfTMdCMo+FXK
 Tzyg==
X-Gm-Message-State: AOAM533sKzd+BFF5jwtDDmAdrN3QnJ6wB6/tdiUFch12+ceyaXeGtYfe
 JbJN1bKy32empf9uYoNQx4M=
X-Google-Smtp-Source: ABdhPJxk9rOdpE4HgxiGJpCpV8qAxuDvUDSE2k3P0fdjGxEoRibRvR2T6Nm3YJkS2IVAmQ2EkTF6xA==
X-Received: by 2002:a17:90a:708a:: with SMTP id
 g10mr3211941pjk.108.1624355824979; 
 Tue, 22 Jun 2021 02:57:04 -0700 (PDT)
Received: from localhost.localdomain (104.194.74.249.16clouds.com.
 [104.194.74.249])
 by smtp.gmail.com with ESMTPSA id c18sm4742498pfo.143.2021.06.22.02.56.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 02:57:04 -0700 (PDT)
From: Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To: narmstrong@baylibre.com
Cc: wim@linux-watchdog.org, linux@roeck-us.net, khilman@baylibre.com,
 jbrunet@baylibre.com, christianshewitt@gmail.com,
 martin.blumenstingl@googlemail.com, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, art@khadas.com, nick@khadas.com,
 gouwa@khadas.com
Subject: [PATCH] watchdog: meson_gxbb_wdt: improve
Date: Tue, 22 Jun 2021 17:56:39 +0800
Message-Id: <20210622095639.1280774-1-art@khadas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_025707_840138_03F72AD2 
X-CRM114-Status: GOOD (  12.03  )
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

Improve meson_gxbb_wdt watchdog driver
1) added module param timeout and nowayout same as other modules
2) print watchdog driver start status
3) add watchdog_stop_on_unregister
4) remove watchdog_stop_on_reboot ( still can be activated by
watchdog.stop_on_reboot=1 ) i think this driver configuration more useful
becouse we can get reboot waranty for abnormal situations on shutdown stage

Signed-off-by: Artem Lapkin <art@khadas.com>
---
 drivers/watchdog/meson_gxbb_wdt.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
index 5a9ca10fbcfa..15c889932c13 100644
--- a/drivers/watchdog/meson_gxbb_wdt.c
+++ b/drivers/watchdog/meson_gxbb_wdt.c
@@ -35,6 +35,17 @@ struct meson_gxbb_wdt {
 	struct clk *clk;
 };
 
+static bool nowayout = WATCHDOG_NOWAYOUT;
+static unsigned int timeout = DEFAULT_TIMEOUT;
+
+module_param(nowayout, bool, 0);
+MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started default="
+			__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
+
+module_param(timeout, uint, 0);
+MODULE_PARM_DESC(timeout, "Watchdog heartbeat in seconds="
+			__MODULE_STRING(DEFAULT_TIMEOUT) ")");
+
 static int meson_gxbb_wdt_start(struct watchdog_device *wdt_dev)
 {
 	struct meson_gxbb_wdt *data = watchdog_get_drvdata(wdt_dev);
@@ -174,7 +185,7 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
 	data->wdt_dev.ops = &meson_gxbb_wdt_ops;
 	data->wdt_dev.max_hw_heartbeat_ms = GXBB_WDT_TCNT_SETUP_MASK;
 	data->wdt_dev.min_timeout = 1;
-	data->wdt_dev.timeout = DEFAULT_TIMEOUT;
+	data->wdt_dev.timeout = timeout;
 	watchdog_set_drvdata(&data->wdt_dev, data);
 
 	/* Setup with 1ms timebase */
@@ -186,7 +197,12 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
 
 	meson_gxbb_wdt_set_timeout(&data->wdt_dev, data->wdt_dev.timeout);
 
-	watchdog_stop_on_reboot(&data->wdt_dev);
+	watchdog_set_nowayout(&data->wdt_dev, nowayout);
+	watchdog_stop_on_unregister(&data->wdt_dev);
+
+	dev_info(dev, "Watchdog enabled (timeout=%d sec, nowayout=%d)",
+		data->wdt_dev.timeout, nowayout);
+
 	return devm_watchdog_register_device(dev, &data->wdt_dev);
 }
 
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
