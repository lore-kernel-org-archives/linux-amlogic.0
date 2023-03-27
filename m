Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28DB4C7619A
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Mar 2023 13:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tuVdJhTed7NbVeH4PhG4Hd58XYChBvUy1wtNdz1CFbQ=; b=EszWCJujktTBWv
	ysjCxasOqtTzdDIeHqBWqd42nqUTVdMxEsG/uIoSe/JD5UBPtajcy+4EyXLpJNSHYK+NqArPB5f2o
	3LnoMXkPbcX/A3qVZEeNwi/p2mp+MM2x3WqkkeVX70g1JxpZSUm3PG63iZIhPr8RfftFR9lfwcrVE
	PhxziWPyTF9aj2uB1DyvT/EVHies2ZhO2tLls+/vR6s1kv+z8Y8hTSbvjOa0jQwPSua+vNgSvCWiz
	8IT92pKreX210XjUsK/JUI2vMVYWKXRxSRO2RFqgAm3d59JSaRfXZZwbHAPgaxR0svc4/h5f1wX3r
	me6KNKg4GK93xsAPlL+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgnB4-00BARU-1D;
	Mon, 27 Mar 2023 13:46:26 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgnB1-00BAQY-0e;
	Mon, 27 Mar 2023 13:46:25 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id AC5A85FD0E;
	Mon, 27 Mar 2023 16:46:20 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1679924780;
	bh=pyeJhFAbE+miqSstuxVl40dzgwv1mlbuNAYyruqXoxM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=duYnrmuSgzHWdSczRpO68tljKttJNIPVDeNiQBFip0fwd8LxhibTr2LnvkkNU8pk6
	 4JlBWnlv1ESX+Zl/5Xsex6w/O2yAMHJH4pz3gcG3JHQFltZk7qdU5t8nP9vOYCrTKN
	 UcSp5XQDL8+GWUhiDK4jEhUzkau4ZOt0QsPbUM+WljChE0Jt1o56mpoFn/2KzG8X0O
	 +EiGEKWxz0jNkOgj5kcflpn+tatw+ZfpiF6XCCJYbtg36MaslCU70IaEKEDNlBTUdP
	 G1tLxC09SqQXMbZD8R1J6itvBAJ36PLSFw3U3Swr9U142lhCQ/hktiz4TURA7ZWuCI
	 0DDUlVaJy/T2Q==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Mon, 27 Mar 2023 16:46:20 +0300 (MSK)
Date: Mon, 27 Mar 2023 16:46:19 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Jerome Brunet <jbrunet@baylibre.com>, <neil.armstrong@linaro.org>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <jian.hu@amlogic.com>,
	<kernel@sberdevices.ru>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v11 3/5] dt-bindings: clock: meson: add A1 PLL and
 Peripherals clkcs bindings
Message-ID: <20230327134619.hs272yreukj6xw3l@CAB-WSD-L081021>
References: <20230321193014.26349-1-ddrokosov@sberdevices.ru>
 <20230321193014.26349-4-ddrokosov@sberdevices.ru>
 <1jmt3yo5r0.fsf@starbuckisacylon.baylibre.com>
 <20230327105115.ury3w4xpzhcpnqjg@CAB-WSD-L081021>
 <1jilemo1r9.fsf@starbuckisacylon.baylibre.com>
 <1f68ff4f-46ab-7d9e-fa57-bb94beb4c691@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1f68ff4f-46ab-7d9e-fa57-bb94beb4c691@linaro.org>
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
X-CRM114-CacheID: sfid-20230327_064623_584509_2EC8D5D4 
X-CRM114-Status: GOOD (  28.79  )
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

On Mon, Mar 27, 2023 at 03:41:27PM +0200, Krzysztof Kozlowski wrote:
> On 27/03/2023 13:39, Jerome Brunet wrote:
> > 
> > On Mon 27 Mar 2023 at 13:51, Dmitry Rokosov <ddrokosov@sberdevices.ru> wrote:
> > 
> >> On Mon, Mar 27, 2023 at 11:51:21AM +0200, Jerome Brunet wrote:
> >>>
> >>> On Tue 21 Mar 2023 at 22:30, Dmitry Rokosov <ddrokosov@sberdevices.ru> wrote:
> >>>
> >>>> Add the documentation for Amlogic A1 PLL and Amlogic A1 Peripherals
> >>>> clock drivers.
> >>>> Introduce Amlogic A1 PLL and Amlogic A1 Peripherals device tree
> >>>> bindings and include them to MAINTAINERS.
> >>>>
> >>>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> >>>> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> >>>> ---
> >>>>  .../bindings/clock/amlogic,a1-clkc.yaml       |  73 +++++++++++
> >>>>  .../bindings/clock/amlogic,a1-pll-clkc.yaml   |  59 +++++++++
> >>>>  MAINTAINERS                                   |   1 +
> >>>>  include/dt-bindings/clock/amlogic,a1-clkc.h   | 113 ++++++++++++++++++
> >>>>  .../dt-bindings/clock/amlogic,a1-pll-clkc.h   |  21 ++++
> >>>>  5 files changed, 267 insertions(+)
> >>>>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml
> >>>>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
> >>>
> >>> There is two drivers (and 2 independent patches). There should be 2
> >>> bindings patches as well.
> >>>
> >>
> >> Before, in previous versions I had two versions, but it wasn't bisectable
> >> approach.
> > 
> > You are confusing bisectable and Rob's robot. Splitting patches is more
> > that likely to help bisect (and patches backport) - not the other way around.
> 
> No, he did not confuse. Splitting patches makes the series
> non-bisectable which was visible in the past.
> 
> What's more, there is no reason to have bindings patches split just
> because you split drivers. Bindings are independent of drivers - we
> write them for hardware description.
> 
> > 
> >> a1-clkc schema depends on a1-pll-clkc headers and vice versa.
> >> It means dt schemas checkers will show us failure if we split them into two
> >> patchsets.
> > 
> > Only because you are patches are not upstream yet ...
> > 
> >> I know, that we can use raw digits instead of CLKID names, but IMO it doesn't
> >> look like production schema and it requires one more patchset above the
> >> series with proper CLKID definitons usage and proper header including.
> >>
> >> BTW, there is an example of Rob's test bot failure found in the previous
> >> v10 patch series due to chicken or the egg problem.
> >> https://lore.kernel.org/all/167769997208.7087.5344356236212731922.robh@kernel.org/
> >>
> >> Please advise what's the best practice to resolve that..
> > 
> > Don't use the header in your example would solve the problem and
> > still be correct DT wise.
> > 
> > The examples are just examples, they are not required to actually
> > matches a real HW, as far as I know.
> 
> Yes, that would work... or just keep them here.

I've mentioned it in another reply, by anyway..

Yep, we are able to cheat dt checkers, but we don't help dt developers
with such example. From my point of view, it's more clear for DT
developer to see direct CLKID points instead of "fake references".

May be, it's better to prepare two patches in such hierarchy:

1) A1 PLL clkc bindings with fake references without clkc headers
2) A1 clkc bindings with real CLKID bindings + A1 PLL clkc bindings fix
with real CLKID A1 clkc bindings + header.

The such approach resolves DT checkers failures and split DT bindings
into two patchsets. Also bisectability isn't broken.

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
