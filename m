Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDA6CD4F54
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 May 2026 14:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GZoFVwNrlGAoMx/TLYH/pQ7f9WHfsZvlimrzGg4rPIQ=; b=pN1gu/DOEVFbcZ
	uMAOkP1J3zXLXR/e57/FqRkLUSpCmhrcmUYEIz1nytUrRVveHjktNvJxKoHEJM5KJBRp6ATtxJiWo
	C4+Sc2OCtq5xGeiV3P5hUnrX2+352zxutn8qTbZHPWHpfMc7r8DmZ9q47ikkKoVRqa16Jkw/5ygSs
	1Vlbz9h3dwkOrwHd53EurdEGdiaaN8QROmWI3zoQ/bvrwWxDyVSh0kb7VgXpSlMHzcuqFnevsH847
	YBK+HnCguEvutezpmYItK6GQG7i4+VdhNNjZ3eW1h0ivCNE/qcKUN6BxOlvRvGSGVqByHP481lgxE
	luhw8NOKv4IFo2BqhxVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSxr1-00000007ULP-3Rz5;
	Fri, 29 May 2026 14:06:27 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSxqz-00000007UJo-2bBt
	for linux-amlogic@lists.infradead.org;
	Fri, 29 May 2026 14:06:26 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-36b95eb4bb4so829805a91.3
        for <linux-amlogic@lists.infradead.org>; Fri, 29 May 2026 07:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780063585; x=1780668385; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R6Vlr6IjEZJ4HXKB0HJH8awIxM/NowdIhVK0gPa/XrQ=;
        b=JNQQVg8iznLrCmVmmD0SF3LpHdrwEKtNTXWTnL3o7yPSygfPhUbXlfuYCdHrGWMCoq
         1Pr19s3pQCmt9VNBjOhsZx/s8D5aKOI5mr3r8AuMpPEqIowBTHp3Xvt2Eh5xo4kun3qp
         f2p09FizXKBHr6BYe+xlm1IdBNlYaL7tk47fVtTufgm/k+5I32Awlp6UiQEoys9Pe+Ca
         u1OvePO4uttZpy1m/7gk+pQvlqdsOlqbB9ZPAILiB5FizYGfce4Hgkz1xO2REz0IetR+
         7Ts1tECDOjdJD1zqQ8FF139bgPDScHken7NYYUOFAkMCGEHd7XDHl2cWtFPD65LJSyDf
         0vvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780063585; x=1780668385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R6Vlr6IjEZJ4HXKB0HJH8awIxM/NowdIhVK0gPa/XrQ=;
        b=ISfLs3ncaJzUJxaOhDsB36wpZUy6j8D17niZCNnOks3DNCh9zFXEBRHv6jAjLpAhG9
         BWljYyzRQF47q46Dq7Ux+/m8lG2z74hg1/2bieOWP0d+MES895gDCwrAmnyuevC4qFY3
         +jNsWxh/1h+Fk/hLQhU7hAXCS6EmpehFlADW5nQp6mcbBuhemrd0XhzoFcO3ktJUIVs1
         9qxbetqvwbuLvCf1Lv4vAFRbgMxdPqx6Bf0l2+1KR5XzzrMkeqo0X+dwGFRLYXHb2Ugo
         mh735x86zqjnsY0SlBzOaYrmZCp7fn1ANf+h4lK7buFPDpfXMdikAULZkGh/9fGz1Lz4
         jXkw==
X-Forwarded-Encrypted: i=1; AFNElJ+R+Uzdrszs+Z9rXdIoAAKLlXzDEztw5GJbfeGem3g8pjqjhbf8vmz8NgYVS3RQZoLWArjj7A6MuxeAKos3@lists.infradead.org
X-Gm-Message-State: AOJu0YzT5DbuX7j1teTwU/oxrjqCmczS7MKqJfnCBizu33JUqpSZe6ih
	Y1GNe+mXHaGvLI4sQ+bjUzvg1K2WmygXgJIQY9msdbSGHvMuYk+f9JOu0O8nv5zVPE4=
X-Gm-Gg: Acq92OFsqtX5pzbfn4I7KiFCnJzk7KZlBHI2ohwhRawCc3ngWuFhKCaEBrx0fZKtKOU
	N/O800Xqf7dQj/KsiJmxUxeLRIZZxW0PN39GrQ2vHSNR5lzF4YzW+67QrzRUjTe2Aht7KPRCPCo
	/CarFhs6kWpvkXiqDFMGOX3tiqT4Q7tXcRzXIolCQXK6ntasEbznpj8yEjUsKeieccVepenfdYQ
	H4jCrLg8FD2Qhq/0P+oz2luKSLXQ+lewU7+xFQOGEgaidfl7eSvQtpctD1KG+TzLxMpnuLpC7jP
	eHDwu82hT4eBF/ECRpggnFnDGORWDKBrLDiXtWkwUkSUM4Pic9ny79Skg6IoS3dxFD+lV5bUZKX
	recD+EKCMGm7hQ+mikwkiP5UGsl4b/xnq9Wh3r8m7MAgehIt0THm93rHqmWD4q2W5GxL/QxN+LB
	lS/BVI3LwVnNkFQjDqqIZS/ZAI+RRM2UhIbD0MnSwLdqyrAY5U3A==
X-Received: by 2002:a17:903:37cc:b0:2b0:ccad:de1a with SMTP id d9443c01a7336-2bf209b860bmr44254305ad.30.1780063584729;
        Fri, 29 May 2026 07:06:24 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a5f:4fa1:cc65:18c0:209b:38a4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c51f80sm22926645ad.80.2026.05.29.07.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:06:24 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: amlogic: meson-axg: Disable pcie_phy node by default
Date: Fri, 29 May 2026 22:05:58 +0800
Message-ID: <20260529140605.1070764-3-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529140605.1070764-1-jerrysteve1101@gmail.com>
References: <20260529140605.1070764-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_070625_655650_783B9330 
X-CRM114-Status: GOOD (  10.50  )
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

Set the pcie_phy node to "disabled" as it is not used on some boards
and should be enabled per-board when necessary.

This change suppresses the deferred probe warning:

platform ff644000.phy: deferred probe pending: (reason unknown)

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index b7a7f4fae7dc..41a75e3d286a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -328,6 +328,7 @@ pcie_phy: phy@ff644000 {
 			phys = <&mipi_pcie_analog_dphy>;
 			phy-names = "analog";
 			#phy-cells = <0>;
+			status = "disabled";
 		};
 
 		pdm: audio-controller@ff632000 {
-- 
2.54.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
