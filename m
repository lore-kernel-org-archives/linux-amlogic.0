Return-Path: <SRS0=ZD2b=GW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7132AC433DB
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Jan 2021 20:25:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0D0623133
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Jan 2021 20:25:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0D0623133
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Qk86QBV4SLXDNzyLRwNAL8aZ+VNliqF4IdPyaZ1XkKs=; b=a1KFj8o1KQAm/lMjHnuyyRD5Sk
	0igsEbgYm7y+ghR7fpPOBL9IfqGtCbwp6YYxYqvrvcNjezYIvY2vh1ZBAIUI/kqug8VUzPbaWZNmP
	6tlal97Rk7JmyLIvopWqHAgxbhldW2Ha18aUWBZdHA5GWpgk3pOEYzGsE0fXbwGrV0+bEYC2FjoEo
	wkZx3V6Jh4A6WpVPnkyhwH3EecZf5TvoP14rG4jFSJKH6F9OSNP8QqqJqlcKG++XGSyXqvA985dtg
	t3G+75WnEG8WQd6bOtvoxLNMKKfRBaAsmbq1l6b+6GQSK5xPDlWtSaRKeaFLeoAtwwUhQUgAOIvam
	fvjYMYNg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1xYi-0007z1-1b; Tue, 19 Jan 2021 20:25:00 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1xYe-0007xl-I3; Tue, 19 Jan 2021 20:24:57 +0000
Received: by mail-ej1-x633.google.com with SMTP id a10so13745783ejg.10;
 Tue, 19 Jan 2021 12:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rFyr2V+Jzdi4YW1yffMaIUqKhZ3/Vi5CLcZD0g+G3W0=;
 b=o+4RLf0mOmonrScZu/JxFwoEr0HqSw4KJX7HorYpAUIAC3Z4pFXORzdwqXx0ELKJQv
 8jtosQrDAVVlwbeObGSkKXhJjIC6QWTdF9cRpQ7Eefmxi+gTLqvmRANRFHV0LuNNClqU
 jgscy3xuF5QZVAPUnw/SS5ctnagl0/iKvOobiusKJA0uvujbONo7kMgpwXogk3a31d5A
 i/yfg7+FSeBGtKzh9NMRxiOOe5nkCPrVLReLB+FoM0Lx1QSbSfNFSiRvRSB+jcqrsF3Q
 kU+izgGu38oIpK+jBaKmDsng+8FLAp6oi88N10LwOacMLGiTnvtS7rhTYeABR3Ru3ZQB
 Pfyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rFyr2V+Jzdi4YW1yffMaIUqKhZ3/Vi5CLcZD0g+G3W0=;
 b=b0CMsurtUc31VzlsvMHW/+3rhQMzwi7klxr/Ya51bxOXriz9xoCGAnQ3OxiIvRtd6G
 XmO9hNERUaouhymj3sNAV48jizsPARazm9SaULY2YLbUr2mj6WFl0a0KY5i73rZZAqQq
 8fW01rjo8NOGdu6ZvceozDWNIhzgP2CLxUXsYeotVKSuTm0ZqdwfRLt1K7kpj2xjtU96
 hBU4JnATP9gucSaOeCszVc0xzKuuuirWLuZQ1Vs/pgfkuaLhUy5hZqZONkLsqs/6NVxK
 yHRlXxTlT8v+4DLOippNdi6qbUrUCMFSfaj4qUYMSbzOLx0l7TcG2uH4TQffb96sZ0cB
 rlFA==
X-Gm-Message-State: AOAM531vf+Eac++r7N6glraSUHJrKRZG4RwNlzg4xPmFWXLEKJpGnwO2
 wtpH18GkRPUIrkorJat1QX4JHfDQWRQ=
X-Google-Smtp-Source: ABdhPJzgJWBS8Glb8O8e1TWNjzrEWbp0SXKsfSt9zOga9qYGgKUcy74g3uI6DG+n0NBnuIHe4x4Csw==
X-Received: by 2002:a17:906:87c3:: with SMTP id
 zb3mr4123114ejb.244.1611087893049; 
 Tue, 19 Jan 2021 12:24:53 -0800 (PST)
Received: from localhost.localdomain
 (p200300f1373d4700428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:373d:4700:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id g18sm12876367edt.2.2021.01.19.12.24.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 12:24:52 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	netdev@vger.kernel.org
Subject: [PATCH] net: stmmac: dwmac-meson8b: fix the RX delay validation
Date: Tue, 19 Jan 2021 21:24:24 +0100
Message-Id: <20210119202424.591349-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210119_152456_627382_21DD1DAD 
X-CRM114-Status: GOOD (  13.29  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, kuba@kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org,
 Martijn van Deventer <martijn@martijnvandeventer.nl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

When has_prg_eth1_rgmii_rx_delay is true then we support RX delays
between 0ps and 3000ps in 200ps steps. Swap the validation of the RX
delay based on the has_prg_eth1_rgmii_rx_delay flag so the 200ps check
is now applied correctly on G12A SoCs (instead of only allow 0ps or
2000ps on G12A, but 0..3000ps in 200ps steps on older SoCs which don't
support that).

Fixes: de94fc104d58ea ("net: stmmac: dwmac-meson8b: add support for the RGMII RX delay on G12A")
Reported-by: Martijn van Deventer <martijn@martijnvandeventer.nl>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
Many thanks to Martijn for this excellent catch and for reporting this
issue (off-list)!


 drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index 55152d7ba99a..848e5c37746b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -443,16 +443,16 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 	}
 
 	if (dwmac->data->has_prg_eth1_rgmii_rx_delay) {
-		if (dwmac->rx_delay_ps != 0 && dwmac->rx_delay_ps != 2000) {
+		if (dwmac->rx_delay_ps > 3000 || dwmac->rx_delay_ps % 200) {
 			dev_err(dwmac->dev,
-				"The only allowed RGMII RX delays values are: 0ps, 2000ps");
+				"The RGMII RX delay range is 0..3000ps in 200ps steps");
 			ret = -EINVAL;
 			goto err_remove_config_dt;
 		}
 	} else {
-		if (dwmac->rx_delay_ps > 3000 || dwmac->rx_delay_ps % 200) {
+		if (dwmac->rx_delay_ps != 0 && dwmac->rx_delay_ps != 2000) {
 			dev_err(dwmac->dev,
-				"The RGMII RX delay range is 0..3000ps in 200ps steps");
+				"The only allowed RGMII RX delays values are: 0ps, 2000ps");
 			ret = -EINVAL;
 			goto err_remove_config_dt;
 		}
-- 
2.30.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
