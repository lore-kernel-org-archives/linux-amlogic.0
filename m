Return-Path: <SRS0=DBdr=XJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A824C4CEC7
	for <linux-amlogic@archiver.kernel.org>; Sat, 14 Sep 2019 17:41:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56B752067D
	for <linux-amlogic@archiver.kernel.org>; Sat, 14 Sep 2019 17:41:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MhURC97E";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="oR/DGMfb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56B752067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5+NZhI+ueTVGbQeiapAAeHm36le5f5kmfNKoaZy26ko=; b=MhURC97Ejr3vJD
	6NF6gO+Ahv/F1xEk63Ol7wqtCF3mIRrTN5z39ZGcKfI7hqThvyvRBRJ2lzSA084RuD9GJ5S/srngc
	I0r66we4RxJ3MJ/rX4e4Bg57aPHN0H7MgGrxlk6e437GmCq74ZacwHBx4b25/4JWfDsKWQnkVTedo
	CiHbJskRAo1wBBq+TGov2yaPHr2KcYTsccFD2EwCk06s+chs5h2gFXCh4L8wal0rEqRb55GYiZVEF
	0tfKrNIPV764yMJASlZ5VS3ixevcuNDiGNwSc0/gZ3nAOvBeMG+JT17OaskBQ5BEGqiMsq77fTIDR
	B9GtSaJp8pt4vYtxib1g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i9C2o-0000CQ-La; Sat, 14 Sep 2019 17:41:10 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i9C2Z-0008TB-P1; Sat, 14 Sep 2019 17:40:57 +0000
Received: by mail-oi1-x243.google.com with SMTP id v16so5179595oiv.13;
 Sat, 14 Sep 2019 10:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ScwrZFTGOc+kbhhZsRu5GL1IOvADxSoY4roa9r4rvrc=;
 b=oR/DGMfb/9sZrS1uWjRRtNMdrY5WzzoMndCtZaKV+gw+KnCyNqnAKD24aJKKHJdhxu
 i7amzSzK25ME7g67a28AVFajVTK1cxb+fmXDMU3GS565nM7NXjVzmCa0GD3MOJ6wO5Pp
 sgODIbPNcyMnunPtbLm0F3kOFWFeMMfYJp/Jlt/maGebgXr3vcTwhEgPwASNRV+50Pjg
 N620uvQjpgRfC54Yg71xZ7CQbDchDgFgsYw186toIk3YCFIMqHkiTH4G8cDjv1uhtv6k
 6CgYOUzRHIF14PfBznVGZmQpHsEl3KPgCzFYkK98WoRPBqoSUhB8ZvFYFQK2WLEceNUq
 m55g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ScwrZFTGOc+kbhhZsRu5GL1IOvADxSoY4roa9r4rvrc=;
 b=SrrfFGsjhsQb3z/bbjdG42SOQVrbjRIIiXwP7YsiLpfhNp3y5geioOaH5o0GZ93+a+
 W9WXkum0+8s0W6/t6jVogh+WHJyGo0nIJ5Q52xvWfUEe1SosbehnIbMts6pD01h+PGeg
 tuVgrfBHqL/EcpdRRQzPDNdjLqE7a1c4NXZUYQXRFMRDSn1VOfSQWLdP6YOVofRjayhi
 p9oUQC51OARq68AFEFftXGRmn9UOuOZ3OscbTRR1RfPkivQkcL1v4dBobESOv9v8S0IR
 PygebrCSmXyDVsjhRUPzBLClgu6D0+zB8duhJLvM0Yc8PC+iUVxvuYXOI8i7Vb/VkWdo
 vz7Q==
X-Gm-Message-State: APjAAAUzXJ9ULw3Wj2o0jAmRkhSIE9RAqdYNfQXE8eIf3viCUXQ8evGE
 8Qxn7E7xLLnCj9O/5vHphCMeZiEUlbWRj+Nl768=
X-Google-Smtp-Source: APXvYqxzDSV60TGVXBUNUlUYl4UV7zv7qNNLwQJ0PfQSVLqrKQObbcGram3Yy+w0QN7EAUgIusf4gu4nw3EU9eIuIxE=
X-Received: by 2002:aca:4d08:: with SMTP id a8mr8328954oib.39.1568482854580;
 Sat, 14 Sep 2019 10:40:54 -0700 (PDT)
