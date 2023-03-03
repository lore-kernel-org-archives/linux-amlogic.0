Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34692C678D4
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Mar 2023 09:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3pQ0AbDHKxkf5FNsiuw3nh2LLSEf/urpj0fTTuc2jF0=; b=TaPu76i05XJF5F
	j3/VwIFGsSmEe7PLi+Ko87/ifIrU+KwhnTt7zTvrpKTXDUmnH8RHzGwjo5sI/BgPc5M++fVgsYRTb
	7CANXkU7pXg2yuuVpkXPtyF5OWNNpqQ2yF3BCNGAziSnjdoyPow9fu8rRwSnUMyxWRczNIiZnjTql
	QkrXdOYp/x2h9sr7a9c48S1kgKC8dbIUjiCzn0quOdgTZYP760jP1Defp5ZbryZNTwVjgILxxGaGe
	LCR4mPXhLBgum0kfQAtJlH5k8UyDYKGdWmQHq2KUCAEC1YzmWLldc3DaeC5x37tR7esN+JZpnWH1j
	PqVUSBA4jvEfzxbq2Tvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY1SC-005bfE-Nj; Fri, 03 Mar 2023 09:11:52 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY1S9-005bae-4N; Fri, 03 Mar 2023 09:11:51 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 5E7D75FD19;
	Fri,  3 Mar 2023 12:11:41 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1677834701;
	bh=3ji1fr9+q7ezZEBlpXkWKmZcPIE/FPeg1wnZMzAhRes=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=JUX++Hk0a9OvSMig9pzrU7L+21DIQRJuGk+c0BBy918SyyBRBg9/SSMD7JXmvyGGb
	 WAPu7qkxJjGeOplHqiiCOuf7HjTe1/+tG/8QsHWhT2RHqdYlAc/9C6WYg5tk68NB/r
	 86wJyyBX9kj7EikhG1kk6Pe/EdN4jcbLV7zCCCHSu5Z7U8+ziuDUhcn7bLce120lbD
	 XUrrN33GK32N9tYqzTKB0fTorWjWNwNaHjDq8TQvFbhas+UdjqMvT5/y7TpeuDeSjz
	 ie32LWHynk7euhR6bOsKeGeBjCWea9pu/EW34qqY0Rs2c4L5MWjiXG66zytwtlbx9h
	 uC7E1X5HJk0Zw==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Fri,  3 Mar 2023 12:11:40 +0300 (MSK)
Date: Fri, 3 Mar 2023 12:11:40 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <jian.hu@amlogic.com>,
	<kernel@sberdevices.ru>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v9 3/5] dt-bindings: clock: meson: add A1 PLL clock
 controller bindings
Message-ID: <20230303091140.isp2rfmhatkqan3o@CAB-WSD-L081021>
References: <20230301183759.16163-1-ddrokosov@sberdevices.ru>
 <20230301183759.16163-4-ddrokosov@sberdevices.ru>
 <6a950a51-fe90-9163-b73d-0a396d7187ee@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6a950a51-fe90-9163-b73d-0a396d7187ee@linaro.org>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/03/03 05:33:00 #20911335
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_011149_831463_6472A908 
X-CRM114-Status: GOOD (  21.94  )
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

Hello Krzysztof,

Thank you for quick review!

On Fri, Mar 03, 2023 at 09:28:22AM +0100, Krzysztof Kozlowski wrote:
> On 01/03/2023 19:37, Dmitry Rokosov wrote:
> > Add the documentation for Amlogic A1 PLL clock driver, and A1 PLL
> > clock controller bindings.
> > Also include new A1 clock controller dt bindings to MAINTAINERS.
> > 
> > Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> > Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> > ---
> >  .../bindings/clock/amlogic,a1-pll-clkc.yaml   | 59 +++++++++++++++++++
> >  MAINTAINERS                                   |  1 +
> >  include/dt-bindings/clock/a1-pll-clkc.h       | 20 +++++++
> >  3 files changed, 80 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
> >  create mode 100644 include/dt-bindings/clock/a1-pll-clkc.h
> > 

[...]

> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/a1-clkc.h>
> 
> Does not look like you tested the bindings. Please run `make
> dt_binding_check` (see
> Documentation/devicetree/bindings/writing-schema.rst for instructions).
> 

I always run dt binding tests before sending the patch series.
It's 'must have' prerequisite along with checkpatch.

The first one (dt_binding_check):
    $ make ARCH=arm64 INSTALL_MOD_PATH=${INSTALL_MOD_PATH} \
           CROSS_COMPILE="${CROSS_COMPILE}" DEPMOD=${DEPMOD}
           INSTALL_MOD_STRIP=1 -C ${KERNEL_PATH} \
           dt_binding_check DT_SCHEMA_FILES=${DT_SCHEMA_PATH}

The second one (dtbs_check):
    $ make ARCH=arm64 INSTALL_MOD_PATH=${INSTALL_MOD_PATH} \
           CROSS_COMPILE="${CROSS_COMPILE}" DEPMOD=${DEPMOD} \
           INSTALL_MOD_STRIP=1 -C ${KERNEL_PATH} \
           dtbs_check DT_SCHEMA_FILES=${DT_SCHEMA_PATH}

But, as you mentioned in the another patchset, I didn't take into account
bisectability. In other words, I didn't execute above sanity check on the
each patchset.
Thank you for good catch, I'll fix it in the today v10 patch series.

> > +    apb {
> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> > +
> > +        clock-controller@7c80 {
> > +            compatible = "amlogic,a1-pll-clkc";
> > +            reg = <0 0x7c80 0 0x18c>;
> > +            #clock-cells = <1>;
> > +            clocks = <&clkc_periphs CLKID_FIXPLL_IN>,
> > +                     <&clkc_periphs CLKID_HIFIPLL_IN>;
> > +            clock-names = "fixpll_in", "hifipll_in";
> > +        };
> > +    };
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 39ff1a717625..8438bc9bd636 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -1895,6 +1895,7 @@ L:	linux-amlogic@lists.infradead.org
> >  S:	Maintained
> >  F:	Documentation/devicetree/bindings/clock/amlogic*
> >  F:	drivers/clk/meson/
> > +F:	include/dt-bindings/clock/a1*
> >  F:	include/dt-bindings/clock/gxbb*
> >  F:	include/dt-bindings/clock/meson*
> >  
> > diff --git a/include/dt-bindings/clock/a1-pll-clkc.h b/include/dt-bindings/clock/a1-pll-clkc.h
> 
> Filename matching bindings, so amlogic,a1-pll-clkc.h

You are totally right. But looks like other amlogic clock bindings don't
follow this rule.
So I'll change my patch series and send another patch series with fixup other
amlogic clock bindings.
> 
> > new file mode 100644
> > index 000000000000..3a559518c6e6
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/a1-pll-clkc.h
> > @@ -0,0 +1,20 @@
> > +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
> 
> Any particular reason for using license other than in binding? Was it
> intentional (e.g. because it is derivative work)?
> 

No reason, actually. I've just used license which was introduced in the
previous patch series versions by Jian Hu. I suppose, standard license
usage should be okay.

[...]

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
