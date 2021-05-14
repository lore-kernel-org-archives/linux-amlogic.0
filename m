Return-Path: <SRS0=hwcs=KJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEDAFC433B4
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 May 2021 14:33:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63FF36144A
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 May 2021 14:33:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63FF36144A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QLX1k/+TKQ1cEbCWcO/WJxwxJuLhAi3x4LQzKBw2UMY=; b=qKN78fPMNCqT4I3wtXPr//OOxa
	Qvb7IkYL5Jo+j8U8IpKb73bPxwpnyT9lnWpSIfcbvbEafaZFQnrkJJoDsoiZK/cW9AgpVXV6EKJ6e
	vZ37hF9VPZtnaIF/3ssxjrK8zL1N08r+ZyePwt0MqOTO8HZGe1btD21zBoJzXvVb8hHWv3Ca2YkI2
	vonGAaNTW93DGA0z4/H5ZbvJWOY81c1ngeQcq6lEO76lom5mPQN6/VxUEQ/5Aekw6oj1U6po43HKY
	cCjCnbnEICJmeldNneAJwFiRS64v9/xS+pELUzRNjE34yiIjIx+YT6mXWSlYx7cyh5dckIMoZvSbS
	r895sTDA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhYsu-008IWU-TR; Fri, 14 May 2021 14:33:48 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhYsI-008IOr-44
 for linux-amlogic@desiato.infradead.org; Fri, 14 May 2021 14:33:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=w/VpTW4d5I0K39oGLweJUltX/Tb/UyuPS5ZReMp5vnM=; b=x4MHsUMlBlHkKqFqlcI9NTZHrO
 TLwlMQ2qlHf//yWU7VvYJfRuLQUZZZlLGHtQSEwITKPUbxUzqynXjnLdtt6ByuTJ181BVmN35vtMo
 7rcvwKGfuS46tW7+dtvhLtW43OumxHN0cShk3o5mgfJXY1vWjoORrdjncHLiGs4MWvkwgh4IGHCwu
 NRKPzzjQ61CmeLrYl02QuOw1RHwua9McE9BYiTy04XSu/4LC5XIB+sHiFa5WPVwfYNHncF7sC9XoG
 Y/JDYmWxJ1qyZ/G6zV4IeDcFw8WQbAqBndnv740vCgJslbUz4c6wcfRhtr2d5sBlaKin224PK6n0b
 o3UKD31A==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhYsD-00C2li-Si
 for linux-amlogic@lists.infradead.org; Fri, 14 May 2021 14:33:08 +0000
Received: by mail-wr1-x429.google.com with SMTP id v12so30207709wrq.6
 for <linux-amlogic@lists.infradead.org>; Fri, 14 May 2021 07:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w/VpTW4d5I0K39oGLweJUltX/Tb/UyuPS5ZReMp5vnM=;
 b=HIM48Rl3L4OrJgDurTmmQ2fPlCmtUz+P0PYpv5ZODTD2JLodczQq98PDcqfnygYikW
 p1PRH4TaDnP7tQWSc+0RX2QSw0rPmRABR9OBL6GARLzPzRCU91k1pYkmCbEX5iRKxnBW
 eIFse9OKYQeqoct5TxC/LK4I11fjcd9RMu12R74C1LE43T50Ec/Ma1TpMap36Vb6AMfy
 5O20Z95JEcTpyyt8af5EHY3wHiGGLTc4/2u8Wqg1aE4e3WihQdkSuhq/LT7zUNlflqPT
 EkkxSghc9odhOZB4QN6Qwqn6RzwEWcDWR9ytlqddihClrltKfs9dVhSqnPDkFOlMKnCO
 SwHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w/VpTW4d5I0K39oGLweJUltX/Tb/UyuPS5ZReMp5vnM=;
 b=bWe7bYUmh4cvnEvuoNFG3D2S53s0QXDVIQjoxS8XJit6tVHw9cWEPcKoUshBt3khEa
 NnCUEyffzZye6anLc9Fqb5CxmHjKovX97Id1Vzqa6JymBbvl6R9cEOZWnz8tc5H4qfKD
 lt7+X7uQo7JSaKwZQzOLH0C3mxYNZmE8AmJv47dGOa77VKbdPFa4yZdW6RRwzY5ZEumE
 nTh00a9kSGhE/+yt0b7oVmc8lxhl2nZDv+yocdS4eVrDIJ+Eg8SBKdFp//U4RMkbbW/Y
 klvYG2aAfSrw3UfKeZEA1ecpDrYcxksZ1pnulH7hGXqowWfn2iAG856hU6Z+imDAkBk1
 uGSg==
X-Gm-Message-State: AOAM530FjmKj0WO6V4T581BmhQuU+Zz3pxiQ2eWL9BvPt9EFUsHWxGu/
 5Ey9dsgnNDb1oa2Ay6dqxGbq1g==
X-Google-Smtp-Source: ABdhPJxBp1hHz7JTDl+SuVo0/37Hv4oTe06YTktDzDjvDBQnHPCvNajnUl3nn6VsedqIrcsfSszD2w==
X-Received: by 2002:adf:cd0e:: with SMTP id w14mr59255997wrm.46.1621002781730; 
 Fri, 14 May 2021 07:33:01 -0700 (PDT)
Received: from localhost.localdomain ([37.173.48.34])
 by smtp.gmail.com with ESMTPSA id v21sm11552036wml.5.2021.05.14.07.33.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 07:33:01 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 0/3] arm64: meson-sm1: add support for Banana PI BPI-M5
Date: Fri, 14 May 2021 16:32:52 +0200
Message-Id: <20210514143255.3352774-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210514_073305_980221_0FF8848A 
X-CRM114-Status: GOOD (  10.85  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Banana Pi BPI-M5 is a credit card format SBC with the following features:
- Amlogic S905X3 quad core Cortex-A55
- Mali-G31 GPU
- 4GB LPDDR4
- 16GB eMMC flash
- 4 USB 3.0
- 1 GbE ethernet
- HDMI output
- 2x LEDS
- SDCard
- 2.5mm Jack with Stereo Audio + CVBS
- Infrared Received
- ADC Button
- GPIO Button
- 40 pins header + 3pins debug header

This also adds the missing toacodec node to enable internal audio codec.

Changes since v2 at [2]:
- small nit fix in DT comment

Changes since v1 at [1]:
- fixed bad compatible for sm1 toacodec node
- removed tab in bindings (but kept martin's review tag)
- renamed adc key node
- renamed flash_1v8 regulator to match schematics
- fixed vddcpu regulator voltages
- fixed ethmac rgmii-txid and checked it still worked
- added missing GPIO lines names (thanks martin !)

[1] https://lore.kernel.org/r/20210429170404.3616111-1-narmstrong@baylibre.com
[2] https://lore.kernel.org/r/20210505073248.3816183-1-narmstrong@baylibre.com

Neil Armstrong (3):
  arm64: dts: meson-sm1: add toacodec node
  dt-bindings: arm: amlogic: add Banana PI M5 bindings
  arm64: dts: meson-sm1: add Banana PI BPI-M5 board dts

 .../devicetree/bindings/arm/amlogic.yaml      |   1 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../dts/amlogic/meson-sm1-bananapi-m5.dts     | 646 ++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi    |  10 +
 4 files changed, 658 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts

-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
