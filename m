Return-Path: <SRS0=nfxB=E4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95132C5519F
	for <linux-amlogic@archiver.kernel.org>; Sun, 22 Nov 2020 22:14:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2265A20758
	for <linux-amlogic@archiver.kernel.org>; Sun, 22 Nov 2020 22:14:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sB4f6q66";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="us2dV3Rb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2265A20758
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BId4Ka8lZPQ3Vv+yUu3PiYUcPCKL9nXZjimBMG4wRKE=; b=sB4f6q66YKgUZqJhFH1SdKssD
	1+HEF+//2xGDrBsworf8ZTvnW/vajuXO+3g/qovc+usuL2X/122yWTajI38+u6eK/1u5mN6qcbooD
	TKeM3e7GMOYkXT+cKyjKr+/axXJqct6fLGnu5CuFOrpJ48yfJMXTr4buW4YuqCwowkWP1EwevyuWL
	V6YOWfUaoo8lkRGbhKRRcBVY3N+DZjOr89Qn+K4wd6laVpSdHgVffz6Sx9sW01+WWOCXrI5HyEEr2
	FIP4wx6xiSIdRK3b69lT+cgbFkDCzQafS2R3M7DjrJ2kVY5ZmFcCzQqJHVowackfXnNMepfrv9x9c
	TGHrKQ5Nw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgxdE-0000lA-Ee; Sun, 22 Nov 2020 22:14:52 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgxdB-0000kl-RJ; Sun, 22 Nov 2020 22:14:50 +0000
Received: by mail-ej1-x642.google.com with SMTP id z5so559351ejp.4;
 Sun, 22 Nov 2020 14:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+yX6CsGNQbM1v0n4fLwCiOP2202vjWiqw6FCv8piRAk=;
 b=us2dV3RbpS8hX8nmkSvdMorGnrP+/N3Ck1+adQU4aYNz/p0jUTdvXE6XBeFrQAwnKR
 Ybz2HH4YNX4H3EyCXa8NZ+eeXQYytema0UZE3u7F51tPJrpqoleuu3rOITHYdfFJ/tXK
 K7zM6s0YfUWlixl/yQwv8k/YxqMrIBUNTezRfjTUFtQpwAnTCaOC1xON3FThtGQjr7mf
 IfiOmYBpxDQnGQickaPOIPk/kfqWQWbpCB0NMO+MJ7o/NlKH/j9ftGQF4+YC3QkX6Ko6
 iOVEvUZE0PlfdV+e2C3BxVJFjeaWgxe8E8csoPfY2ijVacFZQo+aeuoSbX4zlI3U5K8e
 yAbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+yX6CsGNQbM1v0n4fLwCiOP2202vjWiqw6FCv8piRAk=;
 b=BbUFW5CGXwfxvrGcbqQij0GihDjHMoMZ8TxOi/aL1L3lpRlNNV0xtEARhRyQZKGhAQ
 A2hz8lO7yHQ1P1I7hId+16goQWuMt38bJQqbH82Dakz1nXcbibB3WTH2FRXpKvCgdlrJ
 MvSeSdDi7s/H8i5vTB7+JPrib2vqRQ33n186E0DaO/sN8oI4iM53fQ+t7JxafvNCPv5z
 nTgidy7BAt3tipPXQFnFEX4NfXGjN/jzQvnx7z2cGqmgR0Her4S3RM22XLqBWdkB/+ey
 I0dpZuVsbEWqKcbk1QEkaAZVMLJ9Wnqh8Qk4Ii3Y9mG+D7VdX0PLFr29IFN3UpgjekES
 Ca3g==
X-Gm-Message-State: AOAM530uAeBlK2ihYhFLBizp4QOfSLq8XiYn3VV2/6/9PAeuDse13/aZ
 XWXZFu3QC1lcd9jJ/dc+qeJikTeej28TZW77r+g=
X-Google-Smtp-Source: ABdhPJy91vmF6noNwrJeQlCEo3WVCRUF5EO22hfLsdERxI3CU1eXejb5kUzUiZ2iWvUkvhEnOsbcIP9ZIR//7CGL144=
X-Received: by 2002:a17:906:bce6:: with SMTP id
 op6mr41182955ejb.2.1606083288744; 
 Sun, 22 Nov 2020 14:14:48 -0800 (PST)
MIME-Version: 1.0
References: <20201120153229.3920123-1-narmstrong@baylibre.com>
 <20201120153229.3920123-4-narmstrong@baylibre.com>
In-Reply-To: <20201120153229.3920123-4-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 22 Nov 2020 23:14:37 +0100
Message-ID: <CAFBinCDLF2bL6sQFBsNTNZV5i9u+KW01O3SqbR=riRru5d8zRQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: meson-axg: add PCIe nodes
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201122_171449_982328_6DF67B98 
X-CRM114-Status: UNSURE (   7.99  )
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
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

(I have to admit that for me the PCI(e) bindings are very complex, so
I may be mixing up things. I am still sending this review mail because
"you're doing it different than in meson-g12-common.dtsi")

On Fri, Nov 20, 2020 at 4:33 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
[...]
> +               pcieA: pcie@f9800000 {
> +                       compatible = "amlogic,axg-pcie", "snps,dw-pcie";
> +                       reg = <0x0 0xf9800000 0x0 0x400000>,
> +                             <0x0 0xff646000 0x0 0x2000>,
> +                             <0x0 0xf9f00000 0x0 0x100000>;
> +                       reg-names = "elbi", "cfg", "config";
> +                       interrupts = <GIC_SPI 177 IRQ_TYPE_EDGE_RISING>;
> +                       #interrupt-cells = <1>;
> +                       interrupt-map-mask = <0 0 0 0>;
> +                       interrupt-map = <0 0 0 0 &gic GIC_SPI 179 IRQ_TYPE_EDGE_RISING>;
> +                       bus-range = <0x0 0xff>;
> +                       #address-cells = <3>;
> +                       #size-cells = <2>;
> +                       device_type = "pci";
> +                       ranges = <0x82000000 0 0xf9c00000 0x0 0xf9c00000 0 0x00300000>;
only PCI IO space here, no PCI MEM space?

[...]
> +               pcieB: pcie@fa000000 {
> +                       compatible = "amlogic,axg-pcie", "snps,dw-pcie";
> +                       reg = <0x0 0xfa000000 0x0 0x400000>,
> +                             <0x0 0xff648000 0x0 0x2000>,
> +                             <0x0 0xfa400000 0x0 0x100000>;
> +                       reg-names = "elbi", "cfg", "config";
> +                       interrupts = <GIC_SPI 167 IRQ_TYPE_EDGE_RISING>;
> +                       #interrupt-cells = <1>;
> +                       interrupt-map-mask = <0 0 0 0>;
> +                       interrupt-map = <0 0 0 0 &gic GIC_SPI 169 IRQ_TYPE_EDGE_RISING>;
> +                       bus-range = <0x0 0xff>;
> +                       #address-cells = <3>;
> +                       #size-cells = <2>;
> +                       device_type = "pci";
> +                       ranges = <0x82000000 0 0xfa500000 0x0 0xfa500000 0 0x00300000>;
same as above: only PCI IO space here, no PCI MEM space?


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
