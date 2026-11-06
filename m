Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69ED606A32C
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Nov 2026 22:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c0S1A+Qc;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=URIe2ULY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ByNc5TRqufw+omnItlE1m8DUKaJxSLZjKXa7+xWZswQ=; b=c0S1A+Qc648nvgQfxcaEOU5AT/
	RGK/Z9ePT6LgYw/N2lHEGty4iw1WQW5iZkYS3Z0E/3eeSvs/r7nYjbkHcJFbRfHk2nDEhXzGiXLQ5
	cvb/lQYUxHIRWchOwIwS+dvu1J2Ek+Pg9QFx0+iYrN1gVTh/iSifoNbCEg8GzNtQt1LqZTk2CEmwS
	ZIoP8bWG8Rw+psDPWLO25xKVSXd7D56zmnHTCMT7IlxSWBBN3CFS1Y/EuI7TN213617wN6jjuVnpj
	b6HhJt/Kz+hcOpaxE9Zphbb1dLn/HUCydjA1dJSAcVL29KmTe5pWtDE35mNlejsk5ktvizZR4JBJC
	ZRMpeL+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPSPW-0000000DmcU-3dJn;
	Fri, 06 Nov 2026 22:27:50 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPSPS-0000000Dmbj-3RjS
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Nov 2026 22:27:49 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-48e09aa5264so634718f8f.2
        for <linux-amlogic@lists.infradead.org>; Fri, 06 Nov 2026 14:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794004065; x=1794608865; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tm44yLE9zR/+xclgm4/iFVDEIIryMy4vkUArG8yur4M=;
        b=URIe2ULYvxmDl5bnXK5F8wTP1YDGl4rooz22SpRQqaXbPMetWWdggcLAXl6vKa+730
         FNUGWrK2OyEMCHONM5cBCRabZvS4a5x/b2J7bd9wn87GaE2uLWcr5IX00Zgn6WP8oDZX
         xdreqGMXPPGWUgt2HoyaMtU8IBv8SlqizEwPSSTIwHt+ZS52g+xldN5g+3CzZRJIHZdg
         ieQ8NSYNHwCIE/8pqs7G9+aqrzoFf+ebYPIUKO025Wpc/Q/vKOaGPuRMgOEqqi+2BPI8
         agsUxTj9o/DeqzK61Af1RG5k77d8y0FAnrS6bcGItf4hVbbs0cbQ9Da8h/0EBThTipl8
         Z/Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794004065; x=1794608865;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tm44yLE9zR/+xclgm4/iFVDEIIryMy4vkUArG8yur4M=;
        b=vDGz2Lo+TeU6GTKHcU7X8Uy8WrjXCELhJ7l/uM/5r7+td3tAHWffiWAd5+DEsEZL8n
         bBArgNCFlkVekaYoA2ZvRjs/taYohq3S+pSxNG9z2y13i56qWNGvJWm2RKs25nigmggH
         4NpAAnUdsF6mc6Fw8n6JmdRUrXIHernijJRxjU5KQDM1ZiEvZ37t5BQm0YcOc+kNKCUx
         wyc9RUCZAgOn9CLApL000KwpiTw6nTe7W3VU5+nZVIWRBZ1Xavfr4D/R9CiHMWeoEeQ3
         EXqeyuTSvRfSED+CsKZ36GBFSBNckVvcsj/M7xLkvNbM1x02cpntdPe6w/xo24Eqoqz1
         G6Ug==
X-Forwarded-Encrypted: i=1; AL+hErEfxEfq3XxhnRLTfA3jGTHBHWagrWVAxKa1rg/zdR5onYTeoX2m52X4tRlu2O3k+kGUBcxIT0rmLNsOrkeO@lists.infradead.org
X-Gm-Message-State: APuU4Z99emhzmEdtkze5WkCZbQmspSAQQPl1Zw/j75og2aVThknnzcdK
	GSb+S3epoL1Gp079Ez/0BZ62a3yDdZ1+fDr+dEWNmYhjcWSwNpwF8jaZ7PztBbpF5fE=
