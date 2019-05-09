Return-Path: <SRS0=XvYc=TJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FCB4C04AB1
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 May 2019 16:29:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21E632182B
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 May 2019 16:29:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jOs3tHFx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="VxfFwifN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21E632182B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=QKa2sO9N60Ts/jD2dDwh+YXLNzM9aGfIow2suuHoFlU=; b=jOs3tHFxxbaGElRLMZSrsVldwC
	WQF2JcwUPc8+P3mv5ekb15qE+ZzIeTldsgrPgWbFRU+dDdXpSxVrm27dcJAI3v48Z5qDKZ3Qh7nxM
	uMfNvSQKJK2WLnrExFHPq4Tb5Yh+qJ4h+GGmw68nm+ZtezK6J1DXWvKsJSQmA4yItLNo//J/HnT4e
	84Z781FQdP3CR0xGMPrXAk5rCMTLSFx+6JYKGo02NJRKWH5MgdQmDi5+d/S8Hknx2awHYtGL+FuEO
	Z1MfMk3691+N+TuQ2j/WvsqCKc1uH8t//vXD9w8qr63sxsmz0gBzxwfTn0DN/MN8AG16MYrqVOHPX
	AEWcSnZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hOlvD-0005xM-4C; Thu, 09 May 2019 16:29:27 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hOlvA-0005vY-QC
 for linux-amlogic@lists.infradead.org; Thu, 09 May 2019 16:29:26 +0000
Received: by mail-wr1-x444.google.com with SMTP id f7so3954678wrq.1
 for <linux-amlogic@lists.infradead.org>; Thu, 09 May 2019 09:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2c6x2f6eeQDgR5pR9v6L40zLzoX5XJYrfYvIkaAjp04=;
 b=VxfFwifNwbqNi2XzCiT6xL1zwC5Abv0LgBZ2PPzyVD5t6T2sMYVCKVkPVeu8S33/Uc
 oDw3/LViauL4eGriZ8a6El5onMLvO0Q3WMu3DQnwnqdBKx4APhMrnNaCl/+m3pPyIKwn
 E05U+8mckVFQ36oriVIhhE2XEqThDMGCzRoPd/otk+V5sVRsGNpBSvlM6JbCc1z1aALV
 +9QkG6oqIs39hJDbq6E2nMiNImliQjj5frZSLPM8PmRYDI0gFw3Io2450Qyl3Na9ApCI
 4lWoaTuNTNfoOuG3Ta8JRgQ4d04USPVuDOsTIP/cQmx+IpKgxxjmAiayrns4BtMwMq8C
 coBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=2c6x2f6eeQDgR5pR9v6L40zLzoX5XJYrfYvIkaAjp04=;
 b=e2JQZFLXx+z80vWy3FFmZUZxaGLwx+GgyHmKXcf5m8VEm4I9itQzEfvz9mVtQFHyKt
 EXUR+Klez7+ILLudigcxRorYGbxD2eC/R1+pNKYOHxPFJLws5HnBVU0ap7wNhWTMII6F
 4L2lsXYkOOSbXYtLrvPO1N4vvPrBWIr5bSs3yOexAwl6kYGp4u5uwzFvGxc8imGLU+i0
 tBMIlEWo6cOH/YaLqt7v6qw8fd4KIijeskF+ys/Q4HHDcCMHHI1vc3syGNjZvWKEISGj
 SMAwbueFBrnuhweN6j9P+4/7H6zUqMLODxJBeeBL9uO/RojCUKDFvhPiS0Bq66YKqm8w
 ujSQ==
X-Gm-Message-State: APjAAAXldzLULsu2u2etvAm7BJ//UalItt3FOSxY7ZceEyxMB2w63zj0
 1WG0pMS3KJjDpwlcQBwkhP1O2g==
X-Google-Smtp-Source: APXvYqzVL8+3tvK+pyR0Yf8H/ohoHNF9R/2o0IP5EFUiAuUIeVNuMQCC7AQlvEtrp/uEtg6KXNR2Qg==
X-Received: by 2002:a5d:628d:: with SMTP id k13mr3878033wru.319.1557419363588; 
 Thu, 09 May 2019 09:29:23 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.home
 ([2a01:cb1d:379:8b00:1910:6694:7019:d3a])
 by smtp.gmail.com with ESMTPSA id k2sm4116297wrg.22.2019.05.09.09.29.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 May 2019 09:29:23 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
To: linus.walleij@linaro.org,
	khilman@baylibre.com
Subject: [PATCH v4 1/6] dt-bindings: pinctrl: add a 'drive-strength-microamp'
 property
Date: Thu,  9 May 2019 18:29:15 +0200
Message-Id: <20190509162920.7054-2-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190509162920.7054-1-glaroque@baylibre.com>
References: <20190509162920.7054-1-glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190509_092924_846553_5A7388A1 
X-CRM114-Status: UNSURE (   9.80  )
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
 
+- drive-strength-uA takes as argument the target strength in uA.
+
 - input-debounce takes the debounce time in usec as argument
   or 0 to disable debouncing
 
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
