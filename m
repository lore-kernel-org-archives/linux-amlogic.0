Return-Path: <SRS0=pKyR=WT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24779C3A5A2
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Aug 2019 07:22:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E95EC22CF7
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Aug 2019 07:22:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iafqv9k/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="GzenkpsD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="mVmbh45b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E95EC22CF7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3n7HzHAYNMbH2CrntRZf86fvglpJyqHnkj6vYULA00s=; b=iafqv9k/EAF5O/
	vI9mzQ/RQXD93VVNBDARiVROfUK7rpzI9NWPCWG983YnucYNxm9PgStMxbgb5BNBnGl0jPxL3uMpR
	CaASnA4To4DzoB9XPVkTcS4OI8pvKZMmTRbzBFWOWFyi3hiQttREjrVLEJ8Og2N5jQ//UjOFr4zbT
	NnWzBIDlRN3b3yS6vfH5qgh9WqudTBLSc1F7V/b9zB1462ImET9i2Lh0vmeQT+zYhUYLwn+0/TCvF
	En1mOcuS7/e2nN6P2THeU8v33t0fEMgvavHu60Of0LwXC9aDkEVXDiJODWVvJwoji9kAxw3dj3u7M
	WK8yJPR4mT0ZRdUcrkew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i13tW-0005YT-3O; Fri, 23 Aug 2019 07:21:58 +0000
Received: from casper.infradead.org ([85.118.1.10])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i13bM-0001Da-Gj
 for linux-amlogic@bombadil.infradead.org; Fri, 23 Aug 2019 07:03:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oQGMBKaIheYnXF/WLoo5OGX0tV7WLbdJIx9rXGOlw/k=; b=GzenkpsD4vVLXUCXv6lIRwBQ4W
 3+TRUGkUJffg57UiDQZFUBhGf5JzffyNvB7LZv2XcKfT+8l0x8oIdJ4f893rdNIOT/7egXncrjOqx
 C0ZgdxrchBmd+oVS1vHAnLzdZKASEwSO5Pspo54S0bchLfShXC+fIKqSNEE+8S+VZiEtd0Ao5GQGc
 QpFPrcFR2an6IjXA6yFVXhX1FIFPkggM6IxLNQXMGNpDxRz3BT8JcnbRCVxP1P5XePLY3/j1Q8hJU
 ovlpiHbWIPCHKYecr06ubAbVodBGS/pb/h9wQ94SIr43bquUoecQTC6AOnAVdok2rsWTFUTiVTtgT
 M6UQW90A==;
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by casper.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i13bY-0001fT-8W
 for linux-amlogic@lists.infradead.org; Fri, 23 Aug 2019 07:03:27 +0000
Received: by mail-wr1-x441.google.com with SMTP id t16so7615693wra.6
 for <linux-amlogic@lists.infradead.org>; Fri, 23 Aug 2019 00:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oQGMBKaIheYnXF/WLoo5OGX0tV7WLbdJIx9rXGOlw/k=;
 b=mVmbh45be4lh02qKYGB1ppWPUAXqpYSlKJfU62Y7zJ1xdVVEmByScDchKh+pHwEFRb
 5oAhmWgIVQibnTwD9F21vmyPl2JHo+goiEn3kA36QXesSw6b4tQelRGrTJ/mdPn5WGpi
 IazIx87rcse7UykBS/zFCfoQmR174qxqGeYUXDAXhiTkGrGMoOWgB5gHqKWQjh5zczK0
 Tdc3b3WJSAgyvnZlF6SGFhcd7F4KuIj/8otVnrc/SZjAdChl3RB8qgpXP3EUbwQEDUdg
 QlpVdTTr8ADEMzrwyA5MWOkVarTraqRMKR/Y8i1ZDTFGrSbwKSoprGIUh/0e2pmAEtN7
 uCjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oQGMBKaIheYnXF/WLoo5OGX0tV7WLbdJIx9rXGOlw/k=;
 b=aQkVwClxVOWlaXSB9RsRh+nLfOwATS7t8cn6iNf0HHJeOxtDAsnopF3SzySBhnkSqC
 RCmxFDT6/ZUgF939TRa0/+f/m8cPNTSmW8jvnK0IefulFdmprQw/gq35APsjEGbJieYh
 Px6N/i0raIGpbSjBy5Yd/5Yz1iYG3hwsz8XMEziItCRvAWh0yXi2clqmPm3240LFXk5E
 KjkhTxfNhyVzqKjD4HOmJAZjmPoc+pNUZN7b5x3yhg5D5156CZWB4+sAS858kJewIk5k
 1D1xeGEZTy42NDhdiP1Sjf4cQg6sk1G6442oiYwohC/wZAJEXfH9tnx4Dj71SSKS1C/o
 4fiw==
X-Gm-Message-State: APjAAAWJasqyHgCYdyZ7nkMIUfO5WaWPfaoAc7FaEyGHW6KHt1dYnSri
 SfatPySW+lu+BHY644h/IBtIvQ==
X-Google-Smtp-Source: APXvYqzwxUVLowuS3xao7n+i7OlRwLWmah+4GSU46RDQCt7NTemeu1LZlIIg7p8uweotJYEbZaHFCA==
X-Received: by 2002:adf:e4c6:: with SMTP id v6mr2982750wrm.315.1566543782721; 
 Fri, 23 Aug 2019 00:03:02 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id a26sm1741833wmg.45.2019.08.23.00.03.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2019 00:03:01 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [RESEND PATCH v2 09/14] arm64: dts: meson-axg: fix MHU compatible
Date: Fri, 23 Aug 2019 09:02:43 +0200
Message-Id: <20190823070248.25832-10-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190823070248.25832-1-narmstrong@baylibre.com>
References: <20190823070248.25832-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190823_080324_317441_706F867E 
X-CRM114-Status: GOOD (  10.26  )
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This fixes the following DT schemas check errors:
meson-axg-s400.dt.yaml: mailbox@ff63c404: compatible:0: 'amlogic,meson-gx-mhu' is not one of ['amlogic,meson-gxbb-mhu']

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index acc2feb8fd89..82919b106010 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -1118,7 +1118,7 @@
 		};
 
 		mailbox: mailbox@ff63c404 {
-			compatible = "amlogic,meson-gx-mhu", "amlogic,meson-gxbb-mhu";
+			compatible = "amlogic,meson-gxbb-mhu";
 			reg = <0 0xff63c404 0 0x4c>;
 			interrupts = <GIC_SPI 208 IRQ_TYPE_EDGE_RISING>,
 				     <GIC_SPI 209 IRQ_TYPE_EDGE_RISING>,
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
