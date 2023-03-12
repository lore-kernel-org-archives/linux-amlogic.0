Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F20B4C6FD19
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 Mar 2023 20:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w3H0pKAmr5ogwqCPY+2MQRTRjM7+w0cqg1cOkbqbjrQ=; b=q/iGmgIgQOnfM2
	CP//72OvxEFtCCntnhyqbKg4TPzXhjuNc0UNgK/bdKqMWtO72qizdt95piKjjMIFNRa7ercbfdy+1
	QLX+mHj5Cdyhjn8ucpQk+MDdw6yPhBvBZ9eE6J+2aeGnPHOBxa1d0oVzFsLeXsaC8ac8IAnwG0PkR
	u9fTG9h7PH130k4yrlRASzRRR5hqWxK5DwijSrMLfYMzGyGqHR5I1w5NPx0R64656r7OLB4HK/18q
	Gz+g0vHXWjqdljG4xju8IsPEgDzvIqI90ydXACjRK8nnWqNtMUUT63ThYXHWoQM9tIhRov4oBQBK2
	ej/gt7IuvYMJt/odhf8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbSBc-003TD4-IE; Sun, 12 Mar 2023 20:20:56 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbSBP-003TAn-40; Sun, 12 Mar 2023 20:20:44 +0000
Received: by mail-ed1-x532.google.com with SMTP id x3so40786214edb.10;
        Sun, 12 Mar 2023 13:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1678652440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SBD3saFngHmWAL0vT++GS+KZHgFK9mytKPRQSV1qkzw=;
        b=YFztskzuLekY301pyRV5OCxUgSY9aVg3Ag978+tSo+Si2HzSNw3F3K6ldw0lOULzwq
         GI/9M4GMj3/ZlNp1/CWCZ8TI9N6jqhv8Himk/C2YQCDwEExES3B8YUQzSKLIjmX4MRpJ
         eAhp/HYG1V1ou1Gg7ZVWN/0ovHkKdHUKr91udmQyglLo92m45M0paotWT41m9pkrX+FR
         CMJvXFdunDG9ZgnsZCDKYxYHr4ndhNMutDpYY8NXv9x4sDc9V02WuT5G2xOey0Ci1frj
         jxbBInT3rC4lIzi3684t7kHNtz5ja7Jm9szXt/tup7//ABiRGIEYoBBP7fqYwYEquoBt
         vzWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678652440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SBD3saFngHmWAL0vT++GS+KZHgFK9mytKPRQSV1qkzw=;
        b=7xGJDT1Vn1qZLiZ6GpuK2l/0fyvX9kFqIobDjiTlfiuVprTSX2JVsf6B7VY6w2nbLL
         bvnguoBbXF3eEVmXnpJSkkBGida7tp7Jg3JK3B6qR3LmNtxmOWmYt7KTdGJSYvzj9NO2
         xMttMXeuzevnUyFC+xJ5ykQhO3Ua4Tjz8GmkUuRRIGNC+WaiD2McwpHW63dMRbkdfEMg
         QPk6IqsBtyjfa/k4z1AIPdUACVJnkRxQmLwwJPuwdIW8FfYwP/kdOJQpAIGM/1Ld+QnH
         0e55FwFbCHaSq3ZuS1sGSd3pIQnxjzUvHJPwr99yyaAr62IdF9vb1gtzFefzIxFVZH0J
         Y44g==
X-Gm-Message-State: AO0yUKVuCKlmPSVIeupDUAtw6Uywge2LyxuX3iSt+OOnrEJmCjvGf3PV
	y44UhVGJCM9kPA/fcH+G9LM6wn8/KEJdZzmCZwY=
X-Google-Smtp-Source: AK7set/5UC3YaQhY9aeEwLq6eppdRS1dBWGMyGxVBNnuEH5lFMhvXvVzZ0DAhls0wa6n/qE4sSP9uspy5ark7STsws4=
X-Received: by 2002:a17:906:a3c2:b0:8b1:78b7:6803 with SMTP id
 ca2-20020a170906a3c200b008b178b76803mr16341011ejb.4.1678652440558; Sun, 12
 Mar 2023 13:20:40 -0700 (PDT)
MIME-Version: 1.0
References: <858a592b-ebf4-99b4-74fc-21b4ad3382f8@gmail.com>
In-Reply-To: <858a592b-ebf4-99b4-74fc-21b4ad3382f8@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 12 Mar 2023 21:20:29 +0100
Message-ID: <CAFBinCCRO5vkQN78KfeCM=s1BC8W2dqG1T_C+_Va8e9sz+CWng@mail.gmail.com>
Subject: Re: [PATCH] mmc: meson-gx: simplify usage of mmc_regulator_set_ocr
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_132043_176341_B5506D82 
X-CRM114-Status: UNSURE (   7.32  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gU2F0LCBNYXIgMTEsIDIwMjMgYXQgMTE6MjfigK9QTSBIZWluZXIgS2FsbHdlaXQgPGhrYWxs
d2VpdDFAZ21haWwuY29tPiB3cm90ZToKPgo+IEFmdGVyIDA4NzU5MjM5NWE5NiAoIm1tYzogY29y
ZTogQWxsb3cgaW52YWxpZCByZWd1bGF0b3IgaW4KPiBtbWNfcmVndWxhdG9yX3NldF9vY3IoKSIp
IHdlIGNhbiByZW1vdmUgdGhlIGNoZWNrcyBoZXJlLgo+Cj4gU2lnbmVkLW9mZi1ieTogSGVpbmVy
IEthbGx3ZWl0IDxoa2FsbHdlaXQxQGdtYWlsLmNvbT4KUmV2aWV3ZWQtYnk6IE1hcnRpbiBCbHVt
ZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
