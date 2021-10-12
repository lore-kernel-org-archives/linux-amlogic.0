Return-Path: <SRS0=tINo=PA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B9DBC433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Oct 2021 05:26:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6484661040
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Oct 2021 05:26:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6484661040
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vHOjWtOOEv7tR5eoF4OqZ5PLYA4SXJqnVCWoDfDOyoc=; b=4H15Tq6m2PVmX8
	37qP98/ziKr+MfJhAmeSywA+07YtnVSyoL+dqyKJBxFb9FAEletp6t58mAX8EMgxauPaYJhbHSQkW
	HQRlhL+lWSV5cVvMT5Ij7kfIF8GPFi3fXnqbObhEzjvCTWCW3kx+P2jbGdJWZxHdXfhlrAtxRWtJH
	sPY8FsSeVKwtjS7yAYXuL992H3qxHKub45+KgF2Fz4vWbFoMa6ML10wU/Q9JYsuGdyi9HSTiC4Xvb
	O6sZEPgZHmUzURpTSNNJIiDPrC6TOjQOCg6SHvFhN3wCXKO2x+JsVgcgNW0//X+ERQ85OABBCYTwj
	32Pkh7oKnx3sFL6r1Ryg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maAId-00Bbec-RG; Tue, 12 Oct 2021 05:26:03 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maAI8-00BbYZ-84; Tue, 12 Oct 2021 05:25:33 +0000
Received: by mail-ed1-x536.google.com with SMTP id ec8so26552848edb.6;
 Mon, 11 Oct 2021 22:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=xevjtM57f4KsibCMyluFkgFqyP8cUqEzryJuVyfMQ+Q=;
 b=ZacfD9y5vIXLRS06xjCB+MNrjs1HeUPLJIQcgusV98iEnmYaWYs+SV7M+5ROEBqksd
 YYcumrOdxjqpfA47lXfD25slG9nhjIWUD4wbZivJ5lpl6q1jYcJPkvkR/n7Ggp4DpGDY
 QcBoriuJQQ2QLxFOl2KlDahKsyNESeAd6ChMYTrTr6RbSJDiSyzbDwhyRAyH0pLEEDT0
 p6lnUbmYvm2uIjsaI9ADzVn6jmpVlLdbez/PnD7JlE9H72NaHd580VBZIAO4bNdBpPU4
 m94uVlb5hKXDJdU1wGce0Y0LMOP4L+gOY4PVoKvYtfEy7NFuvuSDowGYEU7QGuhIP4S4
 OTZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=xevjtM57f4KsibCMyluFkgFqyP8cUqEzryJuVyfMQ+Q=;
 b=vsO6wrXvL5cRZOjAvzBKmS+hrQvWSNi63tVMunsEKsWzhHjs7iMhgfTkAqpQeCMPbK
 oRuGDQ4a9ilTIXBprOTBqQ1Yxcn0sDsneOrYQq6erkgf6M3/rNLfoNMG8fPVlmd9qPTW
 +ezb+RIXpt5iVM7GREyWvyIbI2OB5lfAtff49+sJOw62HAftcScRkHo2xmLsvViatsas
 im7H8azgfqEshGx6QARJ/54Q82BVDhr+kzsKzZykonF/uzlxscLMxwfbh2rAcILge3Tp
 vJEYijD6LumIWpULzSk7g4gEFAjbLZQXPStzzBbYR9LLOCahS5/zdM4f71YBeYXV7kKO
 OyoA==
X-Gm-Message-State: AOAM532IRHSLz4yGROlny5Rcm22cqzqmNopS2QAP7zHEQO+x8dTR7v1V
 N/agW7tjDZeFKnQSgAwGve8=
X-Google-Smtp-Source: ABdhPJyjbXuo//xn+mq8mM/JHOk3C4ps2eVqud8QcsZpSFChnXGOixgzZiT/iDwXZVxybf8OSvFCag==
X-Received: by 2002:a05:6402:4256:: with SMTP id
 g22mr47208664edb.399.1634016330756; 
 Mon, 11 Oct 2021 22:25:30 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id r22sm4323321ejd.109.2021.10.11.22.25.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 22:25:30 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH 2/3] arm64: dts: meson-gxbb-wetek: fix missing GPIO binding
Date: Tue, 12 Oct 2021 05:25:21 +0000
Message-Id: <20211012052522.30873-3-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211012052522.30873-1-christianshewitt@gmail.com>
References: <20211012052522.30873-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_222532_308774_27FC3AEC 
X-CRM114-Status: GOOD (  11.80  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The absence of this binding appears to be harmless in Linux but it breaks
Ethernet support in mainline u-boot. So add the binding (which is present
in all other u-boot supported GXBB device-trees).

Fixes: fb72c03e0e32 ("ARM64: dts: meson-gxbb-wetek: add a wetek specific dtsi to cleanup hub and play2")

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
index 8e2af986ceba..a4d34398da35 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
@@ -6,6 +6,7 @@
  */
 
 #include "meson-gxbb.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	aliases {
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
