Return-Path: <SRS0=bSlY=PZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 145E4C43387
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 20:04:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D649320851
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 20:04:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="byD5DvBA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="ADkg4fEN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D649320851
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NY/ykRQju6+7hC/BPe09bk0A43aBJA4ZmydQubXpykQ=; b=byD5DvBAG4PWi1
	PTyiABYmpK8/Mcq2+e7Zxmay6Wztn+xmjX8QZs/fW3Z57jV/Xb19Tt7lA3eTBg4A840mDrTZ2Ub+N
	+pba530ar2R8lGL0LgqqPOt2Mpvh+pWctdBQm8fsrV9iAKYR2pef8LAPpGca1vtY+iXBEw0KaYmHP
	N+et+z9k0DVAFv1UNTDVewiwdThDbfXxw0bbRc5VXmNRX1dXYyADwKVsDGQVkXT8HfF0/+wgBJ3LP
	bjBlLTqT00VG4XVBcBCBxVOLKzWH5aKZu3bhMMRiEHFTxpImiZR2YWQq5oLDH8bDeQYXgqAKevaGN
	LcreombplZuAN7jIJb4g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkDtU-0005ol-UG; Thu, 17 Jan 2019 20:04:04 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkDtQ-0005m1-RK
 for linux-amlogic@lists.infradead.org; Thu, 17 Jan 2019 20:04:03 +0000
Received: by mail-ot1-x344.google.com with SMTP id i20so12337732otl.0
 for <linux-amlogic@lists.infradead.org>; Thu, 17 Jan 2019 12:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aOQcJ8A/Hy4SFduSRsbtupfkyGSIJzFNagfozlCbUug=;
 b=ADkg4fEN5BbybunEH8TAKxkFPE9qylv300UVJAHLNOUSMdCafMpKpCfjhMnJCLkEuk
 xj/fAoCQnW4Uxj16dEgAhuKeZ2tnjtcmHk6fvbN0u258Cb4AojIVUgkl2oSsqAgQ3BsQ
 Z5WwHwpmOoDvawLfAq6UP0JRCfOlqk8a3P+8QHInDvG1cveuDRkMwxkw20yS1LF7Qk9Q
 gdR+cKaMS6w90oh/tjyq9bOu4IqIr4Hfb5wwWckt9P31ysMoG2KCDvUnaGiOu3mIcw8o
 oxNMo8B0b9HqaKTOTXb2zf3aq1w8trz9XJKQeGPhh31njcVp9HRAJtM5hGVMk1jj7E3H
 vWZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aOQcJ8A/Hy4SFduSRsbtupfkyGSIJzFNagfozlCbUug=;
 b=aYt6YJekKDx8mwFms0tsdv/+slMwq5ANiJeWe5pdeCoADgiHwUwhqCYzQQC+OPFPrc
 jRwtA6q0Nuk7BmFzCliwyc1MDqim8GJ+gGIJgukOupG1t48bfoTXMyzJkPaVt4sf3UqF
 /RD+Hp4U/2K0kHEUOYiq56VQssDY9E8y6Y+ygayB7xLyRMhX5ZTUrhRCR40LnMqvZCS9
 JEJNzg2GdagoTI4IBi6jZPNokMrBHnbFBptn3no/fDc57XkKGj+qbPXqL7ivD64HfO/6
 s3iwX+46v5z+H2/boAVDL+oRQ5ngTL8DAokiIJb6nrpo36SOVh4pxXcjwm52HTb6wr3J
 94Vg==
X-Gm-Message-State: AJcUukcCD3em29oLnyLejXAbPCTyQz/P5xMkAGGraIFEVzab7KVO5D5f
 Vp1NBUmeVXEDmbWb5aTLPSexj1Cor5PrzzOsTtk=
X-Google-Smtp-Source: ALg8bN6ghFmN/VZR0Bg50QnZMHKftYcuMKJ0j+U4CijxSRFCMa8133BL6vScOSJpQDQXLIne1KpJIwGnOIJsP3IspYU=
X-Received: by 2002:a9d:491e:: with SMTP id e30mr10121142otf.131.1547755439747; 
 Thu, 17 Jan 2019 12:03:59 -0800 (PST)
MIME-Version: 1.0
References: <20190116165236.8330-1-jbrunet@baylibre.com>
In-Reply-To: <20190116165236.8330-1-jbrunet@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 17 Jan 2019 21:03:48 +0100
Message-ID: <CAFBinCBFge2tir-MXw+ojTxzW+7n9Uf4FzCahrw0MDzAYV2SSg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: meson: fix g12a buses
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_120401_330154_8E10EA9E 
X-CRM114-Status: UNSURE (   7.51  )
X-CRM114-Notice: Please train this message.
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
Cc: Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jerome,

On Wed, Jan 16, 2019 at 5:52 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
[...]
> -               aobus: bus@ff800000 {
> -                       compatible = "simple-bus";
> -                       reg = <0x0 0xff800000 0x0 0x100000>;
are you sure about removing aobus?
in your patch "arm64: dts: meson: g12a: add pinctrl support
controllers" from [0] you're adding back an "rti" bus at the same
memory address, except that it's size is 0x1000 instead of 0x100000

I don't have any G12A datasheet so it's hard for me to ACK / NACK this
patch, here are some clues why I'm asking:
- GXM's public datasheet lists the "RTI" region at 0xC8100000 -
0xC81FFFFF, we call it "aobus" in our .dtsi
- buildroot_openlinux_kernel_4.9_fbdev_20180706/kernel/aml-4.9/arch/arm64/boot/dts/amlogic/mesong12a.dtsi
also uses an aobus node as well as an io_aobus_base sub-node for the
codec_io node (the latter is obviously not upstream)


Regards
Martin


[0] https://lore.kernel.org/patchwork/patch/1032981/

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
