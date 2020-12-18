Return-Path: <SRS0=hA9j=FW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0581BC2BBD4
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Dec 2020 08:46:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B43F323A23
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Dec 2020 08:46:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B43F323A23
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lIAzyH91vUXwvuPFoD2IuVQjlIaXsF6PqaQWkXIp1b4=; b=DmI84ICeyjvyUczK8MU1fhf6P6
	+8sqU+8JJRWA2n0agXy3/JQ8l/u1TZm3Vx8YvkGTnLqsBdJuQXELxcORebD2egYu0pxabOYU8vur4
	yBzUJxI6WaDBQnzo5/2uprEezPz5na/F/VRSS+PCWcmLKXYlWnoztQJS8076r27jhCiV7NBLe7gb0
	vBgJ5hfZX4+g8AJd2Z1CIYZiEymbw8W76ozsjkd5MWtn+Ap02xTzCudCfcL6ImVLHXSPhWNQqnjQL
	/iYu5S2vvOk9hW99VQJ1tIGkFei+l6Y2ls31Pb869/98apcSJGx7f7eL7Ap5uzF6lW1p/bLtJRHAZ
	J9pqjzZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqBOf-0007Qu-4U; Fri, 18 Dec 2020 08:45:57 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqBOc-0007PY-1D
 for linux-amlogic@lists.infradead.org; Fri, 18 Dec 2020 08:45:55 +0000
Received: by mail-wm1-x331.google.com with SMTP id g185so1673649wmf.3
 for <linux-amlogic@lists.infradead.org>; Fri, 18 Dec 2020 00:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=kO0SEr0e7/YgXMDhjyfe6vSCO5fzXt1gZ/t1f3mLQV0=;
 b=WqxjakuK8YxhSR6hhosZmHP/lUbp5aYDaSrm0+tzK5U5DSfW+errtZts6RecKCfTr1
 yXBcwrc4EtFfKVUx6FukLfN+n/KDfVf1NRipWMukkLrXkQtzFh90KUCUFtdEWNf5yoWj
 vydYsXhYdlAX8VOt2X/HOVJ2F2ThGEAfjRC7kXpbr6ndpuw2BJBSFHTPFtfy2cIeKAfa
 ipn/pPln1kBM171rjCkSU6Sjduy/XEe3KcVWZwsGYmlSzEMdIFSnrWLuS53qZLMwcvbI
 7u1yvH2B8Pt++moCxqcfj1ATnlNZNzmrv7CMVEC4mA+YNq4FhVgPpExk3FVBhFg42KiX
 8QNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=kO0SEr0e7/YgXMDhjyfe6vSCO5fzXt1gZ/t1f3mLQV0=;
 b=Wq/uYCwmRwm4ZSo8IYPGl/v8QmmHlmkBA9N2bdHS/dLb/jXuhtQicwCK049ABG5le1
 Nqu6xNF48oRr9WZBBl61DofV4GWRZxAVX2KT4zyUyL9NIuxHv8rad+TRfyWXh/bOwOR8
 eo12B4ypuYJ8CU4RFNEQe5wggHY35ScIfQK2ml1zxXPCfXuxqhuXbyjfHYTKNXZKOB9j
 D5SRb6IcMVgm+f+GhHA4ZKTtDQzxQqH4sIO21C2NAGHcIEQJTZnlM0PvY3wlcYs6K/xa
 b+DJ/FrVTDEaV4c/gXny9WpNy3h5n/sI8BGt8Tf2vr5IeGZ8uVdSIZhq4WhKDOedH84x
 YMEQ==
X-Gm-Message-State: AOAM532+yCC+CwTwaelmtvTaWGiNqafkH8X40vaHb0CUYIiqvRy3rBL6
 O5tWeVzgImGPr9MQq0RBwE6z1Zyl0tZ2Ng==
