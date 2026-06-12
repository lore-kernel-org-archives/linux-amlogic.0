Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83765CD8CA8
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Jun 2026 14:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IHGO9yLm8gtsVTI0lWpAAxc3zbfy0pepGb9005FV6t0=; b=F7SuzJjgalk+HM
	pY6/IpbAEwoO6dkITOtQE3u3l0RxS57eM3auYxiv6nUZi+j8nJHPljWGJOz97w8SMJf1OcJhGenZJ
	GuVBpqyw/NSRPeGBsVJR9JWQ+lRKQxHhlbCNOVZWRbOtUcFIA3zDSWM6t68+b7EUMbcYmtNhTgJC7
	W0BZ8gt0XUAgMkEzc5N6Zz+fg3Y/PaZDX3jxlVsWHQZxn8bfh2u0ssM5dRqPipP/sJI4U9/TQl85g
	Y3NgcQ7hCLXdg56GgYKhAaDFGuHG2c+8rdJGvzozInm6QDQ7wsDp0r9nA6m0wIYO4TbIqVDjFwFNq
	t8g1KrwcuZcoQyNUVW5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY33Y-0000000B5ax-3yad;
	Fri, 12 Jun 2026 14:40:24 +0000
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY33V-0000000B5Zu-48Jp
	for linux-amlogic@lists.infradead.org;
	Fri, 12 Jun 2026 14:40:23 +0000
Received: by mail-ua1-x935.google.com with SMTP id a1e0cc1a2514c-9667fe10d29so75115241.0
        for <linux-amlogic@lists.infradead.org>; Fri, 12 Jun 2026 07:40:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781275220; cv=none;
        d=google.com; s=arc-20240605;
        b=dXOsZKs5gPrxwjVs90vbcSBrQqh7r9x6ShkjbBLUsjMzcnh/8HJ0le5jlet6FAUmQV
         gNCoTdUeg/Lj4krp4Ag5IFisgUui/IlEps35UflcBip8WghP+Nst0xl3vJ0SKobgzBWd
         uQjNl7nJRLi/d2y7ZSHIB1SjllBMOEbM41OzLDJICNDaAE5lQBvyGMeke/fzJwybuqDC
         7pIHTARDcmDVQwYKhCCFT1xQGD39hMuVqK5BDMo9iQOcR7YnZFPPp5DIHz8Typyo95Vq
         mrWK6gBidogpC0EYop5cY+6EVVkow1Ype5W833F4wyfRzNzeVZY0nLcj7We6mJo9pyO+
         1Stw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jws4kc/6HCJln3nPYNLHurE61VFKguu58eheUohgKlM=;
        fh=tqCqOx0sPaA8uSPGY9TdVWKPaHDiuHLYKb/mok0jlLc=;
        b=S8ffefrlpXFhDHXfDiSGbv+yZOXwG60pbzoKX6ftZZ2wO5K5SrgS1+RACicJ+C8qVX
         S94R/ZjZyDg/L9/jfHg+Spa6HYieG6DImwpC+Epwol+E8NRfZahaVjUQq8tfZ94/6Gb1
         KERsW7CerjKJRE1CWFUx7P2ClMipewWvN+rjETTkipVLNRPW5VsKQTgDoLy2iaRiEOk1
         yn3pho0C1T6wEiGxR8660HRanuPYcL5zDlmWbZZieTJXysyhgGc+nOuKPV7CjdoCGaD9
         n6DMofobVcSDe8BTZF7k15H0HYBVkKlfwRYi6+fHUCRutLzwDzjV2fPo5P6e4jkxljwF
         JEUg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781275220; x=1781880020; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jws4kc/6HCJln3nPYNLHurE61VFKguu58eheUohgKlM=;
        b=rk2pVvXxOUIUcPsW89xgvnt+F7/UnmjRgdNLEsbZezns4/5B96mbo97VGZMJT9z/B1
         67Z1IhQI513uWO5iq0tRCJh8ez6j7ioGlob66DGbPVVspLivhUVQylUV8XXvBcW94IfD
         NsznLuIx5htwmvKQ8I4CWIJUVOoHxx7Bbdy+jFO95j1e/MDJqkyF7xk9PgG33MdsYNEc
         Pb1ep3M+YYxb9MfYM+cCJjQKTdO2TshgUNduug00SIMYt2eZWqeHEdDui3uZg13V1A3l
         gOerkLFpCa21XlrB5yWUFPN69I6nTXsoNLjlCWMpzlAofEuiiW02XxoP/hCqm32bb4sd
         V6lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781275220; x=1781880020;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jws4kc/6HCJln3nPYNLHurE61VFKguu58eheUohgKlM=;
        b=eW8IrUevhhwoZf66PmSpGe9SkvPoeQQfHZvI8Ttm8+shniayFDurUJ7bqQEDPQuGPm
         MT7TiE6LOlZUmKTb/AkWEhuhFE/bGREbQ3CuukyGRiXMS8Yn5HuNx71Oe7LFnKhgxJnS
         XU6W/Qo0hXtN+tEle7gNzzIIz9eNkMtKd7DvHoTJi59EmiG9xE0fvMMYiTAHpF99CFgy
         BEuD+QzcKAwYrqoUwvACKDANlr3SmMqOFjKT6FXXTPu/tGtDCNALnPYyBqpPSzHeIDOx
         uWZltvXq1icTphfTO/Ia/vXDS5vYrQ2lFf1TzYflGnHDR3FeKBrTXP/13zUkcA7LXMg0
         dE2Q==
