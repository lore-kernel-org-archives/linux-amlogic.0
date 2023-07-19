Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B321C001DE
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Jul 2023 14:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L6V1FjW4K5AkHtqhweu0DKxEhVaPgWVxNf6eOkqVpgA=; b=GQLdy/3nbjw/mq
	rzURZGGTKJtEvyj4m0dTbKRDyQGJ7UsfoSsh70lmwzICNYHUsseGkmX5FJ8k4H1MJcPFLBxl6LZ11
	VeXIBHiNx39S/JotPHi7Q08E6zmApflhWvX1GnGsqkmM+NtcZdAKitJI+l3IoQWzPdM0XUMrlnYTM
	NzPPUVirVd5j7by5qIfliCt+ke18sLhP/2ATeQSD3Wl41ySmYle526f2mehpQxeNWZacwZLaNaw5h
	+tPnyRZHpgbOGMkcX/hrEG+AUVcxJ1dsQoNFW4jVIRoDbilajaUKd3EMhUrwsEPoPSKCRqN7SBO9c
	ELdzn7SMX08XR4xE7hvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM7tp-007g5W-0s;
	Wed, 19 Jul 2023 14:11:29 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM7tk-007g2j-00;
	Wed, 19 Jul 2023 14:11:27 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 6595F12007A;
	Wed, 19 Jul 2023 17:11:17 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 6595F12007A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1689775877;
	bh=bLDHWlqd+9J/3Q27qKAYWbhXTkIrXZ9utoTJw3eZAd8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=PwSykd0PZrBLwQYuZ8SUlmv7SUWrN/+vEAAwid/jh8Je1gRYVfsD4dvac9sJE6ckR
	 ew0OH1vo3tIPQSFlTp5NfiRSKD65Xc5/wM47N0O8hEfJeEErg9hVQGyHPsiyRlQJWp
	 pYtawhiM5aPl5IPg6yHL7vSq7ArrBmsMclz3t7Vp6z/NuVTwvKOj/eEC3JlPdGKr6i
	 bb3z8fFV0Z7cZbQRE95u/5ajlO5Ku4IP4nobm2GAfr9EQPPJl/0dizSxvnbWMXOxzY
	 awIiI4XTbG4U5neNphUHPopIMBzTwtGgJGO0tUvCjMXNmfLkFAIqmzI6E1/HDPhTE8
	 00U2IEp3ZXsng==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 19 Jul 2023 17:11:17 +0300 (MSK)
Received: from localhost (100.64.160.123) by p-i-exch-sc-m01.sberdevices.ru
 (172.16.192.107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 19 Jul
 2023 17:11:17 +0300
Date: Wed, 19 Jul 2023 17:11:11 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: zelong dong <zelong.dong@amlogic.com>, <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Philipp
 Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Jerome Brunet
	<jbrunet@baylibre.com>, <linux-kernel@vger.kernel.org>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <kelvin.zhang@amlogic.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: reset: Add compatible and DT
 bindings for Amlogic C3 Reset Controller
Message-ID: <20230719141111.ykg2pfv4dmyvutqm@CAB-WSD-L081021>
References: <20230719060954.14864-1-zelong.dong@amlogic.com>
 <20230719060954.14864-2-zelong.dong@amlogic.com>
 <20230719115014.2har4sool7d5edcn@CAB-WSD-L081021>
 <c6fd4df2-97ab-a830-f466-2d09f5b38dfc@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c6fd4df2-97ab-a830-f466-2d09f5b38dfc@linaro.org>
User-Agent: NeoMutt/20220415
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178725 [Jul 19 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: DDRokosov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 524 524 9753033d6953787301affc41bead8ed49c47b39d, {Tracking_uf_ne_domains}, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;sberdevices.ru:5.0.1,7.1.1;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;www.kernel.org:7.1.1;127.0.0.199:7.1.2, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2023/07/19 13:07:00
X-KSMG-LinksScanning: Clean, bases: 2023/07/19 13:07:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/19 10:42:00 #21641119
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_071124_908724_13766416 
X-CRM114-Status: GOOD (  18.28  )
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

On Wed, Jul 19, 2023 at 02:33:03PM +0200, Krzysztof Kozlowski wrote:
> On 19/07/2023 13:50, Dmitry Rokosov wrote:
> > On Wed, Jul 19, 2023 at 02:09:52PM +0800, zelong dong wrote:
> >> From: Zelong Dong <zelong.dong@amlogic.com>
> >>
> >> Add new compatible and DT bindings for Amlogic C3 Reset Controller
> >>
> >> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
> >> ---
> >>  .../bindings/reset/amlogic,meson-reset.yaml   |   1 +
> >>  include/dt-bindings/reset/amlogic,c3-reset.h  | 119 ++++++++++++++++++
> >>  2 files changed, 120 insertions(+)
> > 
> > As I understand it, updates to DT bindings documentation, as well as any
> > DT bindings includes, should be submitted in separate patches, per the
> > guidelines outlined in the following link:
> > https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters.
> > 
> > Krzysztof, Rob, and Conor, please correct me if I am mistaken.
> 
> And they are. What's wrong here?

Please accept my apologies for any confusion caused. Initially, I
misunderstood that YAML documentation and device tree bindings includes
should be kept separate.

As such, this patch includes modifications to both areas, namely
bindings documentation and include/dt-bindings, but all of them are
separate from driver part.

In this case,

Reviewed-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