X-Google-Smtp-Source: ABdhPJxA+uZz26wxBJPmbcOk9s7/zgOlkzUW8sx8sAKDgADekgsW5lDKzEtkzKmhSx7dvZEBOQHJXA==
X-Received: by 2002:a7b:c246:: with SMTP id b6mr1325887wmj.154.1608281152793; 
 Fri, 18 Dec 2020 00:45:52 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id o8sm12426767wrm.17.2020.12.18.00.45.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Dec 2020 00:45:52 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de, u-boot-amlogic@groups.io,
 linux-amlogic@lists.infradead.org
Subject: [PATCH 2/5] boards: amlogic: add Beelink S922X board family support
Date: Fri, 18 Dec 2020 08:45:42 +0000
Message-Id: <20201218084545.29135-3-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201218084545.29135-1-christianshewitt@gmail.com>
References: <20201218084545.29135-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201218_034554_182043_5F4985BC 
X-CRM114-Status: GOOD (  17.06  )
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
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Copied from Odroid N2. Add myself as maintainer.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 board/amlogic/beelink-s922x/MAINTAINERS     |  9 ++++
 board/amlogic/beelink-s922x/Makefile        |  6 +++
 board/amlogic/beelink-s922x/beelink-s922x.c | 54 +++++++++++++++++++++
 3 files changed, 69 insertions(+)
 create mode 100644 board/amlogic/beelink-s922x/MAINTAINERS
 create mode 100644 board/amlogic/beelink-s922x/Makefile
 create mode 100644 board/amlogic/beelink-s922x/beelink-s922x.c

diff --git a/board/amlogic/beelink-s922x/MAINTAINERS b/board/amlogic/beelink-s922x/MAINTAINERS
new file mode 100644
index 0000000000..7f223df4ae
--- /dev/null
+++ b/board/amlogic/beelink-s922x/MAINTAINERS
@@ -0,0 +1,9 @@
+BEELINK-S922X
+M:	Christian Hewitt <christianshewitt@gmail.com>
+S:	Maintained
+L:	u-boot-amlogic@groups.io
+F:	board/amlogic/beelink-s922x/
+F:	configs/beelink-gtking_defconfig
+F:	configs/beelink-gtkingpro_defconfig
+F:	doc/board/amlogic/beelink-gtking.rst
+F:	doc/board/amlogic/beelink-gtkingpro.rst
diff --git a/board/amlogic/beelink-s922x/Makefile b/board/amlogic/beelink-s922x/Makefile
new file mode 100644
index 0000000000..27b1a74105
--- /dev/null
+++ b/board/amlogic/beelink-s922x/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0+
+#
+# (C) Copyright 2020 BayLibre, SAS
+# Author: Neil Armstrong <narmstrong@baylibre.com>
+
+obj-y	:= beelink-s922x.o
diff --git a/board/amlogic/beelink-s922x/beelink-s922x.c b/board/amlogic/beelink-s922x/beelink-s922x.c
new file mode 100644
index 0000000000..dc0d933a39
--- /dev/null
+++ b/board/amlogic/beelink-s922x/beelink-s922x.c
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2020 BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ */
+
+#include <common.h>
+#include <dm.h>
+#include <env.h>
+#include <init.h>
+#include <net.h>
+#include <asm/io.h>
+#include <asm/arch/sm.h>
+#include <asm/arch/eth.h>
+#include <asm/arch/boot.h>
+
+#define EFUSE_MAC_OFFSET	20
+#define EFUSE_MAC_SIZE		12
+#define MAC_ADDR_LEN		6
+
+int misc_init_r(void)
+{
+	u8 mac_addr[MAC_ADDR_LEN];
+	char efuse_mac_addr[EFUSE_MAC_SIZE], tmp[3];
+	ssize_t len;
+
+	if (IS_ENABLED(CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG) &&
+	    meson_get_soc_rev(tmp, sizeof(tmp)) > 0)
+		env_set("soc_rev", tmp);
+
+	meson_eth_init(PHY_INTERFACE_MODE_RGMII, 0);
+
+	if (!eth_env_get_enetaddr("ethaddr", mac_addr)) {
+		len = meson_sm_read_efuse(EFUSE_MAC_OFFSET,
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
+			eth_env_set_enetaddr("ethaddr", mac_addr);
+		else
+			meson_generate_serial_ethaddr();
+	}
+
+	return 0;
+}
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
