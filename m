Return-Path: <SRS0=V5Bc=SZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E1E7C10F14
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2019 09:16:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 300F6206A3
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2019 09:16:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DuiCFDd8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Xf0DC2Ny"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 300F6206A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SvVn+8tcKee5GILRh10+PGqSsF5uC9HIz9CShf0u7KI=; b=DuiCFDd84Em8D1
	5ceESbJS/G1Qd8c2nPZEDW+JpLM56fX6OP57s2lBRVXMNza+4/eIiaHoH6QNqIiFpxrNFTzSDYnbO
	eXbcRu3vlihQxco6JbEmf4y3sHlg0TDdg77KvfXfoXD6QNqxdzQSwitMcvv6NSFAA48a950PYqLAB
	qdeOUkJq39UbV4lakWCjkoskWIAnRFWAEX9VDaYRztBGLefVlktb2ANNmYzwNZ7luDaWi+5cFYC8E
	V8TneSZp0bY0NDRlevVjdiRdaAdH/h+8WgcihZ/Qk8iijogsvwPprBX51utqzsO0d/3fKYFbXmb6C
	yEz4ut1xwHlCjqhAdLPg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hIrXN-0004I6-FC; Tue, 23 Apr 2019 09:16:25 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hIrWF-0002nB-Ne
 for linux-amlogic@lists.infradead.org; Tue, 23 Apr 2019 09:15:24 +0000
Received: by mail-wr1-x441.google.com with SMTP id c12so13030795wrt.8
 for <linux-amlogic@lists.infradead.org>; Tue, 23 Apr 2019 02:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Af+jmp4TxV/QvWrI8cMBNBX8b92F7d39H2RU/VUPuWE=;
 b=Xf0DC2Nyd4c7T3jzYzomlXi42Uw0hJDWS5xsYVLq1SYRxJKc0uaBrbdHILyCN7Uv24
 /Vbdn/VG/vFF/05d3ymbai8xGOdsZ1QXfVfM6JEJJtu3bpyXNDFIzIdQzFSVbi+n6Dr7
 txuRrFg+fuxmVCFGxKDC/lIPOEQUjEQFoahxn7WzZoOiciBoPwI14u/u0Wb4jeBq3M+U
 pR2wOSVyQFnHB3hWcoFvn+V/DsNwZ4/c2SwzcEGKrsJB5a163+L2xr08YG8V7+B62Rej
 bzUWECHdxrRLd2QE03pKztQ1U3CUa/my5icnDDISqLJWF49YetfRDwvKkapVE5krIS8w
 S2bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Af+jmp4TxV/QvWrI8cMBNBX8b92F7d39H2RU/VUPuWE=;
 b=bgJiV5dFJhp1eaIhOiO1QIOSj8enY6rkvH+zzBSWQUXRqYtzYcwWgI/tN4Evu9JK0f
 cTVw9NCDwCkHGy3BkF4ELqQpw55czofTynF82L/y34jf6VAm4iafa6lm1LK65jyO4DJh
 U3+winEfKFUbrOXGHf5UIyZFqGqaoQSUj8wdjZiRrDWro85VNUYIJ1mCp3oTLLS3/PQp
 9e8b6FgwP3EUvkG2/mNEyW7uwr824QAKzSCTaouq+aO4Lg9r/lbkymgu0GZ1ciEDR4fR
 nVPNOAUcOwxGspIA3trq8bZVrBMlIobs6Z0c+DNmEdMhPxn6MimQYSbEKEkYFtPEbPzS
 cstA==
X-Gm-Message-State: APjAAAWq1RRiZ1n33t8Qb63sO6HRvh+8/qJJKac83UDQybpeZ86Er6hG
 luwzRlrYaDKLxvc69ifuIB/91w==
X-Google-Smtp-Source: APXvYqxr3NuSkorOvc3NRetbaScHHrW/tcjCzGJC3wPfQVS3XV0ehPIG9WmxU9tUS8KVUot9JWuJjA==
X-Received: by 2002:adf:dbcc:: with SMTP id e12mr14411195wrj.134.1556010913995; 
 Tue, 23 Apr 2019 02:15:13 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id t17sm12241272wrr.26.2019.04.23.02.15.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 23 Apr 2019 02:15:12 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com,
	devicetree@vger.kernel.org,
	jbrunet@baylibre.com
Subject: [PATCH v2 5/6] dt-bindings: arm: amlogic: add Odroid-N2 binding
Date: Tue, 23 Apr 2019 11:15:02 +0200
Message-Id: <20190423091503.10847-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190423091503.10847-1-narmstrong@baylibre.com>
References: <20190423091503.10847-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190423_021516_094571_B0107F60 
X-CRM114-Status: UNSURE (   8.28  )
X-CRM114-Notice: Please train this message.
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
Cc: Rob Herring <robh@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add compatible for the Amlogic G12B (S922X) SoC based Odroid-N2 SBC
from HardKernel.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/amlogic.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.txt b/Documentation/devicetree/bindings/arm/amlogic.txt
index 94bbcc646e10..eff41128268e 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.txt
+++ b/Documentation/devicetree/bindings/arm/amlogic.txt
@@ -116,6 +116,8 @@ Board compatible values (alphabetically, grouped by SoC):
   - "amediatech,x96-max" (Meson g12a s905x2)
   - "seirobotics,sei510" (Meson g12a s905x2)
 
+  - "hardkernel,odroid-n2" (Meson g12b s922x)
+
 Amlogic Meson Firmware registers Interface
 ------------------------------------------
 
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
