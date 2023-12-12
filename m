Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFFB9C4332F
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Dec 2023 06:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kouoIjn5g/cWTdRt1K7b2hOVe5pb0OWSHAgsHfc9cpc=; b=zDD+E+gOlcZk0y
	dzhiaF/euwAlBKxQRp8OPWVltF+BYxrCcviia5XTva0WX5r9wrqcwN1ek4hMZCiiVd0WFChrzwp7S
	V6yHD2z5uzlyfPVt61s2A6T1f+yHwgmFNL3vFHsoJRIaLwYGAXrLErjo2rbfTaP8kgcp5gL0vRlN+
	94Vedupi3rZe1fDwQ9RtTquNkjnEHsi1YSTwKBkQFssOAwDzdHpV58hXKWlxj6hxghvUq17gUV0VX
	Zo9qK6IXZsx4mL4eCJNvMs1ghFxAwNUfJvVZrQNzMWIzLMQwQXfdwq2XOTt28imm282PSGGYdEahJ
	RTeL/xKk80xk5C3w04vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCwAg-00AqmF-2Q;
	Tue, 12 Dec 2023 06:23:10 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCwAc-00AqlG-2N
	for linux-amlogic@lists.infradead.org;
	Tue, 12 Dec 2023 06:23:08 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-1fb104887fbso4019394fac.3
        for <linux-amlogic@lists.infradead.org>; Mon, 11 Dec 2023 22:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702362185; x=1702966985; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=trvLPWdMf9ONBuz1cwMATx3gpPUiFzy4m+MU7IJ3tNw=;
        b=P6BFeOiomOtMD8whgtO6Ea3FJr5msRXqqC1DF2a1Qjh2XebzSNtaYJtabyxQQTpwiK
         /amitsZCKSkjvRUknGdUWse3Jg0rQcRTmWWR/nMx0SNEPSvrBJEw6ReGSqdtgfQq0f+9
         pBNViIlRreFHbWoZsgNegFJLYyW05gkdMl055zoon/J60bcArcYpmzriCSzWyHj8fea0
         NkdG0+IlAihA4vWfWUB3nu0csAFfNOGijOiQIuub6Epeoya8Nff2AQuhVjNSEFcncuiT
         l31UEANa17elyhayKkQn4E4uMhmCKOhRzqyBbY9b7/yymgfQC/CkRwejI2Co1MumvH3L
         Targ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702362185; x=1702966985;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=trvLPWdMf9ONBuz1cwMATx3gpPUiFzy4m+MU7IJ3tNw=;
        b=VFjeceSKIp5ssdn77waJJWBYOaTJZls2vtanW6+tb8lxYMZs8ucZzl+f8e8vJS3QI6
         F90drH7J7ii3ITP9AN18pV/pK0a5kbSvWTjYh9/F4hhfS1ODXj0P36q7O6EGbAhydCiK
         WNAbbaVASGgpPTaVKTNcRsA+qtZMqm0uClZRYO2KCbAAGGtblDNMPB0WNFY7GF6frSXR
         PumPV/fR2RJ3EzOtldoc99H0E6PVd+rhH5JmV8U7QMKh+yxrrv1SWiLV2SbiEHp2mvzY
         tzYpoY6oDgGg494wN9btSNrklUFwpoiAkzWYCN+6IqIIQ6a31ii7ZfhaROO/E418exom
         n6nQ==
X-Gm-Message-State: AOJu0Yy24vOdfr3hEcsd6tyhBc178E28fE51bTmljnP8th6n4rtL2dSQ
	0ZTz6eJAhsnZf+DU3XHYA+AFsfavMC4c+9Hhpo8=
X-Google-Smtp-Source: AGHT+IHH9MpYlWrKCKBE94gDOEjFql0vjoN8nxr8qktyfZX3jatGWzYfF+weG7CtlS8kQc0ez1Mfxc+PNaJXJpMHBSg=
X-Received: by 2002:a05:6870:70a4:b0:1fb:75c:4016 with SMTP id
 v36-20020a05687070a400b001fb075c4016mr7403693oae.118.1702362184693; Mon, 11
 Dec 2023 22:23:04 -0800 (PST)
MIME-Version: 1.0
References: <20231204144429.45197-1-linux.amoon@gmail.com> <20231204144429.45197-2-linux.amoon@gmail.com>
 <20231206135311.GA2043711-robh@kernel.org> <CANAwSgTS0ZSFPv4x803pCLEpjH5imh8vEoWpbiJRH14Sy3GZww@mail.gmail.com>
 <21673bfd-bb87-4c7d-a53f-337c263f3a00@linaro.org> <CANAwSgSo37B0zg-xjrmqndSZ5SbyB3m27_wRsqqN9WTONooeiw@mail.gmail.com>
 <604e653d-c1e2-45c7-b121-8a6b4be5c6bb@linaro.org> <CANAwSgRB=XWo2-40rDru=Zy277-kgGNjozJ8Lxnxgv_4ABB-kg@mail.gmail.com>
 <1a78d453-62a2-410a-a40f-1ff0c2b62e86@linaro.org> <CANAwSgTy4N7Q8e0OQLsFRkRDWksTSbkOetKQGygaqsQ8++U1_g@mail.gmail.com>
 <2e688f4e-11d7-4f8e-b8ec-58f4a97304a8@linaro.org>
