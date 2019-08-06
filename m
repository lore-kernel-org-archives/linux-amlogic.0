Return-Path: <SRS0=TmCu=WC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74008C433FF
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Aug 2019 07:55:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 463F121743
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Aug 2019 07:55:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Chf6OsR+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="xarmdgAb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 463F121743
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/Qnu+47JM1E0Cfcc4WB7/W17qEuIOdeivh4C3D6HfgU=; b=Chf6OsR+nOL74q
	/aNtsw360b4AuYJJVH1o+j2j7KfjD32MrQYNwSx4AlB8teQ6Vs1RZul+dEBOqk4otbY5UfWGT7KeZ
	K9f5EDyqz0DBplJltbe4xh4K67YaoGUSv5ydls5q/OvuEMZvhkoFtDQlBwXSlkVJJ5JpnClJp1gT2
	SeQIlG16zW+KOvHlXXoViTBwq4ZsACO77GWJsJ74DgwbwoOim4BOl3ri6+NPwuDFd6Yaz4eXjyXbt
	BCTL60QprW6rRNW+EG9WgLI2Wtq/hIHfkpziraZa/PNowZYOJcBnYQRaiPjOKhDQZ/I40EpdxiWZY
	+xeg+yGv7oeBGlDi7+GA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1huuJb-0007YZ-Hi; Tue, 06 Aug 2019 07:55:27 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1huuJZ-0007YH-CO
 for linux-amlogic@lists.infradead.org; Tue, 06 Aug 2019 07:55:26 +0000
Received: by mail-wr1-x443.google.com with SMTP id x1so36963610wrr.9
 for <linux-amlogic@lists.infradead.org>; Tue, 06 Aug 2019 00:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NZRqT8V+HbaNyUlq3PdBNLAEq/GOVw1hFRgyTGAZtYU=;
 b=xarmdgAb/WJ9uvxeIe7Vvnuil2dEKchf6tYjy8/jZl8nFLLjSJPqAS0O5pOi/iLqEP
 LNTPcNvW/M+iilAxfnXWBex9Gej95dQnl8JyhGtmVJjcOCe1bM1fTpkGTxdABhKl8Lbd
 i7h607XcKNy/vmaj9QEeMNQRJHB4XjeCEXcRe62ehN+bjsC6uoW7Doqy+hsTr91TUg0w
 HTpi3lWeBPbGzHmKNxlDrENj91LydNecOWqUNEAeNMtx4KYRndhdjatqBgUl8hobEd2S
 90f5DI8yESaDekqlY00MwIwgEMyfrabfwIpXEmHYw5OTqIZyFncYfjFWNv74xCxekTie
 Uu5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NZRqT8V+HbaNyUlq3PdBNLAEq/GOVw1hFRgyTGAZtYU=;
 b=BlUga9m65ObO4pWnXFYR3apfh1P2S172Od4LYfLwhcYhYNS/NPsXKri8BdQ+Je12c0
 4jqW318KFhBsLIA+z5Dt+xVe1evyXIJMzFUDOgLOWnxQeabuUFaJTMVf6f3bPdQoSQLR
 vWbXw14+sSIJqo9sBe0fBXBSPmesSkI9p3oFgPw0osY2B5IRNHjl8JMw6efJRFoon8L3
 4AiC6P09qdTmRtYSlxC0owMMmpcO01oZ//aywNUO6M8FYeXxq2mptheiPG7aNYybOpli
 U9F+EFYDwVLGs2d1m6+t7TQRfEz++mwUclem3Eln3I0/HzFR9MT4c6boVr6pd28xMSeI
 cWhg==
X-Gm-Message-State: APjAAAVDfM5B2dotYSI5sKmhbVy3jp+h90lQulmHF78CHtr4Z5fT2afI
 AciuEx2hxXKCbszp/maTp2+eaQ==
X-Google-Smtp-Source: APXvYqzfaTBkqaGB//oMRTCwkGNn27u+6JoIXAVBcyBbQWY0HtlhPHe6dXf75sino24ZgDU9UIpu+A==
X-Received: by 2002:a05:6000:1007:: with SMTP id
 a7mr3111062wrx.172.1565078123923; 
 Tue, 06 Aug 2019 00:55:23 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id q18sm107379252wrw.36.2019.08.06.00.55.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 00:55:23 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH] dt-bindings: arm: amlogic: fix x96-max/sei510 section in
 amlogic.yaml
Date: Tue,  6 Aug 2019 09:55:20 +0200
Message-Id: <20190806075520.14652-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190806_005525_419224_6740D35A 
X-CRM114-Status: UNSURE (   8.20  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Christian Hewitt <christianshewitt@gmail.com>

Move amediatech,x96-max and seirobotics,sei510 to the S905D2 section and
update the S905D2 description to S905D2/X2/Y2.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 325c6fd3566d..4668064dd7e5 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -91,13 +91,11 @@ properties:
       - description: Boards with the Amlogic Meson GXL S905X SoC
         items:
           - enum:
-              - amediatech,x96-max
               - amlogic,p212
               - hwacom,amazetv
               - khadas,vim
               - libretech,cc
               - nexbox,a95x
-              - seirobotics,sei510
           - const: amlogic,s905x
           - const: amlogic,meson-gxl
 
@@ -129,10 +127,12 @@ properties:
           - const: amlogic,a113d
           - const: amlogic,meson-axg
 
-      - description: Boards with the Amlogic Meson G12A S905D2 SoC
+      - description: Boards with the Amlogic Meson G12A S905D2/X2/Y2 SoC
         items:
           - enum:
+              - amediatech,x96-max
               - amlogic,u200
+              - seirobotics,sei510
           - const: amlogic,g12a
 
       - description: Boards with the Amlogic Meson G12B S922X SoC
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
