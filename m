Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5385C54E6A
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 Mar 2024 13:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bz1mvla7+VcsprsxqpOnqrtE59g46+qW/ki7ZA1H2hw=; b=MKF4XDT6GvQav8
	nDg8c7IOG8BSL0yrVufWWweMDkyFr6RMcPea59oia3p//xe2jgCGqADxQI/ZcArSE8p/SmPBKye+l
	b8YsnxCacaugoxWeyo8fH1bGnYhvXXuzSaaSlO20GR9mExAaZWEgirL/0OZ+stipUT7FBl6RZLKiF
	jL8aubjthk8yyyRiGx4ZtYmcMhl1TaFf+qq+eI7h244Y1WkOsme45Xi9aP80tFYd9hzo+ITav7dWR
	itOchhFc5+A28TLFlMNM+g6pvNfR81aQi//VH5b36/LH6cO3lAIv9Kvx2abmQE7p+eOw66Qc5HvHP
	5EhrHnt2hCZ85S0rnVlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlUUl-00000003DmH-1hFy;
	Sat, 16 Mar 2024 13:54:43 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlUUi-00000003Dkr-1ejx
	for linux-amlogic@lists.infradead.org;
	Sat, 16 Mar 2024 13:54:41 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-41409c98f02so1773095e9.1
        for <linux-amlogic@lists.infradead.org>; Sat, 16 Mar 2024 06:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710597278; x=1711202078; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HPcxqyTeUTFtLFpSljl4ZTM1noOjuExPBLyjmd+rHbA=;
        b=F5gsXIvyCY1KHVJxrUbajaBfR3mfl1qL7Y8Wb2CfmEh/pE27WIz++e+nVklM2lKyx0
         yr+OueEaWOASlphKtxvn0mpXIAdlvdv4lsumPb/Le8p6CqO62kELQdU3vA1ZbSU+SU1u
         qFE2Io9Y2Gb7BbXFoXrxrplcm8NlTNtk9p33M95qB4plKFRmvO98zHvWL1Gw4RF2oQeu
         3fADCZt63M/aUkXVY5Bha+m9jdomKrUNwsPYkceGObOTkq/WSFqyxj8mPWcQWNVLxj7o
         R6IoDRrSaNfzvE53YVkYWW0y+lzeN8/MIcMRR4NiBR2nj83VuufNemh4ZpoI/fSsFqDU
         p7pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710597278; x=1711202078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HPcxqyTeUTFtLFpSljl4ZTM1noOjuExPBLyjmd+rHbA=;
        b=jzTJrjzyuso3o3I/DuTvlmtHzz0n8TpBdP887SuMbZKh40WcZ0xL9BYDXPCsvfe/6g
         zq2zGVDKxEjMPg1bGpKIc6TnafcaQ9NB+8BYDnULD9CfLVvfIqz0UQSHLuJG8nGxPpy+
         IST5kTtooyoCh4+vkjDB0N2sTBerU5g7Rgsff5dHo5jw+Dpa9CnbqgQLOmIbFH7D9WeQ
         MTGnqJjI9DQ8bcMo/H8SNmPQ2a0kphjo2EkGtOwrKjGnUruQ1jdxRKA5D+KQ/AOiDrPc
         0vHg7Z18YH9bs/4XXVajjxulKwIqpEQpdP1YZ9oEzBno/kTvr3P/EzgMKgiBiNxR1+Xq
         +Y5A==
X-Forwarded-Encrypted: i=1; AJvYcCW7K8sd93HTtskcLb9cu78tUCV0gHSIX3I/kMcw590YcSjmrxs9l6uQIVDR85z7UhSGFLfTFf0QtPiwz9jlPbFtNlF4uRL5ucJRhYVoxj+CUf0=
X-Gm-Message-State: AOJu0YzEdYRkiPWD3T/6iB0zt1cIcNcgqr2D0v6vzH8+ykpPI9At8etS
	2oCfY9OObFZVg178+pF/DiMBCC4aqiiNscsPNWRsyZ5OpShgGbsn
X-Google-Smtp-Source: AGHT+IEYG0eH4ayJUBr8ecRr7PG/f3qDBKXctrgFmfXcnYwNZccND8AUuoO0Z4plKiEDHJJUHtl5jQ==
X-Received: by 2002:a05:600c:a0b:b0:414:21b:9a92 with SMTP id z11-20020a05600c0a0b00b00414021b9a92mr1581883wmp.8.1710597278092;
        Sat, 16 Mar 2024 06:54:38 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id r7-20020a05600c35c700b0041409fa57c4sm523963wmq.34.2024.03.16.06.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Mar 2024 06:54:37 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 2/3] ARM: board: meson: update efuse MAC reading code
Date: Sat, 16 Mar 2024 13:54:29 +0000
Message-Id: <20240316135430.826898-3-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240316135430.826898-1-christianshewitt@gmail.com>
References: <20240316135430.826898-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240316_065440_457186_C6847118 
X-CRM114-Status: GOOD (  14.04  )
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

Current code used for reading the factory programmed MAC from efuse on
p200 boards does not appear to work resulting in a random MAC being
generated. Update the p200 board data reusing the function from the VIM3
source.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 board/amlogic/p200/p200.c | 35 +++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/board/amlogic/p200/p200.c b/board/amlogic/p200/p200.c
index 7c432f9d281..fb07eefa532 100644
--- a/board/amlogic/p200/p200.c
+++ b/board/amlogic/p200/p200.c
@@ -14,29 +14,36 @@
 #include <asm/arch/eth.h>
 #include <asm/arch/mem.h>
 
-#define EFUSE_SN_OFFSET		20
-#define EFUSE_SN_SIZE		16
-#define EFUSE_MAC_OFFSET	52
-#define EFUSE_MAC_SIZE		6
+#define EFUSE_MAC_OFFSET	0
+#define EFUSE_MAC_SIZE		12
+#define MAC_ADDR_LEN		6
 
 int misc_init_r(void)
 {
-	u8 mac_addr[EFUSE_MAC_SIZE];
-	char serial[EFUSE_SN_SIZE];
+	u8 mac_addr[MAC_ADDR_LEN];
+	char efuse_mac_addr[EFUSE_MAC_SIZE], tmp[3];
 	ssize_t len;
 
 	if (!eth_env_get_enetaddr("ethaddr", mac_addr)) {
 		len = meson_sm_read_efuse(EFUSE_MAC_OFFSET,
-					  mac_addr, EFUSE_MAC_SIZE);
-		if (len == EFUSE_MAC_SIZE && is_valid_ethaddr(mac_addr))
+					  efuse_mac_addr, EFUSE_MAC_SIZE);
+		if (len != EFUSE_MAC_SIZE)
+			return 0;
+
+		/* MAC is stored in ASCII format, 1bytes = 2characters */
+		for (int i = 0; i < 6; i++) {
+			tmp[0] = efuse_mac_addr[i * 2];
+			tmp[1] = efuse_mac_addr[i * 2 + 1];
+			tmp[2] = '\0';
+			mac_addr[i] = simple_strtoul(tmp, NULL, 16);
+		}
+
+		if (is_valid_ethaddr(mac_addr))
 			eth_env_set_enetaddr("ethaddr", mac_addr);
-	}
+		else
+			meson_generate_serial_ethaddr();
 
-	if (!env_get("serial#")) {
-		len = meson_sm_read_efuse(EFUSE_SN_OFFSET, serial,
-			EFUSE_SN_SIZE);
-		if (len == EFUSE_SN_SIZE)
-			env_set("serial#", serial);
+		eth_env_get_enetaddr("ethaddr", mac_addr);
 	}
 
 	return 0;
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
