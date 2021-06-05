Return-Path: <SRS0=xxsk=K7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43455C47082
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Jun 2021 09:57:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CD3B61244
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Jun 2021 09:57:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CD3B61244
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8kjvGbm94uKBYiT9LYI+YAIuHkrSHNqjwIZ7wm2MYh8=; b=QYVMpdVCzCP45n
	bFD6OEHqcXwLwTXyAk4uVlqVSYe8/3EGV4AAlR3fddr2bzBU2+vzeROApeLiZa+WNwVKzZR4FqXcz
	1/ILd/jIny1fo6uWIMTKxlz3jFMtcFwBp2IgsD0gQz5M089sBs4Fb23+iFgjOCbHHT2larhsZzTH7
	P6JHAOOTPSwPefexvMkRJW2pfbOa5ps3NKXpQmq2ntUYwsQjJ20f541YtNQ5EFsdPW41gyD3FZaJl
	03nrp60cdSaElA/hPhJUp6qIMJP0eK/1WzRJwaZfAO50W5zT8gUX0eqw9no9O0oF+a7khdMY82yPy
	GBmg/7dBYQwjrI/0kHmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpT34-00GPmw-3E; Sat, 05 Jun 2021 09:56:58 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpT2b-00GPeU-TJ; Sat, 05 Jun 2021 09:56:33 +0000
Received: by mail-ed1-x52f.google.com with SMTP id d13so446084edt.5;
 Sat, 05 Jun 2021 02:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yR3o22V6B0YXuWlVxnHv20sYJqOuoilM3F9ooehFaN8=;
 b=EYM0+9+EVxjeZI77wQ3QZeqEL3vpuxoA7Kmxpdduc8F15lOc2egU5DruViDoQhX9Q0
 Msx8YfbAJbyN8Wr+XFF17O7NI1VGHVmJNaEDTlqkNimbvNUeN3arSXR/ScDGd0Fdcj6E
 LydkZyD4e57n5PVw47rQiEYl6rvmkVZg6q6lZx4r9gSZG3HZA1A/IqQk3xhwbrAdlLHf
 28UdImJw9FU8OLXvROGH9X6PEY/n/W8Fu2kPSb/zzJ1phR0CRKSSIKhTn+uMXsvAy9Jm
 wfDztuXz5fFTCFVnr4VinUBiV3kXw4gI7bm3aUnVquCeznzBVR9JDqOvDVfapV0DjyrW
 138A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yR3o22V6B0YXuWlVxnHv20sYJqOuoilM3F9ooehFaN8=;
 b=GrC6qqe5d37AydkKW2PNEte5WHfbeOsScmCqJkGZLosMWBEfM/IBR38yShPRw1PHoJ
 ZV/DKHAfnAwHqhpfNLJ155XeWr3mV/A4y9DtJXEWNmfSqDoCyM4xko7up3OtN3mUCLK5
 hz2Q6T386cTkYqf3tPfBvU7jQ1meGbr200Cgycx4eW799UTn/hq8f7Y1DxtObgF+V8P8
 /kILRx3IVkHM8BQRv6W2V1nxx2NiKLi2Q+DgcSl24sVtxfHymeSjPqQQJHvsFvF1Uqmv
 ZRmzdeimIRSgHywiJ5fT45X9iuHNxAQuwrUWIQd0sfJJNJJO8wTO4e7zCZGgHe3gTnEp
 gSkw==
X-Gm-Message-State: AOAM532J5YucOgKJaZQXKz7efN5mZ70K6YsiVbji+fbCjJkjD0lOx9RJ
 45DOJUkL/gDAe2C/QvSe2vDFlhY6zpgXt0TQkOI=
X-Google-Smtp-Source: ABdhPJzEOzc3gAXmpYvwyNJL0PnwFKClIXK7fupCEPfpbH3SEgvLCg0oYWO6q/WonnS3sKiStvCiL7rWuQRaJeiAsfM=
X-Received: by 2002:aa7:dd14:: with SMTP id i20mr9658485edv.110.1622886988140; 
 Sat, 05 Jun 2021 02:56:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210605062313.418343-1-xieqinick@gmail.com>
 <20210605062313.418343-5-xieqinick@gmail.com>
In-Reply-To: <20210605062313.418343-5-xieqinick@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 5 Jun 2021 11:56:17 +0200
Message-ID: <CAFBinCC=3=tQJo9jSLo-edjgZ5tuNEkjXA=xpiZXi6eXi4YfZA@mail.gmail.com>
Subject: Re: [PATCH 4/6] arm64: dts: meson: vim3: add i2c aliases
To: xieqinick@gmail.com
Cc: robh+dt@kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 khilman@baylibre.com, jbrunet@baylibre.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, nick@khadas.com, artem@khadas.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210605_025630_003516_AD75763B 
X-CRM114-Status: UNSURE (   8.39  )
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

Hi Nick,

thank you for this patch!

On Sat, Jun 5, 2021 at 8:24 AM <xieqinick@gmail.com> wrote:
>
> From: Nick Xie <nick@khadas.com>
>
> Add i2c aliases for Khadas VIM3/3L.
commit ab547c4fb39fe1 ("arm64: dts: amlogic: Assign a fixed index to
mmc devices") added the aliases for the MMC controllers to the
soc.dtsi
I would like to hear your opinion as well as the opinions from other
Amlogic reviewers whether the same makes sense for the I2C controllers
as well


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
