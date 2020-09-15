Return-Path: <SRS0=PGU9=CY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF7CBC433E2
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 15:25:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AC5F206A2
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 15:24:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="afKA3/vK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="xWTKaYx6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AC5F206A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dg3iFCAjKu8QFe68ndcic2z6otvTyC2omkRXDS5/UFw=; b=afKA3/vKutU75/7cXEdXs8uxp
	vFfXEsTMxR5JnibeFjHRsQusO350gO/D+8yVn5hjlP/VStQWeNR5SUFoNYbLoU7AX91SCbxJUyjUj
	T0RoZwO/Oy3c7tB83aeyaORft8F2SLeeytoELOxPiSq2LfXrd+4hC7CI1cfKU15+r06FwC5+0RNlX
	1XGPX+BqjWuKhHD7YAQHes728I22NeKyhkO1hEwQ+z9mIhs1SB5sEbVN2+vmwyin1Ott68dxpMe1Y
	2admQyDsCATWDpGFz/X0oh9StiPCrE8m8iD46d59wTVf0vrFV7y+TUNJNBSoswDPRePcWdJ7pumlE
	aY6nRuIjg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kICpB-00083d-RV; Tue, 15 Sep 2020 15:24:53 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kICp1-00080m-2h
 for linux-amlogic@lists.infradead.org; Tue, 15 Sep 2020 15:24:50 +0000
Received: by mail-wr1-x441.google.com with SMTP id o5so3721369wrn.13
 for <linux-amlogic@lists.infradead.org>; Tue, 15 Sep 2020 08:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9zNnAQ2MkHt7BqXHGEYF86S9SXA/6MmyU+PgjnLUZE8=;
 b=xWTKaYx6VbfPz+qYm5gEn7+7VTFsbHwYSGr5nKz6BsWbkc8ps12ulnqThuBlKniQE7
 gjHHg4hmV5luZGDXtL50DXjU+wug6jtuOWW+k5m+HKRPbb+NfCg+re9m5sCozrB/k9c5
 ow53zqmIaehL8m+GiWBJVNdHeh/IWOMzHnf+eWH967qz/Y7cf6n5OMiSvU3O/fvqoQbb
 G/CrXqvOPA3WDn3cpzxjxZ+jXWdyI8V6gDSdnVxTJUOpCI2OoPY3EK3HT/vls5MIM4ku
 LU9rSgcfUmNZYJIN5TJTBUDNjTvqCVSfK8EFt8WkjI8GsxJ8HhgwcNFBtNA83JCOaXi3
 Hstg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9zNnAQ2MkHt7BqXHGEYF86S9SXA/6MmyU+PgjnLUZE8=;
 b=M1s8vMGFg+4VYdxpvA6jFctCndpHPyRLBx9pvKBCkCw3yDVyxBuL5vpyesgTWzBkP3
 xZg9WiO/zOExkJzZexZZXxMnZDjWSMwvpJqUw5J2tGS0ALJNLNnFxmlU81sXGEDFT3fl
 W4rEHClkvID34eSj41wkzStXtV6wrfTf8k1jAddQjUW7xRyIDRtkb5F3dkGXuhHeLjtr
 dXz+U0bKkRiCgEzY8tv2sub7VEBEy1EMJUsGcJ6sD3rg7I06XLwAPG48/4s0Ltaligwh
 SUVbrPy/WTUIrRwqmNwBuUUIz/VaQ0aFeBFDfH9gPaxD6/WS4likYpqk3zCnepEWgYnH
 ZqdQ==
X-Gm-Message-State: AOAM532eUhND4G9inHq1fwUR+fHEd47Bf/PvOV8YXXPuRAOt8rMLBDAM
 cHfVikenc8biRSXCX0lbNEL2+Q==
X-Google-Smtp-Source: ABdhPJy7gz3lErEQQ2j7aNm6vcpF8nabCqJUs/aUyAH2cTBwZcv7mWvyCHSt7Uc17yTTbhIsmttrnQ==
X-Received: by 2002:a5d:5261:: with SMTP id l1mr21709707wrc.193.1600183481866; 
 Tue, 15 Sep 2020 08:24:41 -0700 (PDT)
Received: from bender.baylibre.local (home.beaume.starnux.net. [82.236.8.43])
 by smtp.gmail.com with ESMTPSA id
 189sm25984960wmb.3.2020.09.15.08.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 08:24:40 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/3] dt-bindings: arm: amlogic: add support for the
 ODROID-N2+
Date: Tue, 15 Sep 2020 17:24:31 +0200
Message-Id: <20200915152432.30616-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200915152432.30616-1-narmstrong@baylibre.com>
References: <20200915152432.30616-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_112443_215360_DF121D20 
X-CRM114-Status: GOOD (  11.66  )
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
Cc: Rob Herring <robh@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, tobetter@hardkernel.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Christian Hewitt <christianshewitt@gmail.com>

HardKernel ODROID-N2+ uses a revised Amlogic S922X v2 chip that supports
higher cpu clock speeds than the original ODROID-N2.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 5eba9f48823e..12ba8d074370 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -153,6 +153,7 @@ properties:
               - azw,gtking
               - azw,gtking-pro
               - hardkernel,odroid-n2
+              - hardkernel,odroid-n2-plus
               - khadas,vim3
               - ugoos,am6
           - const: amlogic,s922x
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
