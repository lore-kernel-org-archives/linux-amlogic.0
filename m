Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E90EDC433F5
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jan 2022 15:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vdc2i9Zo56cyPh3J0RD07KmvmmCLiDD8Z2GgyvnHl3A=; b=GsNBtkc7+5novT
	VeWOZsYFhVhmTtG5/k+Ax9oTYG2ClMlZXhQ+vPAN9n6SNlQPCKbUD6NYOUcEc2aUp/e+SlY5aPDoS
	PO0/m4lZ3MvNq2HDuuer7vpperFPOSUV4MH9kqor02tS1jHSBJNXOOPNJDGaBYMiI5GAVv5mHHtXW
	gBbRB43yBOjPmW7u0SYm+C6kTERCfZ2bz/XIEteperyKsRA2ceT1oRc1DqDydGr8IywXNdB2EfnIv
	M7tEZAGAaV2dRgv1fY58WNHwEP3tHfpPp+EpRyGqyDAcvfKDbm1G3pD0quM0kNMfq2ukC4r7cP+1y
	FctubVln/V0B+V1EJaEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4PYK-009ONt-J9; Mon, 03 Jan 2022 15:47:16 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4PY2-009OH3-Sr
 for linux-amlogic@lists.infradead.org; Mon, 03 Jan 2022 15:47:00 +0000
Received: by mail-pj1-x1034.google.com with SMTP id
 r16-20020a17090a0ad000b001b276aa3aabso24816098pje.0
 for <linux-amlogic@lists.infradead.org>; Mon, 03 Jan 2022 07:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DuinLQ82u9Ll4xBW8hohWni8CpDThAMqaisLf3sqjiw=;
 b=Kkolr/5fSCKwJ4AF6i6ciBiCFTzyg3CmMMSYRrUfD0D0Ih8pTE0FRQaVS8k6LwaWLS
 ePUreY/P0N4LNOx12Kzs9xYlg9X/jEHJYXEjqUC9Jj/dSznmL12TB3wNK3VF85Wn7nId
 OwXbl3OZsd2qiM0LzCd8CKaxFADRZ2ifCQqTE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DuinLQ82u9Ll4xBW8hohWni8CpDThAMqaisLf3sqjiw=;
 b=mJgNjV4rMwjf6+dpXfaKxV3LCYRAKlFE0Jnd2/eMeansA3QZS6Wo1Z3gVwcZ479Zdg
 V7y13mO8l6d6nU0VNjsJuHkACMxgF5Mo49M3CTk1LWgoCaqVpbWhHMpg6EBuU8j/aQ+V
 pFhxSQv8UFH1zaouYMrzCTXakqnvqr1yJjsMrxzgTDnJhArBhhsg9Ptbb7zudBjyKooF
 aahs1Wwhwtp0UmzYb4gD05krJtDtogT2zV5xCHT9UeY3zqYA1XkvNRKxDGOSC4LsnJmB
 zBxoq6R77WatSzwhaWymmb15MJD/WFAMYIJt0oPAgNxuJMfLnTpuvErXDoClqIcOz0ac
 GQoA==
X-Gm-Message-State: AOAM530W5Sd8h4MVNdUlCOYfht+LhoDJtXWcb6PMRXbOfqS4hyX7m5or
 jxDvF+ugVvntQKP6nPsTsFWlWFZ09GzV3g==
X-Google-Smtp-Source: ABdhPJz2tbfvAdwQ5b5as5ZgbBIZRiJhaS6MhPLzuzfwJHOg6gxQ/AN0OK7D3ctvxBQi1c8X8Fbyug==
X-Received: by 2002:a17:90b:210:: with SMTP id
 fy16mr37090944pjb.202.1641224817454; 
 Mon, 03 Jan 2022 07:46:57 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-idf1-1-1088-186.w82-125.abo.wanadoo.fr. [82.125.191.186])
 by smtp.gmail.com with ESMTPSA id l2sm41080153pfc.42.2022.01.03.07.46.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 07:46:57 -0800 (PST)
From: Gary Bisson <gary.bisson@boundarydevices.com>
To: linux-amlogic@lists.infradead.org
Cc: Gary Bisson <gary.bisson@boundarydevices.com>,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: meson-g12-common: add more pwm_f options
Date: Mon,  3 Jan 2022 16:46:15 +0100
Message-Id: <20220103154616.308376-3-gary.bisson@boundarydevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220103154616.308376-1-gary.bisson@boundarydevices.com>
References: <20220103154616.308376-1-gary.bisson@boundarydevices.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_074658_943793_9F977970 
X-CRM114-Status: UNSURE (   9.50  )
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
