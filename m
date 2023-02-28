Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8101C64EC7
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Feb 2023 21:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TnJm459JhBA+EQqP16mIOTJXJ1C6wR+6ph7NgBdRRfE=; b=xiLMP8URAskzav
	pBs5lX8g0zu9MIb+pysufFiKiPkhlx6G+cs8QMxc40qu9+1WXLgG6wyyGP8wQ06iKN2DaZM/yXSM1
	HYD5xJpIxuo68GXHDP7Z+ynApxLUrezE8uPEqfzVkkkq9TZNHlIKo4D2JffaQOsBz8U2mQ3QyWvhd
	sPReDLftUtJQ5YynnNyW9p98R7trEcctu/dJ1Tw3y46bJGMH3UPX7Eil1oOaGlTQRFJ7V7j5HrTtv
	G51gH7xPfiwijw/Wgm4oZb0omSoHheryaWqDOQpVg6MrE5szyDlpV0tdD1H0Vo6IHdgcjDJMKo3gW
	ZZIoBT6YQ7kABG4hiO/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX79f-00EHAl-A1; Tue, 28 Feb 2023 21:04:59 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX79d-00EH8x-DH; Tue, 28 Feb 2023 21:04:58 +0000
Received: by mail-ed1-x532.google.com with SMTP id ck15so45818433edb.0;
        Tue, 28 Feb 2023 13:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/qm/MBWDC8nlZdeWFoTNIoJzLA4ZTwjggcn30R/NHjg=;
        b=D0iAN02e6IRiHJvi7XwpEJaRInPv5a5N+kOlTN3jKZ+4hEvpJI3KmDVTORxTkkrDSJ
         b8BOVYqPbaosTo2zJPbuUDmkmyp6KOUSFP3jj1K7P+HjArVe8CogkTl3G/jRbmFWYylW
         2sg5Td0L5D9wIcuuEZzujbbSeHETGFMIzgnFiusF1ViGc5EyBbFSgPrOFGgPJYM+w6I6
         31lmTRSdZXcJPuuv5PKWa1iSDQodddGKqbI0tOwseecYn+cIZs5nTkADlkHcVm++iD+h
         luDUhzSGMPDiUnMb1h/B4Qblq2G+aQ2Fc5D/gNeXuhoYx15YLP+iZB4jDiB+cRNbJ/HQ
         aNHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/qm/MBWDC8nlZdeWFoTNIoJzLA4ZTwjggcn30R/NHjg=;
        b=E8MitsTEf/CLo7V7yLBdaNkOLKDsnTB8DQyjq5ZND3zO3ruH7w3vRfZ2jEpwtv2eXS
         k0zxRbFXgjHdSOx4VabhhwTbjsVKG8bygXwxk7GA8bglOYeR8BEUPyEOgbXRqjaygrwY
         EtKbNxbANamNgCFz/ZGqM0NMmeNoNI9X/2fDGW2q5dio+ImFYltW0BL0yr+LLSPQrR/U
         nuBCV10pdP10qCPTF8sLWZENEtYfyYEtvEBcdLJtv+rgAx2rZmJ77ad5I0HXgl1jBdwj
         +r1YQuKSUNAhkYmaV9TFaoGUooi7SgqluCf5pVCw9a5en3VYUPMy/yZE566smjjhgBQW
         RTOA==
X-Gm-Message-State: AO0yUKXDsjTjkWiFSWwnzJ66J0x8flBkwN/N7JT2njfdvORpo7kRPyk7
	Pwp431ECluxc3wyM4P3laoYdC5GeJd0qyJL1OhM=
X-Google-Smtp-Source: AK7set9CAWS85CYCJub0afB4axseBQvitchbrFWz4bB2DCpjZP8K0hi2oi2aJvS1Izn26qhetw9HLqQpjrape3SV27k=
X-Received: by 2002:a50:f687:0:b0:4ad:6e3e:7da6 with SMTP id
 d7-20020a50f687000000b004ad6e3e7da6mr2617800edn.6.1677618292126; Tue, 28 Feb
 2023 13:04:52 -0800 (PST)
