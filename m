Return-Path: <SRS0=hY+l=TH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E6D9C04AAD
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 May 2019 11:57:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7220820825
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 May 2019 11:57:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SoTs0dn3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="KvxZZuB2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7220820825
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=1YTvstNqdgDGzMaN6KtN1229pjUY/t1t4uHpdy63dlc=; b=SoTs0dn3dNxCZr88VO/0/ToceP
	BfjnMsvilL/CWAy4DniAHaEMFe/srkzN+KnEmMT+R4il4XvkuhA0KogZkiim3ZCCaGZ6t4AkFBlvi
	B8UpkfofJ9my7pOjsBPv2WqWxP9iMbnrJsZihfsR6YwluVudGK+XP8PI/iXonjVvw+apVWY09ER9M
	LXBIQcCXIuIrnGe1hyMk0G60/wHK1ZyrBHOqPvYvTzwYXEWpCGxSxDg489rrmNRdH03BSD1Z/MTFt
	elGd3n5S0NKRDKS6FVz3MNYppZMRpO+pgsRtcXHy/aX59JihaO2dyLDWs+OIj+bcmUCXAufznu0hK
	V6l6muGQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hNyiy-0002f1-U8; Tue, 07 May 2019 11:57:32 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNyiw-0002dp-F3
 for linux-amlogic@lists.infradead.org; Tue, 07 May 2019 11:57:32 +0000
Received: by mail-wm1-x342.google.com with SMTP id f2so14764598wmj.3
 for <linux-amlogic@lists.infradead.org>; Tue, 07 May 2019 04:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=cMIohpfoq8ydYsh8yqcuhIMeQYx+QNBx59vvj52nmtM=;
 b=KvxZZuB2MX2DVl3lnqgiZt+iGtjzeQEPj/COF446peA5i69RRFXamMwhvQA1o7OAXe
 yXSCHgvlPe5qLe0o/xmVXnAvDe2bM/A541S/CmyMwog6ZlEivLmsWC/NLIYQ3tdWtYVb
 4u70QE/SUbU0vByzmAgzAJG1KxRjUKcaj2NuOhIhZ/bbMDkRE368iE7xnOtKn3Z8Kt2S
 +rNaRAZmXagI+0cUwgfn4mR1X9+S2ePWl/L1NZqjtDGjdiiBX/cyIf9wlsn41zKM/rOG
 /BReYnLgRTFAa9uaP9fn3YTUqEgnLGJYtvV1OOwTskbJsrSMQvdgC0a69/Coxxuqj9rh
 AEsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=cMIohpfoq8ydYsh8yqcuhIMeQYx+QNBx59vvj52nmtM=;
 b=EuCXKNVYbl0oijw/TOlmhtxi6NmuuAkhkFrasp38optzEg6Ja7CnlZiAg0BDW/K8BI
 qct6sTbs2EiVNl+LEY3Xs66m3gGsB7khlVIKNB6qR/yVr3zZfVTLMUurkiKPP00t1iC9
 CnzMZ7k/44AEZwBXnFoXgCmyCE8rGssJKzhwgVqJl9Eq9tI9k9gcYGPvxGPacBpF96l7
 ifgdw1CiR5w/r/rFqzEcXhTVujuoK+fUHrt2drv8ZLiUTWl2AeMggyddmeUmNQ+6FaU2
 vkjPNy9TRMZq65q6W7XYwgaqm6vdFVfhfZlzRfm/1Tx29uEz+M0coHQG/sRBWVOGZXEt
 J7hA==
X-Gm-Message-State: APjAAAU10hzVJtllUflqzE2k3VqfP+f2GGbicgTtpot+b1+hLjFsO8E0
 sHYWbkkKxEfy8s/ecqOGZjEBLgOeBto=
X-Google-Smtp-Source: APXvYqzmj2Rq5RP6yyQou3bzdy9uJ/w14kHqMcuRNezp/SQ/B/6RzFds9x8L9gkQSErOSrCkXWefOw==
X-Received: by 2002:a05:600c:2298:: with SMTP id
 24mr19775725wmf.21.1557230249232; 
 Tue, 07 May 2019 04:57:29 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id s11sm7120274wrb.71.2019.05.07.04.57.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 May 2019 04:57:28 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
To: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
 khilman@baylibre.com
Subject: [PATCH v3 1/6] dt-bindings: pinctrl: add a 'drive-strength-microamp'
 property
Date: Tue,  7 May 2019 13:57:21 +0200
Message-Id: <20190507115726.23714-2-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190507115726.23714-1-glaroque@baylibre.com>
References: <20190507115726.23714-1-glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190507_045730_570454_EC3008CA 
X-CRM114-Status: GOOD (  10.18  )
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
Cc: linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
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
index cef2b5855d60..84adce9f2a75 100644
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
