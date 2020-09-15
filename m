Return-Path: <SRS0=PGU9=CY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C855C43461
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 19:53:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9B8F2078D
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 19:53:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OvxEQxYT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="mfMz05Wy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9B8F2078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cyWkMlEKU+C3MvElydtZ8PU+uXqA4hThLD0kgUymdGo=; b=OvxEQxYTTXv4ztAIjjN1M09eI
	Vf5h47lrxBR4Bg58bQ6N2CIHpQtrByAjbGBi2fAPmHluEoJSt0TnnYcA4nRR+YmYvTceDDItoCKnc
	ar6Ws7rFdnQXiJuE/V6qx6V9J5OuaPp/nV38dELgNUIzMhUcLHjChlo6ltQdMtg/yMw7Lm9RAo8df
	1z8/eM1G2GWxTJFQYK5LnIQYB2xSAe9bu/axMHnxMqsJ1wghGGxPAc93FhTDlbsX5EuTN1Yx7OeG+
	4mydVR9amxGTe4KgjHrp0+HLucrthLX3BoAVQO7trwvyB/OvqLbJBT+thL4Xm+fmd/29YNEev3NMW
	nro/hOLog==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIH1Q-0005Zn-RZ; Tue, 15 Sep 2020 19:53:48 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIH1P-0005ZD-4k; Tue, 15 Sep 2020 19:53:47 +0000
Received: by mail-ed1-x543.google.com with SMTP id b12so4212574edz.11;
 Tue, 15 Sep 2020 12:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h+Glag7Zdcx+JA5O5eROeVL4B8Ql3yXhj7TU2E4Q+gU=;
 b=mfMz05Wy0Rzi3mc9FRF90iBbA+HVDHL4eISMtdCcvtfUvBQM8Wh5qiWEAI/6L8k0oh
 AhFsZPp4OUXp1F8ZdKXdwcQJsuHQ1Zy8naiBndsPu70ZwZQoQpvXgSd54Eyhu79W36Ho
 Pc/au1ytVTbm4f2LpU9Td2cdox15NHuXZSR/vJwUD2y/hrA1VD5Hppc4XvPlS5chwMqD
 lznko/lVoIDy4XNuCtmT1zWCCktBAUIBTQsjy+IgPmfQBFjEksf+EX2rVk5+KvSAQyb/
 GGfRamqsqpooy6xQRI1jsubexprAnEoblMG0wLEzt/5+kbEQ+rUYebyqCA4rEZhMhpaF
 BgYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h+Glag7Zdcx+JA5O5eROeVL4B8Ql3yXhj7TU2E4Q+gU=;
 b=AxFS+fROGcUeIQYwEExJ5L1BgqZeA2zXYOFbVC6+FGQFmEb/78GS39RFuCi9zgeaSD
 4GaZ5xbFJpy0soRwB7Rfgq6fN4wIu+mZZChnTk0ZY/Uu3v/vsa6l148suiiHfsyEqSWQ
 D81F0yyzhpnyBNwqUOlBdBm++1famvlRCusdvJcd7GtVfN9zxe5CsLuTeMtuKCKwicCE
 gNBbJm42sfN992l4FMOobS9VNjVWsfPDzm6BehxNR6KFv1E1VF3zhqf9qk0X5klNEiHm
 Q1+VT7cNPdws9QF02fjzL0+xyFDIfKwXy3to30wL2Vxf6GfmjNZH8vgP6VZ/h6IfQsyi
 D3gw==
X-Gm-Message-State: AOAM531J0XadM2yzz47YP8G3lx9UigYzDlYgXbtNZq3jPLoDFbVTtZDO
 P6BLqo2Oipyb2cGq/ZCFKxJd8EiVN1RX/vhRO9s=
X-Google-Smtp-Source: ABdhPJxVXkzjJNtB0Y3kNGVBHxg1BFzbFcjYn0XJtJNYLcueZkJd0W0gKFbpcuyRnBJHwu4kAof7yiVtgnwo+VrdTVc=
X-Received: by 2002:a05:6402:489:: with SMTP id
 k9mr23671549edv.287.1600199626131; 
 Tue, 15 Sep 2020 12:53:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200909160409.8678-1-narmstrong@baylibre.com>
 <20200909160409.8678-2-narmstrong@baylibre.com>
In-Reply-To: <20200909160409.8678-2-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 15 Sep 2020 21:53:35 +0200
Message-ID: <CAFBinCAAv1fUxO+u7NRuXw8rUqa=z5GYEaPMr7CRq+dasQ6oXw@mail.gmail.com>
Subject: Re: [PATCH 1/5] phy: amlogic: phy-meson-gxl-usb2: keep ID pull-up
 even in Host mode
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_155347_246997_D83677CE 
X-CRM114-Status: GOOD (  11.45  )
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
Cc: khilman@baylibre.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, kishon@ti.com, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Sep 9, 2020 at 6:04 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> In order to keep OTG ID detection even when in Host mode, the ID line of
> the PHY (if the current phy is an OTG one) pull-up should be kept
> enable in both modes.
>
> This fixes OTG switch on GXL, GXM & AXG platforms, otherwise once switched
> to Host, the ID detection doesn't work anymore to switch back to Device.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
