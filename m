Return-Path: <SRS0=QVii=OR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E47CC64EB1
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Dec 2018 16:48:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38D8C2082D
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Dec 2018 16:48:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ckPVRWbE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="tsS8ijvy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38D8C2082D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8WNF2Y3kJlwLqEmkF+KKA7xW/1TI0+uio/tcddQNByg=; b=ckPVRWbExRYzEr
	NhQyUXB+OSNEIEOi3DIP7aZMocPQ0sMBVAgLu3yxoWJ+f3rl93CIL8URXhU58uyQGUyXIAoSk7JxV
	PX7+0cvVwLoGLS3jsrH040K4r62DiRXmzcsO3CBgXjdNX+J0P9idYKFpiUwd9O1eZKFtRPtN2DMII
	DbQQ2Lz3b7H1FahutqzTM73o9O9X2PfN+I+8uuMgV74XP8QFxmlQyRCCke+h9xrgUilj7JRMTEv1S
	MiAPFxFNvahRzG/mayGyCnL8otktd8TEUBhp2bv4LsZ+UhnfbNx0ls0hcORgB+v8eX98+TNUMHqdk
	5XsLuCRA0YNg9VMAyEIg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gVflr-0007sM-Pf; Sat, 08 Dec 2018 16:48:03 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVfl2-0006vY-9M; Sat, 08 Dec 2018 16:47:17 +0000
Received: by mail-wm1-x344.google.com with SMTP id s14so7106932wmh.1;
 Sat, 08 Dec 2018 08:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PmRVlutu1GKQTk4TzoPyamrkqPJpSphyevQTW/8dC7Q=;
 b=tsS8ijvytCT4xDzUT0mXa+JvPwuBUsT6WOKqtF54YOg+hsBxqjPU3QTIqP5TL6MsxL
 iBfQzae36ZsvMmVkY93BStjxY4qu6SQSeOL3Rr95a/Wr9ER0Ou6XnWpVWlRLMbLX9moE
 KTMHznm5b0lkfvG/g5bgGOPs3v4Sjd/DlAbcnooq5gbkJz7fZ1nwuaI7gKbaWVugX7pX
 w4ItqwJxWoIGQfaIHjb5WWTtNRqval0apQP45NrsCQ4hZEnPnR/9S9EpRSkLHOqMmqM6
 kAgTN1+uZ2SwbQonbFFgh3JxDp85tXLm4brYrZO5U5s2fqML2o+Aofzog5Q+bBnmaI+Y
 iz4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PmRVlutu1GKQTk4TzoPyamrkqPJpSphyevQTW/8dC7Q=;
 b=kts6rX5aDmVYxZSNOVExhyIiGAMpEma4TY49X2fQaEMuvEMjeg5uvyOCvr4HFAmiTJ
 bv+5UCj7gYxwXVIvz43K0QPoJmplA1yLTC+XCvkjpcqcYInyA/HxsDZqiVGQ9MFDaBo9
 yy0Rg0Yo96w0Ma9IyqIjGdAZ3NJoqNQMssgwqsYkJtIEZvY8BRSn5gxoYqJqLqI8OFBx
 U1KrMLvVk6mL2OQVzQz547ysSF1GhByprsxdpyZSW6fu6oiVBuy3F3eeVaR860XyL69/
 Z953FeU6oIDXiDGk9gR7Aa1Vmv+4MP0CDebN8iVeZ4RBwLyGjpCtG+L2avOKCpQL/HQv
 /SMw==
X-Gm-Message-State: AA+aEWZEhwuRFflo6Lcwa9xNVOH1r9lvDS4IlKzwaO+nBPfVOHUy2JbG
 fV2c/JuytoPukxKQdXPQTYs2nlwp
X-Google-Smtp-Source: AFSGD/UqYguEGUeNuWgHH/+M6x0dlqFZ1eRnUbdnko3hzoNKo6VaQuJOrkEBgHC0ef/rRgMmv1FcPg==
X-Received: by 2002:a1c:dfc1:: with SMTP id w184mr5323805wmg.2.1544287620189; 
 Sat, 08 Dec 2018 08:47:00 -0800 (PST)
Received: from blackbox.darklights.net
 (p200300DCD73FBA00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:dc:d73f:ba00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id c9sm11100690wmh.27.2018.12.08.08.46.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 08 Dec 2018 08:46:59 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH 3/3] ARM: dts: meson8b: add the ABP bus
Date: Sat,  8 Dec 2018 17:45:54 +0100
Message-Id: <20181208164555.26527-6-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181208164555.26527-1-martin.blumenstingl@googlemail.com>
References: <20181208164555.26527-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181208_084712_634935_E0CFA8A2 
X-CRM114-Status: GOOD (  10.57  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
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
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Various peripherals (Mali GPU, NAND controller, VPU; etc.) are located
in the ABP bus. Describe this bus so we can add devices to it.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8b.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index 22d775460767..5d036842c355 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -178,6 +178,14 @@
 			no-map;
 		};
 	};
+
+	apb: bus@d0000000 {
+		compatible = "simple-bus";
+		reg = <0xd0000000 0x200000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0xd0000000 0x200000>;
+	};
 }; /* end of / */
 
 &aobus {
-- 
2.19.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
