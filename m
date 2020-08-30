Return-Path: <SRS0=MBsY=CI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C23BC433E2
	for <linux-amlogic@archiver.kernel.org>; Sun, 30 Aug 2020 13:12:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26C7A20757
	for <linux-amlogic@archiver.kernel.org>; Sun, 30 Aug 2020 13:12:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nzWCbb/C";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lztvxZTK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26C7A20757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zenhsD00aN+OdZtDmAXgSgWml51x2y12FpDzkmdK7R8=; b=nzWCbb/CmONe3Zd1j8+NK4iUD
	FnFa3jF/20HGJlmpNgcHbyUxMg1MgdiudfWVdwDo6WBXvRVTCfHO7I6gfBQAT6g5Xjnb4qZ0bqONe
	3rIUmZJCU2X1ILgRbcw8U691SBpZPxP1DE5glFIt4Sv/O1ubOGHIn8d/XHPiNRb2V/Fc7PR1jkrAv
	sBgzPvVLZAkMJSSSnH9qqSp8OXcTYBFeiQzf3tuQAYqftpw1M289GLYCO14H/RhyB7QXIthNEtuv8
	A2mmokKlfUBWFnhXb/n0aicvEEvflaJpZ6loHGOjv8sNXpgOgmGi5gYtK+QrIm/An/j6tTGDgEROG
	xhOp0Mtqg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCN7x-0002Rc-7z; Sun, 30 Aug 2020 13:12:09 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCN7t-0002Qy-M1; Sun, 30 Aug 2020 13:12:06 +0000
Received: by mail-io1-xd43.google.com with SMTP id d18so3379103iop.13;
 Sun, 30 Aug 2020 06:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ky7RGqnB3nEYZuhDWZg3ymidYnH0V7KhM8TSpX/Q31U=;
 b=lztvxZTKxduMPYlVazEzxIzqqk9pYCp6sBPjtF5OzNRGvi+Wa2MEkJV465M6aACEF3
 ZRs/0mVTPoXzz4Ok6emO0yCasMjWolNviqOHwxK52APFuEZZqv7cAUY0T/JvYQ8lgxZ8
 wpQ7RqXfPC9BV13MJtt/W3RYkE6JhpRM/1XBURRGP3Jl50bmjDXsufUDmj6VeqJRmQbP
 GwVVBUO4cXRSEierZRu/NpdMelia0BYgCiuc0y3paj+1mBhzhBE4irxNt0nF1UIhWwqD
 +5ywRnz+Zj0JZCzJZfiA80kTh3SFdtAIohW0ztGvu/lKOOKthp4ZiQTES8szHml0ORne
 yt5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ky7RGqnB3nEYZuhDWZg3ymidYnH0V7KhM8TSpX/Q31U=;
 b=UE6UWKXgXUlBQ+OJbI94D3ocjJai8vd1x4Yy3tEkFsOVqrHmaCn1DhUpVQlLMM+R6S
 K64AQUAiCZNodG1jYtU9zloqeHdiKmETnHNdNrvSgEmgG+PriPLv8p1mniG3oLPdZfTf
 7wV0CWHkscGu2UgEfYLO0bybwx/Ven+JAnj60NdM1XL1zDFwSXgFwaxXsYUwzR0uwyK2
 oITzVxcIrvKgccY8brKTCPcu92NxcTajgKQHhclNw9JjOZeRLKBMrfhpedyPKyEMp8Tz
 sQKUtUBtwog78pKVvka5b0WUvX5HMI/svC9FMgGRVwNthcctAQWMrfhG9mMq1EtBdSIC
 P/sQ==
X-Gm-Message-State: AOAM5304v+XiNvGrYznmBQVRd9qFkJ8xnfpQl5vh4XxH0dpLvmIi80ON
 eVdty685T7hi4OG4i7lhWOgItC094UobsVBXUa8=
