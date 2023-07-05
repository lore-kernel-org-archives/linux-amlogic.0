Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A23EB64DA
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jul 2023 09:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FHas0B+f0/soZ/CJ4A0f+VvBH0HtJOwxYIzoO5m1DPo=; b=XyPWQSm9IKoq4D
	O8a+hZmoMjigrvWXWVBD7ng/vbtLMnfnFGRNbqJYZZYX/yNepbqviMEDaQmdkkoff1qhFnvyovRFg
	/RK1DSuRAtg56E/BWUW31RqRu7ihHRRgKfScUAuiko8PnnBVYI1OGMSMu07wHczg4BqjTsq0bcUi9
	BowVIADvXDE1Fmw9Wj11w7OtyH+iHDC3cAOeNgY4t/ORFfxqUUoMDFV0EFEQu9PvPjkt+dVW9tSpD
	s3oyQElwjGDDb2mnKmrxD4Qz8KRMY9fMdxDjZDG80rWydeC3owW+dlDoSBSm7/OTCyUKi1mny0iXz
	HD6joW4RdMEFgX/f563w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGz6F-00FOyl-1M;
	Wed, 05 Jul 2023 09:47:03 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGz6A-00FOvT-0f;
	Wed, 05 Jul 2023 09:47:01 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id E1B8A12005A;
	Wed,  5 Jul 2023 12:46:38 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru E1B8A12005A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1688550398;
	bh=ruyM7/967PkR3Obij04ndcyWIoQTBHGsMkxNaYWC+H8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=hvznwnH+YYIysXV3qrXto4v2qRPeYETSTSzrMHyOGWOCKJFMAX/mrax4QZbCcN1Bu
	 /YlE8EjMnnsGSZhrJURP3J8nbe3/O1aVMnM9JWcC3aHEJ4JZgqAQFpFhfJrYljWhpj
	 rFeB3CbdyoosyYwDVZ1pIv9IyYoahec68KEwN4t8l/ckPNE2uC2MfSMMUm7PTlMvMW
	 o3TYbFObVrXMOwofIkAPk4P+j2vCelBmktG6wj+EiSWcB+jkvZ/zen7JMAuzOSVQIU
	 P1m8Y+DlxhEPlWKqadgE18u9LRjVvvoVuNGIl6KqfxkkJVmWj3zVuyeHy9dVTUIcxK
	 C2Ni5Op61thdA==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed,  5 Jul 2023 12:46:38 +0300 (MSK)
Received: from localhost (100.64.160.123) by p-i-exch-sc-m01.sberdevices.ru
 (172.16.192.107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 5 Jul
 2023 12:46:37 +0300
Date: Wed, 5 Jul 2023 12:46:38 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Conor Dooley <conor@kernel.org>
CC: <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<neil.armstrong@linaro.org>, <jbrunet@baylibre.com>, <jirislaby@kernel.org>,
	<khilman@baylibre.com>, <martin.blumenstingl@googlemail.com>,
	<kelvin.zhang@amlogic.com>, <xianwei.zhao@amlogic.com>,
	<kernel@sberdevices.ru>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-serial@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v1 5/5] arm64: dts: meson: a1: change uart compatible
 string
Message-ID: <20230705094638.mosz6wk76ztd5xf5@CAB-WSD-L081021>
References: <20230704135936.14697-1-ddrokosov@sberdevices.ru>
 <20230704135936.14697-6-ddrokosov@sberdevices.ru>
 <20230704-cannabis-cannon-19397cd806bc@spud>
 <20230704170843.wksxekltre2ob4en@CAB-WSD-L081021>
 <20230704-staff-smilingly-401b99e28edd@spud>
 <20230704171900.ulnnpkuzvtbbqa3d@CAB-WSD-L081021>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230704171900.ulnnpkuzvtbbqa3d@CAB-WSD-L081021>
User-Agent: NeoMutt/20220415
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178440 [Jul 05 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: DDRokosov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 520 520 ccb018a655251011855942a2571029252d3d69a2, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;sberdevices.ru:7.1.1,5.0.1;p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/05 05:28:00 #21565829
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_024658_587654_9B015FA2 
X-CRM114-Status: GOOD (  23.22  )
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

Conor,

On Tue, Jul 04, 2023 at 08:19:00PM +0300, Dmitry Rokosov wrote:
> On Tue, Jul 04, 2023 at 06:10:46PM +0100, Conor Dooley wrote:
> > On Tue, Jul 04, 2023 at 08:08:43PM +0300, Dmitry Rokosov wrote:
> > > On Tue, Jul 04, 2023 at 06:02:58PM +0100, Conor Dooley wrote:
> > > > On Tue, Jul 04, 2023 at 04:59:36PM +0300, Dmitry Rokosov wrote:
> > > > > In the current implementation, the meson-a1 configuration incorporates a
> > > > > unique compatibility tag "amlogic,meson-a1-uart' within the meson-uart
> > > > > driver due to its usage of the new console device name "ttyS".
> > > > > Consequently, the previous compatibility tag designated for the
> > > > > 'amlogic,meson-gx-uart' configuration has become obsolete and is no
> > > > > longer relevant to the current setup.
> > > > 
> > > > I don't really see why you would remove the gx-uart to be honest, and
> > > > not use it as a fallback. Neil's platform though, so his call :)
> > > > 
> > > 
> > > Because of amlogic,meson-gx-uart has legacy devname, we do not want to
> > > use it in the A1.
> > 
> > Which I did read in your commit message, fallback being the operative
> > word here.
> 
> Although it is difficult for me to envision a situation where we would
> require this fallback, but gx-uart fallback will function from a kernel
> perspective (without taking into account bootloader setup or userspace
> daemon script). I don't have any objections to stay gx-uart as a
> fallback, will do it in the v2.

Unfortunately, it's not possible based on schema rules. During dtbs check
I've got the such error:

arch/arm64/boot/dts/amlogic/meson-a1-ad401.dtb: serial@1c00: compatible: 'oneOf' conditional failed, one must be fixed:
	['amlogic,meson-a1-uart', 'amlogic,meson-ao-uart', 'amlogic,meson-gx-uart'] is too long
	'amlogic,meson-g12a-uart' was expected
	'amlogic,meson-gx-uart' was expected
	'amlogic,meson-ao-uart' was expected
	From schema: Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml

Of course, we can change dt bindings schema, but is it really needed? As
I said before, it's difficult to imagine the situation, when gx-uart
fallback will be helpful.

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
