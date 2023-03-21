Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E715AC74A5B
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Mar 2023 17:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2dI1qNJ4gZeqxAc+ujxfUCAeeSUC13aJWutTrH+/Z/E=; b=M5nazScVRA6TLP
	CJ7HC63pwBfTr2962QEDV8ZkpP4DkKf8ZMPqwF0DHFh3uQsWrK6scFs9bLgthRDCzOKPNoVb93jxy
	VQK45nH1VQklDVsLxQaUxWYGgYOTN18FaiXbUEsdYddAI9e7kdOW3yGtrrswmRMfBOXPreiELXkic
	ZKh7em/L09i0zNPt8nG46nT2ZH9yEK2Cn+pTlAtPH7+eyH5Z+r9CUEVBX8WP7WSvVHj17RzXzOF9V
	7Kv08ObW69wMdh60Wigj/l2l15G4ZXT8URbC6iLvbeRY7s8R+SfUbz6hQHzhF+MtEtayIx0MI2e4C
	ldjKahKUtqknJ2gHmCOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pefXc-00DBZL-14;
	Tue, 21 Mar 2023 17:12:56 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pefXT-00DBTr-1o;
	Tue, 21 Mar 2023 17:12:50 +0000
Received: by mail-ed1-x536.google.com with SMTP id b20so29572432edd.1;
        Tue, 21 Mar 2023 10:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1679418761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qEiCCUJNc1PR3pnogvghUdnKOx/0EJRU/1ZM2vOLkNw=;
        b=A7ZBdDyPrIJSe9DoJVUnw26hPeuSrdWVxTlX/JVvaDkkwVbU22O+pG/nq7kZR1ujjw
         8DRIxgNeX33Qe9e5MQzfqOGVejcgaDUKUWg+toZwanqvVYAm1P+2TTwWbLO+q1x6EEGK
         pCAASaoyw6WioSPqhUGhq0vub9Z/WUfcXkUKN/6p0T6yGX6VSsy+90eOx/n4vzn+cSJJ
         7PDF47V/+uVj6QtnRMB+AmlAtY1mUJ7WyxES2yDIsWQza01C+QFZNk4rijttoqmEnO3z
         Gtge0FLZ3iyzp6DuLWMvUK1BZwcwwYRpgXtlwBwICqfDytP3nMOlX7o1ocMcn9/TKXQz
         397w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679418761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qEiCCUJNc1PR3pnogvghUdnKOx/0EJRU/1ZM2vOLkNw=;
        b=OpwlueaSfKm9BHI1FMLR/TslvDTgm9anj3rnw+vX7XKaY6a1jJKIbooFbutZNzvHTs
         zTK/tFq4e4LRYX/VoJEBkjIxykqOOX+kkw7/v/HxpCmL46NP4vh2iK7Z6FDQ5UJx23cp
         T7uP3Q39rI6LMzQ2HQFg4q/uoBjELZpy+2N/HFuTikEbraMuSn/ywR23M8i6oQo/sbAS
         Kn0QGA7ZthCTKVaB+J2jooPMtpirCw3Sej6nUQrfOcnK+Rf/4MoXcx4rqO1z6kMSrly6
         BpeE5PDxkdk1S7MSlZFXR60ewuvIwYR1VcqXWqey2zgLEy+h0BDR5eyCCH0UriSi1ilV
         PTjA==
X-Gm-Message-State: AO0yUKXNJA8icO7kFx7PpHGMLTALPILpS1wJC/rTc/nnsZurkVJUTfMn
	kCtyfYzkfwnWvDVA+TFyyBD/U86Ta28=
X-Google-Smtp-Source: AK7set8afY/2gmlDmp2cFlcf4MZXIdXvWAy082uU862wFq1pjHBJp6vvtG7fppI+TC5a+m2aSINmuw==
X-Received: by 2002:a05:6402:35a:b0:4bc:f925:5dbe with SMTP id r26-20020a056402035a00b004bcf9255dbemr3611171edw.42.1679418761356;
        Tue, 21 Mar 2023 10:12:41 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a01-0c23-bc57-1c00-0000-0000-0000-0e63.c23.pool.telefonica.de. [2a01:c23:bc57:1c00::e63])
        by smtp.googlemail.com with ESMTPSA id c14-20020a509f8e000000b005003fd12eafsm6474959edf.63.2023.03.21.10.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 10:12:41 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	neil.armstrong@linaro.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 2/3] ARM: dts: meson8: add the SDXC_A pins
Date: Tue, 21 Mar 2023 18:12:12 +0100
Message-Id: <20230321171213.2808460-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230321171213.2808460-1-martin.blumenstingl@googlemail.com>
References: <20230321171213.2808460-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_101247_751612_18E9742E 
X-CRM114-Status: GOOD (  10.75  )
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

Add the pins for the SDHC MMC controller which connect to the SDIO wifi
on some boards.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index 4d18bb4e3c33..4f22ab451aae 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -506,6 +506,15 @@ mux {
 			};
 		};
 
+		sdxc_a_pins: sdxc-a {
+			mux {
+				groups = "sdxc_d0_a", "sdxc_d13_a",
+					 "sdxc_clk_a", "sdxc_cmd_a";
+				function = "sdxc_a";
+				bias-pull-up;
+			};
+		};
+
 		sdxc_b_pins: sdxc-b {
 			mux {
 				groups = "sdxc_d0_b", "sdxc_d13_b",
-- 
2.40.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
