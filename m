Return-Path: <SRS0=DOpU=R6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98C35C10F00
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Mar 2019 10:33:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 653612075D
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Mar 2019 10:33:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pK/tlAE0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="vUTzQTaJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 653612075D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IfjpxnC4LKL6DcMWhGV8PL/KHchYKR7qKagyQ8L6DSA=; b=pK/tlAE0RspDuR
	jPDM2uv4efZjwaQYl6H9UMfbNLUjS5k5+Yf00b1mldbIgILbEwI+X2if210+3OwSSlxqqRfySZNsY
	a4v837NhYK//L5MRnO9eDtsgGTsEA+3EYbm97gPgrs7aRAyNpfXugZ+EgvHS/XB8ACOxkXnB1ja3F
	o6PSwG63Hx/OIfD+977KvQhhMJ2+2xdo9wMHUE3UREY/O8B8YrisKFi/L1iGiP8LdbyrmxxiVufS5
	nrMtgctFrPJrpEmhoAo2QFBR5MH1h34VwyOm2uppuNgy2j1pM+e6MdB1DbBNEsQ+o93HBgv1327cd
	mbL8nzTTJzvLJfOLa3PA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h95sS-0008OR-Le; Wed, 27 Mar 2019 10:33:48 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h95rx-0007gS-05
 for linux-amlogic@lists.infradead.org; Wed, 27 Mar 2019 10:33:21 +0000
Received: by mail-wr1-x441.google.com with SMTP id w1so17936765wrp.2
 for <linux-amlogic@lists.infradead.org>; Wed, 27 Mar 2019 03:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nPsAcmFFVoD/0RGDFe58K/8oQV3L3d1wViSopJ+f2wU=;
 b=vUTzQTaJ9/onoSesGv9BFZMJKoEoiyAjX4zttjsLFU132nIGb8tzwsIiUbbbzrETnQ
 Jx30MZ4o8Vzif/CAjvczaspcizjHwwwsIIxg2a1SdMovkBcBcDTapyDdfCfBr3QF5sqJ
 fT3v+TY+sAAliKBcvIbaeVH9FMJuaveM0HLAvRFL/cNnoKXSWV9fgruT76N1b7HkU8fJ
 DtGxn2AnWiKN4nxPyPc9PXTuV7kkk7YyxCP2akaZJAInM29mFAw2BQxckSWwX2MCgH5H
 sr1Xs8qZPl0jIl/w8ki2MYBR1KF/lf3Hjxn6apQQm7dfB4VhK5C8NcPI2kKI/4DRn1Ul
 VqSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nPsAcmFFVoD/0RGDFe58K/8oQV3L3d1wViSopJ+f2wU=;
 b=UupLrvPMQ2uuls0uclV19zEK2ZUgKsrYr/q2kdcHfeHucadAVqPO+7pJ/seXqIZayc
 04r8NSma1hzRNRRrVASkZX1VIPD1YIn3eqd7OeQJ0dfWWDRnucARL4d0D1PdelmQGKku
 mZ4vdYy5G3rzQhRsAqxIkuklGIGne9vR8DZOJse3BxGMf1j+IrGZv67WJQ7jcF2LZoyF
 4ThX/8jXml3Tu+Wg7uJ2mc+h60zaboyKh9FqyyAm5PQ5DZr36R/AJ5Bk5L0fXjYCWPFn
 LGWxV8RfjOIvI3tLHwvshP+8C1nP2tcnec7s2fiHHTkX/RStsClJbgSPWYDCI9qpUUVy
 LPiw==
X-Gm-Message-State: APjAAAV0R7UyGLE7iq38/u5HjvnsExyq/63rzcAAdWMYOfg1OLSC1FVT
 khmbrdVkO9tfsu5CLonHSt+DRA==
X-Google-Smtp-Source: APXvYqzPHdoMGWkCKEbtzbb9UbLgqZ92xIsgK4/GZ4MLmdzAQtza5TO2ezDhtZxSTc3+Hlm590Ezew==
X-Received: by 2002:a5d:4f11:: with SMTP id c17mr345185wru.34.1553682795104;
 Wed, 27 Mar 2019 03:33:15 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id a20sm27017513wmb.17.2019.03.27.03.33.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 27 Mar 2019 03:33:14 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com,
	devicetree@vger.kernel.org
Subject: [PATCH RFC 4/6] dt-bindings: arm: amlogic: add G12B bindings
Date: Wed, 27 Mar 2019 11:33:06 +0100
Message-Id: <20190327103308.25058-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190327103308.25058-1-narmstrong@baylibre.com>
References: <20190327103308.25058-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190327_033317_202699_23DA6748 
X-CRM114-Status: UNSURE (   8.29  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add compatible for the Amlogic G12B SoC, sharing most of the
features and architecture with the G12A SoC.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/arm/amlogic.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.txt b/Documentation/devicetree/bindings/arm/amlogic.txt
index 061f7b98a07f..94bbcc646e10 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.txt
+++ b/Documentation/devicetree/bindings/arm/amlogic.txt
@@ -61,6 +61,10 @@ Boards with the Amlogic Meson G12A S905D2 SoC shall have the following propertie
   Required root node property:
     compatible: "amlogic,g12a";
 
+Boards with the Amlogic Meson G12B S922X SoC shall have the following properties:
+  Required root node property:
+    compatible: "amlogic,g12b";
+
 Board compatible values (alphabetically, grouped by SoC):
 
   - "geniatech,atv1200" (Meson6)
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
