Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 586F6CD1296
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Apr 2024 16:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=95O+XbQ29cFnB42HSE43OwyUREIhtlSt8Dy6LhOHjwg=; b=ktWgnedfrwm5lN
	/pdeDfvITpvyg2JKUnfyj2z6GKlKYKrOMLvCjkhXvtgwcmMCLCSdx4UKZFDrCgcy0PlRqg6MWtzeZ
	+m6JENY1eP5eG167NXdeS5XFQJRnlaLt1fj/iZ+zo6o0xIf2KuiS/lGNtiXEXePKxN9Skd1UMQFIn
	4R+L9RixUZlrJ9+mxRlos7S3xR/j8dDxDG4pZQF3vZiL4i7vYFCNAKzlZK6bkyvgiOJ5TLf+uPo2V
	DIl+N77z21BWkEraSiaQ0BkLhrmXYLAd/1YGA7rwY+BH375IsiPryBatwrI0TKgCbaXSKkndbQ6Ue
	5R7SiQlFTf+bZNEK81ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtsCI-0000000GFN9-2fEc;
	Mon, 08 Apr 2024 16:50:18 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtsCE-0000000GFHT-1Ky1;
	Mon, 08 Apr 2024 16:50:16 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 9103F120023;
	Mon,  8 Apr 2024 19:49:54 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 9103F120023
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1712594994;
	bh=GVKo6znhMy5c2DD7Af70VLwRzPogSN+CP1wNv/Gt+K0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=GKl0rt1Jj2HYmfyKyUjhNSb/kz4hyLxsaa/jopgRVQ/gw0Paprmnt287VkE/rRfoH
	 REmEizIKeseLRD60c482kp0flYdlWsjOk441rFXVXHkOhpfdX/CSjpDAg0/uy3iLzx
	 BEtgao8PC1EKsXa/qgVn+530uet9waOyOQtZKm8HqptZuC4L1T6wbF4AEsyR/kXWDI
	 DhqeviGKT0GgzB8Lh/EeKUwgO6EskWAqX3ZHpTmrMIXeMsyGH4QTOK4NYNAfjYA+bD
	 PRKiICVaXkblhNOhVq9Rfeq3PbLYlSByxmvVAID5KzL+j/6jAL4zXyVd64qIK4IE6i
	 Go2JZZdr+sw8A==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon,  8 Apr 2024 19:49:54 +0300 (MSK)
Received: from CAB-WSD-L081021.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 8 Apr 2024 19:49:53 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: <neil.armstrong@linaro.org>, <lgirdwood@gmail.com>,
	<jbrunet@baylibre.com>, <broonie@kernel.org>, <conor+dt@kernel.org>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>, <perex@perex.cz>,
	<tiwai@suse.com>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>
CC: <kernel@salutedevices.com>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <alsa-devel@alsa-project.org>,
	<linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Dmitry Rokosov <ddrokosov@salutedevices.com>
Subject: [PATCH v1 0/2] ASoC: meson: implement link-name optional property in meson audio card
Date: Mon, 8 Apr 2024 19:49:38 +0300
Message-ID: <20240408164947.30717-1-ddrokosov@salutedevices.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184624 [Apr 08 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 15 0.3.15 adb41f89e2951eb37b279104a7abb8e79494a5e7, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1;100.64.160.123:7.1.2;smtp.sberdevices.ru:5.0.1,7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/04/08 12:02:00 #24709100
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_095014_726630_F133EE4C 
X-CRM114-Status: UNSURE (   8.38  )
X-CRM114-Notice: Please train this message.
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

The 'link-name' is optional feature in the Device Tree that allows users
to customize the name associated with the DAI link and PCM stream.  This
feature provides enhanced flexibility in DAI naming conventions, leading
to improved system integration and a better user experience.

Dmitry Rokosov (2):
  ASoC: dt-bindings: meson: introduce link-name optional property
  ASoC: meson: implement link-name optional property in meson card utils

 .../bindings/sound/amlogic,axg-sound-card.yaml       |  6 ++++++
 .../bindings/sound/amlogic,gx-sound-card.yaml        |  6 ++++++
 sound/soc/meson/meson-card-utils.c                   | 12 ++++++++----
 3 files changed, 20 insertions(+), 4 deletions(-)

-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
