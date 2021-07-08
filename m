Return-Path: <SRS0=GyIY=MA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 058EBC07E99
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Jul 2021 12:58:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCAB361481
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Jul 2021 12:58:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCAB361481
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DOEauhlQgNlHmVNDN5VNrNAaZ9vk2BZydMZApoCxHDs=; b=YzKPaCyNsL9pcS
	OEnU0YLBm51igcN/H25atwFADPIUzXOA64kOs+tvektOsvoLZfAjnUsUJhVygTKkThO/XNVXr4lx5
	V/nsB8LOwzcerrQtLS4Mrbr28+ybx6R9GJUjtcLp01h3a+0P1whK4EKMOTuZdqGLYP0iFjvZCaz60
	8292noZRSEUYsdxE1bw66xInDsSBaj/YBg0k/FAEJukEgtg4JG2JSCCtM6LRWbhf5mcdf3c38X/iH
	80o8jUc0og2S1s2M9gTHbHAQKqD9nh2JuP6LmkiUiDp/52oxMGQi7FnXP6YvRVXlg3cLvvadLlUxQ
	wfR6TJO3BfkXjq3/ORcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1TcE-00GzXA-MG; Thu, 08 Jul 2021 12:58:54 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1Tby-00GzQJ-Bv; Thu, 08 Jul 2021 12:58:39 +0000
Received: by mail-ed1-x530.google.com with SMTP id l26so36476eda.10;
 Thu, 08 Jul 2021 05:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gdvVI0RiOyCLYVSmlJqxFxM19u28EhTeBE89RX/2DLM=;
 b=mFx5RbowAec6X95nlyphkBhbf16eD7Kcn1DeyQmHkkIRv6VZwuXSujODEyNVyspCXp
 Cc0lcXGiF1Tw9Ns9K//rTOounWLVKc49Tbnuf2IU6S5VoPLisNvOzun12nVGgywgwRIo
 XaWGOEdvsZK8GoqurlDzZB4U2fZWa1ko4PJ6spWNHP8kCgthtGuIoOrP0EuMA+g1TWZP
 TaGvMP8Kq/BPXAKD4aDMGYbjpwlSTtDDd0kZhNChq0R1I2RzzxHbb4O/etgnTq5iax/E
 35Ct8Y5PPmj6JgaVOVnFIl2iW7VjaqD17zmKKpJOfXxHPSNMWD82mLetLRhU3/82SE5G
 QJvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gdvVI0RiOyCLYVSmlJqxFxM19u28EhTeBE89RX/2DLM=;
 b=ET90yJAxwI7Qu7m4c3IH5fwKQ/xm/Y7gDuNM8eWG7ecuBrG8WSP4nYv3FoEBz+ESz6
 3Ry5F9dKvbs9clUTjsJfBC/XKkVQlEm814zBfQuyrZ0XzDG5anBujiLdlkyHiXCNfskD
 TIc7WjR2BEgUVlWIkyhiYeJiDqdc6vqpoAionQAP9/GCN4bPZbq5LN94e8Zce6k6bzNU
 atycLS4dzljBEt2H3ZPh3Ca+ZBj5VT9xxBcdM9Qub+PQ8vNcD+ukZpyYKNBRTS3Ax5cX
 0hiE/EqyCDhVVtRVz82WaGBXeg9ChXdrOaS9rg8rp+YpnyyOmmMYRlmi4+MhpsDTVVGW
 hCOg==
X-Gm-Message-State: AOAM532bv1sZh+RkgaOkgQbLU0cyq15ip1qZfRVfPbOIIsDgNmEa33Kb
 nBBxxaHAzqNSHgEskdxaBJ2lKhA50ZX4tJjeMJw=
X-Google-Smtp-Source: ABdhPJzFF9sN3ruvF+DrBuhqHQ/nWFP1BnkX+uZHBBeIbQkk4JsDVH2y6aEtoXFkR+F/g+EdogO9j9Af6n7lw1NM6lM=
X-Received: by 2002:a05:6402:510d:: with SMTP id
 m13mr37757480edd.179.1625749116555; 
 Thu, 08 Jul 2021 05:58:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210705112358.3554-1-linux.amoon@gmail.com>
 <20210705112358.3554-3-linux.amoon@gmail.com>
In-Reply-To: <20210705112358.3554-3-linux.amoon@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 8 Jul 2021 14:58:25 +0200
Message-ID: <CAFBinCA5ZAPgmYEpo9WPhcAwnY-BArhWtWZRurtuDqjHPVtZMA@mail.gmail.com>
Subject: Re: [PATCHv2 2/3] ARM: dts: meson8b: mxq: Fix the pwm regulator
 supply properties
To: Anand Moon <linux.amoon@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210708_055838_464933_FF50401E 
X-CRM114-Status: UNSURE (   9.43  )
X-CRM114-Notice: Please train this message.
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

On Mon, Jul 5, 2021 at 1:25 PM Anand Moon <linux.amoon@gmail.com> wrote:
>
> After enabling CONFIG_REGULATOR_DEBUG=y we observer below debug logs.
> Changes help link VCCK and VDDEE pwm regulator to 5V regulator supply
> instead of dummy regulator.
> Add missing pwm-supply for regulator-vcck regulator node.
>
> [    7.117140] pwm-regulator regulator-vcck: Looking up pwm-supply from device tree
> [    7.117153] pwm-regulator regulator-vcck: Looking up pwm-supply property in node /regulator-vcck failed
> [    7.117184] VCCK: supplied by regulator-dummy
> [    7.117194] regulator-dummy: could not add device link regulator.8: -ENOENT
> [    7.117266] VCCK: 860 <--> 1140 mV at 986 mV, enabled
> [    7.118498] VDDEE: will resolve supply early: pwm
> [    7.118515] pwm-regulator regulator-vddee: Looking up pwm-supply from device tree
> [    7.118526] pwm-regulator regulator-vddee: Looking up pwm-supply property in node /regulator-vddee failed
> [    7.118553] VDDEE: supplied by regulator-dummy
> [    7.118563] regulator-dummy: could not add device link regulator.9: -ENOENT
>
> Fixes: dee51cd0d2e8 ("ARM: dts: meson8b: mxq: add the VDDEE regulator")
> Fixes: d94f60e3dfa0 ("ARM: dts: meson8b: mxq: improve support for the TRONFY MXQ S805")
>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
