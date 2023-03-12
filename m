Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E89C6FD19
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 Mar 2023 20:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MpP/AiKBq7NpajlSv8w7uklmZX/HpQJT3VUYpFm2/dk=; b=dzufQYJCd0C0IZ
	Lg3LkEWvOaDtqUmjy6Sl5A5tDEMelWeVAUCfNA054r7nwyKxThXdZsiWpAW+Phq1IJvcMJG8UbYTn
	5HDEaC398EForK/pokRmfH7lghvNhiVUB7HHoRBROwTbES98c9LECcw271GH5Ep3CeQ/OysFxk7ch
	SQUQMvv99LmflzUWZWaCl5bfwJYl3Fqw/KPQuvNmsFO9I8Gf1ADVoeNTk3QgrtK+CwA2f0ixPSpfO
	4qTXGNv7BHRTWUZk0xp/dqpoqPPJpxTHjhk5yXiIf1iUNyD6ZrxxR4Z2L5+r2LScv+zxTJLo5Ox3M
	NrSxZTpzA9Tuuv0S9kTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbSI2-003UsP-Jt; Sun, 12 Mar 2023 20:27:34 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbSHz-003Uqb-LX; Sun, 12 Mar 2023 20:27:33 +0000
Received: by mail-ed1-x536.google.com with SMTP id j11so40902332edq.4;
        Sun, 12 Mar 2023 13:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1678652847;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NJIG57E9Rub7tDv1mA8UrojVtdumgjAvRGF4XO89JVc=;
        b=Gs91BukGPyFc4POOzKOYtY6lNg4h+RXqTJiKID9Hhmw/RANDEyu8f9roWgrvC2dJES
         wKjRxrw2bhywOZ5bI8zBAe3o0347vbXFqm8HTcYXOf5fgqqN+kg/Ox1gFh+OoNW87lD0
         P6Gvzt5cERu39C5/9wXgEPPecSCUGJEK6rWT3lndngaceD7QXz29rSjRX1YjBViA2yUf
         n8qU0JyX5zPJqJ4o7uZiiXJNRDGMonL9pEjFaYsT0PH/dYdzd5FHRUQh0sTfaCpp4fL9
         xmlLRb0vYXxU6UNbF58O45n32Qc1PiWlP0lfjNQy871UFgZ1yIPO9uaaHTPMWrVmMHE7
         Q8Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678652847;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NJIG57E9Rub7tDv1mA8UrojVtdumgjAvRGF4XO89JVc=;
        b=4Kzvt8Lf8WPYbY3AiRl3I8aa6V4HeGIXJ+eIyX7+tHZYs+HBRE1kio2Qlj2plr0Yf4
         pV46NFNcjPSByo5J0+CY9yys8KAYeBOJx3eHcsIlDecIAbSB1SXHb06Xu1B2wZg1CyfQ
         fgABwQFkarNHG1DE4R4SMWZS36R4O7MLeueNIzHyzlImMjmJhcOhbe+AeJfIQHaG3XKK
         3fksaBSYtr6QwzW/k7kuTIrksx/uGM0VbmzHjKiecZz8oFeg5zJwMoSUNkKq9gnTS8Na
         9VIeuXdPnJOodBUnt8nGhuCmVmJdT+Yo0feTocuLPzB4wNl1D6+JkvmTVs2UNettZb2X
         mA4w==
X-Gm-Message-State: AO0yUKVtQHE3MDusVTHgAkx5Ik5GiX79GIT4MD+hWlIbgNiZ3Qx1dVi3
	QnGiMOufuKhnXHyo4FVhC7VxDtsqbTBN0wFfyqM=
X-Google-Smtp-Source: AK7set9iMuxq4a2jeYOobSyZd5fBhXYFnw414jirJl2YZzV1fFNeR6Rqn7L94/RVeR97qjcd9DgXYrirHMw5YVOdlA4=
X-Received: by 2002:a50:9f29:0:b0:4fa:e897:7467 with SMTP id
 b38-20020a509f29000000b004fae8977467mr1993592edf.6.1678652846952; Sun, 12 Mar
 2023 13:27:26 -0700 (PDT)
