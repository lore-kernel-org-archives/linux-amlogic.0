Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5CB7C76195
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Mar 2023 13:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CvVtoXXWu9VBFlysxLPQ1mnMYZ2ucElt8vdG5+6C1Kw=; b=vFV8s1EGFqJNBB
	cGlIb7duQd7rBB5eOdtXhv26B3UIc+LVn+dQsUHAXPv5yCk06tr/CyiF13oyYqisylTykyUKs5B3f
	06/BL2n+Yw3/Or5d6w1ngLjUJ6vy4JXm0HJ04+uTflzydFVTeVZOjsCokUXCiiW9Tn5i8Ht9MM0yM
	PkqCsM9ahwmQyy7IJjKF4p1R+GkovAoa9ck6itqSh2vpclmqipPAWuZfj078p44d+oBtMB6I2fHDv
	SFaQrxNbEyTnAOCxR2IGIUADLMa1FQCv70m1OG0fOkLivTH63E4sSfoTt+riNrj3jXnOKyuxQHZL6
	+Y2OC+chnNeJLRAtstaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgmng-00B65t-2O;
	Mon, 27 Mar 2023 13:22:16 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgmnd-00B64r-0a;
	Mon, 27 Mar 2023 13:22:15 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id C2C485FD0E;
	Mon, 27 Mar 2023 16:22:10 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1679923330;
	bh=uWyMD5If887JpUXUAf2FQIqs4GKKl1iQKzSB5o9q4ok=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=DYabJhqEltilnGOBhjRmouVD5C4M9W0f4cyZHlPQhITMB7/HfcfuvWx6rPmxTG+gR
	 RHwsHcZHgoPaXWIB5mv5dxE2nCVNaq2x/hFEWeYYOWazPmwWfHdnUfeT5gvWMVdzTB
	 areAkdxHes7nXA/K4FeH4F2D3upvsrrNF6Q3iMYLPtdyLAmUrOUJyNfL3569322u1h
	 v59z3duYEuj7kc9R8KnfY8cjRJ2+cM6uoZLx02pe1tITThaH/nJUrbRGuwow2sNlOV
	 VPfA7w9C0MfGuQ568p1ndUl4IZSrd9NNONnTkNMxwgO0InXYyyfai+3IAmYSF2euzJ
	 AxEw7OR5o93+w==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Mon, 27 Mar 2023 16:22:10 +0300 (MSK)
Date: Mon, 27 Mar 2023 16:22:09 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>
CC: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <jian.hu@amlogic.com>,
	<kernel@sberdevices.ru>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v11 3/5] dt-bindings: clock: meson: add A1 PLL and
 Peripherals clkcs bindings
Message-ID: <20230327132209.c64ye4ou22cq7wm6@CAB-WSD-L081021>
References: <20230321193014.26349-1-ddrokosov@sberdevices.ru>
 <20230321193014.26349-4-ddrokosov@sberdevices.ru>
 <1jmt3yo5r0.fsf@starbuckisacylon.baylibre.com>
 <20230327105115.ury3w4xpzhcpnqjg@CAB-WSD-L081021>
 <1jilemo1r9.fsf@starbuckisacylon.baylibre.com>
 <ae367a80-e617-42a6-f873-73a1ecfe7c0d@linaro.org>
 <20230327131927.k7uswfn6i3jqjrzv@CAB-WSD-L081021>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230327131927.k7uswfn6i3jqjrzv@CAB-WSD-L081021>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/03/27 05:49:00 #21016052
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_062213_573779_18B81F27 
X-CRM114-Status: GOOD (  32.14  )
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

Don't know why, but my client deleted Jerome from To:. Sorry, added him
back.

