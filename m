Return-Path: <SRS0=SW07=QT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87623C282C4
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Feb 2019 15:14:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53DE2217D9
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Feb 2019 15:14:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FQdiDVhM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="mrPl2XTA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53DE2217D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tzzJNrrADo5dj9fcUwYwzfn0PYu4DNegqim9pb0Q7YQ=; b=FQdiDVhMd50kWQ
	K/QpC2XIrcGzS4UnNcDngjq6DFGN8JgXYG49VBNtqZzQnj0wFz/HOENpyUMRinvneoWWDtZfTgg3e
	lAaeHrnDQK3nqkk72iZ74rVsIAQlvPP+f2BDKD/qRU3jawC0SqC8fSYEY+yoxznGuhxYOUxz+MffJ
	4GEXA13GGDh2527KFBZFcXasnDbXRrObCkYpUvYDl0BNO8qOV9p2dM/MC3h0HqU+jPYsbXqoHLUHp
	j1rxAOx9TFZheW/18KVDgzHToQxnYa/9KdrAvmBfjCk2f6zxAAt5AnfholOwrIUX6xkVEOd7QSFEy
	LpDNeacTr2bNYsMoe3Jg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtZlO-0006TG-2Y; Tue, 12 Feb 2019 15:14:22 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtZlK-0006R0-UZ
 for linux-amlogic@lists.infradead.org; Tue, 12 Feb 2019 15:14:20 +0000
Received: by mail-wr1-x442.google.com with SMTP id v13so3084398wrw.5
 for <linux-amlogic@lists.infradead.org>; Tue, 12 Feb 2019 07:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lEfvGeOk1usEAZ8llxjKkiOzQN+ahvtkYpFJPi6soxQ=;
 b=mrPl2XTA02ZrZOTTKOV6YbwerRpbdV9CMe3BnIq9Qfgh0nKxk5t98JZb1RtPnsYCbx
 ohG+Nv9qn+h1EYsa65ywzS6VFgoAN/ngyjBg1sB2fgIGfT8oYzm+GebourW72INdf5FJ
 oz4nk78cufgfWoZhy/mtB06VdJcg1n6ArWqQ+36geNiP3oaKcrEdT0Di13cFTH1UkC7m
 xviVkV/6Qj+37fy6ivzkYUWtD1aXC4ib3w49aWohJ3cj4pmwEW3yBKXX2igS1bmjjg2q
 4+lxqoT+8zT+rii/ST8SGKlurSxrY2PmIz7JhKUAf4oR8gBKrYW7aqY32G+jIMcV+guK
 YRig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lEfvGeOk1usEAZ8llxjKkiOzQN+ahvtkYpFJPi6soxQ=;
 b=ennOLOWRGqb5jboUf65kpiD3zV9comiCEHPihfFWbohSSj7wG7qp9dxz5A8koq0xkR
 Il/2JBFINfMgAJHa8+VkhEIWI8K4Ou9DfCnGeDrk779jHvc07CnLoE4SqkFkODbdoL0Y
 v0DhxXqcC1PFzNMub7NZlQ7hoArC++QK/RYU+9P6N9QPppmbdNbWoKY8xSheR/fG2zn2
 1qr4Wwdla0UGGkmGVVCVJihqcA7/rAA3sH7JC8TeFqSRlaiAjyJtalHQNZ86yhiCww0G
 e2y9XUDesKVhwCHtr6etY/QerNF3m0hBSSIiUj78b16RK5bgaYJV7gDoDGCplPrJx488
 /ovw==
X-Gm-Message-State: AHQUAuY0ByueBZSm0LmAl6HHWlugRN0NF+bNaIBlE192HNDK3N66V2/L
 luPHnfS+1dOKTjy6wVZscKIWYA==
X-Google-Smtp-Source: AHgI3IYxKnd8AIHCEYlPT+DtsN2774Su5ayDJJB6gxk5G6/KEOGgxjSfhqycSOtgD5LnRxuJc++F6g==
X-Received: by 2002:adf:9123:: with SMTP id j32mr3464508wrj.122.1549984457297; 
 Tue, 12 Feb 2019 07:14:17 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id c1sm1589515wmb.14.2019.02.12.07.14.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 12 Feb 2019 07:14:16 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: gregkh@linuxfoundation.org, hminas@synopsys.com, balbi@kernel.org,
 kishon@ti.com, devicetree@vger.kernel.org
Subject: [PATCH 1/8] dt-bindings: phy: Add Amlogic G12A USB2 PHY Bindings
Date: Tue, 12 Feb 2019 16:14:06 +0100
Message-Id: <20190212151413.24632-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190212151413.24632-1-narmstrong@baylibre.com>
References: <20190212151413.24632-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190212_071418_982022_73124A29 
X-CRM114-Status: GOOD (  10.64  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the Amlogic G12A Family USB2 OTG PHY Bindings

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../bindings/phy/meson-g12a-usb2-phy.txt      | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/meson-g12a-usb2-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/meson-g12a-usb2-phy.txt b/Documentation/devicetree/bindings/phy/meson-g12a-usb2-phy.txt
new file mode 100644
index 000000000000..a6ebc3dea159
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/meson-g12a-usb2-phy.txt
@@ -0,0 +1,22 @@
+* Amlogic G12A USB2 PHY binding
+
+Required properties:
+- compatible:	Should be "amlogic,meson-g12a-usb2-phy"
+- reg:		The base address and length of the registers
+- #phys-cells:	must be 0 (see phy-bindings.txt in this directory)
+- clocks:	a phandle to the clock of this PHY
+- clock-names:	must be "xtal"
+- resets:	a phandle to the reset line of this PHY
+- reset-names:	must be "phy"
+- phy-supply:	see phy-bindings.txt in this directory
+
+Example:
+	usb2_phy0: phy@36000 {
+		compatible = "amlogic,g12a-usb2-phy";
+		reg = <0x0 0x36000 0x0 0x2000>;
+		clocks = <&xtal>;
+		clock-names = "xtal";
+		resets = <&reset RESET_USB_PHY21>;
+		reset-names = "phy";
+		#phy-cells = <0>;
+	};
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