MIME-Version: 1.0
References: <1567780354-59472-1-git-send-email-christianshewitt@gmail.com>
 <1567780354-59472-4-git-send-email-christianshewitt@gmail.com>
In-Reply-To: <1567780354-59472-4-git-send-email-christianshewitt@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 14 Sep 2019 19:40:42 +0200
Message-ID: <CAFBinCANaKMHRuwaFwubZcDjZaGYcLcVuHjJsakR0uJkmZxRMw@mail.gmail.com>
Subject: Re: [RESEND PATCH v3 3/3] arm64: dts: meson-g12b-ugoos-am6: add
 initial device-tree
To: Christian Hewitt <christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190914_104055_841056_37E3587A 
X-CRM114-Status: UNSURE (   8.02  )
X-CRM114-Notice: Please train this message.
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Oleg Ivanov <balbes-150@yandex.ru>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Christian,

my nit-picks below

On Fri, Sep 6, 2019 at 4:34 PM Christian Hewitt
<christianshewitt@gmail.com> wrote:
[...]
> +       spdif_dit: audio-codec-1 {
> +               #sound-dai-cells = <0>;
> +               compatible = "linux,spdif-dit";
> +               status = "okay";
> +               sound-name-prefix = "DIT";
> +       };
please move it below sdio_pwrseq (or at least somewhere below the memory node)

[...]
> +       vcc_3v3: regulator-vcc_3v3 {
> +               compatible = "regulator-fixed";
> +               regulator-name = "VCC_3V3";
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +               vin-supply = <&vddao_3v3>;
> +               regulator-always-on;
> +               /* FIXME: actually controlled by VDDCPU_B_EN */
can we add the enable GPIO here now that we know how to describe the
VDDCPU_B regulator?

[...]
> +       usb1_pow: regulator-usb1_pow {
for consistency with the regulators above: regulator-usb1-pow

[...]
> +       usb_pwr_en: regulator-usb_pwr_en {
for consistency with the regulators above: regulator-usb-pwr-en

[...]
> +       vddao_1v8: regulator-vddao_1v8 {
for consistency with the regulators above: regulator-vddao-1v8

[...
> +       vddao_3v3: regulator-vddao_3v3 {
for consistency with the regulators above: regulator-vddao-3v3

[...]
> +&cpu0 {
> +       cpu-supply = <&vddcpu_b>;
> +       operating-points-v2 = <&cpu_opp_table_0>;
> +       clocks = <&clkc CLKID_CPU_CLK>;
> +       clock-latency = <50000>;
> +};
> +
> +&cpu1 {
> +       cpu-supply = <&vddcpu_b>;
> +       operating-points-v2 = <&cpu_opp_table_0>;
> +       clocks = <&clkc CLKID_CPU_CLK>;
> +       clock-latency = <50000>;
> +};
> +
> +&cpu100 {
> +       cpu-supply = <&vddcpu_a>;
> +       operating-points-v2 = <&cpub_opp_table_1>;
> +       clocks = <&clkc CLKID_CPUB_CLK>;
> +       clock-latency = <50000>;
> +};
> +
> +&cpu101 {
> +       cpu-supply = <&vddcpu_a>;
> +       operating-points-v2 = <&cpub_opp_table_1>;
> +       clocks = <&clkc CLKID_CPUB_CLK>;
> +       clock-latency = <50000>;
> +};
> +
> +&cpu102 {
> +       cpu-supply = <&vddcpu_a>;
> +       operating-points-v2 = <&cpub_opp_table_1>;
> +       clocks = <&clkc CLKID_CPUB_CLK>;
> +       clock-latency = <50000>;
> +};
> +
> +&cpu103 {
> +       cpu-supply = <&vddcpu_a>;
> +       operating-points-v2 = <&cpub_opp_table_1>;
> +       clocks = <&clkc CLKID_CPUB_CLK>;
> +       clock-latency = <50000>;
> +};
(not limited to this patch: there's a lot of redundancy with the CPU
nodes across the G12B .dts)

[...]
> +&sd_emmc_a {
all nodes starting here should use alphabetical sorting


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
