Return-Path: <SRS0=+CC3=YH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAEE3C47404
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Oct 2019 05:19:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B19E42168B
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Oct 2019 05:19:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BtYmrrKk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GF/EoEen"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B19E42168B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PUqBEmJJAgivDeD2BVpOFYoSfejlLSClj984MBv4HRI=; b=BtYmrrKkdwROvv
	4L/XFKwqMDnZYaG4y+xbNRzPZ3ChHthLcQuTD0FjFU/p0oPwaVcJ3Miyro5x8OrLkPdGCgL8hT2fV
	syVZTH2cs1XN7sJn0r5eInJA6ioViPft+I2nb+fUU0+drDEhKho/Fa5hCXGbU4hk1/9BbeL+aYJ3h
	eg4BYwfoxBO9VdxsR/RtSqD1h6TS42bxooFhEzv663WRTXjIAL/YjK2AGMj4T3psU7wwd/LsHQVPd
	MFVbtzEHw0mPQ0ca/uJnr+By1Gw5Ska1teyvJnhUIBqF6tH3Z1pmNhS2EgkQHawjujBL1IjH325kq
	bojaYytPi3v/xRDYl6SQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iJskr-00077c-6o; Mon, 14 Oct 2019 05:18:49 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iJsko-00076u-OF; Mon, 14 Oct 2019 05:18:48 +0000
Received: by mail-wr1-x441.google.com with SMTP id p14so18011109wro.4;
 Sun, 13 Oct 2019 22:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VV3IaZnskbUr1GiFO2X9yDGhA134LORR3NXQx0QiOlA=;
 b=GF/EoEenQBXCUWJ2k0tzuqQR085/nEg2EkMXurnyEdNA2zKX6mjtAE5DIkxdZ0UU5Q
 wSofKEtnAsrgiJeTSdIjD03CU0AYKb/SncJB2yl5/6p80ZrpgWSQoPklhw3I461/0+89
 zm7Sp2nZb/rLh1lZG8RLs1GXPEV8El4hcQ661jDremdTBE5H9wt8573KGsGOPmbhlZoC
 1yHBDrCLpIEkaqxcvFLeaCQMEoWaNvrrRsqGeqp50z8CPYO7Fp7+cftycC7iLB4mmS0n
 QQzIa0U6xir7ZDLNcQlPRwVrRP3iWp9AdJI6aK3c+j38tJ61NbCXeZrw7E3NjzG116Gb
 keTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VV3IaZnskbUr1GiFO2X9yDGhA134LORR3NXQx0QiOlA=;
 b=rZeuRp9pFN+QnnjFvJzIh7He0XjZ02dNgxxgiaK0DA6iJCKGlBg15De2OAFaImHWWX
 VmR1kqWtWefUZuy9DDMwe9FcBKVTo5KfjE+YXCBOwISUsz/YTqkenyw30k8UBRjaPNjM
 tcQ0Z92L+4czSr//dGkKtoi0Z23eQg6DrnkYqZXAwVw/7tYDrCKoZkE3fHqhoMAzT2Na
 tvm84FDIzzRzZ09dyAeJFFK7QP/hZjaNJO7uKA31tazUOoR7ZsVj2HMPNcc2I2U/W+Bp
 GkBNfzn75w06IFnnIYvUnA187i7mEYDZO34WO2vJiGywjR7eMXHuVOPOEKQCn5Rk4p7T
 zd2A==
X-Gm-Message-State: APjAAAXqKKoE2FOsMX+OdtAfMGXCENVsuGlIBPqP0CgLfNbqThMmpLnf
 DgRHptU2Qtxa2YFdCR7n/B0=
X-Google-Smtp-Source: APXvYqwSkfiMiVUM22hh3eH+vxUD6VrSroLzyJM2IkERg+/i7QXfkOq9fwEWbQq/e+W1/GbC3PcE0Q==
X-Received: by 2002:a05:6000:18d:: with SMTP id
 p13mr1507726wrx.396.1571030324402; 
 Sun, 13 Oct 2019 22:18:44 -0700 (PDT)
Received: from Red.localdomain ([2a01:cb1d:147:7200:2e56:dcff:fed2:c6d6])
 by smtp.googlemail.com with ESMTPSA id 5sm14660340wrk.86.2019.10.13.22.18.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Oct 2019 22:18:43 -0700 (PDT)
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: davem@davemloft.net, herbert@gondor.apana.org.au, khilman@baylibre.com,
 mark.rutland@arm.com, robh+dt@kernel.org,
 martin.blumenstingl@googlemail.com
Subject: [PATCH v2 0/4] crypto: add amlogic crypto offloader driver
Date: Mon, 14 Oct 2019 07:18:35 +0200
Message-Id: <20191014051839.32274-1-clabbe.montjoie@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191013_221846_808785_BA736308 
X-CRM114-Status: UNSURE (   9.03  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Corentin Labbe <clabbe.montjoie@gmail.com>, linux-crypto@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello

This serie adds support for the crypto offloader present on amlogic GXL
SoCs.

Tested on meson-gxl-s905x-khadas-vim and meson-gxl-s905x-libretech-cc

Regards

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
 drivers/crypto/amlogic/amlogic-gxl-core.c     | 333 +++++++++++++++
 drivers/crypto/amlogic/amlogic-gxl.h          | 170 ++++++++
 10 files changed, 982 insertions(+)
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
