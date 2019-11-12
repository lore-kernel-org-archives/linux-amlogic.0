Return-Path: <SRS0=vjaz=ZE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D115C43331
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Nov 2019 20:52:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A0CA21872
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Nov 2019 20:52:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K5vfRp5x";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="gjNesBSf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A0CA21872
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=du3IrO57HtPAKxPzc//Si15s/iptEvvIjRkV+veuTu0=; b=K5vfRp5xTVj/7j
	qcOkcT5TpFoHSyqGnbhmfMxQc2VLR0woNVWKvw9WxWFbsivutGjFUcxegcF62z0E/B95IfPo5Ggxo
	slspU4kmn6GB4pOjOXU7SjLW+4qrwUyLRxWby28A+3cpkQxmdYaQFA426sMBW1ia709UsfMnM0NJ8
	QYgLo2wb/llmrmQKx4eQTeGrBX9J7cBV/BpoazGqOHfQQZUKQbaPrM6M5h4b4mwaJ+NKw+nHSFF+9
	VbqfXaH47Z/IWv9K/aU4m97C9IBnZaTjYQTSeP+3ReRhkMjET7f/uFz7F77XwJze9COtxAvRU0GfZ
	b4hURnZkX/sJCSmGrsQg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUd9h-0005YP-Ky; Tue, 12 Nov 2019 20:52:53 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUd9e-0005XY-AC; Tue, 12 Nov 2019 20:52:51 +0000
Received: by mail-oi1-x243.google.com with SMTP id i185so16146669oif.9;
 Tue, 12 Nov 2019 12:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V2BRORY0hBHLizKfzIfi2QGRpqicf8QMY3QuvWoI+ds=;
 b=gjNesBSfjAvc4kesedeMADClQCu4hYTWbOTzUGLfZvlLFHPbuM4uJjGELh0sbQgDWN
 8lrWkP3Yvl8mvcsN4mKb4KCZ3qe4W6A0A7z9ixxdQE383EV8AEXqsi6eCrI5JEytcBvH
 vHA+l6bcOI//BOa+LE7IUWgnSHG9QZwKwI/3YrPNpoUOah6UEQSffUi+8IzTzuDDYU92
 LkFRFw9yqI50wotbSj3BbpSdI2AI/irw9T4DcvU56MUdwu0JW0gIfdH+y+PHsEDXvZx9
 J0EYZEmpPKTRcSTm0s1R3uKbwhfWEINfK24+MPxL/QAyKUNs+iDoATkUt1gjVy3EDP13
 iQsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V2BRORY0hBHLizKfzIfi2QGRpqicf8QMY3QuvWoI+ds=;
 b=NdJd05StLHo5YDusqGfmHQdEeMHHKyq0gFYAfyGW6PT5YNYxpuf/gntAu8ZV12OOnp
 m321vwMtYGjxs017051yX78Da5Fti0lqu0Ia3+IBqexlJP/dzEEAUq4FfCRXehQeQbC5
 gj2e5XSujH5Tu6AM8HkCOGr87W25FcpJJYSNywzTJ+S3DwjOsjXeKsSYK35T1d5kF13F
 9mNtuYJgdsKTGn5N9ypYt26ULVoJx3aIP9jIhW+xLNeZpANtlybgf2v6MR9zlBZMlF+7
 vgz4UYBleiRGD1eI/p5mmFLFtFZSsynb/KxIvNVArjmaPdska3hlkK6nksnclv2X29TI
 yHWA==
X-Gm-Message-State: APjAAAXUL1JbFyHuj21BKNCH6myus1Y8xX2cLLvimySpqcQIXoQE+3Yg
 S7sYE7ucdgB7qpjRdj6QhdcWBwcdc0w3hI3mLjo=
X-Google-Smtp-Source: APXvYqxRmF9qWBGxWM/Cn8ef+fuoL+vr7DkcDUoMRHpMSQl4VaTZvY3t+hLVbva6IXpLe8AdpMoa1ZtmkoCdXt1j/qw=
X-Received: by 2002:a05:6808:20f:: with SMTP id
 l15mr852673oie.39.1573591968888; 
 Tue, 12 Nov 2019 12:52:48 -0800 (PST)
MIME-Version: 1.0
References: <20191027162328.1177402-1-martin.blumenstingl@googlemail.com>
 <20191027162328.1177402-3-martin.blumenstingl@googlemail.com>
 <20191108221652.32FA2206C3@mail.kernel.org>
 <1jd0dxf1uz.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jd0dxf1uz.fsf@starbuckisacylon.baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 12 Nov 2019 21:52:38 +0100
Message-ID: <CAFBinCBnUs0JdHT3TS+1++NMHtgbMvoT7RYRCnB0eNgs4L-2CA@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] clk: meson: add a driver for the Meson8/8b/8m2 DDR
 clock controller
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191112_125250_377248_478621EB 
X-CRM114-Status: GOOD (  13.34  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 khilman@baylibre.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jerome,

On Tue, Nov 12, 2019 at 6:20 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>
> >> +static const struct of_device_id meson8_ddr_clkc_match_table[] = {
> >> +       { .compatible = "amlogic,meson8-ddr-clkc" },
> >> +       { .compatible = "amlogic,meson8b-ddr-clkc" },
> >> +       { /* sentinel */ },
> >
> > Super nitpick, drop the comma above so that nothing can follow this.
>
> I don't think it is worth reposting the series Martin.
> If it is ok with you, I'll just apply it with Stephen comments
I am more than happy with this.
just to confirm, you would address all three comments from Stephen:
- including clk-provider.h
- use devm_platform_ioremap_resource
- trailing comma after the sentinel

> In the future, I would prefer if you could separate the series for clock
> (intended for Neil and myself) and the DT one (intended for Kevin)
sorry, we discussed this previously but I completely forgot about it
when I re-sent this series
I'll be more careful next time



Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
