Return-Path: <SRS0=UvWR=2F=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0E6CC43603
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Dec 2019 20:35:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96EBA24676
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Dec 2019 20:35:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HMwz1pSY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="vIlTcnG3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96EBA24676
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XAzIWI9T8Pa4X5PqgtOymP60H+kFVvJPrprX7nFBWG0=; b=HMwz1pSYcA0S9t
	Hhyksv4M0GOetrNnW8CXqN7IBFUZN048ffrARg5xBKoHQj6Zpu/d00YSojgC0C03ixbNQzMqKfCqN
	N90RZI1P0ccN5FmgWXOP77eRMatKMs4G97fIMOQoz+9i366U27ZA6g4T8nRHELXkXg3uNXQ38+HYO
	KBG8GuXJsCHo4L6JXZhd6YfQzNRnSkiauoNy2taw26sBLt54SA/2LqfLDtkTWhBSOd0Ipw29/0uqy
	7YROATfj9d3d0vl2Em8wbaKmuAfgrdQmgk68g0iJkckxAKEyp9qVNA77xmJ5JBTj04OZNNlkYEP6h
	cc1JFiGbpj3AxwxpGxgg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igabh-000837-1n; Sun, 15 Dec 2019 20:35:13 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igabe-0007d4-9i; Sun, 15 Dec 2019 20:35:11 +0000
Received: by mail-ot1-x341.google.com with SMTP id 66so6242094otd.9;
 Sun, 15 Dec 2019 12:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zbZi4+r1yCXEc/CpcpD0dVQFYFaG6+F9udODBceajHk=;
 b=vIlTcnG35CEORdkR5yB86tv9FbzKRT1W+ELh/GPd3BpXHeuW8hjKrTqgctfag462oH
 tvfUB51YRb9A/TG5liti5EZHwg/9+OS5yC8PuRGNPEeapPi4sOUp9Io45pruYZoz9Qbn
 LeXhxCVCfXq0XTtKbxZd5wmrm6WUeA2iYP2vAyTZVJg6o1uNzecFZ45dUIV+MRK5WuGn
 bFvS0kfl1TPY3ncwhZGaXWeZADtgNNKu73hiqaC10wq+vGJ+/TwEPTbPthyMPJAH9KhL
 ZZcTsK6naGV/rZFj6eZEafwoE9ShfCrsA43y71duQATJaCbLgJfoJ+Ae/E8ayuEvJC5g
 v/Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zbZi4+r1yCXEc/CpcpD0dVQFYFaG6+F9udODBceajHk=;
 b=eP+Uy4TMV8a5CJTfR46T10fF0prZ9Wc0UHp7O71R2+0k4afbbqD644JEHAQY/tuEGp
 s319C3cnm9JFC7HL8N8GP3NmvdQaD5qpzmXUTMkIR3/rkHVhs3KYN3HWWwQxdtQK4lY3
 fVh3c/Wt9pkBN7wLFeQWzhd3sSw2ZNpK2skle6S8uFKlQYFzade3A1s5GQpQbRKwHvzz
 7sDzTf1pI0Y9MeSuS/Gi9upIRVrS/QsER9V+w+k/QuKtBj4m0VKdvIfQtxRAkKgqDxKM
 OMhPVTXrhCLqgqlHuWYDyjrSOeapJFIhAfyMg/9plVP8YlNY/gIeApS+bT1cbsfJwETz
 wJ5w==
X-Gm-Message-State: APjAAAWbLbrSokKlp5XT2tXtIrZIwHsIxQ4XvwmQSYt7gCDA1yo1Nbx9
 XKgOKaZuO2ixeLZ+E1KhaSYlbWH2jNkTYbCiSLg=
X-Google-Smtp-Source: APXvYqxIwAW1/JmFMVUr2AzvIDmU4NWd/3e3k+sCn/MyW7UxkkzglVYwDhPDH6T/yFg/ReNTT/nmp+LIKw+NRnoEAGs=
X-Received: by 2002:a9d:7342:: with SMTP id l2mr28007361otk.98.1576442106640; 
 Sun, 15 Dec 2019 12:35:06 -0800 (PST)
MIME-Version: 1.0
References: <20191215114705.24401-1-repk@triplefau.lt>
In-Reply-To: <20191215114705.24401-1-repk@triplefau.lt>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Dec 2019 21:34:55 +0100
Message-ID: <CAFBinCAsoE3zFEKbS1Tag=Y_honnpfin625u=N+7QMv4cPy2Wg@mail.gmail.com>
Subject: Re: [PATCH v2] clk: meson: pll: Fix by 0 division in
 __pll_params_to_rate()
To: Remi Pommarel <repk@triplefau.lt>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191215_123510_364022_0D2E8D9B 
X-CRM114-Status: UNSURE (   7.89  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun, Dec 15, 2019 at 12:39 PM Remi Pommarel <repk@triplefau.lt> wrote:
>
> Some meson pll registers can be initialized with 0 as N value, introducing
> the following division by 0 when computing rate :
>
>   UBSAN: Undefined behaviour in drivers/clk/meson/clk-pll.c:75:9
>   division by zero
>   CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.4.0-rc3-608075-g86c9af8630e1-dirty #400
>   Call trace:
>    dump_backtrace+0x0/0x1c0
>    show_stack+0x14/0x20
>    dump_stack+0xc4/0x100
>    ubsan_epilogue+0x14/0x68
>    __ubsan_handle_divrem_overflow+0x98/0xb8
>    __pll_params_to_rate+0xdc/0x140
>    meson_clk_pll_recalc_rate+0x278/0x3a0
>    __clk_register+0x7c8/0xbb0
>    devm_clk_hw_register+0x54/0xc0
>    meson_eeclkc_probe+0xf4/0x1a0
>    platform_drv_probe+0x54/0xd8
>    really_probe+0x16c/0x438
>    driver_probe_device+0xb0/0xf0
>    device_driver_attach+0x94/0xa0
>    __driver_attach+0x70/0x108
>    bus_for_each_dev+0xd8/0x128
>    driver_attach+0x30/0x40
>    bus_add_driver+0x1b0/0x2d8
>    driver_register+0xbc/0x1d0
>    __platform_driver_register+0x78/0x88
>    axg_driver_init+0x18/0x20
>    do_one_initcall+0xc8/0x24c
>    kernel_init_freeable+0x2b0/0x344
>    kernel_init+0x10/0x128
>    ret_from_fork+0x10/0x18
>
> This checks if N is null before doing the division.
>
> Fixes: 7a29a869434e ("clk: meson: Add support for Meson clock controller")
> Signed-off-by: Remi Pommarel <repk@triplefau.lt>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

thank you for the patch Remi!


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
