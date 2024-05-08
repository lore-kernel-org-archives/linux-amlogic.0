Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09FAEC19F4F
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 May 2024 14:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7IhKM1DZmwWrudipU1XEcsQWMSLvPZyD/CJtIxmdV48=; b=F23pJVLWYHJwHw
	CZcYlucabcO3WGnCsd38i+JrFUeGiPtcCrfqyrRugnwK5u6Vf2g4DxwCohpoBP8oygf5/4GE3YY4N
	3D/O7BRNtp07tc4jTjqPEwrF9B8NZ2gWpoR5EhRSrLcJK1EaDkyEPDW+YBz63FOvJ9W9HEM7C1eip
	ZFzUizzj6RoW1iy78fdKtzabxUlRGz8KO8hhvu3JWTm4FQ97a1JiuQiFyRB3LXO0/yeVkH1Z7BuUf
	vX5tYOZ3bmf4Ryfz6YDpx/IEJcDJDqFAHQaO3kpqGL+jqIKm/D5PSYyYMj3OOWxv/MP8BVg0RF8e8
	qASpCUpr/4hsE3H0017w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4iWQ-0000000Ft9H-3AgT;
	Wed, 08 May 2024 14:43:54 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4iWF-0000000FszO-1jNR;
	Wed, 08 May 2024 14:43:52 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id AC99E120008;
	Wed,  8 May 2024 17:43:30 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru AC99E120008
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1715179410;
	bh=0jC9OmU53LLfwrewlLDVbsUks0O+ztvJHUVnwfXtnnc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=hbJjq/xOsUZo4lq6NzU+mi2uH0Fa4xKbcDdoVehmhEvqdrge33F1MqIfwMpT6BHNn
	 X+Dtopb7QTym6SHfQw0FoNwaEeLPBQGxlEaURt3CJv0k9rgqeVN+0dmPVyIlG+7R8v
	 LJXMLBIlHD+ujEtO6ePzBBa60wVtOr425HQuYQ8/etDlYXpfYZOr0JMDq/b2Sdfl6n
	 d1EhVyZCaEc6eUlIwpagQ7LQgU86vp9gduMl9dx+6OKWeSEFm6ybvZGD/urqMVeHn7
	 qK9Xa/w/eqAWjG0Rm0iNWRcKhRqB7Sosi918x3E4NnqSVmGxAO7Cmjuxc+lIggGB3b
	 ZQMmtnWtYx+VA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed,  8 May 2024 17:43:30 +0300 (MSK)
Received: from CAB-WSD-0003115.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 8 May 2024 17:43:30 +0300
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>, Conor Dooley
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>, Jerome Brunet
	<jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Michael Turquette
	<mturquette@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, Rob
 Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Subject: [QUESTION] Convert axg-audio-clkc to YAML format
Date: Wed, 8 May 2024 17:42:56 +0300
Message-ID: <20240508144259.191843-1-jan.dakinevich@salutedevices.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 185143 [May 08 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: YVDakinevich@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 19 0.3.19 07c7fa124d1a1dc9662cdc5aace418c06ae99d2b, {Tracking_smtp_not_equal_from}, {Tracking_uf_ne_domains}, {Tracking_bl_eng_cat, c15}, salutedevices.com:7.1.1;lore.kernel.org:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;sberdevices.ru:5.0.1,7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1;100.64.160.123:7.1.2, FromAlignment: n, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, {Tracking_sender_alignment_int}, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/05/08 13:27:00
X-KSMG-LinksScanning: Clean, bases: 2024/05/08 13:27:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/05/08 09:52:00 #25122865
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_074344_231538_1C515131 
X-CRM114-Status: GOOD (  11.78  )
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

Previously we discussed how to implement dt-schema for audio clock controller in
Amlogic SoC [1]. Also, there was an earlier attempt to convert to yaml [2].

Let me remind you that the problem is that only "pclk" clock of this controller.
Other clocks are optional and they are allowed to be not routed.

I can suggest two approaches how to deal with this. Could you please tell me
which of them is more correct?

Approach 1: use 'additionalItems' to declare optional clocks.
Pros: 
 - it is short and simple;
 - no need to modify existing DTSIs.
Cons:
 - checking works but 'additionalItems' doesn't expect no-boolean value [3]
 - there is reasoning that all clocks should be specified ragardless if they are
   used or not [3][4].

Approach 2: assume that all clocks are mandatory and declare all of them.
Pros:
 - it is more common and compatible with existing meta-schemas;
 - may be architecturally it is more correct.
Cons:
 - boilerplate in schema and in DTSIs;
 - requires modification of existing DTSIs.

Links:
[1] https://lore.kernel.org/lkml/20240419125812.983409-5-jan.dakinevich@salutedevices.com/
[2] https://lore.kernel.org/linux-devicetree/20230808194811.113087-1-alexander.stein@mailbox.org/
[3] https://lore.kernel.org/lkml/20240419210949.GA3979121-robh@kernel.org/
[4] https://lore.kernel.org/lkml/07b1ca57-49a0-4151-99bf-caac053eaa01@kernel.org/

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
