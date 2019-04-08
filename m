Return-Path: <SRS0=BDF+=SK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D751C282CE
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Apr 2019 09:32:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0330208E3
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Apr 2019 09:32:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jf83UTJH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="aHexLNXo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0330208E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wFLVh8Yx2sh4G2MuZxmKoUraQgIodip6WrceFzp/6ho=; b=jf83UTJHYnwA4e
	nDOSh8dwOwZ1bhJRBfuscO0iyN1Y8JZBPZ7Hhy3BMEb7XCWTjmli4Wf9Y99zDfLxpGUPGWpjfrMUS
	x2Fe8SpbAFJvCBY7laJA2N2uLMzt/TOzjir4DYlk7qmlyXSba6E8tScTUmEK6Ohf7asFa1M7wP7yI
	F4ZXuceLaIrwzEvkgfZKQrnHo340kztaOr2L6QgzfByyL24+5TzkCm3BDnnvdM3gYhicUll+vc7iU
	o6qgYc9bNbKzGk6upF8vmN0Wj8cN+RYekqdYTnJCQvylsXbodwyITJ5FqUunxPkLmbnuKcRR99Chi
	hZM2v6RvYSEcHsmtUIFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDQdD-00083f-1k; Mon, 08 Apr 2019 09:31:59 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDQcx-0007o4-9Q
 for linux-amlogic@lists.infradead.org; Mon, 08 Apr 2019 09:31:48 +0000
Received: by mail-wm1-x336.google.com with SMTP id y197so13937207wmd.0
 for <linux-amlogic@lists.infradead.org>; Mon, 08 Apr 2019 02:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eqWPfOz+T7d3ynKAyEVuUA/TRR+nVEQpGlMKSeGnrsA=;
 b=aHexLNXoHmWkgXhi4+JSf/ri4QB6cAx309BzNLM1Fvcj9n2syx9qxPF0tLC7YHJglW
 naoSdT/cNLRbY5kfnmTfqnIxVXoS2mcnYuyIzHpMpBSwODQN1JVG0KG9tSy6RGlrEu2R
 C70NsQhSbi8fDnuKUOnPS21juTPlh/MC9cW8y+n9yR83i+pbxdt+hk4F/CSCwasg3jrw
 DGB3ijYcTV7s7GqrTYPN7OrLl7bAUoe+teSx96PNWu1kHwkN676Cl0i+iAGfSBL9tWdQ
 iX8zrss1tHGRgFRk+ekQM+zMZIP7gMr0gQBzZaf622b+warHwcHyCYn6GpsQjlP34sqB
 RTsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eqWPfOz+T7d3ynKAyEVuUA/TRR+nVEQpGlMKSeGnrsA=;
 b=J/8VkS35sG5eenuV5U3XCIULuNC3FKW5IVzkOCQ1m2RxgBvxLesF9Zm3PdPjJtdOk2
 IsVKYJemgQg0DkLvchay+39N/DbSTeIwpHNvMKpaOyhxCJxQlZiQPbQa2EeZPzeo1z36
 9LN+tiBc4OHQ0XQKdp310CcJ11DcOSpCss82XXUs95+911UGG/uLyzR8WLhmjJJcqVCa
 4tcI4faJpB7H/r6Vort6FBnXxw/NzQs/NxiCW1Ix3NAUpk40/vYTkgM3Y1KyqDt/EPMQ
 tTSR/4lmChqkW/JSPOuYeLQckfNAZydeqyKF3YnRyXZMEO6skzV8UM0rSRj8ZoDB5U2/
 zVxQ==
X-Gm-Message-State: APjAAAUYtGPJ/uBqFpS91D7cGEPWgLV7tTWvaDl5X9Sc57EcTyxsvmMf
 HRUInFSB3KyRJqrc5mblapWQgQ==
X-Google-Smtp-Source: APXvYqyqWO3za6JB7f5eX1xm5uFsTEZV6g5Bs0L24HPSBsybRHhlYhADWMUB0dyP19ttI58eAYxZ+g==
X-Received: by 2002:a1c:4105:: with SMTP id o5mr15916837wma.35.1554715901291; 
 Mon, 08 Apr 2019 02:31:41 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id c10sm36777427wru.83.2019.04.08.02.31.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 08 Apr 2019 02:31:40 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2 0/5] arm64: dts: meson-g12a: Add support for Video Display
Date: Mon,  8 Apr 2019 11:31:34 +0200
Message-Id: <20190408093139.27161-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190408_023146_358243_DC4A99C7 
X-CRM114-Status: UNSURE (   7.88  )
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

This patchset adds nodes for Video Display support.

Dependencies :
- patch 1: VPU, HDMI & Power Controller bindings to be applied
- patch 2: Depends on AO-CEC-B bindings to be applied
- patch 3, 4, 5: Patch 1

Changes since v1:
- Added support for AO-CEC-B, enabling AO-CEC-B and disabling AO-CEC-A by default

[1] https://lkml.kernel.org/r/20190313141030.5958-1-narmstrong@baylibre.com

Neil Armstrong (5):
  arm64: dts: meson-g12a: Add VPU and HDMI related nodes
  arm64: dts: meson-g12a: Add AO-CEC nodes
  arm64: dts: meson-g12a-x96-max: Add support for Video Display
  arm64: dts: meson-g12a-sei510: Add support for Video Display
  arm64: dts: meson-g12a-u200: Add support for Video Display

 .../boot/dts/amlogic/meson-g12a-sei510.dts    |  53 ++++++
 .../boot/dts/amlogic/meson-g12a-u200.dts      |  54 ++++++
 .../boot/dts/amlogic/meson-g12a-x96-max.dts   |  54 ++++++
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi   | 165 ++++++++++++++++++
 4 files changed, 326 insertions(+)

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
