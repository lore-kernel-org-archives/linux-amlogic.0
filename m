Return-Path: <SRS0=M/XH=JE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F093C433B4
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Apr 2021 04:27:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 151FE611BE
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Apr 2021 04:27:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 151FE611BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PMM3uJim0LF64iIbfITFhzJC4WGVnNsC19A265VqyuA=; b=aNgzFgyDwVpANjGPUQTLVwzj0M
	gzv+ujnbFKSFCOJ/nKWt6Zm9x+ZZztWooNn7Z2HuBYanA039LPpc3JU9/LvFkekcXyjMOyuX7U9oa
	znB7OAembXCy8chRHeZSxXMvJQirADHYDWBsN0P8SkrbkFClsENhPk5E/+ZDmataVwOjW/mZ0fnhb
	tAijB1F2dXYeD91ANRRYu2iA+DH93F2aUVWob+5FUnWSf3Dx6olbnr8F0kebNu5JvQyKwqQP1I5Jt
	yLnEI+UAzwaC/AY1s/BtSoSxvAvn5sLnEMRE597JXbFUa8usOJwNIhpdvLaGJGI+CYKemhhtkK6SS
	IigkvvSQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTzmW-0041Cs-Iv; Wed, 07 Apr 2021 04:27:08 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTzlj-00417t-QZ; Wed, 07 Apr 2021 04:26:22 +0000
Received: by mail-wr1-x432.google.com with SMTP id u11so3944872wrp.4;
 Tue, 06 Apr 2021 21:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=5KdDU7bWmStE3swA6bDIP4C2YreOYbP8fSjU6f5jMDY=;
 b=ir6wejPtNEQn/ajXwLSx/OHNMCEV0BVm/bYoIJZ4d7dVXy17VYrlvyLE9dQ6+T5zrR
 AE4wSsq0fb8oGb08676TOK3ljBgej5cMobKpqVdO6a67SL8A4M7cEsOPMm1QhBxyx+Jr
 RV5TnxjTyrHTLuvoJay/fgtesLkX60RPrHwu1ByW5ywf44Mdht13yZTIJmorcQezsP3t
 u3ucZZ74jKyO5aJPhLiy0/rVLimQEc8qk1W2rE/OG/5NWGmXj7LM38x2rcSufk+8ijXX
 U2S3Z2YEtAZKJXSfkXEMWjFSib8YpHwZAQLhD+Hmqlevwy7W3ku2KXS05OT8IzfbFoNq
 ya2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=5KdDU7bWmStE3swA6bDIP4C2YreOYbP8fSjU6f5jMDY=;
 b=qLFo3vvbZy3tB7jkH3P3toPR6Y180/JM7/YZosTOBYcJvsvxSZue3xH/1/QYPceDIz
 Cy9H9upjcBQngpYCfxyKVq6v2VvhkfowJt0QfXDx8emdY+JUVpuMZbYNZ62BdeD3/qF5
 VAZIIAH3nbrWM1TipCF2AhTLeHIGVggx9MXqNirrtLz9HulUR7e5qSylIhIGFUwHwCem
 0E9gjYmaBk4ASCs4GJMulpieVa6zOrzwl9Az7WsV/SKRXblliWoADbANi04wNm0+hBnm
 hsPLMrGWNs9srsyK55plo+OdUf3WCSpUz57LEI1wjQkf26T0T0AFgxwha6NMR5jTf5Ii
 EdnQ==
X-Gm-Message-State: AOAM5317avD8INnlVs7FSL13OqIWQoEUP5j3vlugwl/M2DyXhtR1a2oj
 WoiksrVO4xex+Iu7ZVs+CU0=
X-Google-Smtp-Source: ABdhPJxwt/QTf9jnkvwysMy8N0WkMbKvrDaZvwchBpmxsCQ8UBW84c55tpooQVZQgoHKey0EoFDdCQ==
X-Received: by 2002:a5d:53cd:: with SMTP id a13mr1735800wrw.273.1617769577938; 
 Tue, 06 Apr 2021 21:26:17 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id k3sm16487112wrc.67.2021.04.06.21.26.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 21:26:17 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 Hyeonki Hong <hhk7734@gmail.com>
Subject: [PATCH v2 2/3] arm64: dts: meson: add saradc node to ODROID N2/N2+
Date: Wed,  7 Apr 2021 04:26:08 +0000
Message-Id: <20210407042609.9736-3-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210407042609.9736-1-christianshewitt@gmail.com>
References: <20210407042609.9736-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_052620_197935_40939056 
X-CRM114-Status: GOOD (  12.21  )
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

From: Hyeonki Hong <hhk7734@gmail.com>

Add the meson saradc node to the ODROID N2/N2+ common dtsi.

Signed-off-by: Hyeonki Hong <hhk7734@gmail.com>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
index 2f8d574c30c0..0a994668e707 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
@@ -508,6 +508,11 @@
 	status = "okay";
 };
 
+&saradc {
+	status = "okay";
+	vref-supply = <&vddao_1v8>;
+};
+
 /* SD card */
 &sd_emmc_b {
 	status = "okay";
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
