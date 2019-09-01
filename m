Return-Path: <SRS0=MCOz=W4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B5C2C3A5A4
	for <linux-amlogic@archiver.kernel.org>; Sun,  1 Sep 2019 13:58:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D61A2077B
	for <linux-amlogic@archiver.kernel.org>; Sun,  1 Sep 2019 13:58:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FT5DOEox";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OUPioWUh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D61A2077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cn6kh8oNxCrh0i2BnczXcWu4iNBQ0rZ1tsE9MZaHioY=; b=FT5DOEoxig054z
	v4HQRgJ4ZcLJUdMWlMAiDJgoKaViztwmNiw+pgqNMdQQwd9zpggFyV4iUGGDNMii/Q6C0ozNUO+j4
	sn4HtPYoRLCp9+hEfpLkPZfpPu6glEPB5hwNiVi1Yii+SgNoYGZSGLdo5CrBXjsDDBpTNr8xY1nf3
	btckj59pBnjWpPu7R2UXKm/mVdL33wwlZ46eL/BdUYVlPkBh3jdZDPD6b3yn7DCi369nRmvUOUd3q
	UZgc4CRVRdsSEvEAliVCBAEpE3Ra6kwc24qbsyV1t7pxkMCmkYk3RxDKwRxmCKou69Zre9wAwVf6N
	0eHUdThRgC5VoRNyKOjQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i4QNR-0006xx-Fs; Sun, 01 Sep 2019 13:58:45 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i4QNA-0006jU-St; Sun, 01 Sep 2019 13:58:30 +0000
Received: by mail-io1-xd42.google.com with SMTP id p12so24176934iog.5;
 Sun, 01 Sep 2019 06:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N/cxPVZ2/l0a8YIvCXybq//eIUrfVE+ZOnB/0gkvzVI=;
 b=OUPioWUhBIZDB2dqmcRtby+CVstmCh3T7AjdOQuU3lxM5DpyAyhQoqygbq+LjXnlVt
 pxq3M0bnuMbmiHbpQVUlcrj0J5dH3UX6ZNt3Tua6YHqpNGEr4fhskrTYQrGH2ndYrdnI
 Hu2CzCWi323aqNBO9FrIf7c1cOGMKpUC0S+hLVvSOBXYgxTUQRJ9zeM5nDJENBzPDpIy
 tk0XruVKlM4ZRg0bDdapG05nSXqUyiOVWeNuleQfF1clP7S1ZxPnAmwvAZ8uxMPhjnCY
 8KZLeotoUVi9OlY4Y+Nnvgp3t2MNYEN0AIS+0FeDDMd3ecmTuNxd9pbYMi86vgMv/AiF
 EteQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N/cxPVZ2/l0a8YIvCXybq//eIUrfVE+ZOnB/0gkvzVI=;
 b=dh7Zb/x50Js3dn5bSR9qC8z4Nw4JAeoKeI1teK+HNCaLRRSv+dDv7upwyUPHSD7gEU
 uJz6Arzk2blX+BAZzenjIzpzffhC1BW5eDL+h9EMSxi2VrBy+vlaCofNMBJ0E6lQ8AOY
 mD4YW6WO61mIyvUc2A5lvbP7stlbhPpZsoRVrQ0zymuMGag848b/INZFdyTVwly4vWgZ
 +GBRz4hZD5M5VOYl9mFDk8gHp9M0eRFBzVbCnlgFmkf0LcsbdsFXg9EquRq5ysTicNxH
 ATiXCyxz7EFJvn1Huk4N1kC7gxieOv4grfX3WkRFw2VdajMFIO5SamIWR8mmqA3GC+GY
 OKRQ==
X-Gm-Message-State: APjAAAW4R4cNaB98u/d31bI4tv91ILN1MZ0dZ5dXRr++GRGZG0P64Duc
 lWqFRNuS/LM2sEklY9yBBk8zvUjwQpYxVDplX4w=
X-Google-Smtp-Source: APXvYqx1T5rFEQe6gKYnb6Zc83oGlevxTISfBjsjjxv9Vx2xPyRReQNYrCAH8EUo+T85H50o406WImhEOyF0jyTzAGY=
X-Received: by 2002:a5d:9bd4:: with SMTP id d20mr103670ion.243.1567346308370; 
 Sun, 01 Sep 2019 06:58:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190828202723.1145-1-linux.amoon@gmail.com>
 <20190828202723.1145-4-linux.amoon@gmail.com>
 <CAFBinCB9NPtncyJCMWDbbzJnQafeaY5U3XHh=NuRZSCNDdO=Hg@mail.gmail.com>
In-Reply-To: <CAFBinCB9NPtncyJCMWDbbzJnQafeaY5U3XHh=NuRZSCNDdO=Hg@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sun, 1 Sep 2019 19:28:14 +0530
Message-ID: <CANAwSgT_K8oqwrxaQr0j_nyxZdh=Um5ivjoUDBixxWPbqJyYcA@mail.gmail.com>
Subject: Re: [PATCHv1 3/3] arm64: dts: meson: odroid-c2: Add missing regulator
 linked to HDMI supply
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190901_065828_929797_45276350 
X-CRM114-Status: GOOD (  19.62  )
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
 Linux Kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Martin,

On Sun, 1 Sep 2019 at 17:14, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Anand,
>
> On Wed, Aug 28, 2019 at 10:27 PM Anand Moon <linux.amoon@gmail.com> wrote:
> >
> > As per shematics HDMI_P5V0 is supplied by P5V0 so add missing link.
> typo: "schematics"
>
> > Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > Cc: Jerome Brunet <jbrunet@baylibre.com>
> > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> >  arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> > index a078a1ee5004..47789fd50415 100644
> > --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> > +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> > @@ -213,6 +213,8 @@
> >         status = "okay";
> >         pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
> >         pinctrl-names = "default";
> > +       /* AP2331SA-7 */
> > +       hdmi-supply = <&p5v0>;
> >  };
> my understanding based on odroid-c2_rev0.1_20150930.pdf is that:
> - there's a (fixed) hdmi_p5v0 regulator using p5v0 as input
> - the hdmi_p5v0 is the hdmi-supply
>
> it doesn't change the functionality of this patch (since both supplies
> are fixed regulators anyways)
> you are already doing a nice cleanup with this series, so it would be
> a shame to take a shortcut here
>

I could not find gpio control pin which could be used to enable
hdmi-supply node.
So that the reason for direct linking this to p5v0 node.

But looking back at the schematics it and datasheet their are two more
regulator supplies to HDMI.

HDMITX_AVDD33-1 ---- VDDIO_AO3V3
HDMITX_AVDD18-1 ---- VCC1V8

Need to check the hdmi driver if these need to enable.

Best Regards
-Anand

>
> Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
