Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5DFCD128A
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Apr 2024 17:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ehxSDghPcxEuSspBZU8foDJdm1IitSWgwUtsBcEov78=; b=bymRdsrdzqRb5j
	Ddj6Zpjua1oAthCV6iy96XKKMFPD93G1K7AyusayWqF8at6+P93cYJ/o+ET2gdmFrmK20w1gA0jhV
	M8PjZCUMPC9FDo6BSLtZogERtKuipHJgwJKVbfQHReNcwey2vQ0yJzn2Cq15mfONIxcqbsbH1oq99
	Tv6n3zfAQVBV+lD7OruHeiTCd2b2EVGu6Ntg171PZ/dJNZGSTqHSRo3XUbAr7oqVLINltcqd54m0e
	tDJqUkCprCBgvww7HDKULos12Pvao3WBMewhGP8cutlKLcNxoEbcyNd7lXbBMxdbOtEh/QCOb49aY
	8gPPBkG1JRi5qNhkcjeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrLJu-00000008RS9-1H6t;
	Mon, 01 Apr 2024 17:19:42 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrLJr-00000008RR6-0ZRx;
	Mon, 01 Apr 2024 17:19:40 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 15BF1100007;
	Mon,  1 Apr 2024 20:19:34 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 15BF1100007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1711991974;
	bh=qgJttL0sqx5Y2EBpQH+iH8vcd04Yw7u5T84Z9XbPqFM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=TAqmqURqvD7ow4Z0XUa8pCQZuD55vH3SxZhO7JbiUeAJDYeaZudXp7hgZjOilOAsu
	 eS/Z9RMCjXTPsw+JjJDDA9l2FuA/CtGf9zd552Xck00yMugZXW9u1XkHiHJ0VtvzZA
	 92cpKqdqxRauvfYktX08lKGt7z8Gm47j4X1QwOexOjafnUKrsJlpXYlRxtoUT7zqOR
	 unsZKHNA7fQvoyIO7nci19Qw8zyANIcrZ8NcS+s2jNkF4ei/kwVTHQfKnKjhSPIGQG
	 W+1F2ObmO5ZznEWO4ev8YdB+ZHcbdyNCtBVdJkYcYisiA2xiM0eoacGTJ6CYLE5ERM
	 MdTZYgIw9cC5Q==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon,  1 Apr 2024 20:19:33 +0300 (MSK)
Received: from localhost (100.64.160.123) by p-i-exch-sc-m02.sberdevices.ru
 (172.16.192.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 1 Apr
 2024 20:19:33 +0300
Date: Mon, 1 Apr 2024 20:19:33 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: Rob Herring <robh@kernel.org>
CC: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <kernel@salutedevices.com>,
	<rockosov@gmail.com>, <linux-amlogic@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v1 3/6] dt-bindings: clock: meson: a1: peripherals:
 support sys_pll_div16 input
Message-ID: <20240401171933.bqmjsuanqsjvjosn@CAB-WSD-L081021>
References: <20240329205904.25002-1-ddrokosov@salutedevices.com>
 <20240329205904.25002-4-ddrokosov@salutedevices.com>
 <20240401142136.GA559114-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240401142136.GA559114-robh@kernel.org>
User-Agent: NeoMutt/20220415
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184515 [Apr 01 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 14 0.3.14 5a0c43d8a1c3c0e5b0916cc02a90d4b950c01f96, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1;127.0.0.199:7.1.2;100.64.160.123:7.1.2;smtp.sberdevices.ru:5.0.1,7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/04/01 15:13:00 #24563578
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_101939_549412_2ADC0A21 
X-CRM114-Status: GOOD (  20.77  )
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

Hello Rob,

Thank you for the quick review.

On Mon, Apr 01, 2024 at 09:21:36AM -0500, Rob Herring wrote:
> On Fri, Mar 29, 2024 at 11:58:43PM +0300, Dmitry Rokosov wrote:
> > The 'sys_pll_div16' input clock is used as one of the sources for the
> > GEN clock.
> > 
> > Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> > ---
> >  .../bindings/clock/amlogic,a1-peripherals-clkc.yaml          | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/amlogic,a1-peripherals-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a1-peripherals-clkc.yaml
> > index 6d84cee1bd75..f6668991ff1f 100644
> > --- a/Documentation/devicetree/bindings/clock/amlogic,a1-peripherals-clkc.yaml
> > +++ b/Documentation/devicetree/bindings/clock/amlogic,a1-peripherals-clkc.yaml
> > @@ -29,6 +29,7 @@ properties:
> >        - description: input fixed pll div5
> >        - description: input fixed pll div7
> >        - description: input hifi pll
> > +      - description: input sys pll div16
> >        - description: input oscillator (usually at 24MHz)
> >  
> >    clock-names:
> > @@ -38,6 +39,7 @@ properties:
> >        - const: fclk_div5
> >        - const: fclk_div7
> >        - const: hifi_pll
> > +      - const: sys_pll_div16
> >        - const: xtal
> 
> And adding an entry in the middle is also an ABI break. New entries go 
> on the end (and should be optional).

The clock source sys_pll_div16, being one of the GEN clock parents,
plays a crucial role and cannot be tagged as "optional". Unfortunately,
it was not implemented earlier due to the cpu clock ctrl driver's
pending status on the TODO list.

I would greatly appreciate your advice on the best and simplest way to
resolve this matter in an effective manner..

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