MIME-Version: 1.0
References: <cbfd45e3-310b-db40-d52b-daf79ce8743d@free.fr>
In-Reply-To: <cbfd45e3-310b-db40-d52b-daf79ce8743d@free.fr>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 28 Feb 2023 22:04:41 +0100
Message-ID: <CAFBinCAdTHuN+AZKm0Yt=Gv0KgMtRruAHDgcF0qrLTZpki3JRQ@mail.gmail.com>
Subject: Re: Conflict between video-lut and pmu on meson-g12
To: Marc Gonzalez <marc.w.gonzalez@free.fr>, Jiucheng Xu <jiucheng.xu@amlogic.com>
Cc: AML <linux-amlogic@lists.infradead.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Chris Healy <healych@amazon.com>, Will Deacon <will@kernel.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Pierre-Hugues Husson <phh@phh.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_130457_494883_BC5ECC4D 
X-CRM114-Status: GOOD (  14.13  )
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

SGVsbG8gTWFyYywKCk9uIFR1ZSwgRmViIDI4LCAyMDIzIGF0IDU6NDjigK9QTSBNYXJjIEdvbnph
bGV6IDxtYXJjLncuZ29uemFsZXpAZnJlZS5mcj4gd3JvdGU6Cj4KPiBIZWxsbyBldmVyeW9uZSwK
Pgo+IFJ1bm5pbmcgNi4yLjAtcmM4IG9uIGEgUzkwNVgyIGJvYXJkLCBJIG5vdGUgdGhlIGZvbGxv
d2luZyBlcnJvcgo+IGluIHRoZSBrZXJuZWwgbG9nOgo+Cj4gWyAgICAxLjA1OTE3NV0gbWVzb24t
ZzEyLWRkci1wbXUgZmY2MzgwMDAucG11OiBjYW4ndCByZXF1ZXN0IHJlZ2lvbiBmb3IgcmVzb3Vy
Y2UgW21lbSAweGZmNjM4MDAwLTB4ZmY2MzgwZmZdCj4gWyAgICAxLjA2ODY0N10gbWVzb24tZzEy
LWRkci1wbXU6IHByb2JlIG9mIGZmNjM4MDAwLnBtdSBmYWlsZWQgd2l0aCBlcnJvciAtMTYKWy4u
Ll0Kb3VjaCwgaXQgc2VlbXMgd2UgbWlzc2VkIHRoYXQgZHVyaW5nIHRoZSBkcml2ZXIvYmluZGlu
Z3MgcmV2aWV3Cgo+IEEgc2ltcGxlIHNvbHV0aW9uIG1pZ2h0IGJlIHRvIHNwZWNpZnkgdGhlICJh
Y3R1YWwiIGJhc2Ugb2YKPiB0aGUgcmVnaXN0ZXIgc2V0LCBhbmQgY291bnQgZnJvbSAwIGluIHRo
ZSBkcml2ZXI/CkkgdGhpbmsgeW91ciBmaXggaXMgY29ycmVjdCAoZm9ybWFsbHkgaXQgd291bGQg
bmVlZCB0byBiZSBzcGxpdCBpbnRvIGEKZHJpdmVyIGFuZCBhIC5kdHNpIHBhdGNoIC0gYnV0IGxl
dCdzIGRvIHRoaW5ncyBzdGVwIGJ5IHN0ZXApLgpJdCB3b3VsZCBiZSBncmVhdCB0byBnZXQgc29t
ZSBjb25maXJtYXRpb24gZnJvbSBKaXVjaGVuZyBYdSBvbiB0aGlzIGFzCkkgdGhpbmsgd2Ugc2hv
dWxkIGJlIHF1aWNrIHdpdGggZml4aW5nIGJlZm9yZSB0aGlzIGJ1ZyBtYWtlcyBpdAplbHNld2hl
cmUgKC5kdHNpcyBjYW4gYmUgc2hhcmVkIHdpdGggdS1ib290IGFuZCBvdGhlciBzeXN0ZW1zIGZv
cgpleGFtcGxlKS4KCkFwYXJ0IGZyb20gdGhlIGRyaXZlciBhbmQgLmR0c2kgY2hhbmdlcyB3ZSBz
aG91bGQgYWxzbyB1cGRhdGUKRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BlcmYv
YW1sb2dpYyxnMTItZGRyLXBtdS55YW1sCkJ1dCBhZ2FpbjogbGV0J3MgZG8gdGhpcyBvbmUgc3Rl
cCBhdCBhIHRpbWUuCgoKVGhhbmtzIGZvciB0aGUgYW5hbHlzaXMgYW5kIHlvdXIgd29yayBvbiB0
aGlzIQpCZXN0IHJlZ2FyZHMsCk1hcnRpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dp
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYW1sb2dpYwo=
