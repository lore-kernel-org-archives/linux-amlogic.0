Return-Path: <SRS0=VwQk=ZW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EBA5C432C0
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 Nov 2019 18:54:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6679E2075A
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 Nov 2019 18:54:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WF8phLot";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="tBO5/eSa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6679E2075A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KwS+0050BFb1WY8meP8VhYvNn3hmtWSTkP413rBu3AE=; b=WF8phLotWu0reg
	lxHQe602hLkb9oLSuiDcx1M7y1naTLOEcp2LTVj681SZE0z8HIb4uXS+djbL/OXsorbRuCde/i0ht
	iCLEt/+PkZnSzypQGYNuERsAZtASoZk6GnmCXEelQrONg1GNuSagxZC8H1rbXVlljDLxCZMnylJWa
	OL05+RCnJO2tCmRKgmi6k10LNlBUaihawe7iWGijRnxCGp9IL0yIhGYCMoj9LIKnmBRXMmMPBVkuJ
	EZFJuMEl69ANuLKBuw/GKRhUnQHZyB+TOF9GMu/egfEV2+83qe5bywthZNLusSDFS2xfn7DQ6IOiz
	2oHpiXwNDuu4OVfvXMIA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ib7sW-00050T-1n; Sat, 30 Nov 2019 18:54:00 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ib7sS-0004zT-U6; Sat, 30 Nov 2019 18:53:58 +0000
Received: by mail-wm1-x342.google.com with SMTP id u8so2874198wmu.0;
 Sat, 30 Nov 2019 10:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+kgxHfmrLrW74snZZglbmg5V/YCpIUHU33YjewUkzMA=;
 b=tBO5/eSaNaTn3qZ5phIDYDVnDD/KurOdupHxeZOSTuhWIP8nSsFhAm/g9TZ0MrOTty
 N1qkRdu2uEu15LuO9FJnXJqk1y44ZBoz7uU6bpqfP2TJwRDdmGUEzBLoxukNyke6HTSa
 YeJ8SbdVnjX6KTlHHDtBtHmqfAyWwR4xPF/kLZKjPI9HGtTZwx+RKsgEKzrqG5WmPFJ+
 0kPEihJQsJvLZ+U9OaXyaxUv4GQCj2xX/Acro4FowuGOnyRGCoLdaLQRP1DVrLm/Uq6q
 RJ9hjfDX81UtmVAOOJVIh/0hvyR4h5ZWaacb+Nw4Z5JpCaqU6p8e3ONvzpVA1aoakD7p
 8ZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+kgxHfmrLrW74snZZglbmg5V/YCpIUHU33YjewUkzMA=;
 b=WT1dwgh1hIY5wRLCjPP3uDasqgcPYvQ2mhitsFKkKopa4L7NshpLuSqIjDQ/K1Z+JS
 GbeaI9lnIVDrbK6i/xAg62YEwXp3k6pRhfJANoY4qipZGGNR6pclcM8vGgkG+DBRsddL
 Tl5HGmgqQB5sxTpJKCHl/0ajlaAva+oIoDgaupwnE9C0WbTyv2MDMrrBy3sq0x25HGmV
 LLc/r3WcecUfPQJF6Ph3OYr6WzIB+RNbLSSdKT7cKtwdtuAn7FnQIzgnkoip9dyH3lta
 tCEkbCFTxtHaplQ18hCT3ETSPviARu0YaMgQtY1fJkQax5q1528FNL/jpDCTlig7dQf7
 goVg==
X-Gm-Message-State: APjAAAVJQoUvZDkptacHyjDEB77jI73h251Wu8dy/gacqHFKRRWPulP9
 bXycU9L+Kvu2kNK0e6SCLlYdDINy
X-Google-Smtp-Source: APXvYqy+AptLFvOg56oiPA3eBF+V/0bqwP6CitN+KxZd1XEwAi/fIeyCYGRVq/t79HRYvwAZ1FDOOg==
X-Received: by 2002:a1c:a5c2:: with SMTP id o185mr19716529wme.35.1575140034761; 
 Sat, 30 Nov 2019 10:53:54 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1371CB100428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:371c:b100:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id r6sm19295637wrq.92.2019.11.30.10.53.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Nov 2019 10:53:54 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: p.zabel@pengutronix.de,
	linux-amlogic@lists.infradead.org
Subject: [PATCH] dt-bindings: reset: meson8b: fix duplicate reset IDs
Date: Sat, 30 Nov 2019 19:53:37 +0100
Message-Id: <20191130185337.1757000-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191130_105357_000194_B8AFD408 
X-CRM114-Status: UNSURE (   9.58  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, narmstrong@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

According to the public S805 datasheet the RESET2 register uses the
following bits for the PIC_DC, PSC and NAND reset lines:
- PIC_DC is at bit 3 (meaning: RESET_VD_RMEM + 3)
- PSC is at bit 4 (meaning: RESET_VD_RMEM + 4)
- NAND is at bit 5 (meaning: RESET_VD_RMEM + 4)

Update the reset IDs of these three reset lines so they don't conflict
with PIC_DC and map to the actual hardware reset lines.

Fixes: 79795e20a184eb ("dt-bindings: reset: Add bindings for the Meson SoC Reset Controller")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 include/dt-bindings/reset/amlogic,meson8b-reset.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/dt-bindings/reset/amlogic,meson8b-reset.h b/include/dt-bindings/reset/amlogic,meson8b-reset.h
index c614438bcbdb..fbc524a900da 100644
--- a/include/dt-bindings/reset/amlogic,meson8b-reset.h
+++ b/include/dt-bindings/reset/amlogic,meson8b-reset.h
@@ -46,9 +46,9 @@
 #define RESET_VD_RMEM			64
 #define RESET_AUDIN			65
 #define RESET_DBLK			66
-#define RESET_PIC_DC			66
-#define RESET_PSC			66
-#define RESET_NAND			66
+#define RESET_PIC_DC			67
+#define RESET_PSC			68
+#define RESET_NAND			69
 #define RESET_GE2D			70
 #define RESET_PARSER_REG		71
 #define RESET_PARSER_FETCH		72
-- 
2.24.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
