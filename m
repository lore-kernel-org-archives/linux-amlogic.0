Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498CCC4332F
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Dec 2022 09:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1mqlE6ALpp7G0u3S4TZ0BFbpL597uICBES/OIejEqdg=; b=NcJKNN1+MaWlMi
	k3KC1ulf0bu6HJ+0t3GY899SOgj55dwB9oQfs1A5XOVz8jt6ooXlAE7M6xc3rJWXhpOjWIMO+jVEG
	lztLGmdY/oMLSTlaGznDXicnlop0AdfgaK10CKfgZvQYFAk5VTEeLFRm8BfI8TGr9hbUojXfQO5MD
	IdCFuuksoqXywvBvVi2UZw7iu01Z+mxBB0oy6xlkpaDWV3OwpbqQrlId3OmiyboMLwCk0FCMRX5kT
	6uFU9cvEHa//FVvYuTU13ma6RvZRFUpIlMDzAzZNyI341TYt2Ms4pqky6eTtLy9Od5gOgCjaBcXDI
	8AoJidyc8ta1zKkQ2vBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p12he-00F8TV-VV; Fri, 02 Dec 2022 09:51:30 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p12hb-00F8R4-Kq; Fri, 02 Dec 2022 09:51:29 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id D13BF5FD0B;
	Fri,  2 Dec 2022 12:51:24 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1669974684;
	bh=72VVTkRY9DjXgUjSD9VXksh7Od+zuedUupDyk8ZPL64=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=Ud3M/0dAGTjSPWCJ4qDcqnrloGRDW4WyDNac2USRNB1fBT0jW82Aagmxt+Imnip4B
	 zpGE9qStbUJLOpbGVZZR7Ksa3sdzYFNee1SYP2uDfwQt/T4deWBHFyHULhK2dQ6ixH
	 9DvfRo3qDQwt1dpvlZRknRuT5NCArqi98n2vb4Ja+w6CCDfPeejQOtYVfrVorbQmaw
	 l8WkEuaZxJJxEBuZdaWVCy3mEA4TORauZczB4vpdYNyHkDXhz41yyoUzBTN6Fyejxn
	 szgQlsAAE53MM/dnECSed+OhqBqBK8mNTAPCel9vx2pgk3WU15JgPUSTmRYDZn9xWU
	 Z3MTXLbQa/tMg==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Fri,  2 Dec 2022 12:51:24 +0300 (MSK)
Date: Fri, 2 Dec 2022 12:51:24 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Rob Herring <robh@kernel.org>
CC: <devicetree@vger.kernel.org>, <sboyd@kernel.org>, <khilman@baylibre.com>,
	<kernel@sberdevices.ru>, <robh+dt@kernel.org>,
	<martin.blumenstingl@googlemail.com>, <linux-arm-kernel@lists.infradead.org>,
	<jian.hu@amlogic.com>, <linux-kernel@vger.kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <linux-amlogic@lists.infradead.org>,
	<jbrunet@baylibre.com>, <rockosov@gmail.com>, <mturquette@baylibre.com>,
	<linux-clk@vger.kernel.org>, <neil.armstrong@linaro.org>
Subject: Re: [PATCH v8 01/11] dt-bindings: clock: meson: add A1 PLL clock
 controller bindings
Message-ID: <20221202095124.4ecpfqhtzf34lwbf@CAB-WSD-L081021>
References: <20221201225703.6507-1-ddrokosov@sberdevices.ru>
 <20221201225703.6507-2-ddrokosov@sberdevices.ru>
 <166995398251.2089685.16059995540663317860.robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <166995398251.2089685.16059995540663317860.robh@kernel.org>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2022/12/02 07:44:00 #20636821
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_015128_095044_A408FE73 
X-CRM114-Status: GOOD (  19.29  )
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

On Thu, Dec 01, 2022 at 10:10:04PM -0600, Rob Herring wrote:
> 
> On Fri, 02 Dec 2022 01:56:53 +0300, Dmitry Rokosov wrote:
> > From: Jian Hu <jian.hu@amlogic.com>
> > 
> > Add the documentation to support Amlogic A1 PLL clock driver,
> > and add A1 PLL clock controller bindings.
> > 
> > Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> > Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> > ---
> >  .../bindings/clock/amlogic,a1-pll-clkc.yaml   | 52 +++++++++++++++++++
> >  include/dt-bindings/clock/a1-pll-clkc.h       | 16 ++++++
> >  2 files changed, 68 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
> >  create mode 100644 include/dt-bindings/clock/a1-pll-clkc.h
> > 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml:26:6: [warning] wrong indentation: expected 6 but found 5 (indentation)
> 
> dtschema/dtc warnings/errors:
> ./Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml: $id: relative path/filename doesn't match actual path or filename
> 	expected: http://devicetree.org/schemas/clock/amlogic,a1-pll-clkc.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.example.dtb: pll-clock-controller@7c80: reg: [[0, 31872], [0, 396]] is too long
> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221201225703.6507-2-ddrokosov@sberdevices.ru
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

Please find all fixes of above warnings and errors in the my patch
located at the link:

https://lore.kernel.org/linux-amlogic/20221201225703.6507-9-ddrokosov@sberdevices.ru/


-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
