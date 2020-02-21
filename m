Return-Path: <SRS0=5fWL=4J=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10AF8C35641
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Feb 2020 09:16:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F82C20679
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Feb 2020 09:16:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LryeCER0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="CNFUz9Xm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F82C20679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SfqnDiJCFdU7jqZbYN5HFten4ExRM+SKvNfi7Oofvlw=; b=LryeCER0y9FDtl
	1CZ7Kbq7g9frcvDd0uab3BlvgKh6QXda6CCq4sEb4rNPhtqlyJW6kfuL6RxNnmsp+g3+ih8v8mWEs
	IIyLNm4iEcnNAn5ZDI9bTnt/xHVe3mHZV19AiS1ePxkiYBYdUWaP9ZiXFohaNMOsZ+Wfyv2zzbFPJ
	wReRtqyQm+IC8EPBXqsR531XV4jA6b5qi0zmY2+npkHeb4wF4fDNlFPczxMg8ZmT5f+WzYuE0GcXI
	E/m8yP943xpBnXAwA8nECh9QIbQLXsgr+lETjMSxRFFcGFKZ/0Lik6lFoC240kUleR5fcK2Vj+iL4
	ib0Zkyy21ZzcXGnAFBJA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j54QN-0004a3-KZ; Fri, 21 Feb 2020 09:16:43 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j54PP-0003Z1-5J
 for linux-amlogic@lists.infradead.org; Fri, 21 Feb 2020 09:15:45 +0000
Received: by mail-wr1-x444.google.com with SMTP id k11so1102573wrd.9
 for <linux-amlogic@lists.infradead.org>; Fri, 21 Feb 2020 01:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m6wyWMfpOh6h06xGncQF4ABfwmrzTVZCtOS7mfMUTXc=;
 b=CNFUz9XmIGI1z3rF1pEQXHmcssshI74bztcBFdr5a3SNe8JI0QnKTDTONXkWHH9iU/
 1eebI/r4y8loG5bVOhU6pdkLGCN5nrE/3kav0FjA3/aL2kZW+YnOi4bEfufZeb1YlMe2
 Vwvu4n7MSvGJTpXARLUUFFOnVPTgcNtI9q/afAfvgXfFAs6z8e8QmA5EoXZiVzZYOr+H
 tO8mSVpr+1CctLXYHLI58XWXawcWuBeLuWxDaEDInc8YpVYiJnDdPi2XAynDIlszY61M
 vumDIplpMEdW772nhgM3/9AqF4XsghWLQOM7sMw+GZGCmRJG+LWXJDKWwAGXw4hMqCWw
 7J7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m6wyWMfpOh6h06xGncQF4ABfwmrzTVZCtOS7mfMUTXc=;
 b=kiQpo7b2tl1NIDu0dgnuLZJhxzkDiYkUtx0ZblB9z4EQ1JiYZRzr74gQ5ZcUhDdpu+
 d6doStLJQ9DVBi31FIckhVLVCIFGtoOYwflhv3cahWygceZI5u0MYs13KTw6/68AHs5f
 bxSLVbPP1Xl83LdJUg5zL/i7xbcx2xiHbvfJX0P2KgCWiBgO3Wn/dROrGtg0t22cbqSH
 EN8gqPPVPs3RDk91mBRD42gMFxpXhDtgw5zvcudt2FdR7pjwB+oKe5IW1QVlnQMgJ9LE
 xXGSjIBDT8BfPy1DNOeRNa/gW+EmbXaBjP5z+VyJ+/1K2tpkqE2gIKu7yB+2vu6V+aTE
 ubvw==
X-Gm-Message-State: APjAAAWnLjehsZiMEoH/pth8oUz5ORb1cXW9MdmkBFHwkHl98BVv3aou
 gZcmI79qrQaNWvAhwZzm+nllGg==
X-Google-Smtp-Source: APXvYqx/yoZp80GSQF39ZZMKaradH9pBESsqZ0SCSnPQWB0IlpiAxndOzpHoTVL08u7ug6/J7HxbTQ==
X-Received: by 2002:adf:db84:: with SMTP id u4mr48270400wri.317.1582276541693; 
 Fri, 21 Feb 2020 01:15:41 -0800 (PST)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:4ca8:b25b:98e4:858])
 by smtp.gmail.com with ESMTPSA id
 o15sm3257837wra.83.2020.02.21.01.15.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 01:15:41 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: balbi@kernel.org,
	khilman@baylibre.com
Subject: [PATCH v4 3/3] arm64: dts: g12-common: add parkmode_disable_ss_quirk
 on DWC3 controller
Date: Fri, 21 Feb 2020 10:15:32 +0100
Message-Id: <20200221091532.8142-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200221091532.8142-1-narmstrong@baylibre.com>
References: <20200221091532.8142-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200221_011543_284050_90DDA6A5 
X-CRM114-Status: UNSURE (   8.89  )
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
Cc: Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tim <elatllat@gmail.com>,
 Dongjin Kim <tobetter@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

When high load on the DWC3 SuperSpeed port, the controller crashes with:
[  221.141621] xhci-hcd xhci-hcd.0.auto: xHCI host not responding to stop endpoint command.
[  221.157631] xhci-hcd xhci-hcd.0.auto: Host halt failed, -110
[  221.157635] xhci-hcd xhci-hcd.0.auto: xHCI host controller not responding, assume dead
[  221.159901] xhci-hcd xhci-hcd.0.auto: xHCI host not responding to stop endpoint command.
[  221.159961] hub 2-1.1:1.0: hub_ext_port_status failed (err = -22)
[  221.160076] xhci-hcd xhci-hcd.0.auto: HC died; cleaning up
[  221.165946] usb 2-1.1-port1: cannot reset (err = -22)

Setting the parkmode_disable_ss_quirk quirk fixes the issue.

CC: Dongjin Kim <tobetter@gmail.com>
Cc: Jianxin Pan <jianxin.pan@amlogic.com>
Reported-by: Tim <elatllat@gmail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index abe04f4ad7d8..87b9a47a51b9 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -2220,6 +2220,7 @@
 				dr_mode = "host";
 				snps,dis_u2_susphy_quirk;
 				snps,quirk-frame-length-adjustment;
+				snps,parkmode-disable-ss-quirk;
 			};
 		};
 
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
