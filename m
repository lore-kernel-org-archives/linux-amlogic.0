Return-Path: <SRS0=NBQ5=HC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B1C8C433DB
	for <linux-amlogic@archiver.kernel.org>; Sun, 31 Jan 2021 05:54:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F18664E24
	for <linux-amlogic@archiver.kernel.org>; Sun, 31 Jan 2021 05:54:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F18664E24
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tCq7MmvGkWlgP80T2+1DhCrzALvUEiuvhQR+Q2Hr2mU=; b=kApArvSZM28Moy7Rs0PTIYdV5p
	kcXAFq4yY6y1qPn4LR8fprAZ3ivT09WTwbuW5crTySdQGlGtQSdivGhbjDosXorEXb+3Z0z1Z9BKG
	Xg3li/RTlqOqkXjz9T0or3sTonunwd3wwmFo5L30Jfo4hVQOAzd3rs0vH9LYYPXr+BZN9kqwU68Up
	MZuxkDs5lFmhEyeeOUs3PdLqknyDaXRbv9nbAMDKjOQKh8OsJcFGeGEUPKdv1u1MvEP6C7hTsAldS
	IhYAELW9RLLOS+d3ddi6Jtqm/NOTwg21pvfhYV5A95Rv7j8YHSsiRl3rO4lzQY0spnSTbA6uOm3SQ
	I611NdwQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l65gd-0006BP-3E; Sun, 31 Jan 2021 05:54:15 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l65gW-00069O-79; Sun, 31 Jan 2021 05:54:08 +0000
Received: by mail-wr1-x42f.google.com with SMTP id d16so12982093wro.11;
 Sat, 30 Jan 2021 21:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=9xOUKO2XKFLeSm4wVIMXSdkTxiy8OHddK5mDTptdxKU=;
 b=dxkzYiMp801McdHLu1MsonH5EYX8KzHXFk7auYDDT+ryDywmt3errJ9f5axkprzfTf
 Z1uu03yij64OMAYtYqjAAiuKzxPdR3XuTrUi3f7kCJB1/XgM2LpyknsllkWx6i8P1nx1
 4OSqKDLTG2QFaT8KMQOAIU60cctFtqQij+N3SJ38BI47xcjqCSOBHrBKb5jSQBsTesdh
 5TrU/PfnbdhhfRQEDn+1w9fIa32mx6F0WBWCYwmcrCJn4PzGOZBaTuNk5sCqEThCqkgv
 aeG7qMTuXfRe5N9H3m0wcCLF3NDbT4ubBbGCw8+QJII2PVuiR3RL5XXLmOAH1MSfNpei
 K3oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=9xOUKO2XKFLeSm4wVIMXSdkTxiy8OHddK5mDTptdxKU=;
 b=RT1KOzPUWINLFVGIT651+9aXxYudr9qejJ9yCOEly/U16V5FExWaEG+ItoF0F2twGa
 Puo5vbYZTmndzS3j63Jgle9cvvWExpwB0/NfhO0MY8bCDMd7Zq0gDFa3NmAHQCZuOUi/
 o4Ts+R/WB3CFu1LkJe7grGAMWWi9j82R0qWd8EttYmOtxwcT3SYaeT9b5wykGRqab6yM
 fdOPPj3qapwcOV67XhnBp7BDXB5ZsGHBWf3lbZuYyMSnUNUZG6rM21AeUWth0prrdY0t
 w/BgzxcpdrcC8BjA7ULrxhPK0h/YjjeG8RMEUi+fbuTV3iu4ywI17V7aqYMIMR6bwLGS
 O/kQ==
X-Gm-Message-State: AOAM530PriO/L7z+DCXXXc9NDIsHJv4n86kcMF+B+MgOob+HhiNGW4dk
 +DXxFvKr+ieskWIEY3cp0OY=
X-Google-Smtp-Source: ABdhPJxBWJvaAvprZz1rIkpOu+w3hZTIBWB0/Z5CmPM0I/Zm/D/fCvZV+rEBQsXq8eEd3Wo2nKcE+Q==
X-Received: by 2002:a5d:52c5:: with SMTP id r5mr12023981wrv.208.1612072445883; 
 Sat, 30 Jan 2021 21:54:05 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id c9sm20056589wrw.76.2021.01.30.21.54.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 21:54:05 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] dt-bindings: arm: amlogic: sort SM1 bindings
Date: Sun, 31 Jan 2021 05:53:54 +0000
Message-Id: <20210131055358.21293-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210131055358.21293-1-christianshewitt@gmail.com>
References: <20210131055358.21293-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210131_005408_309670_E4138487 
X-CRM114-Status: GOOD (  12.97  )
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
Cc: Dongjin Kim <tobetter@gmail.com>,
 Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Sort the bindings before adding new SM1 devices.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 6bef60ddda64..b21ba8ba23dd 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -164,9 +164,9 @@ properties:
       - description: Boards with the Amlogic Meson SM1 S905X3/D3/Y3 SoC
         items:
           - enum:
-              - seirobotics,sei610
-              - khadas,vim3l
               - hardkernel,odroid-c4
+              - khadas,vim3l
+              - seirobotics,sei610
           - const: amlogic,sm1
 
       - description: Boards with the Amlogic Meson A1 A113L SoC
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