MIME-Version: 1.0
References: <fe7f06ed-4e74-529c-3cf5-45d635cefcc8@gmail.com>
In-Reply-To: <fe7f06ed-4e74-529c-3cf5-45d635cefcc8@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 12 Mar 2023 21:27:16 +0100
Message-ID: <CAFBinCC0vXrn4Lv2D5xtoBKDo4H7q3zzoyCWm97V7rJF-maeGw@mail.gmail.com>
Subject: Re: [PATCH RESEND] dt-bindings: interrupt-controller: Convert Amlogic
 Meson GPIO interrupt controller binding
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Marc Zyngier <marc.zyngier@arm.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_132731_724622_1EE6418F 
X-CRM114-Status: GOOD (  11.64  )
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

T24gU3VuLCBNYXIgMTIsIDIwMjMgYXQgMTI6MTjigK9BTSBIZWluZXIgS2FsbHdlaXQgPGhrYWxs
d2VpdDFAZ21haWwuY29tPiB3cm90ZToKPgo+IENvbnZlcnQgQW1sb2dpYyBNZXNvbiBHUElPIGlu
dGVycnVwdCBjb250cm9sbGVyIGJpbmRpbmcgdG8geWFtbC4KPgo+IFJldmlld2VkLWJ5OiBSb2Ig
SGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+IFNpZ25lZC1vZmYtYnk6IEhlaW5lciBLYWxsd2Vp
dCA8aGthbGx3ZWl0MUBnbWFpbC5jb20+ClR3byBzbWFsbCBjb21tZW50cyBiZWxvdy4gV2l0aCB0
aG9zZSBhZGRyZXNzZWQ6ClJldmlld2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4u
Ymx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgoKWy4uLl0KPiArZGVzY3JpcHRpb246IHwKPiAr
ICBNZXNvbiBTb0NzIGNvbnRhaW5zIGFuIGludGVycnVwdCBjb250cm9sbGVyIHdoaWNoIGlzIGFi
bGUgdG8gd2F0Y2ggdGhlIFNvQwo+ICsgIHBhZHMgYW5kIGdlbmVyYXRlIGFuIGludGVycnVwdCBv
biBlZGdlIG9yIGxldmVsLiBUaGUgY29udHJvbGxlciBpcyBlc3NlbnRpYWxseQo+ICsgIGEgMjU2
IHBhZHMgdG8gOCBHSUMgaW50ZXJydXB0IG11bHRpcGxleGVyLCB3aXRoIGEgZmlsdGVyIGJsb2Nr
IHRvIHNlbGVjdCBlZGdlCkRlcGVuZGluZyBvbiB0aGUgU29DIGl0J3MgZWl0aGVyIGEgMjU2IHRv
IDggb3IgMjU2IHRvIDEyIG11bHRpcGxleGVyLgoKWW91IGdvdCB0aGUgaW1wb3J0YW50IHBhcnQg
KG1pbiBhbmQgbWF4IGl0ZW1zIGZvciB0aGUKYW1sb2dpYyxjaGFubmVsLWludGVycnVwdHMgcHJv
cGVydHkpIGNvcnJlY3QgdGhvdWdoLgo+ICsgIG9yIGxldmVsIGFuZCBwb2xhcml0eS4gSXQgZG9l
cyBub3QgZXhwb3NlIGFsbCAyNTYgbXV4IGlucHV0cyBiZWNhdXNlIHRoZQo+ICsgIGRvY3VtZW50
YXRpb24gc2hvd3MgdGhhdCB0aGUgdXBwZXIgcGFydCBpcyBub3QgbWFwcGVkIHRvIGFueSBwYWQu
IFRoZSBhY3R1YWwKPiArICBudW1iZXIgb2YgaW50ZXJydXB0IGV4cG9zZWQgZGVwZW5kcyBvbiB0
aGUgU29DLgpzL2ludGVycnVwdC9pbnRlcnJ1cHRzLwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgt
YW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
