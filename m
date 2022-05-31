Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BDEAC433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 31 May 2022 21:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kglUlZI4v8/EM5fUFY5wpYn3beX9IGgNUW0J+ZenQxg=; b=inT/iD1pov6S24
	p0dd0JxryjWFnt/LlEWz1VsE/1KLr1FyBL+uLuFH7M2MzoARrECndlWdiOQxB3lZLXvvO02AMEtYU
	OPppEJf+bt1jddv+JkFjXYBOkEdfY8s9XAyHC2XaI69s9t20Vuv1MQvvnuxIfIHw57s1XsMqmHeov
	Hkp2opOdpnYiFLYkac+N5NdVdzYjCsKt/sMhQU57hK7nguQsG3xgBOua8t7u2xc+MyVWVhtFXw96A
	jZ8ktaP19VCA6M10bu2QyYbqMjd683FUDImF37epmp0Oyu9Au6JrnhJzJERhQL5fK55o8Ao0RhM/M
	a6Z6TMNdUrG5MYWQwxTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw9RQ-00CjBd-Fg; Tue, 31 May 2022 21:30:16 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw9RE-00CjA0-Id; Tue, 31 May 2022 21:30:06 +0000
Received: by mail-ej1-x632.google.com with SMTP id y19so1058705ejq.6;
        Tue, 31 May 2022 14:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OdK+eE4TOLAxsJTNj+9orro+91ojVQC6MaYJmCCbeQE=;
        b=piTVTfroLPwR9dT+4Pxk3X3JiQOi8Rvd7xtOxQFx22lNbSupKGHOb6zriXv+TUGynk
         fX0z5+eNlfg9jIyx3P+oq8kLuA/g+0IJ41r4WwXAgBllyhENcpto9vfLhekqVuFVoe+v
         ZcNdT+zYtkLnjbb7PBkn+c211KiaN/Wl562tyGgJVXK89NJrMqZtT/Vg7QKP+pGhzcDf
         3pRWxtyXogxNnfGeWDYyCRcUtgBMfvaGiSQj+3egVqLwVmxiHNXEp4ADIAMmQCHJ7wQg
         hBFM69KE1ooA+Qqi5iIh0uEpykPCaCNtb98Ev52oHt7yi97C/zp2pHELNMgdvWzd4NXS
         ORVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OdK+eE4TOLAxsJTNj+9orro+91ojVQC6MaYJmCCbeQE=;
        b=x76P7op6n92cawo3YzOrs3hRY+ErhbFy5I+tEfMujNW+hfFFqI2xBVrDDM5U0VlWJf
         IZ7ntkbtkfd7MFP0vn1eYbpFk14NYXF3vDYxmCYSdMor9ahYUeNkSrf+o2aA1Vu1cJ1R
         i7ws51Is7DFHXw8qF+2zeEdwXZ+mjBa/l33ThmUo723JrjbxtJ8/mLSaSAsFZEU9C3p8
         oTOqf03p3WLwVMj1kqFaBLYERIwhSm9eJ/9qo3N0F/aXfoCA20L8HP9rmia7PoK+hDgB
         uFuvb1bzhavf8bZJfFBelA2RD99/FPkfeybRKswHIqSlsys0xTJnV7qHwce3jq+tkwPh
         aLOg==
X-Gm-Message-State: AOAM531xlMcMVJ8c0CS4vTljb/KzSjl6CY3TjFgcy0uWgCT8LQHQtdvl
	lYhU+kSvhwHU6WVcC0oJPXbsTbEKD6IGGpz5uCU=
X-Google-Smtp-Source: ABdhPJyOPJ2fxBW5GtBabP3sWZr13JugYTG7IRGrl+fbQSib4tmjBMNQZI9rwETvFrK9H3lHfAOxdiHHf2/cp8zGX3k=
X-Received: by 2002:a17:907:1b19:b0:6f0:1022:1430 with SMTP id
 mp25-20020a1709071b1900b006f010221430mr55649654ejc.13.1654032602340; Tue, 31
 May 2022 14:30:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220531211842.71998-1-andriy.shevchenko@linux.intel.com> <20220531211842.71998-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220531211842.71998-2-andriy.shevchenko@linux.intel.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 31 May 2022 23:29:51 +0200
Message-ID: <CAFBinCCDyX-dncLWV-CEuQ2Ksauxg-Qm=ZO4jRtMvXNbMYuBCA@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] iio: adc: meson_saradc: Use devm_clk_get_optional()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_143004_648522_5223488A 
X-CRM114-Status: UNSURE (   6.64  )
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

On Tue, May 31, 2022 at 11:18 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Replace open coded variants of devm_clk_get_optional().
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
