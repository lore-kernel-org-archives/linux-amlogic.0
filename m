Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA07DEB64D9
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Jul 2023 17:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pb3oUxDqblNWVFHHCIGyPbXSH3ind2ijMPQhAnbZTaM=; b=hEt0ko3pvfKCHQ
	zma1pOvAF6+GERhGhgedvPQ85ViGPxuN7vKKNPPkSZUToiQHr3u6nKxm4wL0NhigbofS9LVP6slld
	MlEfOOFdhUHVZImhDz7yVt2PNwlBlitMJYaJJjo+o1MbqA7uAFEDxt8FtlOAvtkK+CVixs5V5SUBF
	ObCPCAr9cskOft2qT9TJTvoj3gwL0RTH3QimXB4sRVK6WER7eVzu5hve/zvnmbeYV6n3530jLHQbU
	nAGha2nvzsRfy8ZqDGsgWAx751mv2YPvN5ysY/03aUGnKrKniQBLQOifNVZp75UZ5RTTGORWMkpeO
	iR+3uAkLzjFAETMgsnxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGjgB-00Duv9-28;
	Tue, 04 Jul 2023 17:19:07 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGjg8-00DuuU-0V;
	Tue, 04 Jul 2023 17:19:05 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 058E3100069;
	Tue,  4 Jul 2023 20:19:01 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 058E3100069
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1688491141;
	bh=+h4yVW7FjpHQ+urNjtfPriUNzJFyj06QNNvg77/XYRs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=maqmeQDMdiiQvgMVedC+XspuixWr+zxXEFZTeF5UtiGvFx5XCJ40bGxz5RX1RMZfa
	 couGVJuc3ltmrWFN8iUrKslX2Nnemmuu2SiIfQAgfETfl7rv8mx+W4G/HOBUhRa7kS
	 wypwIq6yGYZEWSeung19nxdbQ1qdLWU6EKB0LRTDqHPjLnvpd5Y2I88GMVFKZ8gxL3
	 0MiHKoFM3S1eh5esAv5FsEmI4Nt1+5SdBHqFUVTBqOoBczy0kuiMdsH/lI7VF9wQNq
	 OtSSj3HGGkwdjI7EFePVoQFdVaIgiEEbvXGdwpVATqLoHbhwGQnDrTUCwV2RpxmbDS
	 I26/yimdAVLuQ==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue,  4 Jul 2023 20:19:00 +0300 (MSK)
Received: from localhost (100.64.160.123) by p-i-exch-sc-m01.sberdevices.ru
 (172.16.192.107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 4 Jul
 2023 20:18:49 +0300
Date: Tue, 4 Jul 2023 20:19:00 +0300
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
Message-ID: <20230704171900.ulnnpkuzvtbbqa3d@CAB-WSD-L081021>
References: <20230704135936.14697-1-ddrokosov@sberdevices.ru>
 <20230704135936.14697-6-ddrokosov@sberdevices.ru>
 <20230704-cannabis-cannon-19397cd806bc@spud>
 <20230704170843.wksxekltre2ob4en@CAB-WSD-L081021>
 <20230704-staff-smilingly-401b99e28edd@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230704-staff-smilingly-401b99e28edd@spud>
User-Agent: NeoMutt/20220415
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178431 [Jul 04 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: DDRokosov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 520 520 ccb018a655251011855942a2571029252d3d69a2, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;sberdevices.ru:7.1.1,5.0.1;127.0.0.199:7.1.2;100.64.160.123:7.1.2, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/04 05:54:00 #21559896
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_101904_584784_60055B02 
X-CRM114-Status: GOOD (  20.22  )
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

On Tue, Jul 04, 2023 at 06:10:46PM +0100, Conor Dooley wrote:
> On Tue, Jul 04, 2023 at 08:08:43PM +0300, Dmitry Rokosov wrote:
> > On Tue, Jul 04, 2023 at 06:02:58PM +0100, Conor Dooley wrote:
> > > On Tue, Jul 04, 2023 at 04:59:36PM +0300, Dmitry Rokosov wrote:
> > > > In the current implementation, the meson-a1 configuration incorporates a
> > > > unique compatibility tag "amlogic,meson-a1-uart' within the meson-uart
> > > > driver due to its usage of the new console device name "ttyS".
> > > > Consequently, the previous compatibility tag designated for the
> > > > 'amlogic,meson-gx-uart' configuration has become obsolete and is no
> > > > longer relevant to the current setup.
> > > 
> > > I don't really see why you would remove the gx-uart to be honest, and
> > > not use it as a fallback. Neil's platform though, so his call :)
> > > 
> > 
> > Because of amlogic,meson-gx-uart has legacy devname, we do not want to
> > use it in the A1.
> 
> Which I did read in your commit message, fallback being the operative
> word here.

Although it is difficult for me to envision a situation where we would
require this fallback, but gx-uart fallback will function from a kernel
perspective (without taking into account bootloader setup or userspace
daemon script). I don't have any objections to stay gx-uart as a
fallback, will do it in the v2.

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