X-Google-Smtp-Source: ABdhPJw5zO8vATsaTW2UhLmnknjkiNKOkPQUklYrvkX1WUjxsK/y1x2I2nsxtyiBiwFE2jBvuSrz0uwiNN6+CuuBj2A=
X-Received: by 2002:a02:730b:: with SMTP id y11mr8460860jab.126.1598793123756; 
 Sun, 30 Aug 2020 06:12:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200820121323.564-1-linux.amoon@gmail.com>
 <20200820121323.564-2-linux.amoon@gmail.com>
 <7hlfi9xgch.fsf@baylibre.com>
 <CANAwSgTZ23jFPAO46vRg1Dx_Bzi=4Bg6KHE0ozLQGky4p_fgKQ@mail.gmail.com>
 <CANAwSgQLnqDnuQvLv4cvaeTPeBW=H_g5F2aaNue_hb4nKLdovg@mail.gmail.com>
 <f7e6ce5f-02b0-065b-ffcf-2826159f926a@baylibre.com>
 <1j7dto3ylq.fsf@starbuckisacylon.baylibre.com>
 <CANAwSgQ1Miu73hfdK+cgL3howpekn2xj_5qwGasQZwtQpSGj5Q@mail.gmail.com>
 <1j4koq4x38.fsf@starbuckisacylon.baylibre.com>
 <CANAwSgTWnHXRFRUrbdCph+eBxL2PNXe6Q4aTXxEU32i7dGS=dw@mail.gmail.com>
 <CANAwSgQV7_4VdGRMgJDMjPFvOS3Nabkqbf2ucE5vqo6zrhxPDw@mail.gmail.com>
 <CAFBinCCEJJT_kfJ4qfTEz0R7Mo3ciCGDSw_MJYi_5PyNJA6x5w@mail.gmail.com>
In-Reply-To: <CAFBinCCEJJT_kfJ4qfTEz0R7Mo3ciCGDSw_MJYi_5PyNJA6x5w@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sun, 30 Aug 2020 18:41:52 +0530
Message-ID: <CANAwSgRV8y3Cc72CtppfJMPFKDSfpddzAKLeBGExn8G4OBVJ6g@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: meson-g12b-odroid-n2: Enable RTC
 controller node
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200830_091205_767840_677A1F23 
X-CRM114-Status: GOOD (  25.63  )
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Martin,

On Sun, 30 Aug 2020 at 01:26, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Anand
>
> (I haven't re-read all of this discussion, so apologies if something
> in my reply doesn't make sense)
>
> On Sat, Aug 29, 2020 at 6:31 PM Anand Moon <linux.amoon@gmail.com> wrote:
> [...]
> > Just want to clear my confusion on RTC INT gpio setting is not needed.
> > I did not find any other example to support this changes.
> > So I have enable the debug logs on rtc-pcf8563.c with this current
> > patch at my end.
> my understanding is that your testing procedure is to simply use your
> original patch and see if rtc wake-up is working.
> since GPIOAO_7 is not explicitly mentioned in your testing procedure
> I'm assuming that you're not configuring it anywhere.
Yes...
> Kevin's concern is what happens when that GPIO is configured
> incorrectly (for example by some u-boot bug, firmware issue, ...). for
> example: have you tried to configure GPIOAO_7 in u-boot as output low
> pin and see if rtc wake-up is still working?
Yes I will check this later.

Meanwhile I have checked this feature with _mainline u-boot_ and
_odroid-n2 u-boot_
and the result is that rtc wakeup works.

>
> In your previous replies you mentioned various pin mux settings
> related to TSIN_A_DIN0 //  TDMB_FS // TDMB_SLV_FS
> I don't know how those are related to the RTC
> My suggestion is to look at
> arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi - it has a
> eth_phy_irq_pins definition and apply something similar on Odroid-N2
>

Thanks for your suggestion, I have given this a try see below.
But any new pinctrl setting leads to RTC probe failure.

# dmesg | grep rtc
[    5.308536] meson-vrtc ff8000a8.rtc: registered as rtc1
[    5.483978] rtc-pcf8563 0-0051: pcf8563_probe
[    5.487549] rtc-pcf8563 0-0051: pcf8563_write_block_data: err=-6
addr=0e, data=03
[    5.490116] rtc-pcf8563 0-0051: pcf8563_probe: write error
[    5.552763] rtc-pcf8563: probe of 0-0051 failed with error -5

------------------&------------------------------------
$ git diff arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
index 35a31cf181e2..dad54f8a947f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
@@ -206,6 +206,15 @@ vddao_3v3: regulator-vddao_3v3 {
                regulator-always-on;
        };

+       /* Make sure the rtc irq pin is properly configured as input */
+       rtc_irq_pins: rtc-pin-irq {
+               mux {
+                       groups = "GPIOAO_7";
+                       function = "gpio_periphs";
+                       bias-disable;
+               };
+       };
+
        hdmi-connector {
                compatible = "hdmi-connector";
                type = "a";
@@ -481,7 +490,8 @@ hdmi_tx_tmds_out: endpoint {

 &i2c3 {
        pinctrl-0 = <&i2c3_sda_a_pins>, <&i2c3_sck_a_pins>;
-       pinctrl-names = "default";
+       pinctrl-1 = <&rtc_irq_pins>;
+       pinctrl-names = "default", "gpio_periphs";
        status = "okay";

        rtc0: rtc@51 {

-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
