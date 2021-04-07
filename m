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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7988C433B4
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Apr 2021 04:27:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A88D611BE
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Apr 2021 04:27:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A88D611BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LwPz5ejEqyDSBiIkQfMfn4bcwAVP19imc19PIS52W8Y=; b=GjprLo2uTFvioQJ3HmAHcHpq/+
	xP8tem5Ftpj86oN363YsxuCJOK8NNUZ5ug8drMgk1AdrSbqsz7q7sTVJUFjY94yFoJ2kXjvg0L4Yv
	vaXHUD2sJFlWSLMtOhMQiKmVrwRRVW3eV/aL4h9xL65UJUnDAB9yuF+X2yzMg/hrnMKLMMi5zhyFs
	pOaOouEvphHm7q6553goU/7vZ2ALzg6zCBYsyr0S479aSNgsZvfMJ7ajL9FVpLSVOxrPwNwg+u74m
	h4VbmdcyoU/ZgqBc1t+C1RZLYnGPOhEVrN/wz1o4jerIgOD8mo7euTP1j2qsyYr6tJd/Q/avSH0+I
	jdizoRhQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTzml-0041H3-NX; Wed, 07 Apr 2021 04:27:23 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTzlk-00418D-Es; Wed, 07 Apr 2021 04:26:25 +0000
Received: by mail-wr1-x436.google.com with SMTP id y18so261928wrn.6;
 Tue, 06 Apr 2021 21:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=0o51oKuyha39MJhgnZxMd0OeTompQ+WxXOsAhpP5pys=;
 b=IbPPd48qDCfZS45non9+lat2dwNvXl6fJp5nD0kkUlGT6m8wXcTCbu3qwYB07PzGYt
 twyQp9P46r8yhS+BiJy9za7WYL9oTeolDOSv5LKdBeajdPfawHPDDbKbGrW4bwI0lmne
 LcvS+SApTGwSVkA+Ovq5JeNyLwW/9VWSx76YiDIStlWe3d2/FgLZCm3rr+2z/AZ87FCf
 a1AnufSeTDh1KRgttFCNGbqekvtJcmTNh9q19JEf8bQ4N/Aoz8YGtKND+zJgeHh1DNLt
 fZNRQa6K8SAFGzewWCBvZwrnOvspZHQr4ybYox0rHTqRDZJmibzK0ewsmq7d+LhBnHrv
 KUdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=0o51oKuyha39MJhgnZxMd0OeTompQ+WxXOsAhpP5pys=;
 b=Wmj5QOuTfwf4vLu6tfRQmu26T31r0nm7RJ4lZI1r9LOrxQHWZHtueKj8nRoZitT8Od
 YwO0YEy3hxGDZPxFHXPYs98qJOQ6T3rGrn4UTRUEesU5q9mcicRDLcwjuniM519tOvnM
 Bq+ex9AL0l6j3yxzAPSKV+qcGF7oLQ/ojEVoGkcBT2zHwlVBAxagxxA0uEm1NKzQj0Pr
 kw6jbKk9E0LTBSZu+I79AtPMmLlFoOs8yvBDJ+EJS0REJcyqlcrubaTm3ziWuH651ZoD
 ErWItzL+X8N5nknFqxJNs3KORTNM83dubyaMSj69rhH5BXY6ZFOKddfRvzCw8euzFazH
 sC5Q==
X-Gm-Message-State: AOAM530aT9lyX9WnNrsPxXC2P8i6ijsy9J+iKmjF/oQ/OfJtmdmlLHyg
 X8fLbVz3nrRReXYRVsX80Vs=
X-Google-Smtp-Source: ABdhPJzXS9p7nYZ1ia1ZqV4CKAJVhecTAVzEWbh4qtHNl1dKWiE9XW4ULLJge5LZa4M2w/BXPfTkqQ==
X-Received: by 2002:a5d:6c6f:: with SMTP id r15mr1807871wrz.77.1617769579958; 
 Tue, 06 Apr 2021 21:26:19 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id k3sm16487112wrc.67.2021.04.06.21.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 21:26:19 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 Hyeonki Hong <hhk7734@gmail.com>
Subject: [PATCH v2 3/3] arm64: dts: meson: add GPIO line names to ODROID N2/N2+
Date: Wed,  7 Apr 2021 04:26:09 +0000
Message-Id: <20210407042609.9736-4-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210407042609.9736-1-christianshewitt@gmail.com>
References: <20210407042609.9736-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_052623_605471_E941BC22 
X-CRM114-Status: GOOD (  13.27  )
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

Add GPIO line-name identifiers to the ODROID N2/N2+ common dtsi.

Signed-off-by: Hyeonki Hong <hhk7734@gmail.com>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../dts/amlogic/meson-g12b-odroid-n2.dtsi     | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
index 0a994668e707..473b81c652cf 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
@@ -446,6 +446,51 @@
 };
 
 &gpio {
+	gpio-line-names =
+		/* GPIOZ */
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		/* GPIOH */
+		"", "", "", "", "", "", "", "",
+		"",
+		/* BOOT */
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		/* GPIOC */
+		"", "", "", "", "", "", "", "",
+		/* GPIOA */
+		"PIN_44", /* GPIOA_0 */
+		"PIN_46", /* GPIOA_1 */
+		"PIN_45", /* GPIOA_2 */
+		"PIN_47", /* GPIOA_3 */
+		"PIN_26", /* GPIOA_4 */
+		"", "", "", "", "", "",
+		"PIN_42", /* GPIOA_11 */
+		"PIN_32", /* GPIOA_12 */
+		"PIN_7",  /* GPIOA_13 */
+		"PIN_27", /* GPIOA_14 */
+		"PIN_28", /* GPIOA_15 */
+		/* GPIOX */
+		"PIN_16", /* GPIOX_0 */
+		"PIN_18", /* GPIOX_1 */
+		"PIN_22", /* GPIOX_2 */
+		"PIN_11", /* GPIOX_3 */
+		"PIN_13", /* GPIOX_4 */
+		"PIN_33", /* GPIOX_5 */
+		"PIN_35", /* GPIOX_6 */
+		"PIN_15", /* GPIOX_7 */
+		"PIN_19", /* GPIOX_8 */
+		"PIN_21", /* GPIOX_9 */
+		"PIN_24", /* GPIOX_10 */
+		"PIN_23", /* GPIOX_11 */
+		"PIN_8",  /* GPIOX_12 */
+		"PIN_10", /* GPIOX_13 */
+		"PIN_29", /* GPIOX_14 */
+		"PIN_31", /* GPIOX_15 */
+		"PIN_12", /* GPIOX_16 */
+		"PIN_3",  /* GPIOX_17 */
+		"PIN_5",  /* GPIOX_18 */
+		"PIN_36"; /* GPIOX_19 */
 	/*
 	 * WARNING: The USB Hub on the Odroid-N2 needs a reset signal
 	 * to be turned high in order to be detected by the USB Controller
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