In-Reply-To: <2e688f4e-11d7-4f8e-b8ec-58f4a97304a8@linaro.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 12 Dec 2023 11:52:48 +0530
Message-ID: <CANAwSgQstkS-SDaV2hj0fimt7vgfEgOT_x4efshZ6sZQ0gWSEA@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: usb: Add the binding example for the
 Genesys Logic GL3523 hub
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Icenowy Zheng <uwu@icenowy.me>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-amlogic@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_222306_799211_98B9D7C5 
X-CRM114-Status: GOOD (  26.17  )
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

Hi Krzysztof,

On Fri, 8 Dec 2023 at 17:47, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 08/12/2023 12:19, Anand Moon wrote:
> > Hi Krzysztof,
> >
> > On Fri, 8 Dec 2023 at 13:14, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 08/12/2023 01:24, Anand Moon wrote:
> >>>>>>>
> >>>>>>> If I move reset-gpios to required, I observe the below warning.
> >>>>>>>
> >>>>>>>   DTC_CHK Documentation/devicetree/bindings/usb/maxim,max33359.example.dtb
> >>>>>>> /home/alarm/linux-amlogic-5.y-devel/Documentation/devicetree/bindings/usb/usb-device.example.dtb:
> >>>>>>> hub@1: 'reset-gpio' is a required property
> >>>>>>>         from schema $id: http://devicetree.org/schemas/usb/genesys,gl850g.yaml#
> >>>>>>
> >>>>>> Where are the properties defined? If you open the binding you see:
> >>>>>> nowhere. You cannot define properties in some variant with "true".
> >>>>>> Please define all of them in top-level and only narrow/constrain when
> >>>>>> applicable.
> >>>>>>
> >>>>> What I meant is the example below, required meant applicable for both
> >>>>> the binding
> >>>>> But it shows me the above warning.
> >>>>
> >>>> My explanation stands... So again:
> >>>>
> >>>>>> Please define all of them in top-level and only narrow/constrain when
> >>>>>> applicable.
> >>>>
> >>> Apologies, But I have tried this multiple times but have not been able
> >>> to fix the device tree warning
> >>
> >> Did you document all properties in top-level "properties:" block?
> >>
> > Yes, I have,
> >
> > Can you suggest a couple of examples to follow?
> > I looked at some of the YAML files but could not fix my issue.
>
> 99% of bindings. Look also at example-schema.
>
> You can also attach here complete patch for fast look / short review.
>

Please find the modified patch, I have tried a few things but none
resolve the binding warning.
I am not able to debug this.

-Thanks
Anand
-----8<----------8<----------8<----------8<----------8<----------8<-----
diff --git a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
index ee08b9c3721f..7f75fa3c1945 100644
--- a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
+++ b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
@@ -9,9 +9,6 @@ title: Genesys Logic USB hub controller
 maintainers:
   - Icenowy Zheng <uwu@icenowy.me>

-allOf:
-  - $ref: usb-device.yaml#
-
 properties:
   compatible:
     enum:
@@ -27,11 +24,47 @@ properties:

   vdd-supply:
     description:
-      the regulator that provides 3.3V core power to the hub.
+      The regulator that provides 3.3V or 5.0V core power to the hub.
+
+  peer-hub:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      For onboard hub controllers that support USB 3.x and USB 2.0 hubs with
+      shared resets and power supplies, this property is used to identify the
+      hubs with which these are shared.

 required:
   - compatible
   - reg
+  - vdd-supply
+  - reset-gpios
+  - peer-hub
+
+allOf:
+  - $ref: usb-device.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - usb5e3,608
+    then:
+      properties:
+        peer-hub: false
+        vdd-supply: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - usb5e3,610
+              - usb5e3,620
+    then:
+      properties:
+        peer-hub: true
+        vdd-supply: true

 additionalProperties: false

@@ -49,3 +82,29 @@ examples:
             reset-gpios = <&pio 7 2 GPIO_ACTIVE_LOW>;
         };
     };
+
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    usb {
+        dr_mode = "host";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        /* 2.0 hub on port 1 */
+        hub_2_0: hub@1 {
+            compatible = "usb5e3,610";
+            reg = <1>;
+            peer-hub = <&hub_3_0>;
+            reset-gpios = <&gpio 20 GPIO_ACTIVE_LOW>;
+            vdd-supply = <&vcc_5v>;
+        };
+
+        /* 3.1 hub on port 4 */
+        hub_3_0: hub@2 {
+            compatible = "usb5e3,620";
+            reg = <2>;
+            peer-hub = <&hub_2_0>;
+            reset-gpios = <&gpio 20 GPIO_ACTIVE_LOW>;
+            vdd-supply = <&vcc_5v>;
+        };
+    };

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
