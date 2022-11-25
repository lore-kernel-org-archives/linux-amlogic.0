Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 096B1C4332F
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Nov 2022 11:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jqvTToFQUcKkQCUVvz/CGJcJjHu/49p1UI/+N11Xoso=; b=AN+qZfjsbxOj3Z
	4qWjdyXFQJVx5HHse+t6UDL4QTdvd6Vlp0XINPJgfyOmJ8S/Zfr6t5gPbSlZ51F8XYSgMUWWR0jtf
	f2N0Dgp8nT+GJmFuCnKSAhqDGVZmbNuDdM4fIT6AT428EMVtE/wUpmRduP6g+dD5h7PfpS/w5ZzKt
	FY7EoHfI53lHZAMYX17VnYuNXDwriRvkFY37WiPHwovoVYRPalI1YCAkyxnXtmNuxiFHAnPUaq8Ms
	nWtoIQfnVEQpCA+TCnqQe6zqrkiUmOV+s0BPIjQPjNCz2cIPO/w5e/uNUef3pPKRdKVrIBtDaQ8BS
	1I23p4CHnRKx7itvPQoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyWkb-00G1mn-Nn; Fri, 25 Nov 2022 11:20:09 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyWk9-00G1U3-SZ; Fri, 25 Nov 2022 11:19:43 +0000
Received: by mail-wm1-x332.google.com with SMTP id c65-20020a1c3544000000b003cfffd00fc0so5970152wma.1;
        Fri, 25 Nov 2022 03:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F6QrfFFXtNlfuBto8kS1m3+IbzT51Etpw/eL3qE3JO8=;
        b=lXKAyknG4+JDmB/LJpN2yOCEJBAq3k/M7HDcwVevK57TjYwrpkqQJ5mJNbKZwI0h72
         jx1YdOf9zGEa0d5zwA9uOX1+ZvK0+tsQ1ZQ8Uu0SrvYMPMS2q05usD6mcGDWhwSErc6d
         NRm7+RKqRrV7XpJtoJk+WHIWLaSiW4cNoBYZzSrh0eBPCtsUr4KiMOvU5nyQ8pNEK4im
         ip1myN22+2jiA/1f2OC9Qp0lvw/ssJuqBuL4OF4TkRibh8ksA0fBl/xkzQ2ZUSCg+Csf
         u2lLkAQxVv+DHEnGFnobofhfBljK/T+tY1ZYQGSx4AagFggeHGQie/NjrENbigP114Og
         moFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F6QrfFFXtNlfuBto8kS1m3+IbzT51Etpw/eL3qE3JO8=;
        b=2TN64hq9Fjw8mpuSIovsPbTpO6Kimj+RwRQ2G8BcBRwEX4+l2c5GrTf3uSkvxBn1sj
         eYb8IfsW+P2uTIF87ezo+u7hHW511h1HL2zjErEoQRQdpySJmEot5NQJnwyWz3/jqoVS
         4ADdYTxtzcEaU/lTJWpa/rmhFVp65mrtzIj7xslqA64C1ByMtiCpf3+pg1+0v+18kac/
         A86Zb/+ceK7j2aUXrdnPMTtht/03XoubusN7T1duVAqd4/4lBjbBAYlylBIsCvuyCZ0l
         16HnM3pnFoup/4nL4MqeF6aRBRi/hRy/ELw60gt92axjaMYO/gsnWx2FnRaDMw7vC4nu
         gl+g==
X-Gm-Message-State: ANoB5pmd8xCRO5PjMatutLwHmg51ho4LaQLAGKzdCsi6awBH/hrJW0MW
	iDLml/OJ8HKyUPH583DmXvc=
X-Google-Smtp-Source: AA0mqf7pcrgOzZ/Xdkx5TuOPEIv5rbwc/M6UlPSODP8J5pP43i7O6QNDznC+UoB7Ri6TENZClzZaTA==
X-Received: by 2002:a05:600c:511c:b0:3cf:6c05:809e with SMTP id o28-20020a05600c511c00b003cf6c05809emr14530954wms.74.1669375178519;
        Fri, 25 Nov 2022 03:19:38 -0800 (PST)
Received: from cizrna.home (cst-prg-44-69.cust.vodafone.cz. [46.135.44.69])
        by smtp.gmail.com with ESMTPSA id v11-20020a5d4b0b000000b002368f6b56desm4207406wrq.18.2022.11.25.03.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 03:19:38 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: 
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-amlogic@lists.infradead.org (open list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/6] dt-bindings: reset: meson-g12a: Add missing NNA reset
Date: Fri, 25 Nov 2022 12:19:14 +0100
Message-Id: <20221125111921.37261-2-tomeu.vizoso@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221125111921.37261-1-tomeu.vizoso@collabora.com>
References: <20221125111921.37261-1-tomeu.vizoso@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_031941_943013_610DCF8C 
X-CRM114-Status: GOOD (  10.29  )
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

Doesn't appear in the TRM I have, but it is used by the downstream
galcore driver.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 include/dt-bindings/reset/amlogic,meson-g12a-reset.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/reset/amlogic,meson-g12a-reset.h b/include/dt-bindings/reset/amlogic,meson-g12a-reset.h
index 6d487c5eba2c..45f6b8a951d0 100644
--- a/include/dt-bindings/reset/amlogic,meson-g12a-reset.h
+++ b/include/dt-bindings/reset/amlogic,meson-g12a-reset.h
@@ -69,7 +69,9 @@
 #define RESET_PARSER_FETCH		72
 #define RESET_CTL			73
 #define RESET_PARSER_TOP		74
-/*					75-77	*/
+/*					75	*/
+#define RESET_NNA			76
+/*					77	*/
 #define RESET_DVALIN			78
 #define RESET_HDMITX			79
 /*					80-95	*/
-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
