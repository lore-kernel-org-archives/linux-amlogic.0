Return-Path: <SRS0=N67E=WS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81F90C3A5A2
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Aug 2019 14:25:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 583EC21655
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Aug 2019 14:25:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oQc6EDRs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="bLOp1aL7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 583EC21655
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LuF17es/v3SlcOq16toV8eCiDRjYbLlMqjE/Cr0MS7I=; b=oQc6EDRsi4wcN/
	c/sHbdaiFZdAuB9E+v7tCoYqtbZudPzDU+Z1lZO0L4KhM+lppMH+5Xb7m0ccKh0PgjreWdcm9HUSI
	p27AsSk0klAErK8cK63iqGFKLD7wLZEIKz+ORgx3I7CNP5Osds4cbwrSoOsBe7TwVss0JQqPlpy/Q
	6vcolDanfDHDP9J7KWVnIe4gj7+CLT0x5njFB1uT6opjmna4F/dzcaW+IRJ4czB0IkMhaMAb3MRCe
	p7ZgYyZGpD8K5GmsviULYE7bqb7S9gqVBT62oEeCHgUTKb/SttV7jELaLbjBAygxhb/zEs7G2xDo2
	pkXyWoBh9RoZVGRE0DZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0o1T-0001ud-Rr; Thu, 22 Aug 2019 14:25:07 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0o1N-0001GA-4c
 for linux-amlogic@lists.infradead.org; Thu, 22 Aug 2019 14:25:03 +0000
Received: by mail-wr1-x441.google.com with SMTP id y8so5610685wrn.10
 for <linux-amlogic@lists.infradead.org>; Thu, 22 Aug 2019 07:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=532R/ZWuiDeQURoM9QVstK3VNVhlUb1b5wMTdcD1y6g=;
 b=bLOp1aL7F9THqfOV7Xme5zs7Clfg5QY4THoC3eh0rpK44IWqhwMShz0XtR/iqKv8kc
 NcQFoFY3MPRkiYgSRInPWeijRXC5S5f1rqLaSjPnKUoRSjG+eI/aOj7CvEefd4KmH/g8
 UDbf+h2tWFy8sjTBM8VbqE7RXx9e/19Xz+PxO7P48ixBT665fCzijh+eVYDnKaQUAXbp
 boZg+ini8cDQ9V7X9MhxT/SQPvbX6PZ3XuTgdtOJXKKwfG2+F7UZUNv78y7T6ckNRVMn
 H3BTICzwaKMl8djlpygj5xvQ9ogRv12RtOHsHbmYkOisf7LLjUix1ka3IbRQAxM9GhbO
 SDbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=532R/ZWuiDeQURoM9QVstK3VNVhlUb1b5wMTdcD1y6g=;
 b=VxeEuRJHjMJGWQlgeyke9jQFFVm1lgqoeuP0GGdsCz76Jyb6ldeDv4lUFJ65wTKwYm
 VN41e8rMLTSerVAbz3l668fLTl/RW2THhbC1RkIt5xIV1vDWg4MlFb4I362wKe5mAlmf
 pXNi7ImgkwSeTGKbd5W4zPp8xUhYgEFX7nSj2Mt0ez3BF1ivMAXhH7/CSUXyC4H6E6Ii
 yboItnaRsCujLJAS9jj3tJQND7obGfTC6F989pwZC44A9l3WZZT9ki2g+nAk6T9ZHmol
 pDmYTADqMVpT5wxkUncJKPwptzALkb4942HWVrRHQSVPkpU77/VvJD6i40gb934iJzD6
 myPg==
X-Gm-Message-State: APjAAAW4gVRG0dv5ww6t6+MKw29uuVKB2aKL08zRhSm+LeWDnmaTmD9A
 EiNYCO/eYrDT1BMuB6skWO1fHA==
X-Google-Smtp-Source: APXvYqxNvQfiW+pmE3LmlxBbVlKlHM6v/pU91KToTSnslnmLS0Z+eHTKFQz+xNljPf3GF3C7gC2pJQ==
X-Received: by 2002:adf:cd84:: with SMTP id q4mr25260602wrj.232.1566483899812; 
 Thu, 22 Aug 2019 07:24:59 -0700 (PDT)
Received: from bender.baylibre.local (176-150-251-154.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id d17sm25806547wrm.52.2019.08.22.07.24.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2019 07:24:59 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com,
	jbrunet@baylibre.com,
	devicetree@vger.kernel.org
Subject: [PATCH 1/6] dt-bindings: clk: meson: add sm1 periph clock controller
 bindings
Date: Thu, 22 Aug 2019 16:24:50 +0200
Message-Id: <20190822142455.12506-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190822142455.12506-1-narmstrong@baylibre.com>
References: <20190822142455.12506-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190822_072501_176964_D322492A 
X-CRM114-Status: GOOD (  10.65  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Update the documentation to support clock driver for the Amlogic SM1 SoC.

SM1 clock tree is very close, the main differences are :
- each CPU core can achieve a different frequency, albeit a common PLL
- a similar tree as the clock tree has been added for the DynamIQ Shared Unit
- has a new GP1 PLL used for the DynamIQ Shared Unit
- SM1 has additional clocks like for CSI, NanoQ an other components

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
index 6eaa52092313..7ccecd5c02c1 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
+++ b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
@@ -11,6 +11,7 @@ Required Properties:
 		"amlogic,axg-clkc" for AXG SoC.
 		"amlogic,g12a-clkc" for G12A SoC.
 		"amlogic,g12b-clkc" for G12B SoC.
+		"amlogic,sm1-clkc" for SM1 SoC.
 - clocks : list of clock phandle, one for each entry clock-names.
 - clock-names : should contain the following:
   * "xtal": the platform xtal
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
