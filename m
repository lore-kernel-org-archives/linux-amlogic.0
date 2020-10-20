Return-Path: <SRS0=scox=D3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36C8AC4363A
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2020 19:39:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B014B2225D
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2020 19:39:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nAe14b/j";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="gn81M0+D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B014B2225D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=omDXhcQP8szJB+9tYJS+TIODez/7XhhzR2ce+aDQq3k=; b=nAe14b/jVj386128CgUrR2T6H
	/8iflKIyf2kXjQkdgxOS2Zqpl4ZeQ2UOWrMw2z58f9fslr7erhyYoaNe8YN6iwrb++spedwos8nKB
	fJETiAXu6jkJz4zDMhmPhIRQ2oAcFES0tay+4DlUd3B4Q/cbZZKuzh4W1aCGQf2XjuT+9ic3nlz4e
	FGw0GP7vowJLBX9osvVl27BdyPxfKCny02w835J/XIP3Sf1hwS+9Bxmq3kDYwejkPPFPofcRs9bGc
	2mBta5Wv1NavdBg58LLo6OdpNFXu6WK1eNyArtlHqNzphc5i+gj3cABmlXe7DWJ9sjum1xZnCwTfH
	iXkuLEDAA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUxTd-00012z-5s; Tue, 20 Oct 2020 19:39:21 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUxTR-0000xx-Su; Tue, 20 Oct 2020 19:39:10 +0000
Received: by mail-ej1-x643.google.com with SMTP id z5so4473102ejw.7;
 Tue, 20 Oct 2020 12:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OGa0T8OkLLMmgfjB4YAzLF5Kxm/033tJDwKOPiI7Ego=;
 b=gn81M0+DMt7jNCodc+D0l8rZMWwOuAkOeZgL5AAMXnUsvFj4999pDx0QSER6EFRJfL
 UQmleD7H107xY7LciGX6OiNXJdac+BYUD2/Wl6V01q71xL7fu7v1osGOgxK2MB0yOipY
 rau9NDUvUI+UNbQiSEwA4UUygdjeK18y4G/XLLQMQERPTJZDNoNeRoTWoSfW7jb17hUt
 G7tMOrvKnqDLY2W75Qb1C9mmI9xvyyPVth6okgyZCPXfus7K4W7nnMRKQuAWKvbX9Kqt
 3AguBFnkWQqfAUPkuLHY/J60jp/LVBuVcsXxU0lWnArrHW9uxM8/H7t7BabyQ8zRGxcc
 nRbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OGa0T8OkLLMmgfjB4YAzLF5Kxm/033tJDwKOPiI7Ego=;
 b=rn1vHPYgF0Lql1htEBIuHBLF96jZfpiy6FleAQsQt1VFpzb0pHT9v9nUzeh/62s3UA
 R/FVqmGgKB+UVXP+vglpRj+2G05hx/oFrWC4z3q74a7URfKpu3FlCpLAjKqbCNPzBGHC
 V1po9TjZW1d+6L/abJIbKfORHJQieB4dR8XKhPJcspfBwfCSaFYAwKoFAZsiDwCszhyC
 p9T6Q2jXLo0oz6+WhWwaAjCVLef68Aev4cuq+X5yFf4INPEq9UrQ2Nf49Jhh5tgEp49/
 CefuT/17NF/bCLMN1OGsFEav9ervtLDkzlEm7JAxdsHUyNHu8DR7F7k2lJhLP5BSFBFj
 Zxvw==
X-Gm-Message-State: AOAM531dRr3e85k7Kstw+fLVhkj7fhdzhFe0BCE66H3rvQZ4oihddHoJ
 mOQ+/LdOXSqeN8DxHD7eWc+P8gSVQVyEoUBGUXpBueGVkh4=
X-Google-Smtp-Source: ABdhPJy+NlD78wLx9VHzH32hEHLAj60GshDRrO8+OvYaj+GURm05w76Xt9z4xnQGQySbl056x6n4imZShIST8fP9P9k=
X-Received: by 2002:a17:906:2cc5:: with SMTP id
 r5mr4891487ejr.328.1603222748692; 
 Tue, 20 Oct 2020 12:39:08 -0700 (PDT)
MIME-Version: 1.0
References: <20201020115959.2658-1-Sergey.Semin@baikalelectronics.ru>
 <20201020115959.2658-6-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20201020115959.2658-6-Sergey.Semin@baikalelectronics.ru>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 20 Oct 2020 21:38:57 +0200
Message-ID: <CAFBinCAQkia9HCGVUZ_hD7p82h40NsNoSNmH5X7ihnOf3CBMjw@mail.gmail.com>
Subject: Re: [PATCH 05/29] arm64: dts: amlogic: meson-g12: Set FL-adj property
 value
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_153910_068365_02F10BBF 
X-CRM114-Status: GOOD (  10.83  )
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
Cc: Felipe Balbi <balbi@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Oct 20, 2020 at 2:00 PM Serge Semin
<Sergey.Semin@baikalelectronics.ru> wrote:
>
> In accordance with the DWC USB3 bindings the property is supposed to have
> uint32 type. It's erroneous from the DT schema and driver points of view
> to declare it as boolean. As Neil suggested set it to 0x20 so not break
> the platform and to make the dtbs checker happy.
>
> Link: https://lore.kernel.org/linux-usb/20201010224121.12672-16-Sergey.Semin@baikalelectronics.ru/
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
