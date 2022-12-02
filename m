Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 792F2C4167B
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Dec 2022 09:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6elnkCKgmv4xdriEPjM9dlV/A4ILx2JUYPht9oYcd1c=; b=06ebeg77jLv1eR
	TiONWggzBnBgkTWQ8x88Ky8Wp2PpQ7M2HSaW//zzlLfU/bMamFyHw/Swbw46KaN0aNhHrB1f12I+N
	IrBSLrgoQzm/oJ6wvXKJ2u5/RiLsmH1wErJjcO6I4qX8/bIg2vM95p85+BNIEn1Boo6OiKfzQ01gt
	tSN8iJUMT4mivoZLYaa55GMeaHXKXlCXa9LGgRCqX4T+Y+v5faiL33WgX7iBqbWx9fg66CDmaTQ1b
	BaGSlg41fHdAElOT6bfyyJFiW0osI8I7K/V5J+fY30kV7bDsdyuE8HGWDAbo7ToZzUD7Hho50mVEh
	UbC2ZVNDCVqtz7OR7f9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p12g2-00F7Gy-Kn; Fri, 02 Dec 2022 09:49:50 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p12fy-00F7D8-SX; Fri, 02 Dec 2022 09:49:49 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id D027B5FD0A;
	Fri,  2 Dec 2022 12:49:41 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1669974581;
	bh=FbqsU5GM/s6H3tix6hLnnOQO0K56pMLJtqHLVhUNgXs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=UPYOpBXln+D9Lxmxx9q2ygclqrJdoUAa8swbKYm+8ASGftkpKx8beygRXG6PDCV9n
	 HgQuF0cb+CgZx7AOSCrDHHp7oZmRUVK9kEasMLDnPWYCyeaIianqRHgb2Qgc1TL7yK
	 0/dZrba9wr0NfWFU5U+4wSXwiaYrtrPqO0s4M3FGue8qiTqjuHsOBTeKE4ZteYBix6
	 z0xkxkFAE89NSuG2hysxpUUXcIGBahNZHJZbaRfLPR7IVVxsknE0nS83aYFCFtvExS
	 JPsRvTSVerFnrsPEzUzjmXHFqugK929a1DRr2cAK7dFDahM9yzU5w/BtTKIDcJs/TG
	 ONH9njUxEksEg==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Fri,  2 Dec 2022 12:49:41 +0300 (MSK)
Date: Fri, 2 Dec 2022 12:49:40 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Rob Herring <robh@kernel.org>
CC: <martin.blumenstingl@googlemail.com>,
	<linux-arm-kernel@lists.infradead.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<khilman@baylibre.com>, <jian.hu@amlogic.com>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <linux-amlogic@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <rockosov@gmail.com>, <kernel@sberdevices.ru>,
	<neil.armstrong@linaro.org>, <robh+dt@kernel.org>, <sboyd@kernel.org>
Subject: Re: [PATCH v8 03/11] dt-bindings: clock: meson: add A1 peripheral
 clock controller bindings
Message-ID: <20221202094940.elhjbz7tbgxesr52@CAB-WSD-L081021>
References: <20221201225703.6507-1-ddrokosov@sberdevices.ru>
 <20221201225703.6507-4-ddrokosov@sberdevices.ru>
 <166995398331.2089708.18189499743713568568.robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <166995398331.2089708.18189499743713568568.robh@kernel.org>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2022/12/02 07:44:00 #20636821
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_014947_627732_2300A84B 
X-CRM114-Status: GOOD (  18.79  )
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
> On Fri, 02 Dec 2022 01:56:55 +0300, Dmitry Rokosov wrote:
> > From: Jian Hu <jian.hu@amlogic.com>
> > 
> > Add the documentation to support Amlogic A1 peripheral clock driver,
> > and add A1 peripheral clock controller bindings.
> > 
> > Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> > Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> > ---
> >  .../bindings/clock/amlogic,a1-clkc.yaml       | 65 ++++++++++++
> >  include/dt-bindings/clock/a1-clkc.h           | 98 +++++++++++++++++++
> >  2 files changed, 163 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml
> >  create mode 100644 include/dt-bindings/clock/a1-clkc.h
> > 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> ./Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml: $id: relative path/filename doesn't match actual path or filename
> 	expected: http://devicetree.org/schemas/clock/amlogic,a1-clkc.yaml#
> Documentation/devicetree/bindings/clock/amlogic,a1-clkc.example.dts:18.48-30.11: Warning (unit_address_vs_reg): /example-0/periphs-clock-controller: node has a reg or ranges property, but no unit name
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/amlogic,a1-clkc.example.dtb: periphs-clock-controller: reg: [[0, 2048], [0, 260]] is too long
> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221201225703.6507-4-ddrokosov@sberdevices.ru
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

That's totally right warnings and errors. All of them are fixed in the
my "fixup" patch of Jian's original dt_binding schema:

https://lore.kernel.org/linux-amlogic/20221201225703.6507-11-ddrokosov@sberdevices.ru/

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