X-Forwarded-Encrypted: i=1; AFNElJ/x0N+vHUsX22sib9jabQIF/Er5HeVfPgBJboACGsRwygVf/8iFpL1fsE4PGb5Wfsy9Zsk0Swea614adYr/@lists.infradead.org
X-Gm-Message-State: AOJu0YwjD/3QyAQJjFS7ZD3fWP6zA74eLhjbzTdlABAUHrTf2XKrI4uA
	KM2ZWH+nAJ5ZbHvc5P8fTuI8oIHIqA/bQcU2sqvJbhwsLcFrdNsw4TBbsTDqHiqNq9j0sLmynPT
	wv6LrQzJ6P3gH75TS3vHWB93gbjA6SLI=
X-Gm-Gg: Acq92OEDZM0YBPyt4n60HDGw4RCNEGH5Cau3LlRSpEVsC95xvIclh4Xd6NUSEE3sv39
	re/XamNkw4Dcfldb5NGWwTiYYKUvC/QgyJt/bsodFuy10B59Rv53jjrPTJTiZnEjR7GyH6VLbaE
	NHKCmvqDZMD6A6zP+nJchCbCRPjo/EEOphnC/1oscMV4u/9ZSsTkfaOKIEWEzJAULSRSp5mP120
	7gcKOFv8J4huJR+cFWOgNhE+diFUS2ix0W2a9NEcmQuR5gx1wRbLcNUF6h1wBqpGpPEkosxrDe8
	q8elmXnw84bCNFULq5saTBZGwS6oHTVTop81VIg=
X-Received: by 2002:a05:6102:3e8a:b0:633:f2bf:7de4 with SMTP id
 ada2fe7eead31-71e88b250c7mr1959385137.10.1781275220197; Fri, 12 Jun 2026
 07:40:20 -0700 (PDT)
MIME-Version: 1.0
References: <1a0c86ab264cdc1c79c917e984b90991af51d827.1779123847.git.shuvampandey1@gmail.com>
 <20260611222653.GA527114@bhelgaas>
In-Reply-To: <20260611222653.GA527114@bhelgaas>
From: Shuvam Pandey <shuvampandey1@gmail.com>
Date: Fri, 12 Jun 2026 20:24:56 +0545
X-Gm-Features: AVVi8CdKAP86TtMoO599NkYV98Yvwx6Qva5SIn9Z5VQSeP_4V_va59YftVroKA4
Message-ID: <CANAAWH+qT8T4_OBwu0WxU6o0FTT7xqwpLTOFrWiV1dZbXHk+fw@mail.gmail.com>
Subject: Re: [PATCH 2/2] PCI: meson: Add missing remove callback
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Yue Wang <yue.wang@amlogic.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Fan Ni <fan.ni@samsung.com>, 
	Shradha Todi <shradha.t@samsung.com>, Hanjie Lin <hanjie.lin@amlogic.com>, 
	linux-pci@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_074022_030101_4A90900D 
X-CRM114-Status: GOOD (  10.33  )
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

Hi Bjorn,

> What's the user-visible effect of this?  Does it avoid an oops?
> Reduce power usage?

I don't have hardware with this controller, so I have not observed an
oops from this.

The concrete effect is that driver unbind/module unload gets the
matching teardown for the successful probe path: the DesignWare host
bridge is unregistered with dw_pcie_host_deinit(), and the PHY is
powered off with meson_pcie_power_off() before devres releases the
driver's resources.

So yes, it should reduce power usage after unbind. The host bridge
teardown is also the matching cleanup for dw_pcie_host_init(), but I
don't have hardware evidence of an oops on unbind.

> Of the 34 instances of .probe() in drivers/pci/controller/dwc/, on 12
> implement .remove(), so if this fixes a problem, I'm wondering whether
> other drivers have the same problem.

Yes, that may deserve a broader driver-by-driver audit. I only checked
Meson for this patch. Some DWC drivers implement .remove(), and several
others set .suppress_bind_attrs, which affects the manual sysfs
bind/unbind path. Before this patch, the Meson driver had neither, while
meson_pcie_probe() calls meson_pcie_power_on() and registers the host
bridge with dw_pcie_host_init().

Thanks,
Shuvam

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
