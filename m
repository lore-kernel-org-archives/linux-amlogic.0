Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6650FC64EC4
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Mar 2023 09:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m40Lm07OuECY/4hGiukXK3FK/u6TJOZhFRKMI4QJJNU=; b=yFzL0sfot7pgAn
	YuGE5Hi0UH3cikW0CgFyJ6XL/RGMyP5A9mXNooxgLWsSTmx57FLIdcXL2bmNZokyT3wmOkmuwiUVf
	IsenKN1SmBNIb2He/sI+elFMq7z7/EzLpcTC+0M6ilapPE+QCoinLpcyyO0n0Bpi2y8Ju0LLnoJOR
	Gp/LAsQOBRaCDArhkisYRTqL9sNYrf405onT5wPoizLoQfsOEcz01b4ziWQ92L/04f8vaDG7bO+ej
	0hn4GK4314S0Efp0u7Bxb7CF39pQjd1N5+mYRVOUGcxYzoz+1QxmNYSS+0qVPzgX8MGAAU8jbejXm
	6zjNXERlc4PEoxUhWopg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY1Um-005cYP-38; Fri, 03 Mar 2023 09:14:32 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY1Ui-005cWD-9n; Fri, 03 Mar 2023 09:14:29 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 043C55FD24;
	Fri,  3 Mar 2023 12:14:26 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1677834866;
	bh=kUxnEfhf3DSq+AgIFhAXjSbGolPo+vWxyTE1tXzicTs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=U2VsBqbdmuVXpFEsA05fb/bTexuln481h/mtvOffQH2yTwXz3QJY7qX5PV6+1Czrk
	 l+k76WjTHxc/aK4/m8x45QT0CiD1xChznaxX8xBlNOtRdmeoknKpxMj4k93xuJen6+
	 eMA5sU5LIHyxaTu62/SErXhprUKXI/S5OHmTXBvYI+C46YhuysLFTSKhyA6Zu1F03o
	 KC6cS7e8avRwYkcUfPo+CdlQzYl8AR11MKO48/7VL00he81fzjUVES0Ypk8MVAMpr4
	 /sYhMebpSjITGl5z0Ti9088UBqtWmCaMhm6Pzum+XG+NoZAjF/JWSDwzZhph8/RO9o
	 R7XRxD/dbSu0Q==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Fri,  3 Mar 2023 12:14:25 +0300 (MSK)
Date: Fri, 3 Mar 2023 12:14:25 +0300
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
Subject: Re: [PATCH v9 5/5] dt-bindings: clock: meson: add A1 Peripherals
 clock controller bindings
Message-ID: <20230303091425.hwn5ihu4et4oviee@CAB-WSD-L081021>
References: <20230301183759.16163-1-ddrokosov@sberdevices.ru>
 <20230301183759.16163-6-ddrokosov@sberdevices.ru>
 <d5c93a9f-4a66-f884-a4d1-68cf47bcd7d4@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d5c93a9f-4a66-f884-a4d1-68cf47bcd7d4@linaro.org>
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
X-CRM114-CacheID: sfid-20230303_011428_554211_0D8F3A56 
X-CRM114-Status: GOOD (  16.06  )
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

On Fri, Mar 03, 2023 at 09:29:59AM +0100, Krzysztof Kozlowski wrote:
> On 01/03/2023 19:37, Dmitry Rokosov wrote:
> > Add the documentation for Amlogic A1 Peripherals clock driver,
> > and A1 Peripherals clock controller bindings.
> > 
> > Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> > Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> > ---
> >  .../bindings/clock/amlogic,a1-clkc.yaml       |  73 +++++++++++++
> >  include/dt-bindings/clock/a1-clkc.h           | 102 ++++++++++++++++++
> >  2 files changed, 175 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml
> >  create mode 100644 include/dt-bindings/clock/a1-clkc.h
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml
> > new file mode 100644
> > index 000000000000..3dc86e912dea

[...]

> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/a1-pll-clkc.h>
> 
> Eh, this explains bisectability problem.
> 
> Please do not sent patchets which are not bisectable. You can hard-code
> the IDs in the example, they don't really matter.
> 

Yep, my fault. As I mentioned in the other patchset, I've executed dt bindings
checkers on the total patch series, not on each patchset. Sorry for
that.

[...]

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
