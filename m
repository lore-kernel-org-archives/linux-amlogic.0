Return-Path: <SRS0=deyy=4B=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20223C352A3
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Feb 2020 22:15:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9A792086A
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Feb 2020 22:15:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d1LYgFns";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="obfKpjZr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9A792086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AjzINLfixqRWlEJnKuCdkOW4NI+Yn1qwwMff/F0pn+U=; b=d1LYgFnsW+BOs7
	9v2p4aoDf1Z57KnH25kjwnYMBJfDVurp9T08A9wpFfUqojwMHKcPyXXgOjAbnnjhS6/eieU7e2/ZH
	ggVdA6K+2lscfOSWZ2TMvgfLx3Hdz6jaE8zs0ZV6uc7QDczA84rVhsCcxNFOpvQHhFfWbFB16RBHS
	wrrUkyKUgdtlJTaOErEn6QrLfWraTN2N01znyOvR2rPrLlPi4I5m0tlXoayEwDHdpssYKZgzknv5U
	vcbrMInWVhINA+UD8quwR9wlYFCSzkwbaOAeeb0TfIp3eUUOmWRy3HhrvseVPYaYcDVNwLsFZBEDq
	/ZRBZI0Mo6ZohhKXMjbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2Mle-00066S-7o; Thu, 13 Feb 2020 22:15:30 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2Mlb-00064w-TV
 for linux-amlogic@lists.infradead.org; Thu, 13 Feb 2020 22:15:29 +0000
Received: by mail-wm1-x32a.google.com with SMTP id p9so7980730wmc.2
 for <linux-amlogic@lists.infradead.org>; Thu, 13 Feb 2020 14:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C3cvRiUD9Nl8p8YLjwne8+EjZQQWMV3C+2eRUsxiU0Y=;
 b=obfKpjZrGeQ28llGQWizduZmcSjrU3n3fyjbkEtDAc7X4E4qGuZpF0KupIwTnVYeKb
 /4depdHqgxty/txIX/hotOggnb7A57wwTi9brubyBvVyKVwSjQ5RdEMZ4or8PAoAPGSN
 WHiTzXU4H1NRkgC+MmVuFK6t0VSI7Ds5r/sQ8rDbyQCbhQlx26ZA+59Z6O9vJzPqi2lI
 7epmIFe4CYldjIdF94AVjnl+ByvFGqGnixrAD1ysfvqvo8dRSviBm6x+BDpt5xjNDGwL
 4HYni4Z4pdKsc8EhHLdBXnX6LlsyrPmAYWAIkqLA1VUdsCTIlMJhuQvVd9llGnqpSnwa
 ffVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C3cvRiUD9Nl8p8YLjwne8+EjZQQWMV3C+2eRUsxiU0Y=;
 b=E6MrkNiMT8RyczmULcAxP3HwJogeJcwmLlqE+464b2vJITR4LLOEtYb8PgLMrv8CP9
 JFJl9qXgyQKKDBSAlQR9xQHocA1S02bPRgAEqyxYZfdhP4iQ0SoIuomiNG7GTzHx24Bm
 UFy51XkV2cUzZQtIztd+p8/wuTEueQjpXzIouK6QJfp9uBnABsx0PEuBWYEIRcDP0pkQ
 KQllp4EUfM8K8A0KPXNoArTPe/7xu9LvFRquE0M6afYUJf7Kh2pTydQtWW+gy07TXP11
 BlVTxkKwe6NTpBXJK2o0TjVEdqy+Xgp81FtHnCjXSqXnO322gaF8qSy0eWh7D59OYJLj
 u8tw==
X-Gm-Message-State: APjAAAWozJcVIkgZZkub2Ak3XQWJUj7m3Edetwf/z5VXyUxTcxYglAjU
 I1KsvXZvS6G/uAmv2l/Iu50=
X-Google-Smtp-Source: APXvYqxt0CpQAAb1iZV4IYSleIdo4xdoY1PZW+GdIRpE9o6+t7Mrte9eakVwz2MN3zs/5hbTzore6w==
X-Received: by 2002:a1c:7c18:: with SMTP id x24mr184315wmc.185.1581632124560; 
 Thu, 13 Feb 2020 14:15:24 -0800 (PST)
Received: from localhost ([37.237.208.38])
 by smtp.gmail.com with ESMTPSA id i4sm4524633wmd.23.2020.02.13.14.15.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 14:15:24 -0800 (PST)
From: Mohammad Rasim <mohammad.rasim96@gmail.com>
To: linux-media@vger.kernel.org, Sean Young <sean@mess.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org
Subject: [PATCH v4 0/2] add videostrong kii pro keymap
Date: Fri, 14 Feb 2020 01:15:11 +0300
Message-Id: <20200213221513.28540-1-mohammad.rasim96@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200213_141527_954074_C382088F 
X-CRM114-Status: UNSURE (   9.92  )
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
Cc: Mohammad Rasim <mohammad.rasim96@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Videostrong kii pro comes with a NEC remote control, this adds support
for this remote and also select it from the device dts

Changes since v1:
- fix styling issues

Changes since v2:
- use KEY_VENDOR for mouse key
- use KEY_PVR instead of KEY_RECORD
- use KEY_APPSELECT for the launcher
- use KEY_TV for the tv app key

Changes since v3:
- add a patch to use the keymap by the device's dts


Mohammad Rasim (2):
  media: rc: add keymap for Videostrong KII Pro
  arm64: dts: amlogic: add rc-videostrong-kii-pro keymap

 .../boot/dts/amlogic/meson-gxbb-kii-pro.dts   |  4 +
 drivers/media/rc/keymaps/Makefile             |  1 +
 .../media/rc/keymaps/rc-videostrong-kii-pro.c | 83 +++++++++++++++++++
 include/media/rc-map.h                        |  1 +
 4 files changed, 89 insertions(+)
 create mode 100644 drivers/media/rc/keymaps/rc-videostrong-kii-pro.c

--
2.25.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
