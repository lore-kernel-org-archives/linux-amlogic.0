Return-Path: <SRS0=Y5gA=R4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF9FBC43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 17:35:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F6FC205C9
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 17:35:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OkLt/rrv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Fex4pV/W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F6FC205C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=roBsBqqh5PfBjMPqA3Z30LI9j67wIRwzOv8yx42rJD8=; b=OkLt/rrvAlYkjn
	TMoVSB4thV4BNvmsovJz3UvKRr02H7fxlCods9CyhHoqcDbZDYL2mKdKWvmQFjjc8DTDkoT3QYRWW
	eGbUdiv0qszDB4bbidCFy4teDu49yav9tSfTUJPjyqpZJBl6CbHvU3biK53l4lLygYYvZAX4b7lYf
	yxalMxOBmKkMx20WVERi+gFzw7wUcxH1wlupQ/Qc0Iox6KJzo9WrtQvhJtWVfrQhozcZyzH9edfH1
	/CGd/j4RI++QZHYEZOpbhsnBBsGPporGYyrH8xO923R4jTmPkpUqaDheqyensOMyarsREm8o86zMn
	oxaaKu43uu7T8i8qvbJA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8TVY-0006sG-Gt; Mon, 25 Mar 2019 17:35:36 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8TV8-0005ua-8L
 for linux-amlogic@lists.infradead.org; Mon, 25 Mar 2019 17:35:13 +0000
Received: by mail-wr1-x443.google.com with SMTP id p10so11213219wrq.1
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Mar 2019 10:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IXlGPOBwp//uKNJa434eOkLrClSnsgj56Ngvzlundr4=;
 b=Fex4pV/W8FZ7zM1+mvDX7aFNrxVQ0fvfVQ/tuyoMWe+HW2joBx8VPHo6PFe79v8bX2
 B93VcniUw1rX7zNw8KT408MKK4oNiS6OquFwPNqmpGyscjI2J60LYK1J6cYs4nqEdf/S
 kA40GYYZ/IRUSx5nMYE+6OrTH+kvL+2R1uLJPC95NP6Q6ssEm3fOGPUtTPtEpMHIOq/c
 2wSQFp3vaW020tM1wtDCDTmIJ+6wdF+PknWsuuoKErFcsgbxBwAmSB9vN6AXDAKBjhhj
 3/zV3TdrOuOkDnOfxcfIiVlBOJjwJnrNvqs1BP8qjudrjBbkkvoBYg+2+l+w/mOpEh1G
 JxTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IXlGPOBwp//uKNJa434eOkLrClSnsgj56Ngvzlundr4=;
 b=Egb76Ad+v34SnhcvEh+k7wtL+cpS9RwQQ4gvQYoH8vxsY1kk3HiDwPcmzZ9/EMiued
 oJ8YwW8IiSy1s6qQIgHSrLyYgAx6EWhmFvlEcOr0CLuMnSCTQEtGi9WXs78kHj951Ek6
 v9XQ5+3XCyDGpslZqAnVhh63yVDCKnj8ejMGQdWWI8M3MSxyiDtg7oecGfiDDXZagPst
 pPK7qXJ1r8dDMBCl6TisHqqMbjhpfNy/9YLcxD0/lSFDUgW+Mwd3f3QXbRLgwIoEfcnl
 1uvyyx6xQUOrLJLeyahysBo5/1LKWvyh8wlbflFRulESK1I4V0FoTnCYeFmCV9l9CNvy
 /kpw==
X-Gm-Message-State: APjAAAUXHgobniEvW7OLCvqawvcbjQ73w76zfkWiovIpqdvRoLWg3Rsi
 Tf2f86mQQNENNMC9dCgNtOpqcA==
X-Google-Smtp-Source: APXvYqzIEKV0+Wttnn+Y6TxMdCzyreipXSORa22STjIeFFmPStP6jn1djkcf5aOlJP1npioffi3IPw==
X-Received: by 2002:adf:eb84:: with SMTP id t4mr17732631wrn.100.1553535305536; 
 Mon, 25 Mar 2019 10:35:05 -0700 (PDT)
Received: from localhost.localdomain (176-150-251-154.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id o15sm16003227wrj.59.2019.03.25.10.35.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 25 Mar 2019 10:35:05 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: hverkuil@xs4all.nl,
	mchehab@kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/3] media: dt-bindings: media: meson-ao-cec: Add G12A
 AO-CEC-B Compatible
Date: Mon, 25 Mar 2019 18:34:59 +0100
Message-Id: <20190325173501.22863-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190325173501.22863-1-narmstrong@baylibre.com>
References: <20190325173501.22863-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_103510_432412_9FBFDA36 
X-CRM114-Status: GOOD (  10.59  )
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
Cc: linux-amlogic@lists.infradead.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Amlogic G12A embeds a second CEC controller named AO-CEC-B, and
the other one is AO-CEC-A described by the current bindings.

The registers interface is very close but the internal architecture
is totally different.

The other difference is the closk source, the AO-CEC-B takes the
"oscin", the Always-On Oscillator clock, as input and embeds a
dual-divider clock divider to provide the precise 32768Hz base
clock for CEC communication.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../devicetree/bindings/media/meson-ao-cec.txt    | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/meson-ao-cec.txt b/Documentation/devicetree/bindings/media/meson-ao-cec.txt
index 8671bdb08080..d6e2f9cf0aaf 100644
--- a/Documentation/devicetree/bindings/media/meson-ao-cec.txt
+++ b/Documentation/devicetree/bindings/media/meson-ao-cec.txt
@@ -4,16 +4,23 @@ The Amlogic Meson AO-CEC module is present is Amlogic SoCs and its purpose is
 to handle communication between HDMI connected devices over the CEC bus.
 
 Required properties:
-  - compatible : value should be following
-	"amlogic,meson-gx-ao-cec"
+  - compatible : value should be following depending on the SoC :
+  	For GXBB, GXL, GXM and G12A (AO_CEC_A module) :
+  	"amlogic,meson-gx-ao-cec"
+	For G12A (AO_CEC_B module) :
+	"amlogic,meson-g12a-ao-cec"
 
   - reg : Physical base address of the IP registers and length of memory
 	  mapped region.
 
   - interrupts : AO-CEC interrupt number to the CPU.
   - clocks : from common clock binding: handle to AO-CEC clock.
-  - clock-names : from common clock binding: must contain "core",
-		  corresponding to entry in the clocks property.
+  - clock-names : from common clock binding, must contain :
+		For GXBB, GXL, GXM and G12A (AO_CEC_A module) :
+		- "core"
+		For G12A (AO_CEC_B module) :
+		- "oscin"
+		corresponding to entry in the clocks property.
   - hdmi-phandle: phandle to the HDMI controller
 
 Example:
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
