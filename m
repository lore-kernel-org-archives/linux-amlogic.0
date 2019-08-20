Return-Path: <SRS0=f3iC=WQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3599EC3A589
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 07:58:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B7A5238D1
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 07:58:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TlZL+ul6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="QBVD7UH6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B7A5238D1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mhHMndo4HYPS8NP5QWbqKjBsiM50ZlHdUSskRGVe87M=; b=TlZL+ul6ZxLP0B
	q1S23TaA84aKjRc+SEjSAM21O0b9Ft5HZ7Domqx3d0Z3wFEwbzltcE2ketIYJp6RNBSLo0r9dcaVB
	xwf3Q6r7G9CRilAJuEYlymyvUvMzvuAYPcrzmSnIXFLxWguaH1W9x05sZ+wHwbHpCr+cd2MPHs6jb
	j0H4rhwqncNpB8L4bF3eZo6+3uEKwHVA7GsNyJaz+PanJfHVljZSogaoT/vM31pS+c7jtHDMmiwIz
	9hTtA3jiAHyhqrPENWeqiW3O/JivlE56nL0VPnZi7BEycMVEGGZNHMK+9k9KUwYm8c28bHodVfS3J
	Iyc04wetL3qP6c98l8ew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hzz1p-0000Tf-Sj; Tue, 20 Aug 2019 07:58:06 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hzz1b-0000Gn-4y
 for linux-amlogic@lists.infradead.org; Tue, 20 Aug 2019 07:57:52 +0000
Received: by mail-wr1-x441.google.com with SMTP id j16so11316536wrr.8
 for <linux-amlogic@lists.infradead.org>; Tue, 20 Aug 2019 00:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Tchdtmk5F7h2SP8mzdRtJmsq+fYnHuGWtMSSIw89WGE=;
 b=QBVD7UH61GHuPXpXQft/phCUoJkwNJ8e6e3nCTfc/1NqFxhFr4j7SeAnWxYD0GG1eH
 FxbH5XW57kDWs3fnFMongqoQ1DlvaP2HEF+QwPAVQ/lQo5GFUKwp/SVwc4BFQeTPD30K
 o0Miqmc2rj+PSNaKUrMIA2jxslfSsGPhlViWXng4HVm9przmpP98RN6ezcruNCRjDdFs
 FIoIFAwbfyjYsS9y6w/9wA7wyz/s/Rtmx2PuomRK8+nMZRr9Ege32OHBeVjZ7cegbc/z
 vKkrszkEVli6JHEU2P4bj0/hG/Ov8R38U/z0nQYeqal47JFkGa9XWbk9pl/x0gSf+6B/
 IsrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Tchdtmk5F7h2SP8mzdRtJmsq+fYnHuGWtMSSIw89WGE=;
 b=MaVxHEGND5IBJQPFzCwb/WplyD8aWu2jGA5kNviAatYbOG9/cqXDLGNbAostqbqo7y
 uj18iEV6zx+RdqGS7NaK2RE2ndsVBLZtHQX/nDqTjMXNBnsCWtYbjNmIT7uF/U/ugSNG
 aaOlpMPmvGysWSIhH6RyruxvGx+2uxHSe/Pn3k6WfnO2c6xKoxyIN6t1LM7+Vv1AKXM8
 SY8+i7eXGPR0YnSHD8GfiELCx3p1EOVgIzEVMIxFd2c9w/I/HbPFylA7QPxNzwo3sb2V
 igdhRnU4wEmAP3Oyh8xACmUwIAsxRGf6e7S+oQyW7ARDMeC76LQPKtBHZYVrV6yJFZSo
 7ptg==
X-Gm-Message-State: APjAAAV0dOW17VNg8SDrz4j6rcVbzShF71w8uXDJ5CRrAwp0nTeDgBUP
 Ya9l8EJPdfqSYujfb9dXYzGEvw==
X-Google-Smtp-Source: APXvYqz35DSpTf0iX8quJPKfw+8fSiZAcN4YJ2/eier/D7uQL2HGvfnfx43BsLej8/27j+Tkzhst0Q==
X-Received: by 2002:adf:dfc5:: with SMTP id q5mr33919384wrn.142.1566287869291; 
 Tue, 20 Aug 2019 00:57:49 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id q24sm1506467wmc.3.2019.08.20.00.57.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 00:57:48 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: davem@davemloft.net,
	robh+dt@kernel.org
Subject: [PATCH net-next v4 0/2] dt-bindings: net: meson-dwmac: convert to yaml
Date: Tue, 20 Aug 2019 09:57:40 +0200
Message-Id: <20190820075742.14857-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_005751_196860_D86058B1 
X-CRM114-Status: UNSURE (   8.24  )
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
 martin.blumenstingl@googlemail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchsets converts the Amlogic Meson DWMAC glue bindings over to
YAML schemas using the already converted dwmac bindings.

The first patch is needed because the Amlogic glue needs a supplementary
reg cell to access the DWMAC glue registers.

Changes since v3:
- Specified net-next target tree

Changes since v2:
- Added review tags
- Updated allwinner,sun7i-a20-gmac.yaml reg maxItems

Neil Armstrong (2):
  dt-bindings: net: snps,dwmac: update reg minItems maxItems
  dt-bindings: net: meson-dwmac: convert to yaml

 .../net/allwinner,sun7i-a20-gmac.yaml         |   3 +
 .../bindings/net/amlogic,meson-dwmac.yaml     | 113 ++++++++++++++++++
 .../devicetree/bindings/net/meson-dwmac.txt   |  71 -----------
 .../devicetree/bindings/net/snps,dwmac.yaml   |   8 +-
 4 files changed, 123 insertions(+), 72 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
 delete mode 100644 Documentation/devicetree/bindings/net/meson-dwmac.txt

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
