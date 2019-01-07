Return-Path: <SRS0=/OEX=PP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 015DFC43387
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Jan 2019 09:53:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C54EC20859
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Jan 2019 09:53:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lQMACDS/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="LIEitCVz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C54EC20859
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8hfY222IgXM5+QxO97XGElUm5TepLSYI71DEsO2AJNI=; b=lQMACDS/9YNNGt
	1CNt/L/JyNuJ7McLsnMYusVyg3IZXK5ONZkg8cdlZxcpkSA1WKygDVPuPAbAFTn3MShxt1VUPfOPx
	tGqLv+5hwElzXCy+sg2wgcRcY/YiB7U8A/wgAfmNpfU/iBC+LZMWpEdAq8Aa0OfDZX1ZsTh9nwesu
	oCdq24vqScnByGJLbhpDzbNW1pFbXzql6Ey0TDvZqOuosOsoTPLRgwzbvPR8BoucCDE1PZaLMu5rN
	6N5V1eeW2n1KI6WxZaER0L3ui8lryOgSvI/C0W3RfngUkL0iWUld/mQz+D0K+7k3l9pLJ4GW0TaCM
	MJXGa6DI8C87dLCFrzKw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ggRb0-0000G3-1s; Mon, 07 Jan 2019 09:53:22 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggRaw-0000EO-MO
 for linux-amlogic@lists.infradead.org; Mon, 07 Jan 2019 09:53:21 +0000
Received: by mail-ed1-x543.google.com with SMTP id x30so275336edx.2
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Jan 2019 01:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TwNcnlR2Zn4hx3zkp8zOAgTjAGZi9ae85weLFJBkyP0=;
 b=LIEitCVzeGyNf86Fl8b2Vwm+G6NGMcmlBiGs+LsMCMl6c66/sSyIERhJbRxiuYP0DV
 jvd2cWiEqyWr+OEJQSUoj37pyx5SK7qkY0geSbCun+Mtp7Fi35MYq/sN36iLHFg/cTs2
 v+0bLqvRNTdgXblglg4JG4qbUOIBFK/DmmCxfX6IGBdMlTBMJpZcBwM4epwd4sv0luot
 FEzhXEx3kFdfnA1IrathqKohc2wLS/CMAL+QModrrApmv2EK1hMr5M9lJR0QJoUKkS9A
 ovWp3vS+6VbVtweR9c2wPvUNJWmUSBgNQjOnLIrb7qH9W2gC0u49bF2LFCf+wB92BSrA
 hdjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TwNcnlR2Zn4hx3zkp8zOAgTjAGZi9ae85weLFJBkyP0=;
 b=jjppGe2MQjV1c/PJmFDEvkUW0R4DEcrh6np7AvPOVmLsm/MHkdbfHWq9aO/hRL+EGT
 6i5HFyUBt78xWEpkQWg/+KFamEasTO8Ie2PcY9wBvMQvAyX5wL+wdhN2pz4RvPdEjoNF
 gGCyg4vOKaEzMSQg5Tc0fUvFIJxck07roCeXWh0G7Ia5MO0LuzD7EuH50G+NARew4AoC
 6rUPg/5hrtZ8SzfjHfBSfa4QAMI3pX5HKALU//P8IEFFb9GoAf27acsbK+O9s1QoDK4v
 5TbiD4bSH6Vit0GmuiTRnjBePsEDj/ED5fJQp8IBuMfaBl+aQWsyI5ejSBFcSnXg1Aut
 Nrug==
X-Gm-Message-State: AA+aEWaJou2a7YKyOHIOim5v+zGuUnUZYXohyBSosGeyDyyyWDjCAKSm
 N71fuc+SZ90aXb0nkymUZ2rYrw==
X-Google-Smtp-Source: AFSGD/XJ8bv6nFQ7jL654BoGNZYlp7hkrUW5waa2vPSjfYe3uWQgHBULUvUIEI28oqmrSyj8rtJiag==
X-Received: by 2002:a50:a642:: with SMTP id d60mr56230877edc.290.1546854796428; 
 Mon, 07 Jan 2019 01:53:16 -0800 (PST)
Received: from mjourdan-pc.numericable.fr (abo-99-183-68.mtp.modulonet.fr.
 [85.68.183.99])
 by smtp.gmail.com with ESMTPSA id f6sm35737049ede.53.2019.01.07.01.53.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Jan 2019 01:53:15 -0800 (PST)
From: Maxime Jourdan <mjourdan@baylibre.com>
To: devicetree@vger.kernel.org
Subject: [PATCH v2 0/2] arm64: dts: meson: add simple-framebuffer nodes
Date: Mon,  7 Jan 2019 10:53:05 +0100
Message-Id: <20190107095307.15233-1-mjourdan@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190107_015318_781396_F297E74B 
X-CRM114-Status: UNSURE (   9.90  )
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
Cc: Maxime Jourdan <mjourdan@baylibre.com>, Rob Herring <robh@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patch series adds support for simplefb for the GXBB and GXL chips.

simple-framebuffer allows sharing a framebuffer already setup by the
firmware to the kernel for a seamless boot transition.

It goes along with a u-boot patch series adding display support to
GXBB & GXL that is not sent yet.

Changes since v1 [1]:
 - added cover letter
 - added simple-framebuffer compatible fallback to the bindings
 - Updated node names and removed the unit-address
 - Consolidated base nodes in meson-gx.dtsi
 
[1] https://patchwork.kernel.org/patch/10720879/

Maxime Jourdan (2):
  dt-bindings: meson: add specific simplefb bindings
  arm64: dts: meson-gx: add support for simplefb

 .../display/simple-framebuffer-meson.txt      | 33 +++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi     | 22 +++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi   |  6 ++++
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi    |  6 ++++
 4 files changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/simple-framebuffer-meson.txt

-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
