Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F039C433F5
	for <linux-amlogic@archiver.kernel.org>; Sat, 22 Jan 2022 07:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cO0nEz6kQXgoHnEMd2nsanfvYmEpWtQ5qluAl0PKC4Q=; b=rGsT++eAd/abGS
	ZCtsbkRXr8y76lSy4zWaMalpP2zMR6CtSmUk7Q8p0F8GokqzG/yuHwRRDqYKIknrx/mRXCdDRLFPu
	9Amw+0yp1qR07PhIE6kDuYpxoS43Lvu2xVah2G4elUIRakrsGteACUXTLrxfe1PejW5oG/SnApnw6
	6FjDq+ezB6F0kLTsyoQ596XjeGOaLNKYjq9D27JNR5qnus4nVvSKD7SluDAVupc7SNk8A4akqO2L2
	NG5r0tlaGo0CwZMEkcxMRlSjGvu6sLpku3ayUCV6r3SCJ3qLmH3cwZueMMEFSljAcBkvenkuD5qgO
	3s6WV4Ra0fpCJ9g5iRFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBAtf-00GiqQ-SF; Sat, 22 Jan 2022 07:33:15 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBAsz-00Gibc-OC; Sat, 22 Jan 2022 07:32:35 +0000
Received: by mail-wr1-x42a.google.com with SMTP id v13so3768620wrv.10;
 Fri, 21 Jan 2022 23:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=1dbRvYlFYtDwYEmVyaZdpxRConwrNczxL4pzjyGKTeM=;
 b=Ymq+X6yZH67bhxLGQvvvDuVW5WuGuC05+9SEuvh6VzWhqxI++n4PQMwKI72DonXbcv
 Jm1o3bTvlY79AHPM887eoZqOPufKTfo2WXBKHXlEQan+/+G1Pr4wODrRZOat2ksVsYlO
 kM9wwDeVjTuEFa5UzkLetEXfqdVHy6Jlm4fPQwOt6jX19mCa4T4ASEPAqS0ZwQ7ZW96U
 X2UCA59NYW9nsaO0zopnRQ16BSUpL9UxssDfNCT6Ef9wO/vFqweejM9k77tS5OVommWD
 ptKQRFDpo2cVA+6kVDuRI7TuWdlQLtNv1F9n2F2J9OjRcoKY9C0Te8cQSHuB+cSMUY8J
 CFUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=1dbRvYlFYtDwYEmVyaZdpxRConwrNczxL4pzjyGKTeM=;
 b=ly43cmcuG57Rx2XsK+IuybiCscbnmMY99Ydv3XbUGpaACEs63hmhUs0iPnfXr83rmT
 T7UZLNr+igwjZO3EB/QBwQ3d0+dycIB5YmscoRzt3mhxKj796x71lqhf9dRHA9MwXjyj
 OJIzKGWuvzC2VaGSiks8Zl532CHPJTTQRuyEM8mi4rm3tTjgpy6CDzRxdsIGid/Bc/NW
 +Ij1B9a3oyr5h42yawKuVJ9UgZBnL4yee9xI2hLunA4sqImrbBsHRDhTwUJvr6TXRr0V
 ada1qDGEZuX4xqaFK4WxxpmNQHV6ZNg+xepzRLzClHZ7kZhH+PFfjabKf32K/I/0DwUL
 8W/w==
X-Gm-Message-State: AOAM532XCDwOJE/BwY/tQ9UebnpRHgH9Yfiudlce8tu7ygVg5HjhdRup
 jEmeP4XAjRpjlwPAwtl+KvM=
X-Google-Smtp-Source: ABdhPJxmD/1s884WHFC5qHJ6DlhRLHZ4vDsrKm089DWjneV2lKc4wGWAIDh9CiSAcCQ2LKPzv5eQ/Q==
X-Received: by 2002:a05:6000:1569:: with SMTP id
 9mr6440779wrz.155.1642836752312; 
 Fri, 21 Jan 2022 23:32:32 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id i8sm8970485wmq.23.2022.01.21.23.32.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 23:32:32 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 Furkan Kardame <furkan@fkardame.com>
Subject: [PATCH 3/3] arm64: dts: meson: add BL32 reserved-memory region to
 GS-King-X
Date: Sat, 22 Jan 2022 07:32:21 +0000
Message-Id: <20220122073221.2398-4-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220122073221.2398-1-christianshewitt@gmail.com>
References: <20220122073221.2398-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_233233_812508_EC979FFA 
X-CRM114-Status: GOOD (  11.02  )
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

Add an additional reserved memory region for the BL32 trusted firmware
shipping in Beelink g12b devices. This fixes a long running issue with
boxes booting from Vendor u-boot where the board wedges during boot or
soon after due to the (un)reserved region being overwritten.

Fixes commit 93db2ce05204 ("arm64: dts: meson: add initial Beelink GS-King-X device-tree")
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Tested-by: Furkan Kardame <furkan@fkardame.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts
index 6c7bfacbad78..c6178cbe3a9b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts
@@ -20,6 +20,14 @@
 		rtc1 = &vrtc;
 	};
 
+	reserved-memory {
+		/* 32 MiB reserved for ARM Trusted Firmware (BL32) */
+		secmon_reserved_bl32: secmon@5300000 {
+			reg = <0x0 0x05300000 0x0 0x2000000>;
+			no-map;
+		};
+	};
+
 	gpio-keys-polled {
 		compatible = "gpio-keys-polled";
 		#address-cells = <1>;
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
