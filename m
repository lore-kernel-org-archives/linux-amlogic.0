Return-Path: <SRS0=+CC3=YH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3F0BECE587
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Oct 2019 14:17:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 387272067B
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Oct 2019 14:17:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NResKJzM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="oH36a8sl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 387272067B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=S/qiU4BljirgcEpnUxc9/yYExprrqART1Yj2H2eIcTc=; b=NResKJzMcIGTIE
	bAvFi+ndKdtC+dCyoRmISHbqD2+nw9rM5doa+7e82HKqRgFVFhP44VIiynFfs0QgykpAZgSjF8sgu
	4LBfyc66O3kIT1xlc3AvVA6fUB+WkbV4fLI9B1I5Xg0e0Bvqi620EWkrr7RPDMfzzRly8ERt2wnwO
	Iy9MJGokFFMRWZdr4yDIQp/15QOSESnYeVWnY1FzV4ZZqyuHykjCauQK5GPt59TxiCKPEbLb7kwdF
	6T4Cc4YvwAHY+D38IUJ9s6ZgLTRRCzpjlvVHGLr3AxuATmJnqZq2/yi8RqbND6exoDCJQ5xmy2+Wj
	alj5ULR4xVUjTaDkgNPg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iK1AF-0002mh-Iv; Mon, 14 Oct 2019 14:17:35 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iK1A3-0002bi-Nz
 for linux-amlogic@lists.infradead.org; Mon, 14 Oct 2019 14:17:25 +0000
Received: by mail-wr1-x442.google.com with SMTP id y18so10496624wrn.5
 for <linux-amlogic@lists.infradead.org>; Mon, 14 Oct 2019 07:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WSSsFrkn7EdTTWu+GWp0+LGeW3aaonOPgHYuuTaEg/Q=;
 b=oH36a8sl1Y0woo+uZ+4d0YC209fG+020lXLFq2OWCB2CNdkLhDLm9/zs35CX/x2qo0
 zYI7znIKhTEadQR2tDjgQTxje1l03+eUNK8+pPUzzcqGuiY+4rNgov+W+TpwKDVb34wa
 gSojkc7hfZhAHFX5wloTc2MrIC08nBej23ayyT1Q/GQytY3rFPAHkNsW1C44GKSI+Snt
 ilTLJ99AXZjy+eHwDXCY3nLPPOAEV2ryDLikeqvttfu4IBI0TvRxOdhV7o1xXQrIr8Uv
 WqruTS/QkuTKsv/SzCjvKEdVjhkhlhE4K+lxDjwMf2n5QDY24GcYFA0chKuOp71rVzDL
 EnIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WSSsFrkn7EdTTWu+GWp0+LGeW3aaonOPgHYuuTaEg/Q=;
 b=OXjEcZJKoVNmPAJTvdZSVXwcmf4JbPKmPQJAHptGkdeapgDZgzXm2hlzdIFg3PYwZR
 9tdTELaRWaVsUCEc+UgiDEExWz74tfhGmNra2Z9A/uBI4NEzytg70YvKDIN9p+e3TgSd
 eQIg+zUkeLamnFKzAlXrfLg+5sQpQFttWIRolEfn8hpNjRwFilpg6fRWBmlWwBYCctey
 9CBDvo2L1IYwle69EfIUVmi9Yo5mHpYTbJpgp/Llr6dy5WlzlNv1gUNKHAKsuTdWyMUn
 dd/96U5J3nB7uOnnyxdWn1lGKLu1035WOyC6O95Yj1YS3ZcoL/Otf5fwkM/TzrOS4MJD
 MjVQ==
X-Gm-Message-State: APjAAAXYCau++rk1SNQUH5I64luA9xAm8e4ovC9r+/SLHWUlQK6V1RQp
 lec2LTsG2WSC1IvuEQE7dd0Rhw==
X-Google-Smtp-Source: APXvYqzKPStl7+pYZiI5sC3h4CfQaz40UoOoFTnzTHrvT/VixgRr3uo24eUmfwMJhwQ+sK/e93D/3w==
X-Received: by 2002:adf:f004:: with SMTP id j4mr7541474wro.68.1571062640575;
 Mon, 14 Oct 2019 07:17:20 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id t83sm42708624wmt.18.2019.10.14.07.17.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 07:17:19 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: balbi@kernel.org,
	khilman@baylibre.com
Subject: [PATCH 0/3] arm64: g12-common: parkmode_disable_ss_quirk on DWC3
 controller
Date: Mon, 14 Oct 2019 16:17:15 +0200
Message-Id: <20191014141718.22603-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191014_071723_833050_4BAB290A 
X-CRM114-Status: UNSURE (   7.21  )
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
Cc: linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

In certain circumstances, the XHCI SuperSpeed instance in park mode
can fail to recover, thus on Amlogic G12A/G12B/SM1 SoCs when there is high
load on the single XHCI SuperSpeed instance, the controller can crash like:
xhci-hcd xhci-hcd.0.auto: xHCI host not responding to stop endpoint command.
xhci-hcd xhci-hcd.0.auto: Host halt failed, -110
xhci-hcd xhci-hcd.0.auto: xHCI host controller not responding, assume dead
xhci-hcd xhci-hcd.0.auto: xHCI host not responding to stop endpoint command.
hub 2-1.1:1.0: hub_ext_port_status failed (err = -22)
xhci-hcd xhci-hcd.0.auto: HC died; cleaning up
usb 2-1.1-port1: cannot reset (err = -22)

Setting the PARKMODE_DISABLE_SS bit in the DWC3_USB3_GUCTL1 mitigates
the issue. The bit is described as :
"When this bit is set to '1' all SS bus instances in park mode are disabled"

Neil Armstrong (3):
  doc: dt: bindings: usb: dwc3: Update entries for disabling SS
    instances in park mode
  usb: dwc3: gadget: Add support for disabling SS instances in park mode
  arm64: dts: g12-common: add parkmode_disable_ss_quirk on DWC3
    controller

 Documentation/devicetree/bindings/usb/dwc3.txt    | 2 ++
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 1 +
 drivers/usb/dwc3/core.c                           | 5 +++++
 drivers/usb/dwc3/core.h                           | 4 ++++
 4 files changed, 12 insertions(+)

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
