Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 049C6CD1299
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Apr 2024 16:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tuFGmF4HajUhLweKPzU7EhkBrwYtKpzKe8D7xL5VtfI=; b=ekFdzGNHK0fS4F
	hVZAAjX6bs6A2Tf2sXxnrq5kC5TvUB6vQAeOZTbJvNy9CRAhdxrHmxeze8EyXQmQf56u/o6F9kBQx
	OJgSoro/BpHuGgXxjoim3VCFUr89N6P3Tjh9H6yZOVfhJOZH6lBeh9p1bcLbzVIy5J7HLCauwlWbL
	dr5wXwp6uxPl7r5nsw8+Y0JxdxqLsyTtmPIx+HdAattiIoKUls98eXIA4/s2jYdwSgfTsxYU3my+u
	gnQmRZH9PHZOFBydv/H5GNvLco5Z2qowxmXKX8c+v8fuls+AyQZymDu474BhO+qCVyGqnyTWkwzzC
	jiRmXA3aTN9vBW42XCMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtsCC-0000000GFKZ-0anj;
	Mon, 08 Apr 2024 16:50:12 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtsC8-0000000GFHX-1Cix;
	Mon, 08 Apr 2024 16:50:10 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id AD415120027;
	Mon,  8 Apr 2024 19:49:56 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru AD415120027
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1712594996;
	bh=HZCeDqOWZRFrRmmJb31Zwudz+k5V9qwLfzuWrQFrCr0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=Mbjhu4jURZzp+med9MOYEhZqXIgEyuvptRXXUaggCCEGe0qvFQqtxIECPMCb09o4e
	 9U+RLqL4qYCNn5WhVgap/l44esWXeH78j+mYbOz68RQ/ty1a9IVMOSnflfPJhuiMUH
	 USz3kmZn5u++K7n//jZRMP27/O+bEQHRQI56/FB86sk6gOmkichtCluqUd89Xsy59p
	 OwQJIP/K5BoU4biD4gdHOxLYzSvewd+E5QbMu+3M+cxoHVZg1q3AR3FCh5izEt4dss
	 mplv84t39KGU4/ZQIK1PKZFy9sA2b0iRa2Wp9eHlMcJfD3VsesvN70pEe5X3O5yQyt
	 odkf53me/OI+A==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon,  8 Apr 2024 19:49:56 +0300 (MSK)
Received: from CAB-WSD-L081021.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 8 Apr 2024 19:49:56 +0300
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
Subject: [PATCH v1 2/2] ASoC: meson: implement link-name optional property in meson card utils
Date: Mon, 8 Apr 2024 19:49:40 +0300
Message-ID: <20240408164947.30717-3-ddrokosov@salutedevices.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240408164947.30717-1-ddrokosov@salutedevices.com>
References: <20240408164947.30717-1-ddrokosov@salutedevices.com>
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
X-CRM114-CacheID: sfid-20240408_095008_812214_2D2A1D7A 
X-CRM114-Status: GOOD (  12.77  )
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

The 'link-name' property presents an optional DT feature that empowers
users to customize the name associated with the DAI link and PCM stream.
This functionality reflects the approach often employed in Qualcomm
audio cards, providing enhanced flexibility in DAI naming conventions
for improved system integration and userspace experience.

It allows userspace program to easy determine PCM stream purpose, e.g.:
    ~ # cat /proc/asound/pcm
    00-00: speaker (*) :  : playback 1
    00-01: mics (*) :  : capture 1
    00-02: loopback (*) :  : capture 1

The previous naming approach using auto-generated fe or be strings
continues to be utilized as a fallback.

Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
---
 sound/soc/meson/meson-card-utils.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
index ed6c7e2f609c..7bae72905a9b 100644
--- a/sound/soc/meson/meson-card-utils.c
+++ b/sound/soc/meson/meson-card-utils.c
@@ -94,10 +94,14 @@ static int meson_card_set_link_name(struct snd_soc_card *card,
 				    struct device_node *node,
 				    const char *prefix)
 {
-	char *name = devm_kasprintf(card->dev, GFP_KERNEL, "%s.%s",
-				    prefix, node->full_name);
-	if (!name)
-		return -ENOMEM;
+	const char *name;
+
+	if (of_property_read_string(node, "link-name", &name)) {
+		name = devm_kasprintf(card->dev, GFP_KERNEL, "%s.%s",
+				      prefix, node->full_name);
+		if (!name)
+			return -ENOMEM;
+	}
 
 	link->name = name;
 	link->stream_name = name;
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
