Return-Path: <SRS0=rXaj=A2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A57EC433DF
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Jul 2020 16:02:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6B8320658
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Jul 2020 16:02:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uMwlrG/c";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o9c4MJmX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6B8320658
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JuLBvK0Dk98Q0gXIB8Bpohef08DmPq3qow+hFAAaEQs=; b=uMwlrG/cRjSn990mwb88Ab+vB
	J8aG6mNKTa3kzABmwTQ/0l17B7OkifJOdeWRZrUvWGwPVliZIz+4Jfdglky11cDtS9HHCzSKn5e4W
	BdgKundgJHhd5WGQTbojvbGFW5y2N1EOl8HAK/51FQexZW/ZwITUn+JfE5yjMQXLvjA1B6VMFQppb
	zxqK+ejar3c5DEKQWROPWqb4xUK7HQSsLghpaIgE+35IDpJA88i5yjCUQin1hMccFZAKYTpudrYoI
	u812PWN9Z746C47aaV7BACQlkVFtgOdqYwq/U2eS6Is1Rz6B+4qRCGmRWVeZpuIN/lxgqro+FCvKe
	g5sYA4lwA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvjru-0008Hm-DX; Wed, 15 Jul 2020 16:02:50 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvjrm-0008Et-Q0; Wed, 15 Jul 2020 16:02:44 +0000
Received: by mail-pg1-x544.google.com with SMTP id l63so3272821pge.12;
 Wed, 15 Jul 2020 09:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FojCQD0soL8L04oOiGd4PA6/4vPUGRHj5zClY/TRPYE=;
 b=o9c4MJmXZhdJnJvZPE9FDAfuRd9z181vQC0EyB7eV0Vqd13Md5EaEuu7+Xo1aKJR1N
 itYOoAXd3hF9Vq+MXGUDY4r33mgpBs6bIS5cYT871cdxz1PxpC3wdJjBt77O3SkaagNK
 1S4V/xo2K8hWtE/o3o8n9HwgVOhXLoHmAVPvtSPIJ8EF+ZEt8HZOPbBsdkEnYHcAvYWR
 KS2BZ361E7EeWDQCKIOjqyppvfucHF7sxiEhSdPCrmPOYsXmfeVHQeGoSG0qFWDCJCrX
 d61ByL5zdorBmqdAXDW5nCCyL/ZcuTzfEJIXYEBeyA4loh8VdpYccawhyB7WMq4d7iQL
 AGFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FojCQD0soL8L04oOiGd4PA6/4vPUGRHj5zClY/TRPYE=;
 b=nUV1eHORRuqRI8G1NAbzMbtTJW5LhAX4UcHXFk/d8gGOPRTBylIVuA/Yjftew1KuwA
 MazhP/r3uQ4e+MxctQIJQjbnMX94gf6Y3Di4P1xf1FAMAwm+tplETCZ7G2IjwaX+87Od
 2Xra9sv2iOCO6WEEzKaopXxf/iap3Ceyq2R4UFt7LEkh0KfmXEtF14g37sA9Ekan6MNF
 243s7q1frYX6RMJ1IChF2s35p8+kQNlabu2PBu9Y07NxCEAL6UebaBmq/qE8YOnKSSUo
 bUoQPqOnCt5G8E7d/WdQTtM8gRPGQsm9RIncn+4W/FRV8omoemS+VLIiBX7Ri5aIj5rD
 sMtw==
X-Gm-Message-State: AOAM53227virPAuO7y+pnX/hDsGDR+u1yMHp27ST6PshL/myD5GfmfFb
 vaiLuwVFim+0dEFWjqX/PqC4GNJ+
X-Google-Smtp-Source: ABdhPJyxCVqUzd3vAJRX+GM36miY+jtS2+L+UYd39LbvOgCrUKbfH9foNP6Qm4zApSMKeBufYVfUVQ==
X-Received: by 2002:a65:640c:: with SMTP id a12mr380941pgv.88.1594828959616;
 Wed, 15 Jul 2020 09:02:39 -0700 (PDT)
Received: from localhost.localdomain ([103.51.74.198])
 by smtp.gmail.com with ESMTPSA id 4sm2520157pgk.68.2020.07.15.09.02.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 09:02:38 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Subject: [PATCHv1 2/3] arm64: dts: meson-g12b-odroid-n2: Disable virtual wake
 RTC
Date: Wed, 15 Jul 2020 16:02:08 +0000
Message-Id: <20200715160209.652-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200715160209.652-1-linux.amoon@gmail.com>
References: <20200715160209.652-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200715_120243_791878_E39530D0 
X-CRM114-Status: GOOD (  12.31  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Disable virtual wake RTC node on Odroid N2.

[    7.171149] meson-vrtc ff8000a8.rtc: registered as rtc0
[    7.182875] meson-vrtc ff8000a8.rtc: setting system clock to 1970-01-01T00:00:07 UTC (7)

Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
---
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
index a447cba4dd53..c8c1262a7bfc 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
@@ -517,3 +517,7 @@ &usb2_phy1 {
 	/* Enable the hub which is connected to this port */
 	phy-supply = <&hub_5v>;
 };
+
+&vrtc {
+	status = "disabled";
+};
-- 
2.27.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
