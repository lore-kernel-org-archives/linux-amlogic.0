Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57CD3FA3741
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Oct 2022 21:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dvLujAgeC6yxQxssbtz6ILD1DrE6indcOGnaOA9Xq58=; b=EeWl9zyqF2rlsc
	dV4rsdROmwuYxa2IXYU6brlWDIk0PTMXWmmpfgvwU5sjRh408cKJd9+21rtj7Zxct8xfpKWDoCANX
	jZnz4uJvd4x0sH45Guy5RbjoBJHw2POC7Wr9MpxUYGbPe/Vcbqbt79vU+CzzLrP9rAqKDkN82+5fU
	+PnQSpQPTpIae8ccoK3ruuQNOezRK3Bo0JeB1P5oEHisx5rrwsWvvz1NW31BdBy6WQgO6tZ9a7vH7
	Xa1H5weQkLWqnQblcix2R83Uh2tY0bFNk4VqYLrLRsGnXtPojuQUPLqpOc4tUHz4Ad9Kur/HnWnpi
	cHkOkXzgDfPfS3jc2Y7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opcBm-00FZYI-4A; Mon, 31 Oct 2022 21:19:22 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opcBa-00FZVI-Qw; Mon, 31 Oct 2022 21:19:12 +0000
Received: by mail-ej1-x62f.google.com with SMTP id y14so32621220ejd.9;
        Mon, 31 Oct 2022 14:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/qWsb0SGi8QeQtOKhb0/4kvJ5Eb+D2s5VKybi0N7j1Y=;
        b=AzZULfLPBMcm+DUmjgEYV107VADO9otzoaT9RLKeDX8V2ypcVjCMMxR1ZfS339jhbz
         xnA3jaA3aIv/uzdt0kbteLtMmNzUos7Z9ZY4vmerRpOKEPe+u7e33u1bN3MRQT5LLI4p
         dtq1ToR3KPduVwJjwTukPWqEywH7+NA6wJN1a22IdXuJOKi6clXO8Zy1dMzy7mGZd1b9
         koT+JXMa9w13JgOsvT0XSCo+m9lJ6oCh9S7cqKa1D45GcLy4jqPykMqyzyRHqThojUdE
         yZyzJkFRjr4FnWPe6x6oIRtNChO8SK5z74xhMZ+dMWIhL8OnY/hKdq6lBJimYNiFRO/g
         0KHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/qWsb0SGi8QeQtOKhb0/4kvJ5Eb+D2s5VKybi0N7j1Y=;
        b=JBxM1wovI1mm4UPwtjRQy3axs0GZlkPOh48CTZiN5WEj04bs/KGoBv72l2LbHqipzO
         Lk3FZ08MM3giD43hcrmyF4owmOY2z7Q9qyZFgUYZAtS4dvBE/le0ADeLteoih/oi7yBq
         a2WQIny35TulhGxrQtG/3E9zgh4Fjbu1eiBIShKFLQE2aBx7KH0ZEV+q4xOZB9njT9GI
         kNPdIjQT51jp9EVugkyo0HgcM/RVTlJMAA4V69f8EKKvxjvc/PK8/LVrXy60AhWPZ2FG
         BC/mfwqI1sky/OQZCLIndXXqlV9TbAh87VnUTCFWItzDrH/O48s1JjdWF9b7VTxHX7F3
         xUcQ==
X-Gm-Message-State: ACrzQf3KAGPvZ1Fx1Evnt7xZvJ6+9TbIKlZkmaK5pbazv6/u2PHYmWqQ
	q72JolhLBGSopuyIkHYDiH6jsgrfj4xm/e9wRFE=
X-Google-Smtp-Source: AMsMyM793wQb5dTAUE/EmKc++FETmfnoTczV6euc1hrr77pY+81h0cawpbby2zZhteI7qZWz0A+LqmZypQ+fPno4seo=
X-Received: by 2002:a17:906:7314:b0:791:a45a:bc84 with SMTP id
 di20-20020a170906731400b00791a45abc84mr14859875ejc.394.1667251149204; Mon, 31
 Oct 2022 14:19:09 -0700 (PDT)
MIME-Version: 1.0
References: <20221031-b4-odroid-go-ultra-initial-v1-0-42e3dbea86d5@linaro.org> <20221031-b4-odroid-go-ultra-initial-v1-3-42e3dbea86d5@linaro.org>
In-Reply-To: <20221031-b4-odroid-go-ultra-initial-v1-3-42e3dbea86d5@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 31 Oct 2022 22:18:58 +0100
Message-ID: <CAFBinCAuiGtigKwzJ1WUgs5bbwf-y1fvVFq79wZA-E1e6tMXtw@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: amlogic: document Odroid Go Ultra compatible
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Sebastian Reichel <sre@kernel.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_141910_886477_D8DE22A5 
X-CRM114-Status: UNSURE (   8.22  )
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

T24gTW9uLCBPY3QgMzEsIDIwMjIgYXQgNTo0NyBQTSBOZWlsIEFybXN0cm9uZwo8bmVpbC5hcm1z
dHJvbmdAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBUaGlzIGRvY3VtZW50cyB0aGUgT2Ryb2lkIEdv
IFVsdHJhLCBhIHBvcnRhYmxlIGdhbWluZyBkZXZpY2UsCj4gd2l0aCB0aGUgZm9sbG93aW5nIGNo
YXJhY3RlcmlzdGljczoKPiAtIEFtbG9naWMgUzkyMlggU29DCj4gLSBSSzgxNyAmIFJLODE4IFBN
SUNzCj4gLSAyR2lCIExQRERSNAo+IC0gT24gYm9hcmQgMTZHaUIgZU1NQwo+IC0gTWljcm8gU0Qg
Q2FyZCBzbG90Cj4gLSA1aW5jaCA4NTTDlzQ4MCBNSVBJLURTSSBURlQgTENECj4gLSBFYXJwaG9u
ZSBzdGVyZW8gamFjaywgMC41V2F0dCA4zqkgTW9ubyBzcGVha2VyCj4gLSBMaS1Qb2x5bWVyIDMu
N1YvNDAwMG1BaCBCYXR0ZXJ5Cj4gLSBVU0ItQSAyLjAgSG9zdCBDb25uZWN0b3IKPiAtIHgxNiBH
UElPIElucHV0IEJ1dHRvbnMKPiAtIDJ4IEFEQyBBbmFsb2cgSm95c3RpY2tzCj4gLSBVU0ItQyBQ
b3J0IGZvciBVU0IyIERldmljZSBhbmQgQ2hhcmdpbmcKPgo+IFNpZ25lZC1vZmYtYnk6IE5laWwg
QXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPgpSZXZpZXdlZC1ieTogTWFydGlu
IEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
