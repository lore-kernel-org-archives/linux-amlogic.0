Return-Path: <SRS0=lgrq=RV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCE41C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 20:02:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86FE320872
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 20:02:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qpJoGLod";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="jIlWkdeP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86FE320872
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wb32hHyme4puD+D/dBIgPgzKgDDGQIokXfbZdn03zTg=; b=qpJoGLodHsBWIz
	AtYbm8dzPHAC5VvhJ/RYwVnVRRA95/krE8Ej8kZHz2XFBldWwTDbAi6YX8WVMRyagbqDRCGj3dmSP
	yBNH6ri0AKFpu7OAZmpiRj6fRom58vWFJy68HCU2znJDX8l+XsufOkO7J6g8xn7tVWomQh8Qf/619
	QpipFlnWiychZ09wFkhjJnkn1Hg7l4Ax0IUuS21xt0QauWcGkAZOgGZHFkntF4pT/v42Dlif/lSE2
	Jvdmj2fhe3VDi7eT9y4YOsnCiwH2xIzWKSZgSWmDElkYi+lE8/nl1dlYa+UrzjMKgFQb0GH9YOTgy
	zuoEQNhuP/d8iNN/Hm+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5ySr-0007g2-Ix; Mon, 18 Mar 2019 20:02:29 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5ySn-0007fB-Ql; Mon, 18 Mar 2019 20:02:27 +0000
Received: by mail-ot1-x344.google.com with SMTP id i12so15553083otp.12;
 Mon, 18 Mar 2019 13:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8bXx8Gd7kRQfyDxcGx1GeZllmU8/LjyER2A6kL540eQ=;
 b=jIlWkdePbJhfhKFeSPNNyi5nfcDPDuFQOFpUMECgAIwUKkTY8xI34VLnxYnYRmn8zh
 DeeojmZabNPZBIC9J6rwYIxYgBW7Niqzsdv8SoQhMhFirtGj8k1930KMYPFkowMqUrVY
 ve/2GzO4nF/iHmUoFjcVT2itRn3diCJ0bMbMl5HUAh8z+O1DEAfED4vTtmfFBNsvsYEh
 Vyt0kOLEG7rncKRDwPeSw5IyJjfw0yRy3sFqLcMS7i+eUIOO4pq7gnEsxYRgH/+Ldai1
 Oguq3pcbDObEFHnn5wevz6zPTdKausjkicgTCEljM8V9r3GzCo+inXOAd8/gWwIuMBUN
 4qFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8bXx8Gd7kRQfyDxcGx1GeZllmU8/LjyER2A6kL540eQ=;
 b=SzJGUX8RMFgbSQxFan8vZjv8whjQxVkQ2llmTxXIrK0Z/trbrVfbURGqKPml/+Th7c
 ky5tTsn92BMJnuoAN81PeRi19yAvUOUocqbFqUEslAu4UsosNMrHD6wRESGkVQx9/oCc
 SdB74sdLQvcTfuKt03M28GoLYEQwk00TxjwaGetrwNzDt5P7IEXhr8ihRoIPisM6QRLT
 6eJGIbZCrmmQ4+QgYn/5/TtD8tIepavfkABeR0IujF5rfN+LWwf4Egh9LTnQ+KTTEyIa
 CRG3OqKVtFXAGV6Y/cCEm/P228MF6pexb69gERejeM2GCkaDxiIifN5lmDLhR78QqYpQ
 uWXA==
X-Gm-Message-State: APjAAAWBcS6NaMJ9VznaL/+/hSIqUROS9MdLIdHiBVWh1XRkq5J2v58i
 iF0o0EmJT6Nd1Yb4sJZ4uJG/FSXF9HLlSZwQ7Dnivw==
X-Google-Smtp-Source: APXvYqxB4pS1IFH+Pv2u9eodriTgaqFiTQKklidzZ5NBVs5HL+8cEiDJpG7pWhLLA9SdhA66O7ViDoX5cyt7rW9gLSw=
X-Received: by 2002:a9d:6306:: with SMTP id q6mr11298896otk.86.1552939344732; 
 Mon, 18 Mar 2019 13:02:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190318095851.4062-1-narmstrong@baylibre.com>
 <20190318095851.4062-2-narmstrong@baylibre.com>
In-Reply-To: <20190318095851.4062-2-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 18 Mar 2019 21:02:13 +0100
Message-ID: <CAFBinCDfOEvmQcE7TgYvXmM1f=pywYbjhbAZWs4AYNXs8y6y7Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] arm64: dts: meson: g12a: Add AO Clock + Reset
 Controller support
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_130225_868396_5EAC6D66 
X-CRM114-Status: GOOD (  13.08  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: khilman@baylibre.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Mon, Mar 18, 2019 at 10:59 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Add nodes and properties for the AO Clocks and Resets.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> index 31ddf9444b3e..5c0983edf837 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> @@ -4,6 +4,7 @@
>   */
>
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/clock/g12a-clkc.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>
> @@ -122,6 +123,23 @@
>                         #size-cells = <2>;
>                         ranges = <0x0 0x0 0x0 0xff800000 0x0 0x100000>;
>
> +                       rti: sys-ctrl@0 {
> +                               compatible = "amlogic,meson-gx-ao-sysctrl",
> +                                            "simple-mfd", "syscon";
> +                               reg = <0x0 0x0 0x0 0x100>;
> +                               #address-cells = <2>;
> +                               #size-cells = <2>;
> +                               ranges = <0x0 0x0 0x0 0x0 0x0 0x100>;
sorry for noticing this only very late: I missed the #address-cells,
#size-cells and ranges property in my last review
do you have any change queued which requires this?
my understanding is that the drivers for all RTI children should use
the register offsets relative to the RTI start address. In that case
the child nodes neither have a unit-address nor a reg property, making
the last three properties unnecessary.


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
