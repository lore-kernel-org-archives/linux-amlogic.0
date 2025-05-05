Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA27C3ABBC
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 May 2025 13:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UxhYdHMP+mi+9hGj6TAJWtIXBHTijVGk41W2GA7bvpo=; b=cEUGMLWvhl4V54
	fcnl1UoxZDE2NUyvg3fTpQpo/zkZSNs096nh00KgMxAfDXTfXB523jT6dww5INvQMl41L/lZV+pGh
	fHces/jW3C8EmPnuQ7W3KflYixVsqNSd28J3O6Ua+iKwi8vCOwvSM6G3AGy25A3Fs6JoezPVjs+vy
	MZGxgzuCNyzHjpgycSiQpnQwvgy5oYq8NTmGsmS1+g/T3gSU1gjO7H1zhHsUEhjyzg4daItn1+ppt
	EaFQBDDTzrbqZHWAw2aNMAT4yW6BpY05osoBLH+lk2r/lGcxOhaCqOHWuHy79Nz8xEZ4hvrrYIsvF
	Eg/HI/8nGS/iOVi7hhZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBvkh-00000007RzQ-3MVF;
	Mon, 05 May 2025 13:20:59 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBvKE-00000007Oqc-0P4P
	for linux-amlogic@lists.infradead.org;
	Mon, 05 May 2025 12:53:39 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uBvKB-0001yX-6r; Mon, 05 May 2025 14:53:35 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uBvKA-001ESr-2Q;
	Mon, 05 May 2025 14:53:34 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uBvKA-000Jb9-27;
	Mon, 05 May 2025 14:53:34 +0200
Message-ID: <168c0dc2b1a9ebabbfd993e3a516dbf96d809f47.camel@pengutronix.de>
Subject: Re: [PATCH v6 1/3] dt-bindings: reset: Add compatible for Amlogic
 A4/A5 Reset Controller
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, Zelong
 Dong <zelong.dong@amlogic.com>, Conor Dooley <conor.dooley@microchip.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Kevin Hilman
 <khilman@baylibre.com>, Rob Herring <robh@kernel.org>,
 kelvin.zhang@amlogic.com
Date: Mon, 05 May 2025 14:53:34 +0200
In-Reply-To: <5bb02494-e974-4d2f-a00f-417312b73bc1@linaro.org>
References: <20250411-a4-a5-reset-v6-0-89963278c686@amlogic.com>
	 <20250411-a4-a5-reset-v6-1-89963278c686@amlogic.com>
	 <5bb02494-e974-4d2f-a00f-417312b73bc1@linaro.org>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_055338_129258_B062CC17 
X-CRM114-Status: GOOD (  17.52  )
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

Hi Neil,

On Mo, 2025-05-05 at 14:30 +0200, Neil Armstrong wrote:
> Hi Philipp,
> 
> On 11/04/2025 13:38, Kelvin Zhang via B4 Relay wrote:
> > From: Zelong Dong <zelong.dong@amlogic.com>
> > 
> > Add compatibles for Amlogic A4 and A5 reset controllers,
> > which fall back to 'amlogic,meson-s4-reset'.
> > 
> > Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
> > Link: https://lore.kernel.org/r/20240918074211.8067-2-zelong.dong@amlogic.com
> > Signed-off-by: Kelvin Zhang <kelvin.zhang@amlogic.com>
> > ---
> >   .../bindings/reset/amlogic,meson-reset.yaml        | 22 ++++++++++++++--------
> >   1 file changed, 14 insertions(+), 8 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
> > index 695ef38a7bb346c92b4cf428e7615d45682c940a..150e95c0d9bed74c7045942610a311114a257889 100644
> > --- a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
> > +++ b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
> > @@ -12,14 +12,20 @@ maintainers:
> >   
> >   properties:
> >     compatible:
> > -    enum:
> > -      - amlogic,meson8b-reset # Reset Controller on Meson8b and compatible SoCs
> > -      - amlogic,meson-gxbb-reset # Reset Controller on GXBB and compatible SoCs
> > -      - amlogic,meson-axg-reset # Reset Controller on AXG and compatible SoCs
> > -      - amlogic,meson-a1-reset # Reset Controller on A1 and compatible SoCs
> > -      - amlogic,meson-s4-reset # Reset Controller on S4 and compatible SoCs
> > -      - amlogic,c3-reset # Reset Controller on C3 and compatible SoCs
> > -      - amlogic,t7-reset
> > +    oneOf:
> > +      - enum:
> > +          - amlogic,meson8b-reset # Reset Controller on Meson8b and compatible SoCs
> > +          - amlogic,meson-gxbb-reset # Reset Controller on GXBB and compatible SoCs
> > +          - amlogic,meson-axg-reset # Reset Controller on AXG and compatible SoCs
> > +          - amlogic,meson-a1-reset # Reset Controller on A1 and compatible SoCs
> > +          - amlogic,meson-s4-reset # Reset Controller on S4 and compatible SoCs
> > +          - amlogic,c3-reset # Reset Controller on C3 and compatible SoCs
> > +          - amlogic,t7-reset
> > +      - items:
> > +          - enum:
> > +              - amlogic,a4-reset
> > +              - amlogic,a5-reset
> > +          - const: amlogic,meson-s4-reset
> >   
> >     reg:
> >       maxItems: 1
> > 
> 
> Do you plan to take this change ?
>
> It has been laying around on the list for a while now, I plan
> to apply it in my amlogic/drivers tree at the end of the week.

I thought you'd pick it up together with the dts patches [1].

[1] https://lore.kernel.org/all/a5d9b775dd860d8f2bbf174300a2e3161b654035.camel@pengutronix.de/


regards
Philipp

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
