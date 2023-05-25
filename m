Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D88CC7EE29
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 May 2023 14:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MhPmd1OQCRfSwg1lUwGA5ImfbOsxXu374kro8GbgmZM=; b=op3gV2XqnBRGRR
	imUB3b7dWAx/gxhLPsS8EUTvUOeFvF3ZrXjGHRV0DLKxkcMIHVtjhV4EMCVuAxh65F4G0QzllNBDs
	zSg4STLtI1vrNpCFnzKQTjaHaFup8x0K0aiqAj3UGc2OLumNjkkAAmGcN9YzockTQu09AFbmMB1Fe
	xdoplXHYGT2u/6rZNukoACSUjDbQHs8muKW/RnPsEFQf4Cmfwm1V/Fz8rjBWu8qmNGzxOn+bEBb09
	MNNDJMjq7q/8lQLfffUj0YABuFXsp36hVqMMyrmFkNr+5HS0oj4aLga+naL/1ytC6kt8FGAmhf8vK
	ofZR62GaLGeRxmw3odcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2BWk-00Gn8i-2D;
	Thu, 25 May 2023 14:01:14 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2BWg-00Gn7J-1G;
	Thu, 25 May 2023 14:01:13 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 9CC4D5FD51;
	Thu, 25 May 2023 17:01:02 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1685023262;
	bh=bpPitjV95L3ioVshJeARXDTfhB1q4NXomIjqNtoVQq0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=g542J5yIh9b82dadzQ8Wzl6DX57oGV8BuX0mh2ze4Lxm+6swAF021XvoO8GlwxhT6
	 Pq7nf95oLmZnAL7nbuuLJrlbpPy+Ls62/SpbtMjJ1+zYrgZRm+mv6c9jEW7PG11L7K
	 MWOZeU+48k2eWJJPd5jBSlocvi6aBbF883AvvL3TtR5N3LA9lLGt0Mgy6Vufx4y4v0
	 UZeg7QdcWiUFvEEKDnq6/udXmN2PqmQeLhV2nI8+vkeOpEFcvawVE/FCbXyq4nxnEJ
	 tTtWSfufJTfkg06kJ5qH2vEyV2UYNmOpwFKsXlspxbSAfqDIQtzzNyjs8AnRfB8Y2s
	 AWQ3QJod3p4IA==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Thu, 25 May 2023 17:01:01 +0300 (MSK)
Date: Thu, 25 May 2023 17:01:00 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Conor Dooley <conor.dooley@microchip.com>
CC: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor@kernel.org>, <jian.hu@amlogic.com>, <kernel@sberdevices.ru>,
	<rockosov@gmail.com>, <linux-amlogic@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v16 5/6] dt-bindings: clock: meson: add A1 Peripherals
 clock controller bindings
Message-ID: <20230525140100.mdzuhyfhxxkf4mx7@CAB-WSD-L081021>
References: <20230523135351.19133-1-ddrokosov@sberdevices.ru>
 <20230523135351.19133-6-ddrokosov@sberdevices.ru>
 <20230525093736.naztwqlhvskujsoa@CAB-WSD-L081021>
 <20230525-connected-skipper-442c6d0b52c1@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230525-connected-skipper-442c6d0b52c1@wendy>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/05/25 11:25:00 #21349968
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_070110_955054_B3A9D2BD 
X-CRM114-Status: GOOD (  14.15  )
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

Thank you for quick reply!

On Thu, May 25, 2023 at 02:16:02PM +0100, Conor Dooley wrote:
> On Thu, May 25, 2023 at 12:37:36PM +0300, Dmitry Rokosov wrote:
> > Hello Rob, Krzysztof and Conor,
> > 
> > Could you please take a look at this patch version? Before Rob marked
> > this patchset with RvB at v13 -
> > https://lore.kernel.org/linux-amlogic/168130720431.2218249.7671061964988064525.robh@kernel.org/
> > 
> > However, due to several comments from other maintainers, unfortunately,
> > I had to rename the 'a1-clkc' controller to 'a1-peripherals-clkc' and
> > remove Rob's RvB.
> 
> I dunno if the compatible change is worth dropping the tag for tbh.
> That seems to be the only change, so I guess you can have my R-b instead
> of Rob's...
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Cheers,
> Conor.

I was unaware of the official policy regarding the removal of RvB during
renaming changes. I took a cautious approach to the situation :)

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
