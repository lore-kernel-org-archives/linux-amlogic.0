Return-Path: <SRS0=Jp6n=EB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40F74C2D0A3
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Oct 2020 13:49:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94E2A21D42
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Oct 2020 13:49:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uQxwjMCk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mZ4vQMuO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94E2A21D42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZETTYjomxOFczqb46bbg7E/r7YeAhgZsjUqCfngQBwc=; b=uQxwjMCkP9o5pjxuP1YAL4yfwy
	ndZEhlO/85ddCWMd0qLjvEsG4bfgdysFAMmeZ5wBggMmy0Xi7bAeC2ODhqpr4Dxwcsba4zHdKeAyW
	XsQ/g9Ps9F1aT90MtK1cSnvTK2bkbtTJhNcC7HP0ge2tv8yJt/99tXrXwc/SUhRFdA+q8qPo3/2jn
	fWghSp6rJHLmxaagfeHc+KseVQYMz47hQkqZu0e6wisJORx3hFDNKectkmumGlB/jTT3/pjaYwKjZ
	5AvKHLrOhnL9Hf+TJ/+OTin4BsOGZUsEh2OjNuh2KHhi6+m4vohPbqk8VQpNSfyMNwRvq2emOuAJX
	WiPbINUg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kX2sY-0006EX-Kk; Mon, 26 Oct 2020 13:49:42 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kX2kJ-0001yg-4U; Mon, 26 Oct 2020 13:41:24 +0000
Received: by mail-wr1-x442.google.com with SMTP id b8so12642178wrn.0;
 Mon, 26 Oct 2020 06:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=6ig/zuFGYK5p0hWRfkZP0StQyYJ9vBPAEaTb1VFLW0k=;
 b=mZ4vQMuOl9Sj2HHJt80Aan9NNJGvQuC0Dn7XBsEHgkdwXjDyOL80+aAze1WU16smab
 8FB+1aQHFm+NMARBSVpdGVa+rSIlFqqQE/YqJ0Fdfu/seO8GzF8kwQzSUOf7qZ9aXa5l
 v75AZcbl8fj3dNxPpc4hUex0JnX7bOWsKzNL+kVUw+3n8eCJgh2ECxgGWcGtemIbFl7r
 D/aOwCKSZ/maXWvzLFcre6K9vc72i0kUaRQM9NOq1q60//6iYL8YMT3nSLSe5tPjv259
 l5uSpUcflouEE8n40hJipsWufHhSb6ZC/T8xtZ/aBrH0lWi8HyqN0j6O8zTExZ3rEh1m
 dS0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=6ig/zuFGYK5p0hWRfkZP0StQyYJ9vBPAEaTb1VFLW0k=;
 b=RK7dGdZqwARR0Q6YQtCuxcWuiNfRhk4T3z0u3ki19+18MEMhA5D4KiEI++Lg6bZWX5
 8MMlrFZz5EF2G6M2XchL51qV0nWorklkTV3O0Mwa7BbXGLYSAeSpjg9/i4eNiXWUoTy8
 foRqXTA6JWyuZ3T7FRITedBqUCQA9bpxA7TrpjrlNkeWsp7+I81ELBOoP7tSWYMSlKUr
 I6ns7km1eBORBgWPdXBy2Z7xW2V/81ZhlA+3z1pIYbv0C8SVwo6O4mdAgwAiUdkfo3KM
 kTPK3D5OvML1UZzHi83CKx2bvw6lu9hhtSsgyrLb8knSvZpMafVkrV+IgFcmUTKB19ex
 9l+A==
X-Gm-Message-State: AOAM5329BtVsA1wsrCty/8AlOFb/I4O52ntYE1qSLGuPZS12uTPKIoZW
 jGXN0E9zNTPueW65+8zvc/M=
X-Google-Smtp-Source: ABdhPJyRAlNz7XRHfwdZyf/ZfYQ4mRtUc2hnTBcKVfMsne3We7JPpO++HsDFqyafwJokZO2KDhAZ/Q==
X-Received: by 2002:adf:f986:: with SMTP id f6mr19097577wrr.38.1603719666637; 
 Mon, 26 Oct 2020 06:41:06 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id q2sm22780129wrw.40.2020.10.26.06.41.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 06:41:05 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: meson: remove empty lines from aml-s905x-cc v2 dts
Date: Mon, 26 Oct 2020 13:41:01 +0000
Message-Id: <20201026134101.10594-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_094111_481402_C798F72D 
X-CRM114-Status: GOOD (  10.87  )
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
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Fixes: 63fafc5a046b ("arm64: dts: meson: initial support for aml-s905x-cc v2")

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 .../boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts      | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts
index 675eaa87963e..9a3c08e6e6cc 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts
@@ -84,7 +84,6 @@
 		regulator-always-on;
 	};
 
-
 	vcck: regulator-vcck {
 		compatible = "regulator-fixed";
 		regulator-name = "VCCK";
@@ -124,7 +123,6 @@
 		regulator-always-on;
 	};
 
-
 	vddio_card: regulator-vddio-card {
 		compatible = "regulator-gpio";
 		regulator-name = "VDDIO_CARD";
@@ -195,7 +193,6 @@
 	};
 };
 
-
 &aiu {
 	status = "okay";
 };
@@ -207,7 +204,6 @@
 	hdmi-phandle = <&hdmi_tx>;
 };
 
-
 &ethmac {
 	status = "okay";
 };
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
