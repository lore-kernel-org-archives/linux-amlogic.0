Return-Path: <SRS0=n5rD=RO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A0EAC43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Mar 2019 09:58:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57A9C206BA
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Mar 2019 09:58:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ugp+l4Pm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="xl+G+6NW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57A9C206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hp4HaIDmEloTUCz+6bfr2g15NLHKW5DpyLoQnsKRk28=; b=Ugp+l4PmanXUki
	zrmcrsFc1tGq0d19m6ne5x4R1jRiLreHVHXrUsUosLhzGKoPeRphfE3fgTeXhmCJtPKrJNQdyvsew
	uzE9JxiQY1ccHUs6pemk78LYXh57YL4x0Y1K9j+sZE4sMpm8SNW4Jw2gX24qnFvbcbxck+e6ppThf
	AOxzSuj4f0abCjxSVziWGCvj5XmsEZqbNlRpn8AYibUB3bbRhZF8f+2EXy8aGoClm3T+c76K436LZ
	Dh6ZTWagIrqGvS2FHp2yugkj2JWINnyMWxkuZ1XLLgu/RTBCImL/7kEDo+tfUKLEG1yT2bBfw0WRH
	HeATrNngFhcK9EjyBQ+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3HhI-0002ry-Sq; Mon, 11 Mar 2019 09:58:16 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3HfW-0000KR-MZ
 for linux-amlogic@lists.infradead.org; Mon, 11 Mar 2019 09:56:33 +0000
Received: by mail-wr1-x442.google.com with SMTP id w2so4295457wrt.11
 for <linux-amlogic@lists.infradead.org>; Mon, 11 Mar 2019 02:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Udu5uhezWydKZu4K1HYQtiJgtb0stOPsgF+RirKZSBY=;
 b=xl+G+6NWSc4HOZ1LJmn9AFbRGVHaMerxoQLx1UEkfoZKM1H7kNQMMYnvKFY+jjdmwu
 8yBm36k1lWaV3wVQItw8bUNNSpU0bRkYdprZijjP2NfeRNbobBCDc3vaeYM2suEJDxHz
 0REXZ5EtiIYdDkopWehhi/t8VSk/O7ksgavnd3usqmiI4i55WMyZjAKPQv4PU6DkFd11
 C3zbGhr8BguNYiCK6vAM7e0H+rr8EsrziPpHV8mpwoRVIpR22y4kNErGUcCBgKZUnzH0
 z2mJKC+cWbgDVqLBPJgFEsfyzoDnJY18czxBaXq6udftf1mC31slPAFazElmD9eHxNYD
 1WYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Udu5uhezWydKZu4K1HYQtiJgtb0stOPsgF+RirKZSBY=;
 b=daal2dR+5FyQ7wnraME7qyuq60ibfI4ZqjaY20UIpT2Er4cH/1jXyXu9PkLBDrRaUk
 EI44sufqYqHrxNXzT5sgr+xtDmydK0TLD7+GAqfsVYveGKR17kfn2nR/ZDexJ+2nFxQ0
 RfBkbWxWnpz8evxWD4Yt9zR0LySJJXw/JG3FDqtN64X6btBY4mRAye8P9VZ6IshXs9R2
 OPfffixFFsWHlfpHmzOqt69bASkeiVNWz+3Mo85Ql78Wd5IhW4cCo1URj5/ywyKc+e1J
 lI3m3ySdk4RQGNdcW6N7lEaloweCSvWrQVbwd2KMbZPDWLSblDfCzgC6yAyTTXx1vptl
 Z77g==
X-Gm-Message-State: APjAAAXXsMQUMaJW7hSS+MlKFXnrsArRr+UDg7MUi+ZZzEw1lyCmgg5z
 RG5YMuv4Jh0cJxZFqyuRWQXLyiNCLM9tIg==
X-Google-Smtp-Source: APXvYqwewHUUyU/UhXvbgGzdNB6BmlJnKJ5g9JfSkNDyqqdEMigm09Ikxn/YF/RPW0VtKkc3xtXvvg==
X-Received: by 2002:adf:e3d1:: with SMTP id k17mr19123533wrm.143.1552298185200; 
 Mon, 11 Mar 2019 02:56:25 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id e12sm4764737wrs.91.2019.03.11.02.56.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 11 Mar 2019 02:56:24 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 10/11] arm64: dts: meson-g12a-u200: Enable USB
Date: Mon, 11 Mar 2019 10:56:12 +0100
Message-Id: <20190311095613.11371-11-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190311095613.11371-1-narmstrong@baylibre.com>
References: <20190311095613.11371-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190311_025627_156186_1DE1CE9A 
X-CRM114-Status: UNSURE (   8.87  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Enable the USB2 OTG and USB3 Host ports on the S905D2 Reference Design.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
index 17696f356ff2..cc043e075521 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
@@ -108,3 +108,19 @@
 	pinctrl-names = "default";
 };
 
+&usb {
+	status = "okay";
+	vbus-supply = <&usb_pwr_en>;
+};
+
+&usb2_phy0 {
+	phy-supply = <&vcc_5v>;
+};
+
+&usb2_phy1 {
+	phy-supply = <&vcc_5v>;
+};
+
+&dwc2 {
+	status = "okay";
+};
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