X-Gm-Gg: AYBFou38vQDRNVinlgHbv2fH/G2/ByvY6UYe77IEsr0AwMZUrPPzmow9q1ij4jKrmkd
	R7/u2NrqFxvP+/R6teb1FiBRwul/21V72RSH82TEbw4wSmLBM7LQepYIoDz+Mr8tCvqAfgbPzf3
	s4xkKGytvkCmxzE0vxSeI6t8dpR3modOj97b2mv3PU7haUvtj/xDRb2AkBmYe94RVF8p81ZR/m8
	MmL2zSmIvXZQHHDO+adVEzo84B4xwhrfIkgrdkU+MYo5IDdjQBWQ2q3h7SGUjTc86DTWsqe/QaK
	CbxIiEhPyAKOjJ2hYDlHRCRIwtiNmWnmDLDAanA6lZv7RfVoZejvKVuskHi81MBJoykNhmgEDpe
	ln7AJNFfUTnJ4+klWRw54k8aJCa5s3uRJx2ZDbpEbw7qfBhdZvsbKcQYN3ddCSA/73iNc4q42sL
	s5g18/q0b7Wq6u2hmbZq4QZhiE3V8J+tz7hSiIiVAXvAdkF7u9U0GcW+e4+96U3fuVMl5nNU5yC
	13CWYmWc9lmFjGzxm9KRfA0zZxFGJkYQ4Ht05yQ96Om8DJnx+HBl63r/tYdkG08VBLBSH3SKqEd
	gucH80JMZ4Uru1w9VNsYq1Zr0iPXCPQv33f/l2IyLhzEPPtx0Hs44mDI+ycrfKNotGBKpLi18Qt
	mMyLSXRtWVjc=
X-Received: by 2002:a5d:5d13:0:b0:490:ef5a:bf39 with SMTP id ffacd0b85a97d-492733d12f2mr5925598f8f.6.1794004064618;
        Fri, 06 Nov 2026 14:27:44 -0800 (PST)
Received: from macbook (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d73286cdsm5497080f8f.28.2026.11.06.14.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 14:27:44 -0800 (PST)
Date: Fri, 6 Nov 2026 23:27:38 +0100
From: Carlo Caione <ccaione@baylibre.com>
To: Conor Dooley <conor@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 6/7] dt-bindings: clock: Add Amlogic S7 peripherals clock
 controller
Message-ID: <au5RoF6BooP14xhY@macbook>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-6-7d501d62621f@baylibre.com>
 <20261106-unwilling-preoccupy-156dbb310448@spud>
 <au4p0xYEFkgEU6T4@macbook>
 <20261106-headband-buckwheat-fecbd459ee85@spud>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261106-headband-buckwheat-fecbd459ee85@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_142746_926802_49A5D73C 
