Return-Path: <SRS0=bSlY=PZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CCDCC43387
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 19:58:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C44C20851
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 19:58:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O69wvgEE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="IQ6eanC6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C44C20851
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i32FHbKbiZ7jKhSMLeZypQMH2/BYyWqb4mzZ+hUaHUk=; b=O69wvgEEqbRofy
	WGB4G4AlghyHwGSZ0KhAXb5LDs6NYGZjsSz9ZFBk0ZJFZegDCBXhis2YflvWPfKAN2x2Vni3mm1J/
	lfxGv1+TzAryLjMG43sZzoCTijwbPjPzXc7htkBJAmjZBwg9OTLnahpYCv2WPAe8r9zj9JDHxg2f+
	SLRXOX6Vxt/gmWDpg4jA7n2vgALPS2Cu1hhxxr1EO+XiWU+WyEhF2ChET5iec1cX9CHatGE8eG7FT
	NJEYZIJwASBSBObdJLE9t+sS/XscMOfBzpRJvbKKrXv7l3j2anevQy2jxNF4hNlFtuHZXZqHJN6s7
	Bl+EwEmS9+kDoK5Im5FQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkDnl-0003b0-6A; Thu, 17 Jan 2019 19:58:09 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkDnh-0003aF-U2
 for linux-amlogic@lists.infradead.org; Thu, 17 Jan 2019 19:58:07 +0000
Received: by mail-oi1-x241.google.com with SMTP id c206so7202594oib.0
 for <linux-amlogic@lists.infradead.org>; Thu, 17 Jan 2019 11:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8kbKi4J7Pv9IIt9CBOSUEb0XV0HiJDsajvAfbgVCqRQ=;
 b=IQ6eanC66pjhHSw+qR+yqc8Nk/r2rfYuT5E5WofHBRVio+rAaN2KP773yKs73Lgdbq
 WVgMRaaaK/hImynyFTLOwDHjBf6U2STzNY+wqJNkX6pYx5PTQS4ICiE3mo/Uxv5+pduL
 mwEYFfWr6LpfC2fQka7DD8z9sjg/gjMLhORzSs9n1guMJOZr4h3UP9ZIujCR5BMxSEb2
 srzLY8jDqxu3Mmsksj4p/O3pOQ/8vMJ2srtzF06Wz3CKWgGqMHjv307I3uLYh+/c6b0a
 ZLG9hN7NUjWF0eePaxZHFIRylbeNe+TwgOaKvAQEngA0nGU4YY4o/Z7dHhdNSSUU0cFe
 KdyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8kbKi4J7Pv9IIt9CBOSUEb0XV0HiJDsajvAfbgVCqRQ=;
 b=HIp04pmaDLtiVDaRoPiGHz1GWfrS93xkErluT0M+UIRNnbmQ5OoddZlEW/XTJa4U9g
 DSvom6+Ai5JlE4VH0hW7N+/0FEd/g/KZb/5wRF0hpWyC0t2uN3+PwAGLge4c+Jwu+UMJ
 aV27zhVXG7TPEqVAJAXmWolTZAyuQqs2gRMvn+Hc2S3SCONzLoHDY3OU3i62H/DUwiQ0
 ouU5l3rAUclr8HraQBy/vrZE0EImefsxR0bs/B1THMHmOhWBL/g9l5iiwgiwPtUDWXQu
 DLJur49fBBWWgW4ntwd9+QPjVakvyJ1VoeROmUIUappnVIMePoDpxPFfbeecx98I0AbD
 1A5A==
X-Gm-Message-State: AJcUukd6IORNRSkVg5ITxcrdrXuK0foetHZbt18+tJP0z2VZBUrXAlh/
 8VKzCqZOT4g2gq8aN8m47hDzPj5twNuCPg3wle8=
X-Google-Smtp-Source: ALg8bN413LM7538gOPe2Ql03TGdmQlTBK38KWqOcQbIjKIoU7v96tHWL9yDClCeloo6ATYzVpP9d2gCa/3DCrg2p88w=
X-Received: by 2002:aca:5b43:: with SMTP id p64mr4276274oib.41.1547755082532; 
 Thu, 17 Jan 2019 11:58:02 -0800 (PST)
MIME-Version: 1.0
References: <20190117164838.8008-1-jbrunet@baylibre.com>
 <20190117164838.8008-4-jbrunet@baylibre.com>
In-Reply-To: <20190117164838.8008-4-jbrunet@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 17 Jan 2019 20:57:50 +0100
Message-ID: <CAFBinCChyyWaiju6ghaCHBFktTXV6DbtuCgZFjEENrf3t3eOxg@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: meson: axg: add clk measure support
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_115805_969594_7527782C 
X-CRM114-Status: GOOD (  10.77  )
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
 patchwork-bot+notify@kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jerome,

On Thu, Jan 17, 2019 at 5:48 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> Add the clock measure device to the axg SoC family
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> index 0e0abb1a03e2..94ea36a2417a 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> @@ -1611,6 +1611,11 @@
>                                 status = "disabled";
>                         };
>
> +                       clk_msr: clock-sensor@18000 {
in the dt-bindings specify "clock-measure@..."
this also applies to patch 4/4 from this series


[0] https://elixir.bootlin.com/linux/v5.0-rc1/source/Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
