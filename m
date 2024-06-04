Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E86CC25B78
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Jun 2024 14:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QIjXAwNGClm8MvIxT1KDkufIwYMO1nHxPTagmnAsXH0=; b=zGidPGta8+gpqw
	MMgvE+mNUtJTGy8mj42UIIw7YDeT5zlWgpdEn5OsiKH74CHKmF3KAWs5dtyv3YXL4xES6frnzWNMy
	AxQPTo55qu1lChntsJdaOe55ZoEkB45x+m1GTfBqaciaU0Bi+x4XEsJM2s9426Hv3bfBA7O8s5Rs6
	kxsjNFtERs0sH2rNE3TCOd1JQK8e0x9Ux9eWJRCf35Pxao7XjyLPNoS/YrLO1mcZWf5rKQ3F+eFo0
	g4Cpr5wvYT/paoq8Jb3EFL/T+TJ1shXsYuTPpr0K0qXBX5VnRr1Ip01ll4l/zpnfEb+Oqbgt5ovF2
	5mTxn1CMAL13eDnsciQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEUoG-00000002cst-2M2G;
	Tue, 04 Jun 2024 14:06:44 +0000
Received: from mx.adeep.su ([185.250.0.168])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEUoB-00000002crr-2xWo;
	Tue, 04 Jun 2024 14:06:43 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 511C9FC974;
	Tue,  4 Jun 2024 17:06:17 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
	t=1717509991; h=from:subject:date:message-id:to:mime-version:
	 content-transfer-encoding; bh=IBuooCDtyKHRQbL0BSwWXYG2t/9WVK1dkFV9raf2ZvY=;
	b=CKfwtdCwbZrMdw6VnDe6QW4eaNX86ggr7TqKXZAx6CJUYHCI5JNXvXjBqxvKdHMxxwu5vL
	4/d8Q6qDviKdtQhrDG7HAqOOqG0Wj6Qqg6yUCUrijFXFvaLNKPYoGDYE9GNzJDBmmH1AQu
	svCPglmyl1L3OY6k6iW+gw9FAr1XHZ1CHsvwXK9ctRfYFS42gSjcpDSooZsl/LW7Qlnl4V
	CM0pLhWJY0/wMTrNcoTcnEdb3EXdiWJ8KuyY8McjUxM0eOScLbk7uV86eT7T0mE6cnG0VI
	YVjQNJkJ0BJFoJ/ZHoyjky76iOofRxYiSiPeEsybmYIn85wOTE/8nUXi2jC4Uw==
From: Viacheslav Bocharov <adeep@lexina.in>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH] soc: amlogic: meson-gx-socinfo: add new A113X SoC id
Date: Tue,  4 Jun 2024 17:04:51 +0300
Message-ID: <20240604140612.1179323-1-adeep@lexina.in>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_070640_985584_75BE539C 
X-CRM114-Status: UNSURE (   7.36  )
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

Add new definition for Amlogix A113X SoC found in JetHub D1/D1+ devices:

soc soc0: Amlogic Meson AXG (A113X) Revision 25:b (43:2) Detected

Signed-off-by: Viacheslav Bocharov <adeep@lexina.in>

---
This commit is applied on top of Christian Hewitt's commit with S905L SoC id.

--- 
 drivers/soc/amlogic/meson-gx-socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/amlogic/meson-gx-socinfo.c b/drivers/soc/amlogic/meson-gx-socinfo.c
index 7e255acf5430..8809a948201a 100644
--- a/drivers/soc/amlogic/meson-gx-socinfo.c
+++ b/drivers/soc/amlogic/meson-gx-socinfo.c
@@ -63,6 +63,7 @@ static const struct meson_gx_package_id {
 	{ "962X", 0x24, 0x10, 0xf0 },
 	{ "962E", 0x24, 0x20, 0xf0 },
 	{ "A113X", 0x25, 0x37, 0xff },
+	{ "A113X", 0x25, 0x43, 0xff },
 	{ "A113D", 0x25, 0x22, 0xff },
 	{ "S905L", 0x26, 0, 0x0 },
 	{ "S905D2", 0x28, 0x10, 0xf0 },
-- 
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
