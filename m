Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB57C433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jan 2022 21:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o2sX4lgmC29uMpf8UcWoJeobYAuB9RWtdhe4p1BDLwc=; b=KXK+gSrfsGXjuA
	pP9BLcQX+nFPueBgJb7DZG8Eqf9qCcDLyHhQoZBQly3vlU+YJsrjxt0YQcTw4vEOXo12UmdTyVzet
	fDrCZgiF3shiNldtAt8lA1HLqx+5NACUsnwNIUUGJZWo+zjsPr6AV8yf0tvGVEHU4K4ctHQP2+Kq0
	yNIJe1aYKeTkFCszRHqWuM+5hbLvtuc+7NuWxytltci9Cj4A4Qkc0FkysoM5vbI0s+d6a1tdScBbU
	q7DS5RvqLO9GFs+rZ2yaZOXrjrr4Nof81uvmuqtQTC0bfUyHZpPNNIECQGAAvE2CbnxbJ21m7p2sC
	4ihjHbLK8rdrnHvMn4zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7kzg-003pkW-Vo; Wed, 12 Jan 2022 21:17:21 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7kzK-003pbH-K7
 for linux-amlogic@lists.infradead.org; Wed, 12 Jan 2022 21:16:59 +0000
Received: by mail-pj1-x102e.google.com with SMTP id
 59-20020a17090a09c100b001b34a13745eso14801134pjo.5
 for <linux-amlogic@lists.infradead.org>; Wed, 12 Jan 2022 13:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zgxD7kZzL7b24qfqWANZprBwy/1xz32dY5nSJ1Y+mnM=;
 b=LoZvhsYPqLB7U/0kRvIfraJSktSWw60cF3UyRYJm0oOks02RiP1kSnBRFebdQB6nV+
 x88KAxwQGU+4HMdYwBcBFraVtL9auGlav5RC1ebYM7TECrHBBeS1lGnqAKDNUmYVw3mE
 H8Y4AGqH+jcm3Yjr7lHqimRCW6kc9sWQhunxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zgxD7kZzL7b24qfqWANZprBwy/1xz32dY5nSJ1Y+mnM=;
 b=r3iy/nmevWg+XQB/PH8Qoq08stoBxafSM6jtikr2onZ/YV+QyVGbx1IuIYgocSZwlG
 dMZrmG0gjIL4VAAcxrDttxmJ+80djx0Ah9TG0lYZFNkOKehz6Ay+kEU2Zf6nCjwRNUpw
 dAzXWXygnLlcPD7MX9fDSXUCUmpyaZ0GFDPOfTtZe0vMsfAa/tL5XjBQjRhQaM/Wk1TN
 s3KoLhoPXtYeiErTTYaT9Ep5yQkcpKWX4hHqshqptQZlr7oV2mxJfty1CGzG0SWDVpKX
 nEUVF/pxYRQWscZjcGXk3Y8iUBXNVT8VA9WnvMHSeiyHntyxFt80/LEIq0tP1Q0qgf3V
 VRVA==
X-Gm-Message-State: AOAM532UXCckZCvdbsBQ83vrmpBO7UgmHK8FKu+YbcmV+tWZg87yGL7k
 ia6FjfKz2r7E/ttVEqDMIOMK6MhDuYRYQw==
X-Google-Smtp-Source: ABdhPJz8ajGHuukTahaTnyx/SiHDR6PQ/asbdfTpJaZd5ZZo8iGS77v5cne7LTcgmRkOLz4lT2lYTw==
X-Received: by 2002:a17:90a:e7c8:: with SMTP id
 kb8mr1650228pjb.35.1642022217759; 
 Wed, 12 Jan 2022 13:16:57 -0800 (PST)
Received: from localhost.localdomain
 (2a01cb000f5a8200e371e4a5048c8b22.ipv6.abo.wanadoo.fr.
 [2a01:cb00:f5a:8200:e371:e4a5:48c:8b22])
 by smtp.gmail.com with ESMTPSA id h15sm507192pfc.89.2022.01.12.13.16.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 13:16:57 -0800 (PST)
From: Gary Bisson <gary.bisson@boundarydevices.com>
To: linux-amlogic@lists.infradead.org
Cc: Gary Bisson <gary.bisson@boundarydevices.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] arm64: dts: meson-g12-common: add more pwm_f options
Date: Wed, 12 Jan 2022 22:16:41 +0100
Message-Id: <20220112211642.2248901-3-gary.bisson@boundarydevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220112211642.2248901-1-gary.bisson@boundarydevices.com>
References: <20220103154616.308376-1-gary.bisson@boundarydevices.com>
 <20220112211642.2248901-1-gary.bisson@boundarydevices.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_131658_688380_BE971871 
X-CRM114-Status: UNSURE (   9.43  )
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

Add missing PWM_F pin muxing for GPIOA_11 and GPIOZ_12.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
---
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 .../arm64/boot/dts/amlogic/meson-g12-common.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 00c6f53290d4..af1357c48bee 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -894,6 +894,22 @@ mux {
 						};
 					};
 
+					pwm_f_z_pins: pwm-f-z {
+						mux {
+							groups = "pwm_f_z";
+							function = "pwm_f";
+							bias-disable;
+						};
+					};
+
+					pwm_f_a_pins: pwm-f-a {
+						mux {
+							groups = "pwm_f_a";
+							function = "pwm_f";
+							bias-disable;
+						};
+					};
+
 					pwm_f_x_pins: pwm-f-x {
 						mux {
 							groups = "pwm_f_x";
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
