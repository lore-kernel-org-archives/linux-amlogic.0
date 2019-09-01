Return-Path: <SRS0=MCOz=W4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB502C3A5A4
	for <linux-amlogic@archiver.kernel.org>; Sun,  1 Sep 2019 11:45:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CD8E21897
	for <linux-amlogic@archiver.kernel.org>; Sun,  1 Sep 2019 11:45:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KCd//HJh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="vhanXbkP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CD8E21897
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iy8yxyadKnirOQ5wS6zRoLnNLT18Ai/4nSdhQ6HeD8E=; b=KCd//HJhyLG00l
	sLph7gqVmNDQfxyExkj75xm5JBxjzKIst0UH2tTYoH6lnunp9JbOR5Ral21+0JYrRfW8beRljZ3zU
	CEatbvL3Aisk1WZ7vZFHc/UD9dEOMz+v8ABkDDawik1lHtmQn+CpkownoOEUTLc0RfF6btkYRi79Z
	PaYjoaAaxBn8iUQVzhRmAcdBxC/JS8qwV0Gy32fMrYiuttQLjKAYql/NOD6t0fXuClp71S3LyDKTh
	goVsn3zDG6FF7F18njtOwJvDsOucQvu1OE9CRx1+csfpTsMgmtpc9yh9FIv9yYnAS2TXb0sORSThC
	CZ5xcUT5eimKMW/V1qEQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i4OIE-0007WG-Q3; Sun, 01 Sep 2019 11:45:14 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i4OHy-00069R-Rh; Sun, 01 Sep 2019 11:45:00 +0000
Received: by mail-ot1-x342.google.com with SMTP id c7so11175837otp.1;
 Sun, 01 Sep 2019 04:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N5SW0h/ksHed7i/eHFWIqXI6qoMGR2BQIv5D3teJr74=;
 b=vhanXbkPhCASy7yp6E70RWXSIea3XKgBgpX4J0cjIOAXFMJTvv4io0WvNACb2Q3NHI
 KqPzpdfJDGsN3hcbHseg56/IVIqd+TCUKLGLCVlBCgoaBA3+DcXamXY36nT+rtVt/7UH
 z0Sx87ePMve/U0njqJexwh8+c8PfcU7rKefFregulzCaq0LKPs65DamwrPTnAZQ0/xmK
 +cduO/uBYFyqO1xVjiFqng6rNs1rMw21ZKXzSKn2lRN3OuElmSbwlOv+bg6vTiymyDXa
 J8X6pRqog59PPe0G6EpFNcdUq0OlIcD6RqJttG9cIFjx7MaQ92QUm2Lw13rLH5OmKldY
 wSAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N5SW0h/ksHed7i/eHFWIqXI6qoMGR2BQIv5D3teJr74=;
 b=WjKTn2x62O9/9Ivnm44kyVMzGoo0mT5XD5VsYdPkzydgUYsbe3MndRSEOKBUbDtJ/r
 grNP9Rsi8vecX+AEt/Aul7+zqwEEchbweJmezAt/01nLWuo8JqFKY+XWZ+vpLhvYhtIe
 d5zvmXVh8MyS+A6TWOonKDxyaU4BxuMvWkbb1YaiwrAURfmPVJCe8o7RnXFf3oBh6sy2
 JPDuPNYevyxc+SzgtDuP6ZH2Qqk47pkF1zM7oaXcJbO5PTAmjsOtXIozHt+b5RyKi2Yw
 xey0pqNz3+yOjarjQNsWSGm9YY/skedytZuv8gVVnh2xBv9rTmgI/R1VnVhUZfXh87XX
 0xlQ==
X-Gm-Message-State: APjAAAX+A6yphX0O6JGNOWAIKmySc5Y3wpHj7kWvBEG7Q9XUtZ8Q0DPL
 ZotoIo/t5WYwMK1agya26bCLjKkYgjp+9X29EgA=
X-Google-Smtp-Source: APXvYqxLmXiuv+TRf/3RDHS6aD3eo3thHXEQG33YbJzqOL7vyoTqfUAXob2N+E96QZArxo0XcqUwg5ritXmDRv0E4k0=
X-Received: by 2002:a9d:1d5:: with SMTP id e79mr19768337ote.98.1567338295280; 
 Sun, 01 Sep 2019 04:44:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190828202723.1145-1-linux.amoon@gmail.com>
 <20190828202723.1145-4-linux.amoon@gmail.com>
In-Reply-To: <20190828202723.1145-4-linux.amoon@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 1 Sep 2019 13:44:44 +0200
Message-ID: <CAFBinCB9NPtncyJCMWDbbzJnQafeaY5U3XHh=NuRZSCNDdO=Hg@mail.gmail.com>
Subject: Re: [PATCHv1 3/3] arm64: dts: meson: odroid-c2: Add missing regulator
 linked to HDMI supply
To: Anand Moon <linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190901_044458_906310_119FEACD 
X-CRM114-Status: GOOD (  14.47  )
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Anand,

On Wed, Aug 28, 2019 at 10:27 PM Anand Moon <linux.amoon@gmail.com> wrote:
>
> As per shematics HDMI_P5V0 is supplied by P5V0 so add missing link.
typo: "schematics"

> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> index a078a1ee5004..47789fd50415 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> @@ -213,6 +213,8 @@
>         status = "okay";
>         pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
>         pinctrl-names = "default";
> +       /* AP2331SA-7 */
> +       hdmi-supply = <&p5v0>;
>  };
my understanding based on odroid-c2_rev0.1_20150930.pdf is that:
- there's a (fixed) hdmi_p5v0 regulator using p5v0 as input
- the hdmi_p5v0 is the hdmi-supply

it doesn't change the functionality of this patch (since both supplies
are fixed regulators anyways)
you are already doing a nice cleanup with this series, so it would be
a shame to take a shortcut here


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
