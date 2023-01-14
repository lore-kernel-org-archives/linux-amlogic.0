Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E77C678D6
	for <linux-amlogic@archiver.kernel.org>; Sat, 14 Jan 2023 23:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5mehkCaqOvgHum6uFEySRexBSnmV/+YOl2t6ga4DwVU=; b=i9bPMkgQRHozgy
	IkhskhlwTcjV2t9BTLrlzyvfrIXRHhN5QqUZe1C19eQs7A5PA4QNTlUDX254qdfEC1Dv53UtD76l4
	Bdh79k8B/24VwSKriEcfzTfJQP0GuE60OBqZRcFO4l3UcGCFo+/C9hnNXX9k5VJ54DWdahyrPZt9f
	wirxVVgS47j2bRhfPMIXEN5jstsmIDPR8aE5q4TT4c9suLs+67G6kyfJG8On0DRct/0vh/T9g3c8W
	PsxkK5nTTe8RNMmg6txDweqFxqrhGZzIWeSWvzmo2o1Db1/S/ra4CioZvXp/qS3MAMwZr/EHU4Y6a
	4j5pApJff02AlobNvuGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGq3L-006dYP-PS; Sat, 14 Jan 2023 23:35:11 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGq3I-006dWx-KJ; Sat, 14 Jan 2023 23:35:09 +0000
Received: by mail-ed1-x52f.google.com with SMTP id v30so36091632edb.9;
        Sat, 14 Jan 2023 15:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GWVrESddhMcKV9qP+Dkj74fkQan5eC2qiWVTWYlr+WE=;
        b=aSpgkeU/VZC36HH2IOCrApSC6/dnJxHVVhk/EP4hS7lxvlqwG8haUfghF65tQrDYRM
         bd90WFiY6wgmjeUadxvJRKvRuEKPd4aiNxIT5U/ERvXOpzsNzvMHVfapgUNRI7/rlntv
         7eXneQ577hZthSj4JsI3XGgQrKAsGZQbuBshsyKJPEEYolvoJ/BjgjC0vvhlkWlF+BXf
         vWRO7Dw87Vvap0MZCKCheSMarlo+SqyrU9lpsPABprq5aAgQDbBcWEZUsb1I7Afj4NI4
         X0emxf2gFSLoMKG9/ZLrIiTvqA7OHeRlT35JXqqei8VjHO7sQON83giV9fMVGvVFanQt
         s5iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GWVrESddhMcKV9qP+Dkj74fkQan5eC2qiWVTWYlr+WE=;
        b=VmHwW+2azTXNxyfOlyHPBIbstQw2gqv8g/lkEEh8lR29wTJoPqT4JIFSGLVExKzY4g
         Wxq3h9lpthZVskHsQG68OuRPRfxoHrro/4PMsHeWvU/wuwaIlBgDhYehUVIKSEsDdipg
         io6ofbaodfivASVuUHpvG26M8TP+q9y0styCBRhAh8uzWAV81CPWRCPeHjb2ZV9g7CJn
         MUxh8qE/Yn9s51oXMqmnlDleGIGJnJ4mZcMPJ4RB1hztQA+Q4AokB7MsrnP7bK4k4QJ7
         /FIhscOwkodHDM8FY+RxHbz1GTkQtbmUDJkXn1XbuQThvvsd5GrlhCa5WEyMrzpDXzgp
         dZXw==
X-Gm-Message-State: AFqh2kr6gcGLM1OcQ946SeBNiRS/nTMsaQJvZrPvllMNEK0kHkyzTO22
	1qI2Tug2gUzsgfUT85L29q4WmNELzms=
X-Google-Smtp-Source: AMrXdXuSopPP0FVI3dTqxvJnvWR//Ng9ic9FQLSlfUHndfsNGtoMtLC4QGI5TgHARiRWhJ0kzZHNGA==
X-Received: by 2002:a05:6402:2d9:b0:499:d0e3:7745 with SMTP id b25-20020a05640202d900b00499d0e37745mr14991236edx.14.1673739305751;
        Sat, 14 Jan 2023 15:35:05 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a01-0c22-7ae1-c100-0000-0000-0000-0e63.c22.pool.telefonica.de. [2a01:c22:7ae1:c100::e63])
        by smtp.googlemail.com with ESMTPSA id d7-20020a50fb07000000b0049cbd334b13sm1967620edq.29.2023.01.14.15.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jan 2023 15:35:05 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	neil.armstrong@linaro.org,
	devicetree@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 2/2] ARM: dts: meson8b: Add more L2 (PL310) cache properties
Date: Sun, 15 Jan 2023 00:34:55 +0100
Message-Id: <20230114233455.2005047-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230114233455.2005047-1-martin.blumenstingl@googlemail.com>
References: <20230114233455.2005047-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230114_153508_693175_4EB43F21 
X-CRM114-Status: GOOD (  10.45  )
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

Add more L2 cache properties which are used by the 3.10 vendor kernel
but have not made it upstream yet.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8b.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index cf9c04a61ba3..2d80c009bdfa 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -643,6 +643,9 @@ &L2 {
 	arm,filter-ranges = <0x100000 0xc0000000>;
 	prefetch-data = <1>;
 	prefetch-instr = <1>;
+	arm,prefetch-offset = <7>;
+	arm,double-linefill = <1>;
+	arm,prefetch-drop = <1>;
 	arm,shared-override;
 };
 
-- 
2.39.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
