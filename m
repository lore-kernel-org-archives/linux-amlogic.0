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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4C09C433DB
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Mar 2021 23:16:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E0566188B
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Mar 2021 23:16:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E0566188B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vVzoUeMXTekPyMxle5ikrcq4mmcCz0DdKqPy8Y1pgYs=; b=ZC9+O4SfLDKsS39wpjf57T4VrF
	NXBeToc/6SCW3THecMbUr5orQT4yZ6iDe+rgmzlJ8CxkwsV0YZZcDdRB21V+viKQnm6oZgcxUwiGJ
	n8O23cq7yIMLpajgf+QojCrZ1isq2C0YM+hVwm4Poy4hjdatvZYf04BAsP3CmqW5s7G4rgMp2pVCZ
	vEvlRlLsdvpUjREkaalvkVvYEN8rFSWjn3mt6uWcwR3y6ah24JZwMaIZ7EeZPdzP0uj+rJnF145uO
	p0SxagqdVCaCe2FEyfNmuk9dewDsxLrvqmXQnhbVSMbCC2O9YfVOCUGCb1l8+nJmdbGW4ogQ8Z4Uo
	+eJQaLig==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR17S-001sko-Rt; Mon, 29 Mar 2021 23:16:27 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQuVj-000knP-Eq; Mon, 29 Mar 2021 16:13:24 +0000
Received: by mail-wm1-x332.google.com with SMTP id
 j20-20020a05600c1914b029010f31e15a7fso8812276wmq.1; 
 Mon, 29 Mar 2021 09:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=5ZiO1iVwSoVj9P/6X3+DQz3ORP6IjIgP74RDaktXeLw=;
 b=bmM2rwSwTpnT8Z/6JyLA8AsCfuXFr5FlCeR2+vaIEjLrZ03HaNLq5XAJ0kFA4CWWju
 CLJ3GxLCAvp4Oi/bQBvgnagAup7PsXryis9YycN7Kapb5QxqBpYjGgUi9gq4PQtkEBoW
 WeDGfHo9V65hCQswzJ5rooic6Raac0lNXvQHWLkDF0fnZcpc2DKSjf4CxoEZ0d8bZFJ1
 4kkRDNq1P9wMQ/4C2Y0CUvuWfGg3g5/VxCKWCTkr1/nehdOiVZy1NyJXkQrZuQDHWKNm
 Rt1uGhiiU8yU99VNVByljj1DgzVJhwnWpvVzVStFMof3WifLB/jwK5litaa8CW76TOes
 OOEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=5ZiO1iVwSoVj9P/6X3+DQz3ORP6IjIgP74RDaktXeLw=;
 b=mVwCmWf7lWELV3FcUUtUjduNN9S/XMQrWnsMgABv11Fu2H9RGA8ntQt/eGTyE1jIbJ
 G7hrb8GlG1HS74fIW4Dpv7tKpehHfcId6PlO7nv31ctjOtR3THT/WOkLjaKV5551wvCF
 DUVjaBa3clDfn4fOsOSDdOQpgYVRURF8cQUFCNH7ovATR40icc82IfCQffxsl9smLV8l
 VgFE60GExPTcVbPH3MTFnvS5yFfZkCi2A58nUNYZT0P9sHT4swA0hIUrTGwdnj8M1uk2
 /fZE7cFoQ1cc2jrhNQxqsHebttn9jFy82dJZml4o6diBkZk20NaA5Up4wlHsfdntQzOT
 z7TQ==
X-Gm-Message-State: AOAM531epACbgyZazBBTw80Oa7MXDf6SrKeqoVxMIohYxbdSI1/BVD1Z
 N4+VNP7M+n/SoQUKvhPG5hc=
X-Google-Smtp-Source: ABdhPJy+3OyI5kSwbOAvtK90lDB7L/TtTB6Wj5hNGK363vselfFA2Mm6mEUDQB4pckYzLR6847e4RA==
X-Received: by 2002:a05:600c:210a:: with SMTP id
 u10mr25824003wml.147.1617034382865; 
 Mon, 29 Mar 2021 09:13:02 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id a6sm28570964wmm.0.2021.03.29.09.13.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 09:13:02 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH 1/3] arm64: dts: meson: remove extra tab from ODROID N2/N2+
 ext_mdio node
Date: Mon, 29 Mar 2021 16:12:54 +0000
Message-Id: <20210329161256.31171-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210329161256.31171-1-christianshewitt@gmail.com>
References: <20210329161256.31171-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_171322_815220_284252F1 
X-CRM114-Status: GOOD (  13.28  )
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

Remove an extra tab from the ext_mdio node in the ODROID N2/N2+ common
dtsi file.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
index 58ce569b2ace..2f8d574c30c0 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
@@ -410,7 +410,7 @@
 
 &ext_mdio {
 	external_phy: ethernet-phy@0 {
-		/* Realtek RTL8211F (0x001cc916) */	
+		/* Realtek RTL8211F (0x001cc916) */
 		reg = <0>;
 		max-speed = <1000>;
 
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
