Return-Path: <SRS0=y0rr=E2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E074DC2D0E4
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 15:33:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DAB82222A
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 15:33:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DkeDWz4n";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="h8exnCpZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DAB82222A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Kueor1eMYtBiTY9f88mjK31Q5BEJFOmUbfXKpkfaaFg=; b=DkeDWz4n8uHtE0muimFNfxoWL
	3bPl+UPQjhC7LYc81DOeNd8tkC7dA3TFuwmLJzWMZUJz90NthgCq27he6Obj1TBi8hSiXkuyHfTA8
	0WGwcmqGL08I0+Ijw7NLZMCE/E7/TJCWTjXQb4TDDk9oMjj9IOLshtF4/eGGbUaHGkntND7AL9+r+
	DeUZyB2aEqYcrQ/Ta85isbWJQW/FI54z9LKb7uFcw630ab8SFpXVuXvJJJCpYYnyt6S4Vk8ZzBSbY
	UnDzeAGkuFaP3t1Tg1c5bAwBdKT4e0LxRnatl931EfX3/bucvsvV6cbSBLPAKWV1N3znBpCnTFvg7
	rPBrpU3Pw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kg8PB-0007lt-Fg; Fri, 20 Nov 2020 15:32:57 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg8Or-0007fA-Vr
 for linux-amlogic@lists.infradead.org; Fri, 20 Nov 2020 15:32:41 +0000
Received: by mail-wr1-x443.google.com with SMTP id 23so10420804wrc.8
 for <linux-amlogic@lists.infradead.org>; Fri, 20 Nov 2020 07:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2URB6hakc3nWkld7N5FdP4Ld/qwc/CD2JkWsHdCYAQs=;
 b=h8exnCpZKHXR89TT/5X8scjQZIQp3im2/S/Q0Ksp7sXE4P0d5ZfiUHbxdI60xBusxD
 d75hym+1Gog6SD5dRzL1efyh6z8fHNoxXCUZ08VMEpgUPJucRq0xGmOihHoj8EJVIGvg
 RhogM8G/L91ltrIuCFL5GAGHggEcbLwJVd6MUco+1ziBct4rQjm8MKClLQoD8fhjpEoM
 ICWBcKX/Ocrhfgyty+xHlq5/oG4DQc4/5c83+tc+THRl6v8a1BG5J2nHc8hJyZeQlaKS
 JjqSnIdq7Z9YnLAxDtOI5GMVXuUy2aHFdcdW1c6A3idDuVosvHNws/97BRGUHE3YGfyQ
 XfMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2URB6hakc3nWkld7N5FdP4Ld/qwc/CD2JkWsHdCYAQs=;
 b=VcLK8TbYkB60jSM2spYJ+z0Tteu3zYFs/FiNNmKi6Uj+0Li0SKE9YzG39MkqySv4Du
 DvjjqwK4XTcMDcNeLj4BVb3OaMn2bMQxNc/fG4yT6mkfhQ7f4PzzWgAFLo3GOVjdCCym
 Nr1ONC6e0KK05gWKEkbDxmPHT8D3bNT8OxTByNDNVK2ITX1oRFGWBz6X3RHZ6BSbLIfn
 N7KA6M8ziLi982mXpO8jRWB19Rx7QjVvOGECZB1PUOuhdGMUfwnuo8Nz/6u9maj33yvC
 0/5C8Qc3XSTySQlekgYkdu+YdfmdkHvVOPpZXf0ZiceETlcwOOizSTTIrAdPbhDQAjCm
 NyaA==
X-Gm-Message-State: AOAM530i16giYfZEAulPGhrr0mLB5t19hAY0qmzkz44OPHJqa3E5BJbL
 5OmP+0wTL7KlVhM5BIpEQVx5NA==
X-Google-Smtp-Source: ABdhPJwfTf3h73Vesxg5zZZDESi0OcUkDcB0L1ZerQOBfi/92rBfQHISXh4c/iYb8xFzstjxUrWu0w==
X-Received: by 2002:a5d:5702:: with SMTP id a2mr17909454wrv.371.1605886356665; 
 Fri, 20 Nov 2020 07:32:36 -0800 (PST)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:419f:dca4:d17a:66a7])
 by smtp.gmail.com with ESMTPSA id i16sm5398180wru.92.2020.11.20.07.32.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 07:32:35 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 2/4] arm64: dts: meson-axg-s400: enable USB OTG
Date: Fri, 20 Nov 2020 16:32:27 +0100
Message-Id: <20201120153229.3920123-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201120153229.3920123-1-narmstrong@baylibre.com>
References: <20201120153229.3920123-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_103238_078753_92E12282 
X-CRM114-Status: GOOD (  11.21  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This enables USB OTG on the S400 board.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Kevin Hilman <khilman@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
index cb1360ae1211..7740f97c240f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
@@ -584,3 +584,9 @@ &uart_AO {
 	pinctrl-0 = <&uart_ao_a_pins>;
 	pinctrl-names = "default";
 };
+
+&usb {
+	status = "okay";
+	dr_mode = "otg";
+	vbus-supply = <&usb_pwr>;
+};
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
