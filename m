Return-Path: <SRS0=bUf0=I3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A02FC433DB
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Mar 2021 23:16:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F6526198A
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Mar 2021 23:16:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F6526198A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IU3x21gARS3GaruF2TN2/d5wp5d4bvTrgD5AKdkHGjY=; b=YRbrkyBYvDW7UjsRB03d6qQHGd
	F4v8bq+YaPMFP7q1qvVLRK3rS9DD1VJRDg1rc1SGtsusMYmphTX0FXnI3mJzFKEzXDJGeMIfc9qOi
	UyWnZ6e/4xfIUdJ8bzBIdRl1l8WQL0opbFiMo4BnXvEkLpXBo/h/fgDxJBQwSN+IzliIaHUwphMDG
	sZ14BBTMF/DYsDSjD/CaKaXIPfB4Z8Sl84zB0BER+gIeJO/R5jPoC1XU3T7yMzwsBRkAbomxhkek+
	quDg78xkLktgowfdf7Yr5eWp3b/3STg3suE5p7PpeFfe3UBvAtEtmhowX4mb/CZn6IAgHZhrVUJcI
	0cuTNJtw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR17d-001spL-Sl; Mon, 29 Mar 2021 23:16:38 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQuVn-000knR-Ak; Mon, 29 Mar 2021 16:13:30 +0000
Received: by mail-wr1-x429.google.com with SMTP id x13so13420907wrs.9;
 Mon, 29 Mar 2021 09:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=fZhzW4vGlptf3m5Yu0AgcPAv1OEq7UcLKHN0eiSAYY8=;
 b=SVM7M0Wc+ARI0ldCbAG8m88O4CdzrXYjMS0ZXc2LoTt27YeCA7FaEcxPzVd3pGLogr
 l5dMg6SVL978LlqtxAKwxP1sUWizPwL2FkTw5wfeoUj49DGoOnDkIoPSIt3TvxQnS5Pr
 gJQCRpP2HbJS65HVb5eF7NCcHwEws3Rz/mzSU6iDk09QzzU51tvUGrQtYYsqSsftak0h
 OPWNMbC/D/DsqhISu1zRO8zYKLEJkMqf3m9RPugowarXrWrBvdAxqHnvLzR0RWvnkJR9
 xqyP0E0wZW+OCLXDCLfEbbMhvkc5O6kS63olvMVM/hDzsz3WhVGmTup68P+go8y2wGJT
 ZMRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=fZhzW4vGlptf3m5Yu0AgcPAv1OEq7UcLKHN0eiSAYY8=;
 b=losq/rBZhjPzAxxDHf3hg7tzMGH8AYU8FLnK446+BRCrXqBuFmPlW71cfKqgqopL0Z
 STm+d/td+4X9N/yHIeO81OrJYpDCYgUJMOajj5K7WRFYktz0CgIfXt+Ql7mGZJcRkNXM
 i63J7zghctlHQ57AKMpWCC0TsnmKFgVdqqj/sHWOXmeBllMOC7dNVYkR4J7nNKhElsIL
 +KUGKDgXJN5RoerkooArrzUNBmX4/dUsFNF2eoXEXoaWP6oB7naNbmDgCP/npeVLGY6I
 GmVS0/lgcEY3e4NE3EPGk7VCezIwVuHTC89FaOTFPEBxYQjyXQApFdvX3gZMHMTSoOHN
 BdLw==
X-Gm-Message-State: AOAM5336Q5dj0XJPnAiPSQQQiytKVR2chjaGySPuJ9uQY9yu4hy6Y8nl
 TIrWx4hU8CpiwaZyQrCbHEk=
X-Google-Smtp-Source: ABdhPJxUCY6a+zgeNnE4fZUYOqKSMnPB8ZuOGJnXFf8Fa2+bMk8tyCxiNJ73gCeGKLgoM3en55VbOQ==
X-Received: by 2002:a5d:5007:: with SMTP id e7mr12140559wrt.10.1617034386830; 
 Mon, 29 Mar 2021 09:13:06 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id a6sm28570964wmm.0.2021.03.29.09.13.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 09:13:06 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 Hyeonki Hong <hhk7734@gmail.com>
Subject: [PATCH 3/3] arm64: dts: meson: add GPIO line names to ODROID N2/N2+
Date: Mon, 29 Mar 2021 16:12:56 +0000
Message-Id: <20210329161256.31171-4-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210329161256.31171-1-christianshewitt@gmail.com>
References: <20210329161256.31171-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_171328_603028_754A8EF6 
X-CRM114-Status: GOOD (  12.89  )
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
---
 .../dts/amlogic/meson-g12b-odroid-n2.dtsi     | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
index 139c12cf9f66..4489715fc4f3 100644
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
