Return-Path: <SRS0=Bf+g=TQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 080EAC04AAF
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 May 2019 14:32:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB2D220833
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 May 2019 14:32:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mKdv1qBY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="OMEfpFp+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB2D220833
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xXeXx/BTOP4vwc4HSATZ31OKiSIc51DHUJ+R9i4fmyk=; b=mKdv1qBYC0G+Fu
	w+UZWMOfjCXNZKaeHQTGMxdIGHxc6pYruaNOGP+vXZkOUxtyV0rE3WmvtXBJTu2VR+PmadHXcUKRt
	WUlI5r49/aL6rfKZh3laZLVkOEcO7S95oT+GE3HF/728DJ8wVR2q5JQWNZQcBWvMKeCpV8LpjfOTp
	qDZC2GCbxCgsKUW3iVQDqsmu4QQn1BwrsNJ4lBRwwB7r8jr6mpGK/ge1roC9sBo/kENWJ9XQ7v+fA
	fYTOwIQmJV5lMzA6ltOduxYC3OKvf+Xb3TahRb4wAL5fNz524+p9LS2zDxfvT4MPjGCP0oeJdcesD
	xWK8c0kHLVEbf9/HM2UA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hRHQw-0003mX-PC; Thu, 16 May 2019 14:32:34 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hRHQo-0003Zi-2M
 for linux-amlogic@lists.infradead.org; Thu, 16 May 2019 14:32:32 +0000
Received: by mail-wr1-x443.google.com with SMTP id g12so3386257wro.8
 for <linux-amlogic@lists.infradead.org>; Thu, 16 May 2019 07:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MCh2hGUp25ZJxGPePdNkCdsXMQeyI1uh6u/3BErb/Yw=;
 b=OMEfpFp+KLYfHxBXZQN0DYJBsoAo0sh4lRfrR313ZuB2/XYxZ/vjI6eKK50+gx3Yjw
 iy/aG0HxJxse2ASHabxUprCKQwTA8S/D9Jbp/D+q6RSfdY/vwPZHD3yNw2YP6SZQLDOx
 uJOdZbDahQGnPtwFHIFAyPVE6NLig8V9vbihySB31clyVUel3Os3k0hcA+kLwKXzUNqS
 uJFODNwm8obBwNITLOp+rZ0t76VNSkUFBT8DstnZFCQboxjmJxsgH3AEbja7zzD4+7wM
 W5qbm0IrBKpwpPVx/zNQO8sDc4DurMp+oNShr2bhF0Vi2T9z/mZrVO8ynoNwX3uuPGXu
 eA0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MCh2hGUp25ZJxGPePdNkCdsXMQeyI1uh6u/3BErb/Yw=;
 b=eoz80IKXSZL+VN8jcWjhV1PFHekW/gFAOkNFxNe8OGvGct4SgQYvNBQAgOYF3YhOXf
 U2vtKysKr8KtJvtY1GjWjsO58xpXGc2XWACSgCRi6U0B+oIuD63F9pvgtzbrwDj0lgiP
 fSMKTqlu9azvOtSbbNVBDQDHynkuqmbFgsdZu0GHfmYvEoosEgdpW/fqrP+Hud2F65PX
 M2Xb/Ke3V9UYKxNGxSdUJCBpBpZQMZb43x07yEZlIwMhZiLtVlGUT0bDEtZqF9G87r2W
 XBeWeJzEucCCUc2B37lYy1ZyDnKU0NM53lQ9kOexkyLNbel2oIdGTMU1QHUdYoI18j4V
 RQrw==
X-Gm-Message-State: APjAAAVNMLsqbpnuOBY/QprnOSHOiW1xIGZEF2f1Kk/Rz/Xpwo6IrT02
 RhSGFXlZFKsl9Pk8nxgUG1B0NA==
X-Google-Smtp-Source: APXvYqxh4XiN4cDh/DoIiPtCPuo2gI4Fpj7ttgza+eSTorRPdi7jF2OwizM5OMIMXOYlejycpeH0jw==
X-Received: by 2002:a5d:45c7:: with SMTP id b7mr7863823wrs.176.1558017143940; 
 Thu, 16 May 2019 07:32:23 -0700 (PDT)
Received: from boomer.lan (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.googlemail.com with ESMTPSA id h12sm2386548wre.14.2019.05.16.07.32.22
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 16 May 2019 07:32:23 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH] arm64: dts: meson: g12a: add tohdmitx
Date: Thu, 16 May 2019 16:32:16 +0200
Message-Id: <20190516143216.6193-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190516_073226_802950_F59DF9C0 
X-CRM114-Status: GOOD (  10.24  )
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the hdmitx glue device linking the SoC audio interfaces to the
embedded Synopsys hdmi controller.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---

 Hi Kevin,

 The related device driver and dt-binding have been merged in the ASoC
 tree, for-5.3 branch [0]

 This patch is based on the audio series I have just sent [1]. Like the
 patches I have sent this week, they are all based on Linus's master
 branch. This is done so it applies nicely when setup your branch based
 on 5.2-rc1

[0]: https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/log/?h=for-5.3
[1]: https://lkml.kernel.org/r/20190514142649.1127-1-jbrunet@baylibre.com

 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 3c92d165621c..90da7cc81681 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -1677,6 +1677,14 @@
 					clock-names = "pclk", "mclk";
 					status = "disabled";
 				};
+
+				tohdmitx: audio-controller@744 {
+					compatible = "amlogic,g12a-tohdmitx";
+					reg = <0x0 0x744 0x0 0x4>;
+					#sound-dai-cells = <1>;
+					sound-name-prefix = "TOHDMITX";
+					status = "disabled";
+				};
 			};
 
 			usb3_pcie_phy: phy@46000 {
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
