Return-Path: <SRS0=IdmP=CQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CF4AC43461
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 19:24:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D857A21532
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 19:24:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WZK6b+vT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D857A21532
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GFgaEE+yzJu6s4jvrDMfLH7A3MZ4myGUtEA9w/24JjE=; b=WZK6b+vTndOFSBM/ewH5gAHKi
	04AXb1vle165ADALMC8e9Her2aLJR1lIqeLFbk6oohwpOBKPTT2YZZ4JW85qDZQnm4Dvkgy1yNi+S
	OZ4qiXA6ohppaXKN8AF5K++Eg2m/eWvXfL178EPXtV5apLAK1BDMnxzh9bOl+AI1rJ9H7hknmi2KS
	/jbmw990tNWB1eXIUA+kGWQ8nW7exQjVKK8GTrrDssuI3m3Pz7WEcRtl9qWF7X3dDn9xpitZBZUr4
	AJPspkUNbGmUTCvUw8oT70gRnk1BpK+E9R7FbQhhtShtod81s9eDdm/HfwLP5xqQyOTDHiFSjrzDb
	bdUKrtgqQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFMkd-00016U-H6; Mon, 07 Sep 2020 19:24:27 +0000
Received: from asavdk3.altibox.net ([109.247.116.14])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFMka-000167-7U
 for linux-amlogic@lists.infradead.org; Mon, 07 Sep 2020 19:24:25 +0000
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 0B33820033;
 Mon,  7 Sep 2020 21:24:19 +0200 (CEST)
Date: Mon, 7 Sep 2020 21:24:18 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: display: panel: add TDO tl070wsh30
 DSI panel bindings
Message-ID: <20200907192418.GA558348@ravnborg.org>
References: <20200907111027.21933-1-narmstrong@baylibre.com>
 <20200907111027.21933-3-narmstrong@baylibre.com>
 <20200907114552.GA526406@ravnborg.org>
 <358ee0c3-fe1c-b9b6-9ed8-086f9d14afd9@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <358ee0c3-fe1c-b9b6-9ed8-086f9d14afd9@baylibre.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=CaYmGojl c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=IpJZQVW2AAAA:8 a=gEfo2CItAAAA:8 a=e5mUnYsNAAAA:8
 a=26pVUN82OfOXP9tGjk4A:9 a=CjuIK1q_8ugA:10 a=IawgGOuG5U0WyFbmm1f5:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=Vxmtnl_E_bksehYqCbjh:22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_152424_546080_29B8F7E2 
X-CRM114-Status: GOOD (  25.19  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, thierry.reding@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil.

On Mon, Sep 07, 2020 at 03:24:47PM +0200, Neil Armstrong wrote:
> Hi,
> 
> On 07/09/2020 13:45, Sam Ravnborg wrote:
> > Hi Neil.
> > 
> > On Mon, Sep 07, 2020 at 01:10:26PM +0200, Neil Armstrong wrote:
> >> This add the bindings for the 1024*600 tl070wsh30 DSI panel.
> > 
> > The binding looks like a panel-simple-dsi.yaml candidate.
> > Only differen is enable-gpios versus reset-gpios
> 
> This is the only difference, the panel only has a reset signal and no
> enable signal.
> 
> But I can add a reset-gpios to panel-simple-dsi.yaml, would it be ok ?

Yes, that would be fine as long as it is not a required property.
It was a mistake we did not add it from the beginning.

There has been patches floating to add reset-gpios to panle.simple.c
that I rejected - this was also wrong.
Really simple and dumb panels has no reset but dsi panels that
panel-simple supports too has a reset.

	Sam


> 
> Neil
> 
> > 
> > Could you check if we can use panel-simple-dsi-yaml.
> > 
> > 	Sam
> > 
> >>
> >> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> >> ---
> >>  .../display/panel/tdo,tl070wsh30.yaml         | 58 +++++++++++++++++++
> >>  1 file changed, 58 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/display/panel/tdo,tl070wsh30.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/panel/tdo,tl070wsh30.yaml b/Documentation/devicetree/bindings/display/panel/tdo,tl070wsh30.yaml
> >> new file mode 100644
> >> index 000000000000..20f4fdedfcb0
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/display/panel/tdo,tl070wsh30.yaml
> >> @@ -0,0 +1,58 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
> >> +# Copyright 2020 BayLibre, SAS
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/display/panel/tdo,tl070wsh30.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: TDO TL070WSH30 DSI panel
> >> +
> >> +maintainers:
> >> +  - Neil Armstrong <narmstrong@baylibre.com>
> >> +
> >> +allOf:
> >> +  - $ref: panel-common.yaml#
> >> +
> >> +properties:
> >> +
> >> +  compatible:
> >> +    enum:
> >> +      - tdo,tl070wsh30
> >> +
> >> +  reg:
> >> +    maxItems: 1
> >> +    description: DSI virtual channel
> >> +
> >> +  backlight: true
> >> +  reset-gpios: true
> >> +  port: true
> >> +  power-supply: true
> >> +
> >> +additionalProperties: false
> >> +
> >> +required:
> >> +  - compatible
> >> +  - power-supply
> >> +  - reset-gpios
> >> +  - port
> >> +  - reg
> >> +
> >> +examples:
> >> +  - |
> >> +    dsi {
> >> +      #address-cells = <1>;
> >> +      #size-cells = <0>;
> >> +      panel@0 {
> >> +        compatible = "tdo,tl070wsh30";
> >> +        reg = <0>;
> >> +        power-supply = <&vcc_lcd_reg>;
> >> +        backlight = <&panel_backlight>;
> >> +        reset-gpios = <&gpio_reset>;
> >> +
> >> +        port {
> >> +          panel: endpoint {
> >> +            remote-endpoint = <&mipi_dsi_out>;
> >> +          };
> >> +        };
> >> +      };
> >> +    };
> >> -- 
> >> 2.22.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
