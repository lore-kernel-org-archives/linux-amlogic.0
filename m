Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE7FAC25B10
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 May 2024 09:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MVNnn2O1qwg2ldkafwMfkhUdlGRxuNPo3oq5uFOsC5k=; b=2CUttxfzAYc/2b
	/ppuNcrvdoVdIF5oRvARHLJ8Zwckeo1xjpT3xxkYeRo1LXIC7jGali4a8FjX1MlnUeapbI0vViEiG
	VWt9LxNiIAs/QlEexNiMSQDE9D+VAliIzge+d1tt4HjhRP37jLH6cbycok0P8IaapZd3SKM8rNucM
	CFo1/nJmggph9EHL6LrIgFUxKC7hNtQGu/SPwHdUvu2/BcwHtz4X/xxs0fDftKRBcNYSrlmGO4/2D
	U+xKvEE2L2TXxQZykBVzGbxIQJKvKuCzUwg+acqHDpJZhyabLVLgBHYyZojw9GyRP6i14QAu/lWd4
	VJ5l5foRaFokaRC4yD6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6Rp1-0000000CMYg-0pES;
	Mon, 13 May 2024 09:18:15 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6Row-0000000CMXV-1TrF;
	Mon, 13 May 2024 09:18:13 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 5634D100011;
	Mon, 13 May 2024 12:18:03 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 5634D100011
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1715591883;
	bh=wZapPsm81sWCiMCo2QOM0XD4ZqQCOsyN3/ap/NfoDK0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=M4ZTeLUTnHAGKbsi8EMyDgPJ+KMRa5UGWyVdXe8U6TMkQsSIO3QwhnKaU8rvM/HIl
	 U0EO286kdWajQoTUbv+X9Sip2TtVRFHF0nDVv/ldOpzvtn/3uPbq+VWzKsusvWSlJb
	 6j33k8ws58WecZJa7GBZjopoQCLnM2yfHpJUHkDkFJwBTy3CgD77DPHj4jsPWnQeoj
	 GmOksgLAivMk4/TS6D2oYcWv/zbSbx+4u5oJG9Fy3+wa5R8UfG/dD+8JqOY8kG2zck
	 iWRQgK2NHRPP+cqPCEDMjs2vjjf06K31lvMJuWjFxxTfQIERRCO20rkK2gaH6U9auY
	 h8JuL38054OEQ==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon, 13 May 2024 12:18:03 +0300 (MSK)
Received: from localhost (100.64.160.123) by p-i-exch-sc-m02.sberdevices.ru
 (172.16.192.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 13 May
 2024 12:18:02 +0300
Date: Mon, 13 May 2024 12:18:02 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: Conor Dooley <conor@kernel.org>
CC: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <jian.hu@amlogic.com>,
	<kernel@sberdevices.ru>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 2/7] dt-bindings: clock: meson: a1: pll: introduce new
 syspll bindings
Message-ID: <20240513091735.l3uewwzfrdd6qwbl@CAB-WSD-L081021>
References: <20240510090933.19464-1-ddrokosov@salutedevices.com>
 <20240510090933.19464-3-ddrokosov@salutedevices.com>
 <20240511-secret-barcode-e25c722ddf1d@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240511-secret-barcode-e25c722ddf1d@spud>
User-Agent: NeoMutt/20220415
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 185177 [May 13 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 19 0.3.19 07c7fa124d1a1dc9662cdc5aace418c06ae99d2b, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1;127.0.0.199:7.1.2;100.64.160.123:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/05/13 04:27:00 #25181647
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_021811_213819_68975B3F 
X-CRM114-Status: GOOD (  29.30  )
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

Hello Conor,

Thank you for quick review!

On Sat, May 11, 2024 at 02:08:03PM +0100, Conor Dooley wrote:
> On Fri, May 10, 2024 at 12:08:54PM +0300, Dmitry Rokosov wrote:
> > The 'syspll' PLL is a general-purpose PLL designed specifically for the
> > CPU clock. It is capable of producing output frequencies within the
> > range of 768MHz to 1536MHz.
> > 
> > The clock source sys_pll_div16, being one of the GEN clock parents,
> > plays a crucial role and cannot be tagged as "optional". Unfortunately,
> > it was not implemented earlier due to the cpu clock ctrl driver's
> > pending status on the TODO list.
> 
> It's fine to not mark it optional in the binding, but it should be
> optional in the driver as otherwise backwards compatibility will be
> broken. Given this is an integral clock driver, sounds like it would
> quite likely break booting on these devices if the driver doesn't treat
> syspll_in as optional.
> A lesson perhaps in describing the hardware entirely, even if the
> drivers don't make use of all the information yet?

Yes, it's definitely the right lesson for me. However, without syspll or
syspll_in, we cannot utilize CPU power management at all. I will attempt
to make it an optional feature on the driver side, but it might
necessitate additional conditions to disable CPU clock handling when
syspll is unavailable.

> > 
> > Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> > ---
> >  .../devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml     | 7 +++++--
> >  include/dt-bindings/clock/amlogic,a1-pll-clkc.h            | 2 ++
> >  2 files changed, 7 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
> > index a59b188a8bf5..fbba57031278 100644
> > --- a/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
> > +++ b/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
> > @@ -26,11 +26,13 @@ properties:
> >      items:
> >        - description: input fixpll_in
> >        - description: input hifipll_in
> > +      - description: input syspll_in
> >  
> >    clock-names:
> >      items:
> >        - const: fixpll_in
> >        - const: hifipll_in
> > +      - const: syspll_in
> >  
> >  required:
> >    - compatible
> > @@ -53,7 +55,8 @@ examples:
> >              reg = <0 0x7c80 0 0x18c>;
> >              #clock-cells = <1>;
> >              clocks = <&clkc_periphs CLKID_FIXPLL_IN>,
> > -                     <&clkc_periphs CLKID_HIFIPLL_IN>;
> > -            clock-names = "fixpll_in", "hifipll_in";
> > +                     <&clkc_periphs CLKID_HIFIPLL_IN>,
> > +                     <&clkc_periphs CLKID_SYSPLL_IN>;
> > +            clock-names = "fixpll_in", "hifipll_in", "syspll_in";
> >          };
> >      };
> > diff --git a/include/dt-bindings/clock/amlogic,a1-pll-clkc.h b/include/dt-bindings/clock/amlogic,a1-pll-clkc.h
> > index 2b660c0f2c9f..a702d610589c 100644
> > --- a/include/dt-bindings/clock/amlogic,a1-pll-clkc.h
> > +++ b/include/dt-bindings/clock/amlogic,a1-pll-clkc.h
> > @@ -21,5 +21,7 @@
> >  #define CLKID_FCLK_DIV5		8
> >  #define CLKID_FCLK_DIV7		9
> >  #define CLKID_HIFI_PLL		10
> > +#define CLKID_SYS_PLL		11
> > +#define CLKID_SYS_PLL_DIV16	12
> >  
> >  #endif /* __A1_PLL_CLKC_H */
> > -- 
> > 2.43.0
> > 
> > 



-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
