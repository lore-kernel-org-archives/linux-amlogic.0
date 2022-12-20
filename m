Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08433C4332F
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Dec 2022 09:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VnFItK+zZbDhIfSlNwHZReKSC8pEnZiStlcxlYOSmmk=; b=1HyMF5tT3Crb+I
	Qo/GYG4w8FIpX/D6Cg6W30924mrwB2ue367hb6tQHEVaxwrBYoOZjTuMooJ2/oxPZujdVQqBN99e5
	s0G1XuvTgu15do6C5VZPB9nPGQB/beOa0W2FFt+32dr4812MSsTWuKWmW9MK9NwgDFYC4mHXaai1b
	MxjaNgVvv/KTWWRjIJhqbkiVVL0nEYqcVfV0SN0PPmlkM8y5qMo5QN38+Rb4lq0tH442+uUN8fRgq
	EV98zqH50RlrIfg8TcxuHhqde9k77GU2Q/+iTZom2auXRHTs0Caxv8Y1kGU4Aa5gi9GDPQAKNis9f
	Hsq6DWU1QGcKrrH1cpbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7Ys7-00Cq6Z-8p; Tue, 20 Dec 2022 09:25:15 +0000
Received: from mail.rosalinux.ru ([195.19.76.54])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7Yrb-00Cpm7-8R
	for linux-amlogic@lists.infradead.org; Tue, 20 Dec 2022 09:24:45 +0000
Received: from localhost (localhost [127.0.0.1])
	by mail.rosalinux.ru (Postfix) with ESMTP id 5052A71E3EEF;
	Tue, 20 Dec 2022 12:23:04 +0300 (MSK)
Received: from mail.rosalinux.ru ([127.0.0.1])
	by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id lOIaIJW5cXXj; Tue, 20 Dec 2022 12:23:04 +0300 (MSK)
Received: from localhost (localhost [127.0.0.1])
	by mail.rosalinux.ru (Postfix) with ESMTP id 1F02D71E3EF2;
	Tue, 20 Dec 2022 12:23:04 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rosalinux.ru 1F02D71E3EF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosalinux.ru;
	s=1D4BB666-A0F1-11EB-A1A2-F53579C7F503; t=1671528184;
	bh=Cun9tEP78/02t9DydkissoRdzYCxuv0h/3TtHOePWno=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=hdlWAnzU62LAZeu+PT6EsFieeCmhqqedMOh94GQhC6O/twY2COz3oGLvsDYzS4Q7/
	 IYBtyYvkFoNGXWw5JZgGy1MhCOyMTawlM2HHvf7zoophgNYjqrGc5zwIDH9Ep02kgF
	 tX2qYyXHxXNLSNkLQYI5BO6n2QyIuxzUJqIGYvcj+kpvuDvYS/m403tC4stXGKZ5Dj
	 +8Bqkc9pX10eS8uMH3QoFEWC3x49uYQp6/3PsjQtpNt9NboBDm5R8X6FKeK1elHWaq
	 6Ia5sFoFyx8KRPZyUwRd8Nr/ueTTcACqR2QDBfOXdzlYC01DNiFnPA3kKi5v4UMqfV
	 sp55QrF0QFG0w==
X-Virus-Scanned: amavisd-new at rosalinux.ru
Received: from mail.rosalinux.ru ([127.0.0.1])
	by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id H6h4kHYvn23C; Tue, 20 Dec 2022 12:23:03 +0300 (MSK)
Received: from ubuntu.localdomain (unknown [144.206.93.23])
	by mail.rosalinux.ru (Postfix) with ESMTPSA id 7076271E3EEF;
	Tue, 20 Dec 2022 12:23:03 +0300 (MSK)
From: Aleksandr Burakov <a.burakov@rosalinux.ru>
To: Yue Wang <yue.wang@amlogic.com>,
	Hanjie Lin <hanjie.lin@amlogic.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Aleksandr Burakov <a.burakov@rosalinux.ru>,
	linux-pci@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH] PCI: amlogic: The check for devm_add_action_or_reset's return value added
Date: Tue, 20 Dec 2022 12:21:37 +0300
Message-Id: <20221220092137.6527-1-a.burakov@rosalinux.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_012443_899183_990CA404 
X-CRM114-Status: UNSURE (   6.27  )
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

The return value of the function devm_add_action_or_reset() was not
checked hence an error code would not be returned.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 9c0ef6d34fdb ("PCI: amlogic: Add the Amlogic Meson PCIe controller driver")
Signed-off-by: Aleksandr Burakov <a.burakov@rosalinux.ru>
---
 drivers/pci/controller/dwc/pci-meson.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
index c1527693bed9..3d82f0b65480 100644
--- a/drivers/pci/controller/dwc/pci-meson.c
+++ b/drivers/pci/controller/dwc/pci-meson.c
@@ -187,9 +187,13 @@ static inline struct clk *meson_pcie_probe_clock(struct device *dev,
 		return ERR_PTR(ret);
 	}
 
-	devm_add_action_or_reset(dev,
+	ret = devm_add_action_or_reset(dev,
 				 (void (*) (void *))clk_disable_unprepare,
 				 clk);
+	if (ret) {
+		dev_err(dev, "couldn't reset clk\n");
+		return ERR_PTR(ret);
+	}
 
 	return clk;
 }
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