On Mon, Mar 27, 2023 at 02:03:25PM +0200, neil.armstrong@linaro.org wrote:
> On 27/03/2023 13:39, Jerome Brunet wrote:
> > 
> > On Mon 27 Mar 2023 at 13:51, Dmitry Rokosov <ddrokosov@sberdevices.ru> wrote:
> > 
> > > On Mon, Mar 27, 2023 at 11:51:21AM +0200, Jerome Brunet wrote:
> > > > 
> > > > On Tue 21 Mar 2023 at 22:30, Dmitry Rokosov <ddrokosov@sberdevices.ru> wrote:
> > > > 
> > > > > Add the documentation for Amlogic A1 PLL and Amlogic A1 Peripherals
> > > > > clock drivers.
> > > > > Introduce Amlogic A1 PLL and Amlogic A1 Peripherals device tree
> > > > > bindings and include them to MAINTAINERS.
> > > > > 
> > > > > Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> > > > > Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> > > > > ---
> > > > >   .../bindings/clock/amlogic,a1-clkc.yaml       |  73 +++++++++++
> > > > >   .../bindings/clock/amlogic,a1-pll-clkc.yaml   |  59 +++++++++
> > > > >   MAINTAINERS                                   |   1 +
> > > > >   include/dt-bindings/clock/amlogic,a1-clkc.h   | 113 ++++++++++++++++++
> > > > >   .../dt-bindings/clock/amlogic,a1-pll-clkc.h   |  21 ++++
> > > > >   5 files changed, 267 insertions(+)
> > > > >   create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml
> > > > >   create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
> > > > 
> > > > There is two drivers (and 2 independent patches). There should be 2
> > > > bindings patches as well.
> > > > 
> > > 
> > > Before, in previous versions I had two versions, but it wasn't bisectable
> > > approach.
> > 
> > You are confusing bisectable and Rob's robot. Splitting patches is more
> > that likely to help bisect (and patches backport) - not the other way around.
> > 
> > > a1-clkc schema depends on a1-pll-clkc headers and vice versa.
> > > It means dt schemas checkers will show us failure if we split them into two
> > > patchsets.
> > 
> > Only because you are patches are not upstream yet ...
> > 
> > > I know, that we can use raw digits instead of CLKID names, but IMO it doesn't
> > > look like production schema and it requires one more patchset above the
> > > series with proper CLKID definitons usage and proper header including.
> > > 
> > > BTW, there is an example of Rob's test bot failure found in the previous
> > > v10 patch series due to chicken or the egg problem.
> > > https://lore.kernel.org/all/167769997208.7087.5344356236212731922.robh@kernel.org/
> > > 
> > > Please advise what's the best practice to resolve that..
> > 
> > Don't use the header in your example would solve the problem and
> > still be correct DT wise.
> > 
> > The examples are just examples, they are not required to actually
> > matches a real HW, as far as I know.
> 
> Exact, you can use fake lables instead of defined:
> 
> <&clkc_pll CLKID_FCLK_DIV2>,
> 
> =>
> remove "#include <dt-bindings/clock/amlogic,a1-pll-clkc.h>"
> 
> <&clkc_pll_fclk_div2>,
> 
> is perfectly ok and will permit have 2 separate patches.
> 
> The dependency is only if you have a common yaml file for
> both bindings files, but this is not the case here.

Simple removal of "#include <dt-bindings/clock/amlogic,a1-pll-clkc.h>"
header doesn't work, dt_binding_check make rule is failed:

Error: Documentation/devicetree/bindings/clock/amlogic,a1-clkc.example.dts:28.37-38 syntax error
FATAL ERROR: Unable to parse input tree

It happens, because 'dt_binding_check' generates simple dts example and
tries to compile it:

cat Documentation/devicetree/bindings/clock/amlogic,a1-clkc.example.dts
===

/dts-v1/;
/plugin/; // silence any missing phandle references


/{
    compatible = "foo";
    model = "foo";
    #address-cells = <1>;
    #size-cells = <1>;



    example-0 {
        #address-cells = <1>;
        #size-cells = <1>;

        

        apb {
            #address-cells = <2>;
            #size-cells = <2>;
        
            clock-controller@800 {
                compatible = "amlogic,a1-clkc";
                reg = <0 0x800 0 0x104>;
                #clock-cells = <1>;
                clocks = <&clkc_pll CLKID_FCLK_DIV2>,
                         <&clkc_pll CLKID_FCLK_DIV3>,
                         <&clkc_pll CLKID_FCLK_DIV5>,
                         <&clkc_pll CLKID_FCLK_DIV7>,
                         <&clkc_pll CLKID_HIFI_PLL>,
                         <&xtal>;
                clock-names = "fclk_div2", "fclk_div3",
                              "fclk_div5", "fclk_div7",
                              "hifi_pll", "xtal";
            };
        };

    };
};
===

As you can see, header is required.

But looks like, dt binding checker is happy with the fake references hack :)
Below there is generated example dts:

cat Documentation/devicetree/bindings/clock/amlogic,a1-clkc.example.dts
===

/dts-v1/;
/plugin/; // silence any missing phandle references


/{
    compatible = "foo";
    model = "foo";
    #address-cells = <1>;
    #size-cells = <1>;



    example-0 {
        #address-cells = <1>;
        #size-cells = <1>;

        

        apb {
            #address-cells = <2>;
            #size-cells = <2>;
        
            clock-controller@800 {
                compatible = "amlogic,a1-clkc";
                reg = <0 0x800 0 0x104>;
                #clock-cells = <1>;
                clocks = <&clkc_pll_fclk_div2>,
                         <&clkc_pll_fclk_div3>,
                         <&clkc_pll_fclk_div5>,
                         <&clkc_pll_fclk_div7>,
                         <&clkc_pll_hifi_pll>,
                         <&xtal>;
                clock-names = "fclk_div2", "fclk_div3",
                              "fclk_div5", "fclk_div7",
                              "hifi_pll", "xtal";
            };
        };

    };
};
===

Yep, we are able to cheat dt checkers, but we don't help dt developers
with such example.
May be, it's better to prepare two patches in such hierarchy:

1) A1 PLL clkc bindings with fake references without clkc headers
2) A1 clkc bindings with real CLKID bindings + A1 PLL clkc bindings fix
with real CLKID A1 clkc bindings + header.

The such approach resolves DT checkers failures and split DT bindings
into two patchsets.

[...]

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
