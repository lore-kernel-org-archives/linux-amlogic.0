Return-Path: <SRS0=2xsp=N4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 238E3C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Sep 2021 12:03:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E31EC61027
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Sep 2021 12:03:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E31EC61027
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iLn057lIXGW0VXbDCBVQJKsu2onTT/2A0tzpgtTwPr8=; b=rex5geXRGsYpnD
	giRmTEM/PcyXMLPJfVtkr8Xt11rct17P1YgNljXSjXScj4mPPj4ydQw2y+pG6uxQjJeefdpiSwr0j
	4+Ja/dIvsIHEM9uwpTe8MpxEQGWHA0t7IX6RoQIh4/FLB/XeJNg7YePmdc9aElyiMFY8JOS+UfJFZ
	JoaVyjD6KyeD9te7nu3X3Es7d/9PtwdNbz+jiNombfsqOCIIgl5sFM1Yhc/WX6xNHOrEiXjleTAuy
	nHcJAdXiyS8aniqyM8l70paKxTZtMP1GeY1/3EkMQo93U5UYeQgLiazL7vnRrtLmvLoFWWUVWyek5
	uXttfDvHiNWQRufDKy4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNDLd-000hUT-BX; Mon, 06 Sep 2021 12:03:37 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNDLD-000hQ0-A6; Mon, 06 Sep 2021 12:03:12 +0000
Received: by mail-io1-xd2e.google.com with SMTP id y18so8436079ioc.1;
 Mon, 06 Sep 2021 05:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O7ISh/OwFD2H80nlF7WhKIYbG9cBOwzE8UDDaZsXvsA=;
 b=PT3/Qdobfe0XUw4ybHv2sxcU7bEZ4U8GpCM75nkOhP5SL755yd4LdmI5e96ScqA2L3
 J8Ffv1NMhvlqSijsiavC45D52SLRkaWocVM0GP0s7TNnbHyXAfahuP1zrqdib+ujk+EM
 CU1LizVvzDHmBLU+Wwf8TzBAzyzy/eGNKb8fjnrchdaF05wK2rVfgOaIh5Hc8dMjIKN1
 GTKQm1Ot2cd7xF+PxmzXai7Ru372heQ158Pv8KT9oqxZLHrVTFGEHLKOiN3TyS7nOKf9
 sRtb6KrzVdz90nATiOqiUkRxnLac/Ph+juUv9DQjEosiGvAAlj2Srl51NPJOM3jY/uCv
 mSIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O7ISh/OwFD2H80nlF7WhKIYbG9cBOwzE8UDDaZsXvsA=;
 b=uncPKICcuXuFxuaGGTrxSaMnPe9TE0CTKxXBcuQTnBl6N1jpnyMTod59f4UDgwMGwg
 DbCNbRqXQme3YsimGNPBMWrb8FxlYfSYZYKI76TQ14EPKAYyHEzcfrH34ebGEI2uEbdi
 WueLMdrCEBnb6cR5HMcsT+kou5rC6a7hrQbqncv+372+rUejW9yblFyX5AwZMebsEwS9
 Ph72tG2EyPLXyLhTQ2C4iLcxizTzQ5j2rDdZkKbGl7hwdOzI3FqZV8RbE2JMNORSueEC
 kCd22Ee633mMMBQR8lcFqTw8+Tb/PrsptXC18j6HZoJaEYYSyUVGuGdQaDeq38eEFt7K
 w8Ng==
X-Gm-Message-State: AOAM532pTHwtDxN7EjUFMrc2IHUoB7cZxz1NXic5VwVkcSUuSi3GWl1o
 tJvDoV7sa9+1PDUsV3PF5A/EG0nnbXdaZPZm9x4=
X-Google-Smtp-Source: ABdhPJzA51CZzsXmRD/8mfSkSWFTnPv6HG06K4ZkpxKx5Ats57sEW7izaxtVJ1LHGNNDeMnzRanXapodSqQiPmAFRYk=
X-Received: by 2002:a05:6602:2211:: with SMTP id
 n17mr9431211ion.142.1630929790513; 
 Mon, 06 Sep 2021 05:03:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210812051059.1103641-1-art@khadas.com>
 <247c746b-621c-5db0-25c0-1ef0d0a0d77e@baylibre.com>
 <1jpmtmys2t.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jpmtmys2t.fsf@starbuckisacylon.baylibre.com>
From: Art Nikpal <email2tema@gmail.com>
Date: Mon, 6 Sep 2021 20:02:59 +0800
Message-ID: <CAKaHn9KLYNo9p_Ythq5eXjJSJyJ2=+uhB22A0xp+msLZ9JhJCw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: meson: sm1-khadas-vim3l use one sound node
 configuration with VIM3
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 Christian Hewitt <christianshewitt@gmail.com>, Artem Lapkin <art@khadas.com>,
 Nick Xie <nick@khadas.com>, Gouwa Wang <gouwa@khadas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210906_050311_393252_B6F182D2 
X-CRM114-Status: GOOD (  21.12  )
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

> Take a look at the Loopback sink - it is different between the sm1 based
vim3 and the g12b one ... this is simply because the audio block is
different on these SoCs

Maybe you are right ! i will test it soon too

Another question is:  loopback necessary ? same as 3 alsa sub devices
? mixer configuration is already not easy for  understanding;)

> However the model name here is
> a) probably too long

yes i think need to be like other model = "KHADAS-VIM3L";

On Mon, Sep 6, 2021 at 5:24 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>
> On Thu 02 Sep 2021 at 15:31, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> > Hi,
> >
> > On 12/08/2021 07:10, Artem Lapkin wrote:
> >> Khadas VIM3L board sound configuration same as Khadas VIM3, its already
> >> defined in meson-khadas-vim3.dtsi and no need overwrite it with different
> >> card names and routing configurations.
> >>
> >> Signed-off-by: Artem Lapkin <art@khadas.com>
> >> ---
> >>  .../boot/dts/amlogic/meson-sm1-khadas-vim3l.dts     | 13 -------------
> >>  1 file changed, 13 deletions(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
> >> index f2c098143..06de0b1ce 100644
> >> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
> >> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
> >> @@ -32,19 +32,6 @@ vddcpu: regulator-vddcpu {
> >>              regulator-boot-on;
> >>              regulator-always-on;
> >>      };
> >> -
> >> -    sound {
> >> -            model = "G12B-KHADAS-VIM3L";
> >> -            audio-routing = "TDMOUT_A IN 0", "FRDDR_A OUT 0",
> >> -                            "TDMOUT_A IN 1", "FRDDR_B OUT 0",
> >> -                            "TDMOUT_A IN 2", "FRDDR_C OUT 0",
> >> -                            "TDM_A Playback", "TDMOUT_A OUT",
> >> -                            "TDMIN_A IN 0", "TDM_A Capture",
> >> -                            "TDMIN_A IN 13", "TDM_A Loopback",
> >> -                            "TODDR_A IN 0", "TDMIN_A OUT",
> >> -                            "TODDR_B IN 0", "TDMIN_A OUT",
> >> -                            "TODDR_C IN 0", "TDMIN_A OUT";
> >> -    };
> >>  };
> >>
> >>  &cpu0 {
> >>
> >
> > Jerome could you quickly review this ?
>
> Removing that is wrong.
> Take a look at the Loopback sink - it is different between the sm1 based
> vim3 and the g12b one ... this is simply because the audio block is
> different on these SoCs
>
> So audio-routing property can't go way, Because of that, the cards are
> slightly different and should have different model.
>
> However the model name here is
> a) probably too long
> b) misleading :/
>
> >
> > Thanks,
> > Neil
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
