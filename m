Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9CB1C7EE25
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 May 2023 18:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OvjmA1nbnF5Y3RLplbyPTDu3H1tNVY7TvyYOaxYC0tM=; b=bpTJVtyGBySP5G
	GxlYNrv5qfzSA9AJ+6HZV9nXbAb0DdRJAS6DdpLv00AaqQJ7rq5l2EFZ01Okb0kKBWZus7wEOFX1L
	Wztl5Y7RCNbAQOmRoJoCHfBFu85ZAgNiXIsv8oW5O+wZe2q8owtugR74vlg1OxHFtZqGiHCV1/7lm
	7T1pwLQjYdHCH/kW6fMB5ziu6S+Tk8gAg7j0jgUQyTBtkyFNvhsHp7oZtHDXOD6XvRuDESxbsiT3w
	uQEe/6qSusKKaTXyWvNjjDXjsXYc0uQ41m3FkaGO7loyV1WrDILUIxBboxuAa4WM4L2ESLoVh5Uen
	WI+oHDkD+4TMSLEUEMrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptYen-00GamW-28;
	Mon, 01 May 2023 18:53:53 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptYek-00GalM-2r;
	Mon, 01 May 2023 18:53:52 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-94f1a6e66c9so569049266b.2;
        Mon, 01 May 2023 11:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1682967228; x=1685559228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QcrbAaVz/Tew1epI5hk6Zr7SXYmQTuJNk5UFWlXr0Sk=;
        b=EuyNEUTQVGJioLsniNIIE3aZTgwqVP/VX3T0BP1C7JgtGSW5tYccF5sOrNVy50rRc9
         UYr3RQa8+spA0343UOjCUngKLpa9hV4yXyG69ErqdjokdsX8Lq6nFJOl3JFiwlGKTdp4
         X1jvYgX8Nzdul4ZpzEFDgC07PSffHDumX/nIEXx4X6xDlvQlnN/E1B71zowrwZ9faJUN
         KLZhHPzH2/NSRQ8sNJ3u+2iOJ0I3kBOINlSvUZIM44eLI1AP9h7nw9D4NVasMVkkM5ty
         MU+m1RZOTT2Mv/8KtW6avwQBL5EXRuyw8D81v/K+RGfMh7kCorD/xFErCXkJ7TQClXVn
         1cvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682967229; x=1685559229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QcrbAaVz/Tew1epI5hk6Zr7SXYmQTuJNk5UFWlXr0Sk=;
        b=IQ8WVbbPwOe56wh392oN7ngDdEnKxVUzUiLBJJgxfdQBQxHccVVdlz2f8B+8rtSC8Y
         j3fORHLwAyOvnRxoI3Qj+Q8noz/iVO9ozT8XrcBWJzoaw4eNzqvUEMubh0on0+0SXA7c
         88RTcOw+/gwXn/4XTQm6SQB3zpQ3VyWaZrE1dtbtVZYhUh0LG1a13CBgXcR8bBwGR+8v
         4xcfuzUVgIJldFyzYIzNP9Im99ePWRo52AOu5U4fjOf158ZFJmu1hh50WEfcJ2aNU5qs
         Bbgsgh9nQ0AuklbDKxTZl7QgVxowgCUOT3TZ7n6GY6u7voWmQMxIgyTlltS+QkB8j9H3
         Fvgg==
X-Gm-Message-State: AC+VfDyXynsk7jyoIPYiKAocPCrcnysGDper+yMTvQhf2iKlboOb/gMn
	dZHCuiWav1/dJREUd2en0Bg7q2mHp8gFxUVG5Do=
X-Google-Smtp-Source: ACHHUZ6mtjreyWHLSNSD2jgcn1qzmjbZFHCHL843OHuaKtI4fNDPB8ShYp157YYZP0vIZZDDiShr2V/kTjkyaQNrr7g=
X-Received: by 2002:a17:907:7fa7:b0:94f:3bf7:dacf with SMTP id
 qk39-20020a1709077fa700b0094f3bf7dacfmr15786481ejc.71.1682967228713; Mon, 01
 May 2023 11:53:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230426095805.15338-1-ddrokosov@sberdevices.ru> <20230426095805.15338-5-ddrokosov@sberdevices.ru>
In-Reply-To: <20230426095805.15338-5-ddrokosov@sberdevices.ru>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 1 May 2023 20:53:37 +0200
Message-ID: <CAFBinCD2FKHsOiHyEDSLmTt2CE_5rUNXgyE4og=XS4Vf1ht5hg@mail.gmail.com>
Subject: Re: [PATCH v14 4/6] clk: meson: a1: add Amlogic A1 PLL clock
 controller driver
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: neil.armstrong@linaro.org, jbrunet@baylibre.com, mturquette@baylibre.com, 
	sboyd@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	khilman@baylibre.com, jian.hu@amlogic.com, kernel@sberdevices.ru, 
	rockosov@gmail.com, linux-amlogic@lists.infradead.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_115350_921350_BA2F33BF 
X-CRM114-Status: UNSURE (   8.71  )
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

T24gV2VkLCBBcHIgMjYsIDIwMjMgYXQgMTE6NTjigK9BTSBEbWl0cnkgUm9rb3Nvdgo8ZGRyb2tv
c292QHNiZXJkZXZpY2VzLnJ1PiB3cm90ZToKPgo+IEludHJvZHVjZSBQTEwgY2xvY2sgY29udHJv
bGxlciBmb3IgQW1sb2dpYyBBMSBTb0MgZmFtaWx5Lgo+IFRoZSBjbG9jayB1bml0IGlzIGFuIEFQ
QiBzbGF2ZSBtb2R1bGUgdGhhdCBpcyBkZXNpZ25lZCBmb3IgZ2VuZXJhdGluZyBhbGwKPiBvZiB0
aGUgaW50ZXJuYWwgYW5kIHN5c3RlbSBjbG9ja3MuCj4gVGhlIFNvQyB1c2VzIGFuIGV4dGVybmFs
IDI0TUh6IGNyeXN0YWw7IHRoZXJlIGFyZSA0IGludGVybmFsIFBMTHM6Cj4gU1lTX1BMTC9ISUZJ
X1BMTC9VU0JfUExMLyhGSVhQTEwpLCB0aGVzZSBQTExzIGdlbmVyYXRlIDI3IGNsb2NrIHNvdXJj
ZXMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKaWFuIEh1IDxqaWFuLmh1QGFtbG9naWMuY29tPgo+IFNp
Z25lZC1vZmYtYnk6IERtaXRyeSBSb2tvc292IDxkZHJva29zb3ZAc2JlcmRldmljZXMucnU+ClJl
dmlld2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2ds
ZW1haWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
