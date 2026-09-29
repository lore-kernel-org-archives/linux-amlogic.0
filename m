Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CE8CA5FA7
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Sep 2026 16:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NVps8i7MErl37b7EY4Rddt60tde+y4Yn0gr4lyacAio=; b=cIEvEwOzNLna51
	hsX8ZRHFN21AIzpXiU74NCDVNkRfe/vMpVaYrfEAl9jVcm+mIb026osIj9rTNn22/p3zQ7n1b4oJ9
	JmwgcSAHoP4cK8ndmMRttQP24HNS2pAfSr7HND04VTGitSWWNPxNgSWOqcZG7C0cSbNV0k8Q54Ytn
	dcUAGhf8LhrXssSTDnrC46BOe7nRjqkZp8/9lukDdi5ZZnPDAp91Mq6DeujithhPichZr1fQtCb+h
	8hhzpWM8dEASLr1Dm6FxxgC7AvFSg11VmMJTOVWn3IEMsT7ykPo1tonB/rHOnulypwzzeVSxfOu/5
	AlWT3nRzOl9t/5etmx2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBanK-000000044Jg-0QZu;
	Tue, 29 Sep 2026 16:35:06 +0000
Received: from mail-qk2-x0d.google.com ([2607:f8b0:4864:34::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBanH-000000044Ih-1Bet
	for linux-amlogic@lists.infradead.org;
	Tue, 29 Sep 2026 16:35:04 +0000
Received: by mail-qk2-x0d.google.com with SMTP id d75a77b69052e-53321c5743fso2044041cf.1
        for <linux-amlogic@lists.infradead.org>; Tue, 29 Sep 2026 09:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brivo.com; s=google; t=1790699701; x=1791304501; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BpUlBI/TZ2/z/cI75UbimRM1YcGKhoHyCnq9jL1vi8A=;
        b=RKfUwnLOvbFzIDysOXpM3GK8iUvFCBsWBJKRf7E93H3nYHLSTh5uspT3KuneTIVEsy
         r+VWR3FV4i5QAqGueC9UYOiFxdml2wGTxEHXXtmKWakZjH+fd9FWgX2xvklp3UbMSc5c
         SLliCfpQbjKD+hBRklhRV15LNjvU2NYbfqvamOdgY3X5O+RJ/LKXMex3RLCdevG66IBt
         JML5q6k0RRy0YrrIZTlO/duPpI/KRsS0k29SForo7jhytrbp8UrpQnnMWt5JvtlrtNj1
         N9zFEGKlYI28c/kfeoRHuL0Yg2kuhQklHP/hymiWvhoowTLJQrowVpQoydqs9Kooja1I
         3Vzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790699701; x=1791304501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BpUlBI/TZ2/z/cI75UbimRM1YcGKhoHyCnq9jL1vi8A=;
        b=QBKcoya/z/ZnXorK8Yug7Z81RtlZWVO7CW5X3rp0C6YDt5TeOE0HmSjKOSpzQFFn+8
         x9tVHaE9HKIk+Y+7XHhwGKjpmOA+9a0Y6VU3mozBf6SyXhCyd+RFdoskWez3iOu7uMJR
         ciShYq5TV1/xeZhAVr+9w7PZ5FAszJi9xA0LR3+ARc1nc2UO5DR/GybgJVAPi0jyVcQO
         D2nkOhJQ0teEew18ashcty74x7vaBjYrvmuPlgS6yyIA+8oPACfDh1b6x613pqmWjj+6
         0InEytrvL/2PeqBP09zaYQk2eGvu2T1BkruLMN/LVNn1kCWWgTCqiF59A4/UqXR/uPHh
         xpgg==
X-Gm-Message-State: AFq9FYK7V8k+vf71/3U+WOviXCPXh95GoSOmtF4nKBmX39oxKyg4y4da
	YSPv7cC1ft9J7OdhGxcVjZ8tbrHFAGbWLI8Z4MQxbdHQdty7T49YQZfQ1Now9kHopq3iNMhVqyb
	bkTD8NN38ReM25lDxPzyUDuzGB2GBIZo+Qmk5ufQERLELijDmNf+NKy0ZW/ng0FwUqg==
X-Gm-Gg: AYBFou0xNovx7EKR7z+pomv4mI9CSQmmb5X2X1PpEkxCj97AdByUd6npKsRVZAM2yzz
	jwTUaXWkSBfPb9Pk+LHlSFAHlmf3/Kv2itkP4PrCwng0Y33omRIPwIbWHeSPAYmcAyHWBfPzGtK
	hNNSratMvSeFpOg9mh9zL/GdIjReaLe6zXqj5MXpcc4TiIqgfS/SZ/fG3S810ANhpxnbvzwPtwK
	bVf+vNeQu2SzcupZUhYDf6gkSAdDRrFWHuphTJmI+xgPYm4c4PQd0wAxPQH5vfXIVJJw9BVIlpX
	rwqj3+cEDA4cObYuIBBEPOQ4EvRWL4e20HMOd1SFYCUfW+fUswZCp3M4QHgr+6hXeb5B33RfoQZ
	cKa57m4ZRfKVmrdAyh9wg8/9vnCx7nyD+KkHL4gkbSO4YdeuKrvSYxkhsCvF3H6v4ySNZB4wjiY
	Zzciea04WEiap1mjVh4LT8jprpVGQeJ7IUItWIwzSs7cJdPHRhZ0WmIsWHHwJS3N6q
X-Received: by 2002:a05:6214:248d:b0:917:8d04:deae with SMTP id 6a1803df08f44-9178d04e0b4mr37336786d6.35.1790699701212;
        Tue, 29 Sep 2026 09:35:01 -0700 (PDT)
Received: from strozzi ([71.163.254.246])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d39627asm14065896d6.45.2026.09.29.09.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:35:00 -0700 (PDT)
From: Sean Anderson <sanderson@brivo.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-arm-kernel@lists.infradead.org
Cc: linux-amlogic@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Sean Anderson <sanderson@brivo.com>
Subject: [PATCH] arm64: dts: amlogic: meson-s4: Set stdout-path to uart_b
Date: Tue, 29 Sep 2026 12:34:10 -0400
Message-ID: <20260929163457.3237394-1-sanderson@brivo.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_093503_343630_F9D586A2 
X-CRM114-Status: GOOD (  16.77  )
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

If stdout-path is not set then bootloaders such as U-Boot may fail to
boot when they cannot find the serial console. Normally, this would be
added to the board devicetree, but in this case the boot ROM,
first-stage bootloader, ATF, and TEE all use this serial port with this
baud rate [1]. All of the listed components are signed by Amlogic and can't
be modified by OEMs. So while someone might want to use a different
port, they can't prevent previous stages of the boot process from
printing to this port. Therefore, set the serial port in the SoC
devicetree. Boards can override it in their devicetree if necessary.

[1] Actually, the baud rate used by the ROM et al. is 888888, but some
    userspace tools (such as agetty) choke on non-standard baud rates,
    so we use 921600 which is close enough for most serial adapters.

Signed-off-by: Sean Anderson <sanderson@brivo.com>
---

 arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts    | 8 --------
 .../boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts    | 5 -----
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi                | 9 ++++++++-
 3 files changed, 8 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
index 0a3f81ea0fb0a..15bf143317a2d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
@@ -14,10 +14,6 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	aliases {
-		serial0 = &uart_b;
-	};
-
 	memory@0 {
 		device_type = "memory";
 		reg = <0x0 0x0 0x0 0x40000000>;
@@ -141,10 +137,6 @@ &pwm_ij {
 	status = "okay";
 };
 
-&uart_b {
-	status = "okay";
-};
-
 &ir {
 	status = "okay";
 	pinctrl-0 = <&remote_pins>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
index 99d5df71b9cd4..c602091bca0a6 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
@@ -22,7 +22,6 @@ aliases {
 		mmc2 = &sdio; /* SDIO */
 		rtc0 = &rtc;
 		rtc1 = &vrtc;
-		serial0 = &uart_b;
 	};
 
 	memory@0 {
@@ -334,7 +333,3 @@ bluetooth {
 		clock-names = "lpo";
 	};
 };
-
-&uart_b {
-	status = "okay";
-};
diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 2a6fbd5308362..3e432e232a76a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -13,6 +13,14 @@
 #include <dt-bindings/reset/amlogic,meson-s4-reset.h>
 
 / {
+	aliases {
+		serial0 = &uart_b;
+	};
+
+	chosen {
+		stdout-path = "serial0:921600n8";
+	};
+
 	cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
@@ -794,7 +802,6 @@ uart_b: serial@7a000 {
 				interrupts = <GIC_SPI 169 IRQ_TYPE_EDGE_RISING>;
 				clocks = <&xtal>, <&clkc_periphs CLKID_UART_B>, <&xtal>;
 				clock-names = "xtal", "pclk", "baud";
-				status = "disabled";
 			};
 
 			reset: reset-controller@2000 {
---
base-commit: 6f8319e3e9a44dd537d17f41565a8453c560a581
branch: s4_stdout

-- 
2.53.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
