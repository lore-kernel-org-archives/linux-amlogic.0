Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D72EC79F8B
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Jan 2026 12:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=U4nKpm+VgA/QjQ66LsIzOIBYVtT4GcIMieIeCEH0xg0=; b=lH8cHQM00z8/PA
	PLjbMLyqaZkQvwmAIyF0Cn5w2W5qbY/sHniCIXN1tHnf125KWRhSaiWkMGKOphyYW4Km1/SacvryX
	4fCHo1Vd7Bva8lG/PFGsumSHvvyTywbMhEKCiUf8H7cvGq/WVwisJ/TBSq+qhkxer9CTDGRkAXvGq
	ejtxZXJ7c/4HQ9omTavfQuVYOIo8hSWy48buUi5eiE/nd6buFUm2BhQxcNCMLd5hRmttVy4v4+xaf
	JVhDDtkxaAAu6d5mTeS3IZCsBY/YY8/YcJbGjHtiHoW4RWljqKm86q9AwAz9IrY/O4qyx7nTthMQC
	BDubwtEQrE7rJOJVcXxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vck8c-0000000BMPY-3VBJ;
	Mon, 05 Jan 2026 12:56:46 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vck8a-0000000BMOB-2TNx
	for linux-amlogic@lists.infradead.org;
	Mon, 05 Jan 2026 12:56:45 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-6505cac9879so660161a12.1
        for <linux-amlogic@lists.infradead.org>; Mon, 05 Jan 2026 04:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1767617802; x=1768222602; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=en2pW9puE35IFTbs++BWoNNKvbkB1aM3UnUzh6oqOZ4=;
        b=WsKes/SNSZYBZzffwpWS35Y8Wvn0rA3trU//TiukoLh2911ZLx0pGxBGqx8NZa57ic
         rko5CqeZQTiqdrbByMqEflyjrvEL/i1otHO0x7lGSfCAALScuDsBnqJS/7HSjuAEL+Id
         UUJB+5GZbR5U/A+IZuvaBlFnYsuRIGrLOSt02eQOBRUx8002sLm+tzRyHVwyLa0DrGqP
         s9gKSufLx/5yXwfMCn4+McmKD5BLYUacdoKo6BAfe3ftfJP3aCTbbFlBdT4tD8AHHLUT
         O07bTHBt+BE8CeJ3KZRUm5aQsl/xHFG7Y305UjY4Jk/LyLX34oM3zVktX1gOvM/f1JlH
         Tx2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767617802; x=1768222602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=en2pW9puE35IFTbs++BWoNNKvbkB1aM3UnUzh6oqOZ4=;
        b=dy+/1rbqazh88lEwB0PWrE3CDbbmZ09TZUk2979pO53lmbmM/kNGj0lp8r4Zh8qsy7
         i1BDV3oZGAwUQypwP1xjvok7ki2RKQWxnLeG9lk7lzwbIzx8MoYvccUJy2GCU/dez/K1
         NsRkHNMOFEnrdWpWWnIrIakUfdALYC56xQXaAkrD/aHTwz/lUG1o/ArwKJZpqZDR1PeU
         DKg84HxdWMh/nkcSuhGC/4QP3FVNHH6WO9tUmbEdUaRJSou3WGMkCHaMGSY1l335O/Ny
         HWL3Xu94GlAUA51Zo5kF4WMoOCeykvVvvSsY9aMbx9UnIDSgbav//hEfDqD9qY1MFvdE
         TFeQ==
X-Gm-Message-State: AOJu0YxD3/vi15nRArb+5UL1ixSef994nflHPeNKjOuCZH4+xXybxf4z
	kcdTDPoUD5IARjr7zzX2ZYzJxPMxS+IFFdaduOvvy5spx8Xd24t3U/j65lByFw==
X-Gm-Gg: AY/fxX4w0oDP3EgGO4H6sKuVXby5+ZCzjjGv5qDkNmASVV1PsE2oL29lPTYxDewx/Ra
	kDLOcTbcb2gij64vWPRUr5aNCJrdND9L7cN6eK91kFJ0Uu9Eokhr2AYtBjHZ9pCcvbjA15RM7JQ
	59etmUrlfnLcJpfGoqaXYxrI4/wiiOy2kLE/2f28X0CsSHey01IULO3zz7fypzQBX6x5Qwu3LT1
	8aSvYimkBvANG+zr6ZZU3ZnJDNOkF5qH6v+sJkJ3ijdeO2QGQOEG6CEDTHFQ2apCY2gJW6K+Y7s
	fh9mSu40rvWt31PeukDwZ7PsCtujNDhI0He+iLZzZIDL0HKUdm2s/Hivi4v1yC+ogBiCnTUtjYs
	5XdnJYzrLxPThwy+X+/6DOtj97h7tn7s9qvbkW1bs95DVPxnOHN4o02ohe0Icj5w1zqy+tSQmzS
	CCzwsZGF8wIXXSTEjubtsbWICTxLGt4PefYy1D0pd9AUbMcjmdrS8p8St2IqvCB/nJ3bqj4kY5Z
	Y/SL34DcZGi+LW6e9OQluSfT94CG58O/UGTqPmoqaIimaKtXLOy
X-Google-Smtp-Source: AGHT+IGkQHUVn4G1LTfeKcgEt+M7w3okEoSSOC40iYpGOWHCsX59BOszv9hkdCiQgf3kosmWwCeYyQ==
X-Received: by 2002:a05:6402:3587:b0:64d:3b22:a5b9 with SMTP id 4fb4d7f45d1cf-64d3b22a88fmr37161484a12.9.1767617801949;
        Mon, 05 Jan 2026 04:56:41 -0800 (PST)
Received: from blackbox (dynamic-2a02-3100-a8ad-5500-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:a8ad:5500:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-64b90f53b21sm53582712a12.5.2026.01.05.04.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 04:56:41 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	linux-pci@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bhelgaas@google.com,
	robh@kernel.org,
	mani@kernel.org,
	kwilczynski@kernel.org,
	lpieralisi@kernel.org,
	yue.wang@Amlogic.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH] PCI: meson: Drop unused WAIT_LINKUP_TIMEOUT macro
Date: Mon,  5 Jan 2026 13:56:25 +0100
Message-ID: <20260105125625.239497-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_045644_625942_7D8BB330 
X-CRM114-Status: UNSURE (   9.49  )
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

Commit 113d9712f63b ("PCI: meson: Report that link is up while in ASPM
L0s and L1 states") removed the waiting loop in meson_pcie_link_up()
making #define WAIT_LINKUP_TIMEOUT now unused.

Drop the now unused variable to keep the driver code clean.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/pci/controller/dwc/pci-meson.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
index a1c389216362..0694084f612b 100644
--- a/drivers/pci/controller/dwc/pci-meson.c
+++ b/drivers/pci/controller/dwc/pci-meson.c
@@ -37,7 +37,6 @@
 #define PCIE_CFG_STATUS17		0x44
 #define PM_CURRENT_STATE(x)		(((x) >> 7) & 0x1)
 
-#define WAIT_LINKUP_TIMEOUT		4000
 #define PORT_CLK_RATE			100000000UL
 #define MAX_PAYLOAD_SIZE		256
 #define MAX_READ_REQ_SIZE		256
-- 
2.52.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
