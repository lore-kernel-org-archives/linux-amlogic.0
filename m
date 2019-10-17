Return-Path: <SRS0=5tHY=YK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04C88C4CECE
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Oct 2019 05:07:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB8902067B
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Oct 2019 05:07:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qrR2tSsG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="zh64szI5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB8902067B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=JtFDNROEzVgeZ4DXeVrvkHxalCaVkEEz19nJ1oAvH3g=; b=qrR
	2tSsGeLOJJsDwJhH09QL+13GB+f5v81ZoySBW/UWwSncXGGbk7w6/5TfTNyJiGos/dC2uEv/b8hr9
	84oVKBSeERvHvcqWafCbJsYCba4XzOhfddaIUtVvPNKk6FTZm2Go0mD86iThzOPIrxwFQcJtzqIfP
	2bw8IkjaLqzAvmzDHWoH4LZAui6SV+mJoOCjdWopAc3BFhQ+Qv4ZxG5v9x7UC+JC896vHGIXh6IRM
	1B+WGvUGWtrFnh75rFcrhF+eAQU6iCEOe8A6sE8Kf6Oa7A/y32oAoZQuQ/FVXzb9gBLm5fGWOen44
	scNBXzwX0ah4nThtiaNErBlHqJCnUxw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKy03-0002jF-E6; Thu, 17 Oct 2019 05:06:59 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKxzp-0002Xf-4A
 for linux-amlogic@lists.infradead.org; Thu, 17 Oct 2019 05:06:47 +0000
Received: by mail-wm1-x341.google.com with SMTP id v17so992603wml.4
 for <linux-amlogic@lists.infradead.org>; Wed, 16 Oct 2019 22:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=vc5hMa73OPr/x/aEf805fVYp+2tYvgPjEPvMghKb2Zw=;
 b=zh64szI5/P7kHr7xGyuurhRKHjg1Pn1Q28ubOkmOzG3Stwaf4WlQppsxqn+dNutVpv
 Yp9ECpelYfZLjI25E2yFrf5j4gxK5YunYg3Br2IVSqkK/4jF77prXesnCIAaRvYrU06q
 516AdjPwzMZ+S7nTMrdAZq6HlkPzGFMYWUmQhouxL0xUsRS+9Ct91pLNxgnjDTpcvU0+
 Z60oaEnCXX2Aa9eKW0lvTSpWGEuZLmL31s+hPdJUAe0wFgCg+CbW3KqndIWiAaOKVKjD
 3oFcBNzJVMivg8nPMQ95fwkpuydWpLCKG/B9xbbinhjU3YbV/0M3rzGTb3iA8yggNAYl
 ZAmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=vc5hMa73OPr/x/aEf805fVYp+2tYvgPjEPvMghKb2Zw=;
 b=Cbm/rqZ47Qh1C1kSiDlaRruzpWT/H5R+weSy6Y0E06A/lm03+BTIwKMOcEtbUqX6IN
 PN3gdH1as/H0Am19LNJSsT2zahh65zyqGO/kkizwgD1sX2j1mgahi5fQqYfnVaezIAZ4
 d0Gw+MZD/PFTCKAowN6vW4gtIxBm5FLb+7d2wnrVjXYLrKqKZy3BXtBpk5f6e57g9Cza
 OoZqAU8YZc9TD+CTB0VFUAvj8VS/KTRLKnygnRkQj805ZLgyEojlYD9dhkUSdjIawldD
 37Fl/xT1GxE0ldhTGOyB0waaK2wvG0Qgi/5AcStCSWCVZYiNTs6r5yZbztOPXO3Doj+2
 TNMQ==
X-Gm-Message-State: APjAAAW+SXcgTmX8eJ8IusDtGi4iu7cMuRPwxEU9oHa+aj6+kxcYCWCc
 yyvHg3uiTseFFHd8X2Z452pS8A==
X-Google-Smtp-Source: APXvYqw07wwT75FOoNWJyD/an/XIle9yHvlb7113NxzJZiEpvXnUsfMUBXr2Xe/6iQ8HyyjCXNyUPQ==
X-Received: by 2002:a05:600c:143:: with SMTP id
 w3mr1048902wmm.17.1571288802451; 
 Wed, 16 Oct 2019 22:06:42 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
 by smtp.googlemail.com with ESMTPSA id b5sm1010762wmj.18.2019.10.16.22.06.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 16 Oct 2019 22:06:41 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
To: davem@davemloft.net, herbert@gondor.apana.org.au, khilman@baylibre.com,
 mark.rutland@arm.com, robh+dt@kernel.org
Subject: [PATCH v3 0/4] crypto: add amlogic crypto offloader driver
Date: Thu, 17 Oct 2019 05:06:22 +0000
Message-Id: <1571288786-34601-1-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191016_220645_217056_806C3369 
X-CRM114-Status: GOOD (  10.01  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Corentin Labbe <clabbe@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello

This serie adds support for the crypto offloader present on amlogic GXL
SoCs.

Tested on meson-gxl-s905x-khadas-vim and meson-gxl-s905x-libretech-cc

Regards

Changes since v2:
- fixed some spelling in kconfig
- Use devm_platform_ioremap_resource

Changes since v1:
- renamed files and algo with gxl
- removed unused reset handlings
- splited the probe functions
- splited meson_cipher fallback in need_fallback() and do_fallback()


Corentin Labbe (4):
  dt-bindings: crypto: Add DT bindings documentation for amlogic-crypto
  MAINTAINERS: Add myself as maintainer of amlogic crypto
  crypto: amlogic: Add crypto accelerator for amlogic GXL
  ARM64: dts: amlogic: adds crypto hardware node

 .../bindings/crypto/amlogic,gxl-crypto.yaml   |  52 +++
 MAINTAINERS                                   |   7 +
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi    |  10 +
 drivers/crypto/Kconfig                        |   2 +
 drivers/crypto/Makefile                       |   1 +
 drivers/crypto/amlogic/Kconfig                |  24 ++
 drivers/crypto/amlogic/Makefile               |   2 +
 drivers/crypto/amlogic/amlogic-gxl-cipher.c   | 381 ++++++++++++++++++
 drivers/crypto/amlogic/amlogic-gxl-core.c     | 331 +++++++++++++++
 drivers/crypto/amlogic/amlogic-gxl.h          | 170 ++++++++
 10 files changed, 980 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
 create mode 100644 drivers/crypto/amlogic/Kconfig
 create mode 100644 drivers/crypto/amlogic/Makefile
 create mode 100644 drivers/crypto/amlogic/amlogic-gxl-cipher.c
 create mode 100644 drivers/crypto/amlogic/amlogic-gxl-core.c
 create mode 100644 drivers/crypto/amlogic/amlogic-gxl.h

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
