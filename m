Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD603C636CD
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Feb 2023 15:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iLWFv5nW0+DEKkhXd6tb59tb9ls9nH2MuWYnhNzb88U=; b=4BccVL0jLJYCFP
	OxzxGrHa+ryAeFysg9WIFngoz4ZZjQWwvIl/EOSgulbZ5SuQnds+yXCVTWWnzBLSZ5hR0KU/IxKyx
	xxmePbOx/IDsOPUtVzfRIkAyqkWRAXnKnoduDmPQSyzRTkjQmhGAsOLfv5mHIkaVdBjiGiB4I4AyV
	zoAzEb+socI2uMBEhNGMfVnnqrdLZSRNxiYh493BYXVo7muZ+MqPRGUA/TI6pAXVx3rQaMMsolFIv
	01E04yEQhFxiVMkmQGus5/s4qFGvK+SzmkdNYFZx4HItLlcpOxy4kTgcrewNDYjtbjpz39LM9MLbR
	6rP8L2UAvrfOcfmjpSLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPPaH-00CcoT-CT; Tue, 07 Feb 2023 15:08:37 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPPZx-00Cccg-6g
	for linux-amlogic@lists.infradead.org; Tue, 07 Feb 2023 15:08:18 +0000
Received: by mail-wm1-x32d.google.com with SMTP id n28-20020a05600c3b9c00b003ddca7a2bcbso11706689wms.3
        for <linux-amlogic@lists.infradead.org>; Tue, 07 Feb 2023 07:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mDLwb0REi9aot4lgydSdtlAMRDoMfdfENb6eT6jp90c=;
        b=kPywqcfJTHgGHxa1YybpYJzz7kO1W9HMTE03kle3f/D+vUsbuRoG0QYvACeDglQcc/
         BkBwgincRlPKuS9S3zGcMuae4Y9TBA9WSmTJjHATV5wI6S3DvHbAuE5tUgNCUk1CA7mg
         NQQHVD4hJgJyVPKn2XZPrA6XKwXWzfOdgpB+Vw2xe9yHaUVeJm4wTZklwovMCtaDh3U6
         z5mc9WoXcnxQmAgtxlkKyvztLIlZ35GLPLdqY6n/dLK8hCmEVHEjuaKH1uiWAffAPHMu
         VIqq1X0f2+ZDrEMrmm9y1cia/KWqq3p4P46QRr9WByvlWwuegerqwnNFFLvXKnuI9kAY
         gssQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mDLwb0REi9aot4lgydSdtlAMRDoMfdfENb6eT6jp90c=;
        b=DOOb34BzSoTmHJARfoz+8ySgJ/qfKxm0OqTBa36rv1j5Pt9hCJavIao7yhuN0m6FyM
         rAnXG9xlzE5BW56YzcGyAMKmw0Gc6i+/KAiWWAAGbQugdXflYPeqn5Og0u8Hnt4Syeq6
         6TmFGwkUeqSdRHaQ+ad4BuEbAhTcy58ompnhtmIfCLtWQeyghbSJ0jP6lQUVW68CapNZ
         A9OQvwZ3rAAR8N1oqJVqFQd5BHsPpYDxsSrqGLSD8HT6JUL8S7LPTfmH9CqMdCRSJIVI
         AOE+pXFzamoOGHd4V4Pa4NZFTvLyFxxXQgsZiZ1wx1XrdmRKf/qRFrXz3xSHwdbbV15Q
         qaDA==
X-Gm-Message-State: AO0yUKWLgEkhfwzw1mRNqJ6AtP9lsLNRRyknqUpP2koMzXbZUT2jDIEr
	m+KO60VbLU1g5+yGgE3+8j4gRQ==
X-Google-Smtp-Source: AK7set/O+biA2CMO3jm0lUhOJVP7Z8n6pcHfSafJGyVwdEGd6XrBPnDvCgUt1Z3W0/UOA2Ch3FnkGA==
X-Received: by 2002:a05:600c:1e8a:b0:3df:e57d:f4ba with SMTP id be10-20020a05600c1e8a00b003dfe57df4bamr4101626wmb.7.1675782495124;
        Tue, 07 Feb 2023 07:08:15 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id j33-20020a05600c1c2100b003db0ad636d1sm22092173wms.28.2023.02.07.07.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 07:08:14 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 07 Feb 2023 16:07:54 +0100
Subject: [PATCH 1/8] arm64: dts: amlogic: meson-sm1-bananapi: correct
 usb-hub hog node name
MIME-Version: 1.0
Message-Id: <20230207-b4-amlogic-bindings-fixups-v2-v1-1-93b7e50286e7@linaro.org>
References: <20230207-b4-amlogic-bindings-fixups-v2-v1-0-93b7e50286e7@linaro.org>
In-Reply-To: <20230207-b4-amlogic-bindings-fixups-v2-v1-0-93b7e50286e7@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Christian Hewitt <christianshewitt@gmail.com>, Yuntian Zhang <yt@radxa.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_070817_271603_69925A1E 
X-CRM114-Status: GOOD (  11.90  )
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

Fixes the following bindings check error:
usb-hub: $nodename:0: 'usb-hub' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi
index bb492581f1b7..e1683e0630b0 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi
@@ -316,7 +316,7 @@ &gpio {
 	 * be handled by a USB specific power sequence to reset the Hub
 	 * when the USB bus is powered down.
 	 */
-	usb-hub {
+	usb-hub-hog {
 		gpio-hog;
 		gpios = <GPIOH_4 GPIO_ACTIVE_HIGH>;
 		output-high;

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
