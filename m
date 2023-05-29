Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C0CC7EE23
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 May 2023 20:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v5b5tawcZMb+hhdRcd8wfboaYRtN74dCsd2FF8INROk=; b=N28Jod4nD2FfD3
	dtQKHxF/nG0rYfp7JWcNN3LlKwPDWDX0kmn6dQ4lWDjKyjMIsYMMbifezy4913XWIF0r5SpPkjbaw
	cONoGfrofATmc5qO8CjY8tjdjSJrLbLJ/6DNmxGLovF0UU6ISTrpESZnuJ4uQJs4dXaj1opi92AZO
	+8EYUSi5Oi22NEvO03PcfPuaooeT6DNqX3oB/JGYXxh7UPbUPtHJDGX42t2unspCevQwtCRm+Yxtq
	AdUGPCt32E3zo9GR2j4/qZC8e1eR1Z6NKTjvpEIn8/fxT/wvUnIfRarD1lbF5ssCbQQnOfJF6N/Dg
	1d1/NYfR1Ziu5q6QXD9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3jLj-00BcTq-25;
	Mon, 29 May 2023 20:20:15 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3jLh-00BcSc-0H;
	Mon, 29 May 2023 20:20:14 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-96ff9c0a103so532252666b.0;
        Mon, 29 May 2023 13:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1685391610; x=1687983610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UaBaGYCNxPZhOfoDjvgva3si6aUdokMc6Gw8fHEKHuE=;
        b=KfiVQLPJLi42XivH0/2I8b8IaA4agFdHz0r3rtjNs1W6EuPkAsmXg7WOKbVeJPCPgT
         BbK0uX3pJnS3Pv7eVitih7ohKpQyGAZpvzh0Lq5PlbePkTBxQ7ICu32LIfc5yMmVVeHF
         tc/kOgBTSJ1v8YHX3QYrTPPJ0SuGiCm2OPzXsaHvX8FN05aWy9lyslWGWQeB46GmUq86
         1MPdU6XyMhjIOyuN264W/iP03wRp9m2gWqR0AiR1NLka9qoFT/MXtB34mXzIka1VcT9i
         sEAaNpRH+Q3+D8ouWrS0kEQp6mE0jIQ8Wjmum7s1UuODLmWVEMhJaqTugd+qtHHa2Q5v
         G7WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685391610; x=1687983610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UaBaGYCNxPZhOfoDjvgva3si6aUdokMc6Gw8fHEKHuE=;
        b=J42zcM7tCEUKwQHt6lc72qvPaYXSLPqtIsKpiSaQBA8ZoQkkB5NCR/1/hz6QExp3RF
         jsa+IuUYaIcTfH6IoKSGbwlZcOi24a3nYPddRPPRBRF7NeW66cz0r/O5o7nJ60xNxILW
         qGrtPMZH+K0cnWmAEx8nJpERj2KQMawnV+Xn/ydVdEikmqda2vW6Uyt1CFzVhNIuSo0Y
         ytawIYhC8SlbQeE+f/TIGllRi88O5ihZu3PXQLkXI8LNNyou52wVSsEcuT5CPcw/nb4o
         gR9RvfZU5HQgM9Gp7Ojkk9t2jpOPrgTBJhJ3/D4akXdadK5eBzuFol38fbWn5n2Scufj
         10EA==
X-Gm-Message-State: AC+VfDyKlwJlTD9bsQwMxF1pEwHGoRMYxg/ty4kEoleBvbM9h2BXK26w
	SXEU5AjZeExG8tBnAOP/I6FOM9zmJf1IXVgsqHs=
X-Google-Smtp-Source: ACHHUZ7rEdsB1abIjXBwnJgb2QaZ3rA+DNo7mrBeOxfo1iuRO9GdPORptUnmUP9H+tnsnEMOzr4noDOfQ+3s5zbIE2Q=
X-Received: by 2002:a17:907:9813:b0:965:6cb9:b768 with SMTP id
 ji19-20020a170907981300b009656cb9b768mr250326ejc.31.1685391610344; Mon, 29
 May 2023 13:20:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230523135351.19133-1-ddrokosov@sberdevices.ru> <20230523135351.19133-7-ddrokosov@sberdevices.ru>
In-Reply-To: <20230523135351.19133-7-ddrokosov@sberdevices.ru>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 29 May 2023 22:19:59 +0200
Message-ID: <CAFBinCA35XC5mo+t-RV+yBA2XzAiVXPR_gX3jO25HA=V5XgnOw@mail.gmail.com>
Subject: Re: [PATCH v16 6/6] clk: meson: a1: add Amlogic A1 Peripherals clock
 controller driver
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: neil.armstrong@linaro.org, jbrunet@baylibre.com, mturquette@baylibre.com, 
	sboyd@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	khilman@baylibre.com, jian.hu@amlogic.com, kernel@sberdevices.ru, 
	rockosov@gmail.com, linux-amlogic@lists.infradead.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_132013_119948_2919ECE7 
X-CRM114-Status: UNSURE (   8.79  )
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

T24gVHVlLCBNYXkgMjMsIDIwMjMgYXQgMzo1NOKAr1BNIERtaXRyeSBSb2tvc292IDxkZHJva29z
b3ZAc2JlcmRldmljZXMucnU+IHdyb3RlOgo+Cj4gSW50cm9kdWNlIFBlcmlwaGVyYWxzIGNsb2Nr
IGNvbnRyb2xsZXIgZm9yIEFtbG9naWMgQTEgU29DIGZhbWlseS4KPgo+IEExIFNvQyBoYXMgZm91
ciBjbG9jayBjb250cm9sbGVycyBvbiB0aGUgYm9hcmQ6IFBMTCwgUGVyaXBoZXJhbHMsIENQVSwK
PiBhbmQgQXVkaW8uCj4gVGhpcyBwYXRjaHNldCBhZGRzIHN1cHBvcnQgZm9yIEFtbG9naWMgQTEg
UGVyaXBoZXJhbHMgY2xvY2sgZHJpdmVyIGFuZAo+IGFsbG93cyB0byBnZW5lcmF0ZSBjbG9ja3Mg
Zm9yIGFsbCBBMSBTb0MgcGVyaXBoZXJhbCBJUHMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKaWFuIEh1
IDxqaWFuLmh1QGFtbG9naWMuY29tPgo+IFNpZ25lZC1vZmYtYnk6IERtaXRyeSBSb2tvc292IDxk
ZHJva29zb3ZAc2JlcmRldmljZXMucnU+ClJldmlld2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3Rpbmds
IDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QK
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
