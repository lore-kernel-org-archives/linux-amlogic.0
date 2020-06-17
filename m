Return-Path: <SRS0=vfsC=76=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BB15C433DF
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Jun 2020 05:40:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A68420707
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Jun 2020 05:40:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dU54RXkS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=verdurent-com.20150623.gappssmtp.com header.i=@verdurent-com.20150623.gappssmtp.com header.b="tV5VmVtH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A68420707
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=verdurent.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wDexkVIlC6ZgKEleXqET0yki+AwyIm55i6bpf+miZag=; b=dU54RXkSMlG1LC
	pJPEWxQu0Xfu710X5hQRrU4RrWyh2tsP/P+HCogisemFo1iRMuGFro5cCkPhKs0QemLHk5eRpgYji
	3GqQ/i7SEmXabHXhzHBdEa49YXtCGYMjnK/9C+M5FmSL0wrVWTCH3lMzP9G6MrTZ57vdcsXgdVpOc
	2SzAO55dHTGc7HpN0ttCUVUWq18fkyIHe0BxJ5Bqp1mnazYVa/Tg7Ve5bNdePdJoFbZkBJPy5/R9A
	QcEoWRrwf1gOUkCfCFkhAdyYbIuMID+AMXOnnHyOjB33AoUrr5SjXRFI5EKD7nFxulrVqeXqBV2bf
	AxXnGh2LQhZoxxzO2MlQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlQo6-0005rw-TL; Wed, 17 Jun 2020 05:40:18 +0000
Received: from mail-ua1-x943.google.com ([2607:f8b0:4864:20::943])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlQnU-0002zU-C8
 for linux-amlogic@lists.infradead.org; Wed, 17 Jun 2020 05:39:41 +0000
Received: by mail-ua1-x943.google.com with SMTP id c9so357178uao.11
 for <linux-amlogic@lists.infradead.org>; Tue, 16 Jun 2020 22:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=verdurent-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v9qIRx2tmhQ3c3ThbA5nkdagn3KrF5Ngnlh6eWWB5sQ=;
 b=tV5VmVtHEExLDAgnm3QHdrBX6Z+X2xewEeIPR6nHkE1YvO2YLuZj5m7aMMzZc0N5qn
 b+bHb3H1Pc+gT0kD2XioSKa20MP/FHGwtV/+Ku/ZtIp1b1oux3Iapejc2V8uF24wb84E
 iGb7tbt9DpISBvbBvsKSNtrp9WUTQMdXNgm5SX6l5DWFH999VJdCu1JcxskvBo+k2OZQ
 /Oz077l3N08uClrw1bPyI3kIatKaQbccwkvGEVq1gF7KwfD3tn5OMSSBypaFjkdpH7m4
 0SVo1rcoH6DlH7ilS9OSS3zJzdheVKSrfuPcWqR5TLKQeSrLrMatTJo4OiBQ9ZDSl+L5
 e/zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v9qIRx2tmhQ3c3ThbA5nkdagn3KrF5Ngnlh6eWWB5sQ=;
 b=QgKBK1Yduuny2kdfvdhndTsd6YY4Phzx4qrI/M9V2vEpUTJOONAikGy8JXA0c0ZX9x
 0WSn+8UW83M5AP8DS50t351MaOtChg/vXI4PZY/GHt9tCmQhfy8GuFhXtyW7bNITvXh0
 CMbewY8ZUXuwJYWof+eUuOCjNiqPdx2wdCPfNl/7lKCjzDpQi0I8DOxIoDtnvIYk0kzL
 +U1JdltPcpDLauY4iWTXUg2BJ8B/5gQimTwKR/eGsCQseFPz2afIoSZ/qabUAAdBZCvf
 lSBKMQr3stMK2p06IT2JxcNC9oGJWy+n7Znxxo/TzjjdPrZtUysIr30qUzw2OEJsD1j7
 hbkA==
X-Gm-Message-State: AOAM532WtXDMwMFrYgUiRWju9b3pFux2IyAVVYHnNqPM3KfyUpS3LK9N
 UADl1dN2eYOs0abuBsYoFAgaI0FSJkIBFiWK6OCPxQ==
X-Google-Smtp-Source: ABdhPJz89Ef33YgEHunwRCxdjaFBZmv3URUcXF7ranAVS8kN/9HInOJDHD51KTNr0Mh1t1tL3cEoGx09WYVLD327dfg=
X-Received: by 2002:ab0:1eca:: with SMTP id p10mr4534103uak.94.1592372379134; 
 Tue, 16 Jun 2020 22:39:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200608091739.2368-1-narmstrong@baylibre.com>
 <20200608091739.2368-6-narmstrong@baylibre.com>
In-Reply-To: <20200608091739.2368-6-narmstrong@baylibre.com>
From: Amit Kucheria <amit.kucheria@verdurent.com>
Date: Wed, 17 Jun 2020 11:09:28 +0530
Message-ID: <CAHLCerP+jEhZJs7yPmwPEm15FnrShJjNzOJ2UNcXVP5-WFbwVg@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] arm64: dts: meson-khadas-vim3: add Khadas MCU nodes
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200616_223940_434301_4FA193E7 
X-CRM114-Status: GOOD (  12.02  )
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
Cc: Kevin Hilman <khilman@baylibre.com>,
 Linux PM list <linux-pm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 lakml <linux-arm-kernel@lists.infradead.org>,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Jun 8, 2020 at 2:47 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Add the Khadas MCU node with active FAN thermal nodes for all the
> Khadas VIM3 variants.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>


> ---
>  .../boot/dts/amlogic/meson-khadas-vim3.dtsi   | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
> index 094ecf2222bb..3325e54ea690 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
> @@ -183,6 +183,23 @@
>         hdmi-phandle = <&hdmi_tx>;
>  };
>
> +&cpu_thermal {
> +       trips {
> +               cpu_active: cpu-active {
> +                       temperature = <80000>; /* millicelsius */
> +                       hysteresis = <2000>; /* millicelsius */
> +                       type = "active";
> +               };
> +       };
> +
> +       cooling-maps {
> +               map {
> +                       trip = <&cpu_active>;
> +                       cooling-device = <&khadas_mcu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +               };
> +       };
> +};
> +
>  &ext_mdio {
>         external_phy: ethernet-phy@0 {
>                 /* Realtek RTL8211F (0x001cc916) */
> @@ -222,6 +239,12 @@
>         pinctrl-0 = <&i2c_ao_sck_pins>, <&i2c_ao_sda_pins>;
>         pinctrl-names = "default";
>
> +       khadas_mcu: system-controller@18 {
> +               compatible = "khadas,mcu";
> +               reg = <0x18>;
> +               #cooling-cells = <2>;
> +       };
> +
>         gpio_expander: gpio-controller@20 {
>                 compatible = "ti,tca6408";
>                 reg = <0x20>;
> --
> 2.22.0
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
