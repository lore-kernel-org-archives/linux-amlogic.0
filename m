Return-Path: <SRS0=jO5x=WZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA10EC3A59F
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Aug 2019 15:27:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC5352077B
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Aug 2019 15:27:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MA8PHq43";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="FSUPjkY6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC5352077B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mTIIKqROPro5F5HR7B7p1Vk82MJ3KUN+PO+Rw8vbias=; b=MA8PHq43ddxKzF
	Ia/YVPjucsdTcwB46gij44XsqybZhjRIGT7zpegBOKKUJNakDUBNlGEJ2pKoz25AwMb1vMFz8Sw/F
	4GmVlSxl1bU9R9dacXMW1HCe8IrZ7FtzWbUfXTd+ViTg98uYlKP4dEGqmuITWlzs36mzLJ/jyWTBE
	kEb5J3AeKAMzNmGOucje6JHcSe9eIBopnNYs9dZ/qlSOrL0o5CWSXJPVsg8WzYjcINFPdpj+DQ2dU
	e0/deYBKywAo6oLoI4Qi4jwL+gZbsMZNL43ASu2oxprBbr2sosZfwDeo9jvE1zX0rqncE3P/kaXsC
	QI6CJ1eeTH13TxnRBrSg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3MKK-00015J-2o; Thu, 29 Aug 2019 15:27:08 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3MH8-0007RZ-94
 for linux-amlogic@lists.infradead.org; Thu, 29 Aug 2019 15:23:53 +0000
Received: by mail-wm1-x344.google.com with SMTP id v15so4188169wml.0
 for <linux-amlogic@lists.infradead.org>; Thu, 29 Aug 2019 08:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z4qtGd3bv+h29yhSk22SX0CJaSUFSLWmZFG52XETCDI=;
 b=FSUPjkY6A0N+lU17R2nDiCi+Wpu9Nhe1HAEAWHeXyRhHNhBVqXaeLlGHx/UpWWJsVG
 M1ZcrOhadokARZds3Vrl5++RopTa1GizrCVj7fCvpeFSLYsHF8okzW7sDXCHALx/4OK6
 9e+yFPjhVkD1IQtHiNEzN/AD9ZTYqgKFBcCdC1rHJQaoBEyrOV4JSSpRDDz8q4sA8uV4
 V+8IFU0vFQHs2shx8cXJ2MtPM5ASxFtFhMCCvnmlTAUmkVCt4jwawQm+312MYg8skSkR
 P4S6qb+oxfgaChDmpCGRIsGNaxdKd3tY76Opq8vetB5Zm31ybHmb+0wblFqJxcP9SRN7
 dC+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z4qtGd3bv+h29yhSk22SX0CJaSUFSLWmZFG52XETCDI=;
 b=cVJMjKpVbt1U6qcXLXV8DA8fmv/WTXX1j2gwIesR7Y6+uSjpe6X5nuTaZM2cZDdpga
 /qHrf3pYszaJwHlnYeTPBAAzHbK1Lynr/1Bsck6OPenAKN+rI3mGlnvP0b/krZ9EPHcF
 rtw3sUcLfIK9UChm5AlKHmCRQ8HH0iRBoCIpQ4cieDRJ93G0vzmHWqCGOJ5o1G+AmGYs
 iyd9rWwULcG6lB+8E8ThUT+OOKsfzAhxfwEC9H6CQGHIo05NoXiBDxwIjN/0NBu26WPq
 9KVRWFt8AZwUI3Sir+sdFCoal8XlMdS7nGLBt8M/YyLyUJVRY2VAohP2bcGtnvPUXl00
 chAA==
X-Gm-Message-State: APjAAAU/GXIuINmVWpcD3yD7/6t3D5aFD6zHzGhGwiYk+gvccbv8x4Ob
 WrbsVuIGInzad/A15JKkrL9DbA==
X-Google-Smtp-Source: APXvYqw/3Puht71IYQQu2BpacUINPd2n8SKih/ViY/jGkwU097rCP8OcAhVLyZ/qjWn1hqHJKxJLDw==
X-Received: by 2002:a1c:750f:: with SMTP id o15mr12778949wmc.67.1567092228593; 
 Thu, 29 Aug 2019 08:23:48 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id d17sm4866871wre.27.2019.08.29.08.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 08:23:48 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 05/15] arm64: dts: meson-gxbb-nanopi-k2: add
 keep-power-in-suspend property in SDIO node
Date: Thu, 29 Aug 2019 17:23:32 +0200
Message-Id: <20190829152342.27794-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190829152342.27794-1-narmstrong@baylibre.com>
References: <20190829152342.27794-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_082351_193633_F6BCE3C4 
X-CRM114-Status: UNSURE (   8.47  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The WiFi firmware requires that the power is kept enabled while in
suspend mode. Add the keep-power-in-suspend property in the SDIO node
to specify that the power must be kept when entering in a system wide
suspend state.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
index 233eb1cd7967..d6ca684e0e61 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
@@ -280,6 +280,9 @@
 	non-removable;
 	disable-wp;
 
+	/* WiFi firmware requires power to be kept while in suspend */
+	keep-power-in-suspend;
+
 	mmc-pwrseq = <&sdio_pwrseq>;
 
 	vmmc-supply = <&vddio_ao3v3>;
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
