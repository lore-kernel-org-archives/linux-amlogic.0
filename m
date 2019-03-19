Return-Path: <SRS0=/WbR=RW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCE97C43381
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 20:13:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD1F7213F2
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 20:13:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L0NEdlBN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="cg6/9xmK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD1F7213F2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GvZ8DUM+qcQvHvXK/+DzKLvvMu0iJgn/y75QjsIXD94=; b=L0NEdlBN7rMnaN
	hdE4GSHUTeENsfmr4ioOVfvIIfAPc8ppm3PO+vWhIudtzq1JEwQ4d4sJ7PA5pPJUte9I89n4G4IGQ
	jQELhstXYBQ0KHfCItenHEIcewh1yqrmRKJSpkD7W3Fx0FGr4xu6nmuygl1TsKhsogfebylQdL1yE
	aKnPgZKh6nQBSSjGO4HLipZc/L1UsMdO+DL3PtJOG757JQiV84jwzp+e8HzqUAB5EUMKDtFjYFKC8
	NISFH4AwM8m6Irlv/LUXH9ZKebsYAejzYGkBEXZulR6n33HdOxrsDb4WYZxbZwmJqx7BD/zGRE1bs
	jRbHCk1+28ABGiXzTvgw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6L6u-00056R-Bf; Tue, 19 Mar 2019 20:13:20 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6L6r-00055L-IB; Tue, 19 Mar 2019 20:13:19 +0000
Received: by mail-oi1-x244.google.com with SMTP id x188so4848177oia.13;
 Tue, 19 Mar 2019 13:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pChVmqBWNHh+c9JeuJAKczvnZeuFBoIGS35tMLIUbY4=;
 b=cg6/9xmKTOJ0PR1H93EhfAuEZ4Yx3/M/+JUx2Jhh/L+5BMo7PJGWBqu27eZDHs7qLS
 jLyZT/5z/Or1XJSu/2eMuOyycFeYtCAooQ/hQJdeKpSplJ/ht93/f+WGXH3nptplGlGE
 kv+oLq4RH7y/LEfh9BRzxxIaGLFTggtVdWdB26wELBilEpt8j9T1W9wRIr3socNlFnYM
 jE6VIevRtE+q5LeHsrMn0FPOeZPVZgi1k31kaSP4FJcUZLw9tfd44uk5PXo+yI3cGZn+
 P+heNHs6CMWMlTEknaQJTuDSsyQs65XhDtftdq4MddCeQJ1snmlEQTpXxHRtpIQTipqe
 19rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pChVmqBWNHh+c9JeuJAKczvnZeuFBoIGS35tMLIUbY4=;
 b=BKC+L1MVQMc9Gw5KlGVNfrfbA+MBFY4t3DK8qaBnhEBgrPsr6Tdt5/yhlHKPmJY4bi
 Bzh4wlPIFfDE9iNRVancIis3lPM420PqqF6m0x2ZhXqWJ648SDa4OIhA1uk+S47z9zsb
 rYW1jEovw9OGvNowlr3l0CXoSE4gW+i1Ho+mB6Vdbisn5B6Cy8nmrD6yO02sa7Jeggqh
 qYIhyJE7VKXTTKvFJiswO6hbkOz0W94COSXVRr1fPSZ2rYjhCUQnXjld6xOGwbPK+tpq
 YnxtXrW/Un9t2NfpEhHMir73lFOXjzqGQKhRwvTasozt2MXzbu0BvhLnR79SJKyWzpDs
 1f6w==
X-Gm-Message-State: APjAAAWdk6bYq0eJx+EsfxaTcnWNBtcwUUJFEG2tcISsFNQeAlciu7If
 JemcwVpH2zuKk6zPkysRB3KL4QBBFVoIbcGHQlo=
X-Google-Smtp-Source: APXvYqw0lsMDF11GRsRM/4MI4/qFFiwyhPyUyJKWtMj425kYyaCa0Yc2w6Rx4WiZI27Jyt+QkyWDAWrKUDmCZ7VCrLM=
X-Received: by 2002:aca:cf07:: with SMTP id f7mr2725524oig.39.1553026393798;
 Tue, 19 Mar 2019 13:13:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190318100458.5619-1-narmstrong@baylibre.com>
 <20190318100458.5619-7-narmstrong@baylibre.com>
 <CAFBinCCSKh145--5EAPQyJjbuefRgWm57G+05so28-WiZjqNYg@mail.gmail.com>
 <c13bc57b-82ea-8f48-75a7-417941b08a11@baylibre.com>
In-Reply-To: <c13bc57b-82ea-8f48-75a7-417941b08a11@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 19 Mar 2019 21:13:02 +0100
Message-ID: <CAFBinCDj=5VpoJGKVGw5bG50EaBHgKz=WLtSwNVVWXtzfoiQ9A@mail.gmail.com>
Subject: Re: [PATCH v2 06/11] arm64: dts: meson-g12a-x96-max: add regulators
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_131317_600004_8DD897C9 
X-CRM114-Status: GOOD (  20.79  )
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
Cc: khilman@baylibre.com, Guillaume La Roque <glaroque@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Tue, Mar 19, 2019 at 9:29 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On 18/03/2019 21:13, Martin Blumenstingl wrote:
> > Hi Neil,
> >
> > On Mon, Mar 18, 2019 at 11:06 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
> >>
> >> From: Guillaume La Roque <glaroque@baylibre.com>
> >>
> >> Add system regulators for the X96 Max Set-Top-Box.
> >>
> >> Still missing
> >> * VDD_EE (0.8V - PWM controlled)
> >> * VDD_CPU (PWM controlled)
> >>
> >> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> >> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> >> ---
> >>  .../boot/dts/amlogic/meson-g12a-x96-max.dts   | 67 +++++++++++++++++++
> >>  1 file changed, 67 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
> >> index 0edbd00b358f..5c37930b09e2 100644
> >> --- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
> >> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
> > [...]
> >> +       vcc_5v: regulator-vcc_5v {
> >> +               compatible = "regulator-fixed";
> >> +               regulator-name = "VCC_5V";
> >> +               regulator-min-microvolt = <5000000>;
> >> +               regulator-max-microvolt = <5000000>;
> >> +               vin-supply = <&dc_in>;
> >> +
> >> +               gpio = <&gpio GPIOH_8 GPIO_OPEN_DRAIN>;
> >> +               enable-active-high;
> > is there any way to test whether this GPIO is the right one?
> > I couldn't find a reference to a GPIOH_8 regulator in
> > buildroot_openlinux_kernel_4.9_fbdev_20180706
>
> The x96 is based on the U212 reference design, and the GPIOH_8 controls the 5V_EN signal,
> but you are right, it's the wrong polarity here, it should be enable-active-low instead.
> (FYI The SEI510 does not use this at all, 5V is always enabled)
>
> The schematics describes :
> VCC5V_EN (GPIOH_8-Hiz OD): 5V_EN
> L: Enable
> Hiz: Disable
thank you for this explanation!

> FYI, the GPIOH_8 is Open-Drain only, this means this pin cannot pull to TTL 1, only to TTL 0
> or set as input. We need to add a way to describe this in the pinctrl driver somehow....
as far as I understand the pinctrl driver changes would result in an
error when the GPIO is used with "active high" (making incompatible
drivers or .dts easier to see). is this correct?

> I will send a fix on v3
>
> I didn't notice because I power the board using a Type-A to Type-A connector,
> and the 5V from the USB port bypasses this regulator...
this is good to know.
I'm also powering some of my boards using a Type-A to Type-A
connector. I'll need to remember this and this whether boards are
still booting with the DC plug


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
