Return-Path: <SRS0=kgfN=4U=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEDC7C3F2CD
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Mar 2020 13:24:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 851B22073D
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Mar 2020 13:24:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TM4y0H/3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 851B22073D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xJLaTul1GOK+HgB9T8GuDYnMYAmhbK9LHIFYtKJqfos=; b=TM4y0H/3U6sW8h
	SNhOa6PipEMtrJ8FUiLDTY8iNB/TvMGCgc/OtHAunjFeWhulM9NofUmSKAvmWTGrWTEy6Hv1Rk1Nb
	KQm9PlUGtK616MYNw9KvDAQM7tFmsspFe7zqHQygSe+3UmS0rYaxFH8trXi/zN2bhO1jswfQt5hcS
	JfqXJj2FlIYHHMSuqP4cHl/beEsJq8+0QNGa1jdR/3VIgUSGvsZSUllI87UVvfBgxYq8VfwGmHNBx
	mRRX9nmmE1/9hC914tjeDJXGG61Ybg9O7fuoPZqW1e2IVMQGxJXIAgFJQrzLZuGPLwy66mwWhRDdj
	OVDhrV/lcvj1XG/exi4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j97Wo-0006Rl-L6; Tue, 03 Mar 2020 13:24:06 +0000
Received: from dd10532.kasserver.com ([85.13.133.80])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j97Wm-0006RA-As
 for linux-amlogic@lists.infradead.org; Tue, 03 Mar 2020 13:24:05 +0000
Received: from odsus.home.arpa
 (dslb-002-202-024-230.002.202.pools.vodafone-ip.de [2.202.24.230])
 by dd10532.kasserver.com (Postfix) with ESMTPSA id F26A81F40ED9
 for <linux-amlogic@lists.infradead.org>; Tue,  3 Mar 2020 14:24:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by odsus.home.arpa (Postfix) with ESMTP id 960183C3DB
 for <linux-amlogic@lists.infradead.org>; Tue,  3 Mar 2020 14:24:01 +0100 (CET)
X-Virus-Scanned: amavisd-new at home.arpa
Received: from odsus.home.arpa ([127.0.0.1])
 by localhost (odsus.home.arpa [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K-r3Qq-0AQbP for <linux-amlogic@lists.infradead.org>;
 Tue,  3 Mar 2020 14:23:59 +0100 (CET)
Received: from [192.168.201.4] (unknown [192.168.201.4])
 by odsus.home.arpa (Postfix) with ESMTP id 442F43C2BC
 for <linux-amlogic@lists.infradead.org>; Tue,  3 Mar 2020 14:23:59 +0100 (CET)
To: linux-amlogic@lists.infradead.org
From: Otto Meier <gf435@gmx.net>
Subject: [PATCH] pinctrl: meson: add tsin pinctrl for meson gxbb/gxl/gxm
Message-ID: <0522f4cb-936d-50e0-1b6f-c885c94d7aa9@gmx.net>
Date: Tue, 3 Mar 2020 14:23:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Language: de-DE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200303_052404_535770_9C758417 
X-CRM114-Status: UNSURE (   6.38  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

  Hello

after having fixed the uart_c pinctrl definitions during September,

this patch would revert part of the formerly Patch.


  	/* Bank Y */
-	GROUP(uart_cts_c,	1,	17),
-	GROUP(uart_rts_c,	1,	16),
-	GROUP(uart_tx_c,	1,	19),
-	GROUP(uart_rx_c,	1,	18),
+	GROUP(tsin_a_fail,	3,	3),
+	GROUP(tsin_a_d_valid,	3,	2),
+	GROUP(tsin_a_sop,	3,	1),
+	GROUP(tsin_a_clk,	3,	0),
+	GROUP(tsin_a_d0,	3,	4),
+	GROUP(tsin_a_dp,	3,	5),
+	GROUP(uart_cts_c,	1,	19),
+	GROUP(uart_rts_c,	1,	18),
+	GROUP(uart_tx_c,	1,	17),
+	GROUP(uart_rx_c,	1,	16),

The Numbering of uart_C pins is changed by this patch.

This patch definitly breaks  the sdcard, if uart_c is enabled.

bye

Otto


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
