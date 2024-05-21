Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96711C25B74
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 May 2024 22:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JCIimCOsGrKUzX99CS6B/0IzCKSkCrvqiVxx3hjeidk=; b=h/p0dShScYoefJ
	stJuyGlcZ+ePDb2VWC53IY0mwWcBpsfN7SIKPyiRssO7Dt8Ggbz3K+vGRlNbIZzRCzYdobWBGAujy
	tAVcpREyEk2Vji/F8mi6RJSNpXyFkWY4e9TgadMLIYpKqIlHSy1aFjl9VZfyVDe5bLHZWFCxiByRk
	B1nsAgc6CGtCKBMEXsFOYjMX3BMPHq3kF2rVfs2FJf3ypYHxwyIp3ifrI0oPb4OaVvCKuYgX8HBDO
	+WT7hrBx2685uqB2IsqG4Np12aU0WiBH3XHp5ovWrV4xBNNWCVUrQygNMiI+pCslD8fBELy5vl2Ru
	9ChY/nPrLkH5lLUIeKhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9XtJ-00000001FHD-3p5H;
	Tue, 21 May 2024 22:23:29 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9Xt6-00000001F4H-3BWv;
	Tue, 21 May 2024 22:23:18 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 4E3E7100014;
	Wed, 22 May 2024 01:23:04 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 4E3E7100014
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1716330184;
	bh=v9VZSH7QUo/jqKrFcp+LW8lw1h5+u0a9hRtUjHezKJY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=Oi7TaDo7+nQqWMQlvId222AD3nldzBtSrm59Rg4mnhI7MoIzE0CsF4nNv+toNzLnf
	 1JuFOmyz6SwXUxNuRvVESapmE+h7QUIqXyPLRp/1S6gSCAIgtYtJTr/c0Y+c9aSRB4
	 +fZdPyi9MlEVHQ7g5BIuRA/daYtJruQOZVx2y/PDAtD4EeQz9WTcBvxLPxRhgdLisv
	 CE6KO7sejhInSCQ9DoiAyN9b910h+NLODhZd2ZABm7xZbrHOVbEZwAtclM/MJkwT09
	 QVcLyrIjKvCF0hFYwimEZzNx2xSNmikujjXBhb6VY+CECz1b6iPNm1hY0Gg9k692YS
	 ZeP0mZQTZ4LIQ==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 22 May 2024 01:23:04 +0300 (MSK)
Received: from CAB-WSD-0003115.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 22 May 2024 01:23:03 +0300
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>, Conor Dooley
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>, Dmitry Rokosov
	<ddrokosov@sberdevices.ru>, Jerome Brunet <jbrunet@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Lucas Tanure <tanure@linux.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Xianwei Zhao
	<xianwei.zhao@amlogic.com>
Subject: [PATCH 2/3] dt-bindings: arm: amlogic: document AC200 support
Date: Wed, 22 May 2024 01:21:54 +0300
Message-ID: <20240521222155.28094-3-jan.dakinevich@salutedevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240521222155.28094-1-jan.dakinevich@salutedevices.com>
References: <20240521222155.28094-1-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 185400 [May 21 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: YVDakinevich@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 20 0.3.20 743589a8af6ec90b529f2124c2bbfc3ce1d2f20f, {Tracking_smtp_not_equal_from}, sberdevices.ru:7.1.1,5.0.1;127.0.0.199:7.1.2;100.64.160.123:7.1.2;smtp.sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1, FromAlignment: n, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, {Tracking_sender_alignment_int}, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/05/21 08:41:00 #25230763
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_152317_247875_EC0D3D16 
X-CRM114-Status: GOOD (  10.45  )
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

Add compatible string for the Amlogic AC200 board.

Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index a374b98080fe..fb2f5192ec43 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -183,6 +183,7 @@ properties:
           - enum:
               - amediatech,x96-air
               - amediatech,x96-air-gbit
+              - amlogic,ac200
               - bananapi,bpi-m2-pro
               - bananapi,bpi-m5
               - cyx,a95xf3-air
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
