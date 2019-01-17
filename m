Return-Path: <SRS0=bSlY=PZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70087C43387
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 10:28:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BC8B2054F
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 10:28:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Tk6SVc2P";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="0E6lQZS9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BC8B2054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T8oNjCW4cWJ4xbXPxv0PwBJGieBmfq+K99Fv1O3r4Sg=; b=Tk6SVc2PtceV8z
	FDZqLpcR12UbhgpfhIhLda7Dw/IrNFoy2ssJB/HD43k3TfOkGRvDKH9Se89ju5x7AZJrL5UeGMue6
	dKGWcsZ2G5vsFgbOv+va3K/M1x9LI7U27eGQXg4K6BKgtuxThreCcD85sg71JIwkH/effj6/OBXlN
	uFJvEZLQWDREfZlVunsORUue6ZXVgBtS4zMb5So/LQfT/2ARijhg3R5vkdCLivRzf2WaTZS5SKAsD
	DOaOMsqTvsLnfsHvabOQgm2ZKnhpb4AhWCdjtQtslomxDyMy0zvoon+L3wRlPFxeenalBf/pECz+0
	1p+SjqdjLNtkKupvL+EA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gk4pe-0004iI-K7; Thu, 17 Jan 2019 10:23:30 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gk4pa-0004fb-4S
 for linux-amlogic@lists.infradead.org; Thu, 17 Jan 2019 10:23:27 +0000
Received: by mail-wm1-x343.google.com with SMTP id g67so451656wmd.2
 for <linux-amlogic@lists.infradead.org>; Thu, 17 Jan 2019 02:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=arU82ZeX78CY4qS47DMaU2XgnlqLaod0sJ3wwiKXdJQ=;
 b=0E6lQZS9zPkUt5xcP+4AMSa1H4NYJRIuU4bWqFMTzdbvL+uRMYXfuhwHxOIGyja/u1
 0LiFUR2AM06a0Vnf9p6n1HwdZdxDOV15xV8f//fuc1jIVx8bcl0vpDbmGpDru/NtBu4h
 ivi6ZDNvISNA/Vm6BJBuvtPxiKjx8LNkbijxrby0qTkY6UDJY+XYg4E3np27WWdJfVqE
 Wp9q3ln9vEQpZXxjN58sUJCTJCvMaLFcDey/nsptyfPsxOdERxu+Aw63B9t9L7R02adf
 u8UM0O4GXVK56hn0aogtwTQOje6YdQrsvIcFPiyu8M82BeR7UaadCCXkmh5iswDy7eEK
 cYzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=arU82ZeX78CY4qS47DMaU2XgnlqLaod0sJ3wwiKXdJQ=;
 b=UKYKqhJLPIsr7kvTjAxJue6hXBbF55qpJNgh/GL0DdcyJhhfiPs5kufZ3cmvHWvFib
 fXTmlwZGa8/s0wNJWgz81ULDohAZm96/diVCblhyJFGF75afpvewKab+FY4hla3li+xu
 82RoiPBHSmf6M1xPCEYHEn7uNi2htEZBmfYgm0bctA/+uAPMr5q1J1TgGPSIEhFdRRna
 4v716Rvsxw6eUvliro6DUwrvmTCQfh6mEps2zjHr7xa07RbWARCRdQWyCtOwWYHBlGiW
 0DHN6jNXBPXwagF41CKiAMIJHkI3nCwzK0lKhsf+/erEq3KmMyOYUKEF4gbUVi/vBIQ/
 0yIw==
X-Gm-Message-State: AJcUukcFtbGs9jOMrNY7OGkzjZzINeNe7FZtokeEtgYG8tlkZZnIvV8D
 8W6kp1RPxe8S1p6a8qLV/lTnqw==
X-Google-Smtp-Source: ALg8bN6+r6UxGkve+2SVzOFUokDcQ6JsEowB8X71IJ2tKx2zjB42OXexglSwjfpg1+jJT/u1rBsqcg==
X-Received: by 2002:a7b:cb18:: with SMTP id u24mr10685287wmj.138.1547720604286; 
 Thu, 17 Jan 2019 02:23:24 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id u10sm66400530wrr.33.2019.01.17.02.23.22
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 17 Jan 2019 02:23:23 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Linus Walleij <linus.walleij@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 1/3] dt-bindings: pinctrl: meson: update register descriptions
Date: Thu, 17 Jan 2019 11:23:13 +0100
Message-Id: <20190117102315.1833-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190117102315.1833-1-jbrunet@baylibre.com>
References: <20190117102315.1833-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_022326_170216_5FE64256 
X-CRM114-Status: GOOD (  13.20  )
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
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

like pull-enable, pull should be optional has this region is available on
every controllers. Also, the g12a feature a new region "ds" for the
drive-strength

All this region thing is one big mess. I suspect that there is only one
big GPIO region with holes in it. All registers between the current
regions reads '0' so it is probably just spare space to handle more pins.

Since we need to continue to handle the existing controllers, switching to
one single region now would not simplify things. However, if more
organisation layouts and features keep on being added, we may have to look
at this again

Fixes: 3cd3c83f6752 ("pinctrl: Add compatibles for Amlogic Meson G12A pin controllers")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../devicetree/bindings/pinctrl/meson,pinctrl.txt      | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
index 82ead40311f6..a47dd990a8d3 100644
--- a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
@@ -23,11 +23,11 @@ The GPIO bank for the controller is represented as a sub-node and it acts as a
 GPIO controller.
 
 Required properties for sub-nodes are:
- - reg: should contain address and size for mux, pull-enable, pull and
-   gpio register sets
- - reg-names: an array of strings describing the "reg" entries. Must
-   contain "mux", "pull" and "gpio". "pull-enable" is optional and
-   when it is missing the "pull" registers are used instead
+ - reg: should contain a list of address and size, one tuple for each entry
+   in reg-names.
+ - reg-names: an array of strings describing the "reg" entries.
+   Must contain "mux" and "gpio".
+   May contain "pull", "pull-enable" and "ds" when appropriate.
  - gpio-controller: identifies the node as a gpio controller
  - #gpio-cells: must be 2
 
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
