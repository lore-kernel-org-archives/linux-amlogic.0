Return-Path: <SRS0=twEQ=DJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02AE7C4363D
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 14:33:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D509206B2
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 14:33:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UthTARbY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pj+8VvXs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D509206B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PjICXT0jziLpg+UoF6nxWDTVYM+dw9tMrxNPojKbmCI=; b=UthTARbYaGm/RvitdYkHqu0oRV
	SD7V1RLYuFdGFYTFvvWUjBGh5THcuZQeNDQJDMPgbgRqWXNqnjgrVlqm+pTym/uFqrSQuS3ONtMhi
	zpJuafuvlTZWYrLTQEzRjCMbLI2A3rVYmggfp2YHSMUX9rBY/7sPV5kPvv/iKPJEwMx26/U5e2mX6
	VobMAJ6PUXz2cra5zneHMewkLHPpLcxv6bD19YX1cP9KcwPOVaXrrFQX3GSgoZQWWCly5EXpwTCYR
	+sVCMGm6787PKc9fSzfWVBg1ZdooTjxpi45/4Fnvsq1Anih9s2VylqU1lcMPRNgm3kKN82VqxBb5v
	ACdhNxeA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOM7d-0002CW-BF; Fri, 02 Oct 2020 14:33:21 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOM6S-0001SB-9e; Fri, 02 Oct 2020 14:32:09 +0000
Received: by mail-wr1-x442.google.com with SMTP id z1so2078725wrt.3;
 Fri, 02 Oct 2020 07:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=+sbzGxZrB59pV6U+pYub8QGMoi1y6WlUsM0RAR+NpTo=;
 b=pj+8VvXslvuR3nz30A+DMvVhA7P3mGzEZM4S+FepgZ31cslIdvG/+u0VyLgbloPvMK
 veU5sTbMR3FEVFx2IM58C0rYfDnujRBsIKrfgBaV0Gd91zjNkwYoKtSl5p9D+QSfbNmr
 ZiB75D6poMj95qN/gRi3fBbLFrfv6XJseAhKryMINkwN1JxPvwt+R2mvshlnxUP8/KVB
 Z/qd07ahj+xSmBYdyvaS4SJ6F7EtiDMRUegW7w1g4JEzEBMSWGV8InJSe1uNOVeZUkQg
 ESgtpboIla6tU69jWn6uN3XqOmy6mFH5EU+cBQu+kzAn0dQH6hieWfdgUktRKFIOW9Rx
 ur0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=+sbzGxZrB59pV6U+pYub8QGMoi1y6WlUsM0RAR+NpTo=;
 b=iJmWKeDzTjDSQspgNG1LTSR6Mxx4zC5Q3SJCUltpe968xQ5ipFnXGrNuCSccOKeDw/
 Y5ramyHkmnwLOMcFU/422cocAstUT7slkOfTBLM5Eom6/ziCRKcq9625+cQcuttPyM0v
 f5ef8WA5qFJ+SDCZBmUC2yvlV7Rr6KZClFsePYq4eUekY3Yi4zWJYznEmexeDWKW8lEL
 HkQDEzkQS4c0jpEvHt4eTNpRiaib9NaTz35QEJSV/4sVWADxrQo3YoM5aQKLLbCO4eBm
 EJMX95gwDq6oyPMmcmWeaHuhIrIZp0bs5WuVQw9k/H0OZ6triMyn+v2I+WK0BQlsaAsR
 oBtQ==
X-Gm-Message-State: AOAM532BVgXrPYjrZwJTJladzV6Qn+jYWo4uZ/8oNa61By1j2STszfiC
 ooxM4aIYWG3MzsBabxvaiyI=
X-Google-Smtp-Source: ABdhPJyAARAGtC9AIxB8XDdTw4yZaEo0GlJvTcgHnIwHrklz8Y0xB7FJfZCmlZBWWSx6HDVfZUzXaA==
X-Received: by 2002:adf:fbc5:: with SMTP id d5mr3284284wrs.232.1601649127049; 
 Fri, 02 Oct 2020 07:32:07 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id w7sm1907392wrm.92.2020.10.02.07.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 07:32:05 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/10] arm64: dts: meson: add audio playback to wetek-hub
Date: Fri,  2 Oct 2020 14:31:40 +0000
Message-Id: <20201002143141.14870-10-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201002143141.14870-1-christianshewitt@gmail.com>
References: <20201002143141.14870-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_103208_458682_E4A389E2 
X-CRM114-Status: GOOD (  13.24  )
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

Add initial audio support limited to HDMI i2s.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 .../boot/dts/amlogic/meson-gxbb-wetek-hub.dts | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts
index 83b985bb015e..0c1570153842 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts
@@ -7,10 +7,50 @@
 /dts-v1/;
 
 #include "meson-gxbb-wetek.dtsi"
+#include <dt-bindings/sound/meson-aiu.h>
 
 / {
 	compatible = "wetek,hub", "amlogic,meson-gxbb";
 	model = "WeTek Hub";
+
+	sound {
+		compatible = "amlogic,gx-sound-card";
+		model = "GXBB-WETEK-HUB";
+		assigned-clocks = <&clkc CLKID_MPLL0>,
+				  <&clkc CLKID_MPLL1>,
+				  <&clkc CLKID_MPLL2>;
+		assigned-clock-parents = <0>, <0>, <0>;
+		assigned-clock-rates = <294912000>,
+				       <270950400>,
+				       <393216000>;
+		status = "okay";
+
+		dai-link-0 {
+			sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
+		};
+
+		dai-link-1 {
+			sound-dai = <&aiu AIU_CPU CPU_I2S_ENCODER>;
+			dai-format = "i2s";
+			mclk-fs = <256>;
+
+			codec-0 {
+				sound-dai = <&aiu AIU_HDMI CTRL_I2S>;
+			};
+		};
+
+		dai-link-2 {
+			sound-dai = <&aiu AIU_HDMI CTRL_OUT>;
+
+			codec-0 {
+				sound-dai = <&hdmi_tx>;
+			};
+		};
+	};
+};
+
+&aiu {
+	status = "okay";
 };
 
 &ir {
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
