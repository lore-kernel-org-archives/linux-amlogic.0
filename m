Return-Path: <SRS0=BjI6=TK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECD1EC46470
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 May 2019 08:23:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C051C2184E
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 May 2019 08:23:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BOf6/2bx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="xtx6Zvf7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C051C2184E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=xSJmQGXeOTpKNdtbXRRCJQGgOiDG2Kq8NwnnFCOVzmU=; b=BOf6/2bxKTLuQ0xED4du2nQ9mO
	Rkh4g87ewkcyZPpXOa4qwjdjMEJeRod2qxitTF7TSGy1oDA15eCnKtoMUJSh5kJ8UOOCnotA7bjm3
	2xdgE+aYT+NcaHWLASlStSN+BnaYRDV5thCI128e2h7VcwdRvrzXgA6r4dP5pMxJl7ypwhcwzRaj4
	N5end14oQTTi/QUm6O8dbprFhxbsdkqEdNS4oHIagmUrj5A1RzPNeCmyfFUFZOD8q8sT7C6DA7aU4
	fLWeCFQjE5QYCjpBVEc2m2khoPtbzFxlDcadyDI2DoYgGFfQMOsSXTHJsw4Qx59Apd2oRzxCyyDyT
	/23nhTfA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hP0oX-0002SB-Jw; Fri, 10 May 2019 08:23:33 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hP0oT-0002Kb-9E
 for linux-amlogic@lists.infradead.org; Fri, 10 May 2019 08:23:31 +0000
Received: by mail-wr1-x442.google.com with SMTP id h4so6682695wre.7
 for <linux-amlogic@lists.infradead.org>; Fri, 10 May 2019 01:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=U4s1dss+n9Xva15zT8mISpfSr/mUjsA3fFxCGFPn9B0=;
 b=xtx6Zvf7rGsnmGj2NGzV3BEOMtTMORT+mlenmWD+IPsFijXjJ2Tyr0VK0hp/Al3hXD
 S0VtCRtxdkVjUc6Jxl51HYWMQSpq9UGG5EB/J/yCHaRwZjGMmDlHt3HGYWKaUz6MTgB2
 CsmQEb8aQN58qPcvt00IWI9hu7S/8/4aGzMrHlRt6QI5szH9UeOmnxpSb1/NCA8Q/7TL
 /pn7HOE8kyu30H7AUMMR8lIsDgKkNX8bZ9wCfpWiaIcRnX1Kh8QZS8hx4hGABewbyqI7
 bibzUxPIZaovtc0sEBhW61/zgzaX40H6uFd0NrMrDrvlxzRE7yyvXcDPAlt4eOAhDCaY
 18zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=U4s1dss+n9Xva15zT8mISpfSr/mUjsA3fFxCGFPn9B0=;
 b=WWXtr2vV2IZTCyQWftcdPjsIatiWZt7yQCsVxiVsKZv/MWzzRNWVCAGHLav/wQZinM
 Ee4tyKNyLGNEd6rGENst1rHSh5S2Cu6stKhiQpJBqvLjAGa5TCLP7f2kUOjBUFBwmTwU
 XnssW+AfZAR3TNWU1yCcpypzHo8N85iStlEejqOsQl3a4e2eaJcazaPQZr4uxZnlPGEW
 1MIMkX0fAm2S8xa2KYkTMU8NVu048DgRi37W1Y0BMVMO66a+ZUp9ATNUuRW92TJjJWyU
 Ar81IxW3Q2zZQ3bOODRDfUF6vXJ+Eqz5+x+u/hzJ0kIy1HXdC4LnaEiT33yklrIUfF+1
 6Qow==
X-Gm-Message-State: APjAAAVFRplPtuW3PUixeYtxYZ8X+mhuJmoEZB0D5ggLIKisYrcriqbg
 nvzyZi1lGbkI9lnGqjXuiEY9NbfWqok=
X-Google-Smtp-Source: APXvYqy+BhXehiD7cbWFg775OPA4oSa5FmjSz+D1MtxqQQz2jWqz6EddyK8OpD1zRsJf7GXvsYXq0Q==
X-Received: by 2002:adf:d850:: with SMTP id k16mr6636198wrl.57.1557476607654; 
 Fri, 10 May 2019 01:23:27 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id z4sm3790285wmk.5.2019.05.10.01.23.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 May 2019 01:23:27 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
To: linus.walleij@linaro.org,
	khilman@baylibre.com
Subject: [PATCH v5 1/6] dt-bindings: pinctrl: add a 'drive-strength-microamp'
 property
Date: Fri, 10 May 2019 10:23:19 +0200
Message-Id: <20190510082324.21181-2-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190510082324.21181-1-glaroque@baylibre.com>
References: <20190510082324.21181-1-glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190510_012329_577232_8BCD0F2E 
X-CRM114-Status: GOOD (  10.09  )
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
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 jbrunet@baylibre.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This property allow drive-strength parameter in uA instead of mA.

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
index cef2b5855d60..fcd37e93ed4d 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
@@ -258,6 +258,7 @@ drive-push-pull		- drive actively high and low
 drive-open-drain	- drive with open drain
 drive-open-source	- drive with open source
 drive-strength		- sink or source at most X mA
+drive-strength-microamp	- sink or source at most X uA
 input-enable		- enable input on pin (no effect on output, such as
 			  enabling an input buffer)
 input-disable		- disable input on pin (no effect on output, such as
@@ -326,6 +327,8 @@ arguments are described below.
 
 - drive-strength takes as argument the target strength in mA.
 
+- drive-strength-microamp takes as argument the target strength in uA.
+
 - input-debounce takes the debounce time in usec as argument
   or 0 to disable debouncing
 
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
