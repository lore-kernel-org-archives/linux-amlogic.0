Return-Path: <SRS0=Jj0Y=VW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A71FBC76190
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jul 2019 19:43:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 816E3229F3
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jul 2019 19:43:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aCNzPNx1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="UQg/tDmQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 816E3229F3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=bMBsPJ8t2iUGOCnjv1oDqz6a+6msNKMmdQMsNOpzNzM=; b=aCN
	zPNx1I5JwxXpKgcId/qGxqvMyf3D5DWZu6Acs7azPagxwjBFhr1l1IJtHMQPe8hPllQ707FjD99pA
	e2Z7eEzXYUtxoFIda6jREQpkkEVCt1sZFrALtrUgiPdPZFEf8tpsONWSjRksZdzU6/hjxi8EIhJEh
	YD+Z5hP5u8QKhsUIGHmD0HHu3eQTNpKIHVTI9hGTasPK9F970OWVAOBj56+Tif2iuZYEprcSAox0v
	7xYckRgX9gwOjhtSnH60dTKg5Hb+WgAWsGLfOYuzFPjGmatOPNdzxjO7HHp0csjrhQFdOra++EcxF
	KD6h0TgW6AeOlfGRSmNWUORCxmdFt0g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqjdw-0001U3-G1; Thu, 25 Jul 2019 19:43:12 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqjds-0001RB-I8
 for linux-amlogic@lists.infradead.org; Thu, 25 Jul 2019 19:43:10 +0000
Received: by mail-wm1-x341.google.com with SMTP id l2so45728854wmg.0
 for <linux-amlogic@lists.infradead.org>; Thu, 25 Jul 2019 12:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=HpwqwqbOJStimlLPjV2WsSVvFoS5zR7dipevAmhXn+I=;
 b=UQg/tDmQSfp9ChPaHt8EGlDQzZ6S/EdbxNg82he/Mzh8kwJ1qDpcDDkFMwLldt0cJc
 lCF8BYMyw+DpR0ybV0yCoNWYL08yFyuTbTqO6aSQREaMO43xW88KfpTm8GecjxL8rJGw
 GyauPYbXAUfd+wepxHqkp3tFKGMm0w8zorbYNjo6KTprUZWLwZ/Fo8VRDIu+/lxrhFXM
 eDgKBYvOFPyY6b3EkW8UL0kebH0JQ+M7KxuybGZKYAD/kf7iDXT6S2sTLL26ra0MIe4W
 Qa6E4+gr7U08eq2pNnQbGEPANNHi3nhHnEMX5iaonM8eETL+dQ37+c+wg0iR530FfwHU
 Nk5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=HpwqwqbOJStimlLPjV2WsSVvFoS5zR7dipevAmhXn+I=;
 b=ePbGhxiUy2rcoDjYstrT5RlGCKzl1DZncKRk21nPH4lxUrNH5WyQqezfOViVGbmgRc
 4BjYG3ahvFbqmtvO6RKK0G6/I6YS42vBQM0g5nqISQPp41VxA7Ju2kYbw835poSGTFgD
 WL1Ndg/aB2iuRuWy0LiIb1I1r3cWqeiRFThDvwDgi8mDlIUe3+sRnibIgX5jLQJJppY5
 X+Z6PdKz6t2KLtdcXUmks/Wscv6HVi2UleY2eSeeQM0X0+cZQt3Dsq5cDTsFg0VwK/dY
 HhCya3n8qjCXEPfUS14SI8AlHLFPDGJ57G6/z/4xYxkRd/DjCn6E/xa9cn/13JW4qDeW
 wTTQ==
X-Gm-Message-State: APjAAAXLcjnuxnPR5a4zqV5PTppKHgyYRWBPHfRLas7VUJKESy+EztQV
 DdUp7n1SdNW8CPVnv995mz2MxA==
X-Google-Smtp-Source: APXvYqxpAh0jfU//NVh88rL1qSwss1rtJWAjuYNhw8soBe0yFJ+ERG4l4cq/Ofn+pyhmxoEsDSGiRA==
X-Received: by 2002:a1c:cb43:: with SMTP id b64mr82451700wmg.86.1564083786567; 
 Thu, 25 Jul 2019 12:43:06 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
 by smtp.googlemail.com with ESMTPSA id
 y16sm103410662wrg.85.2019.07.25.12.43.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 25 Jul 2019 12:43:05 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
To: davem@davemloft.net, herbert@gondor.apana.org.au, khilman@baylibre.com,
 mark.rutland@arm.com, robh+dt@kernel.org
Subject: [PATCH 0/4] crypto: add amlogic crypto offloader driver
Date: Thu, 25 Jul 2019 19:42:52 +0000
Message-Id: <1564083776-20540-1-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190725_124308_629344_59F4435C 
X-CRM114-Status: UNSURE (   8.64  )
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
Cc: devicetree@vger.kernel.org, baylibre-upstreaming@groups.io,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Corentin Labbe <clabbe@baylibre.com>
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

Corentin Labbe (4):
  dt-bindings: crypto: Add DT bindings documentation for amlogic-crypto
  crypto: amlogic: Add crypto accelerator for amlogic GXL
  MAINTAINERS: Add myself as maintainer of amlogic crypto
  ARM64: dts: amlogic: adds crypto hardware node

 .../bindings/crypto/amlogic-gxl-crypto.yaml   |  45 +++
 MAINTAINERS                                   |   7 +
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi    |  11 +
 drivers/crypto/Kconfig                        |   2 +
 drivers/crypto/Makefile                       |   1 +
 drivers/crypto/amlogic/Kconfig                |  24 ++
 drivers/crypto/amlogic/Makefile               |   2 +
 drivers/crypto/amlogic/amlogic-cipher.c       | 358 ++++++++++++++++++
 drivers/crypto/amlogic/amlogic-core.c         | 326 ++++++++++++++++
 drivers/crypto/amlogic/amlogic.h              | 172 +++++++++
 10 files changed, 948 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/crypto/amlogic-gxl-crypto.yaml
 create mode 100644 drivers/crypto/amlogic/Kconfig
 create mode 100644 drivers/crypto/amlogic/Makefile
 create mode 100644 drivers/crypto/amlogic/amlogic-cipher.c
 create mode 100644 drivers/crypto/amlogic/amlogic-core.c
 create mode 100644 drivers/crypto/amlogic/amlogic.h

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