X-CRM114-Status: GOOD (  21.25  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 06, 2026 at 20:48:01 +0100, Conor Dooley wrote:
> On Fri, Nov 06, 2026 at 08:34:37PM +0100, Carlo Caione wrote:
> > On Fri, Nov 06, 2026 at 17:34:14 +0100, Conor Dooley wrote:
> > 
> > > > +    #include <dt-bindings/clock/amlogic,s7-pll-clkc.h>
> > > > +    #include <dt-bindings/clock/amlogic,s7-scmi-clkc.h>
> > > > +
> > > > +    soc {
> > > > +        #address-cells = <2>;
> > > > +        #size-cells = <2>;
> > > > +
> > > > +        clock-controller@0 {
> > > > +            compatible = "amlogic,s7-peripherals-clkc";
> > > > +            reg = <0x0 0x0 0x0 0x49c>;
> > > 
> > > What's with the weird numbers in this example?
> > > 
> > > Examples don't have to be real, but when it looks like this the
> > > immediate thought is that the modelling of the device might be
> > > incorrec.t
> > 
> > The numbers are actually real, but the example simply lost their context
> > because I copied the node from the S7 dtsi (not yet submitted), where
> > the controller sits under the APB bus node (bus@fe000000) and the bus
> > ranges make the addresses relative to it.
> > 
> > 		apb: bus@fe000000 {
> > 			compatible = "simple-bus";
> > 			reg = <0x0 0xfe000000 0x0 0x480000>;
> > 			#address-cells = <2>;
> > 			#size-cells = <2>;
> > 			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
> > 
> > 			clkc_periphs: clock-controller@0 {
> > 				compatible = "amlogic,s7-peripherals-clkc";
> > 				reg = <0x0 0x0 0x0 0x49c>;
> > 				#clock-cells = <1>;
> > 				...
> > 
> > In V2 I'll use an absolute address for the sake of clarity (PLL has the
> > same issue).
> 
> Before you do that, can you please share with me the s7 dtsi? Cos surely
> you've got it in some git repo online somewhere.

The S7 dtsi is already upstream at [0], the peripheral clock controller
and PLL will be enabled in that DTSI with a following series after the
bindings and the drivers in this set are acked, following the diffs that
will be submitted:

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
index 2c204dcebbba..5f2a61f42cbd 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
@@ -7,6 +7,8 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/amlogic,pinctrl.h>
+#include <dt-bindings/clock/amlogic,s7-pll-clkc.h>
+#include <dt-bindings/clock/amlogic,s7-scmi-clkc.h>
 #include <dt-bindings/power/amlogic,s7-pwrc.h>

 / {
@@ -160,6 +162,22 @@ apb: bus@fe000000 {
                        #size-cells = <2>;
                        ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;

+                       clkc_pll: clock-controller@8000 {
+                               compatible = "amlogic,s7-pll-clkc";
+                               reg = <0x0 0x8000 0x0 0x1e8>;
+                               #clock-cells = <1>;
+                               clocks = <&scmi_clk CLKID_TOP_PLL_OSC>,
+                                        <&scmi_clk CLKID_TOP_PLL_OSC>,
+                                        <&scmi_clk CLKID_TOP_PLL_OSC>,
+                                        <&scmi_clk CLKID_TOP_PLL_OSC>,
+                                        <&scmi_clk CLKID_HDMI_PLL_OSC>;
+                               clock-names = "fix",
+                                             "gp0",
+                                             "hifi",
+                                             "hifi1",
+                                             "hdmi";
+                       };
+
                        uart_b: serial@7a000 {
                                compatible = "amlogic,s7-uart",
                                             "amlogic,meson-s4-uart";

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
index 5f2a61f42cbd..afc88abea301 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
@@ -162,6 +162,40 @@ apb: bus@fe000000 {
                        #size-cells = <2>;
                        ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;

+                       clkc_periphs: clock-controller@0 {
+                               compatible = "amlogic,s7-peripherals-clkc";
+                               reg = <0x0 0x0 0x0 0x49c>;
+                               #clock-cells = <1>;
+                               clocks = <&clkc_pll CLKID_FCLK_DIV2>,
+                                        <&clkc_pll CLKID_FCLK_DIV2P5>,
+                                        <&clkc_pll CLKID_FCLK_DIV3>,
+                                        <&clkc_pll CLKID_FCLK_DIV4>,
+                                        <&clkc_pll CLKID_FCLK_DIV5>,
+                                        <&clkc_pll CLKID_FCLK_DIV7>,
+                                        <&clkc_pll CLKID_HIFI_PLL>,
+                                        <&clkc_pll CLKID_GP0_PLL>,
+                                        <&clkc_pll CLKID_HIFI1_PLL>,
+                                        <&scmi_clk CLKID_GP1_PLL>,
+                                        <&clkc_pll CLKID_HDMI_PLL>,
+                                        <&clkc_pll CLKID_HDMI_PLL_PIX>,
+                                        <&xtal>,
+                                        <&scmi_clk CLKID_ACLKM>;
+                               clock-names = "fclk_div2",
+                                             "fclk_div2p5",
+                                             "fclk_div3",
+                                             "fclk_div4",
+                                             "fclk_div5",
+                                             "fclk_div7",
+                                             "hifi_pll",
+                                             "gp0_pll",
+                                             "hifi1_pll",
+                                             "gp1_pll",
+                                             "hdmi_pll",
+                                             "vid_pix",
+                                             "xtal",
+                                             "axi_frcpu";
+                       };
+
                        clkc_pll: clock-controller@8000 {
                                compatible = "amlogic,s7-pll-clkc";
                                reg = <0x0 0x8000 0x0 0x1e8>;

[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi

--
Carlo Caione

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
