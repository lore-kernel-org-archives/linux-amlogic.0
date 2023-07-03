Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 180C4EB64DD
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jul 2023 07:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M5b/MpfCfoBVcp/Kvo2N5KvVBOoQHk19zDgnK7nKVE4=; b=raBdhm4TgKQN5MN4SMpbGgO3Zb
	qtOutjj+lPzkEtHI8Mnt3Cfq9k+QijFkMpWgsupLJcBWlKiQUjJd41Mj2iQrhA4RY8lpLNbmBEexy
	+YLD9kUULj3l3JwCcWqdFj+gUN+lIGx03J6T07jU/Jy3L8ZR1v6nPQcd7GlpmjwjZEBdtO5KI++v3
	9Ua9ADA/87RdzGxnrZscixxPIaHmi3HahE8Ej6GcnFsnzHSqQbjMm9tf5Xhwdljw/KbbJhV6tyPah
	8lrtGE+Spw4k7qp4ilXqvC1LHbCUaNz6DJQTxztx03fH2VxmZqjGDsPJpGlRUROHWl2GJVYQP5puG
	ZavdenIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGDvF-009ZRA-1i;
	Mon, 03 Jul 2023 07:24:33 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGDvC-009ZP8-2F
	for linux-amlogic@lists.infradead.org;
	Mon, 03 Jul 2023 07:24:32 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3141c3a7547so4248865f8f.2
        for <linux-amlogic@lists.infradead.org>; Mon, 03 Jul 2023 00:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688369068; x=1690961068;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KgMnJ8CKfBislhp1HG0z8FmS5BLcV5+cmaj4jvnhxWQ=;
        b=lKrkHVcsQngHENPpMshxYINgAv/o3G4zjF9clGaCwoFrRmttkUWr4CBrogdvxNzMS3
         VBP86BoCy3AKClMFDF9HKPnJtmGpdmiipRLgTXgdGNS4e85wXCTHXgQTmURXCy5fNf5m
         LxexEPRA7cwPlrcsXz+F1rXEQI1sP8laktduTFkvWEbrgg/jMuTHCuPebIqG1ozPUTdZ
         IUYsdmpolDS8JvoAktsNi9dCycog7boyCBWaDP3PYwLu4lolTKdY5ehvy7aTMVfkLHfK
         R07BeDK6M+Dv1Kr+KwncWpguMs+6Gv792dGNu4Jf1DKoHce2DPoWYH74hji1yCmqMA4W
         sEMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688369068; x=1690961068;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KgMnJ8CKfBislhp1HG0z8FmS5BLcV5+cmaj4jvnhxWQ=;
        b=RIH1jlr+lpMh94KgkoD2UyL8uD+xOgTCWRU6KfAmPxhpBqX2eY31HGMtoE7GiVYKMX
         wGGqAFeBtWK9UQ6yusptUguYBNT2KnZhxtsCf2m7Sik2S4UxdIpbrDev4W7PZuzf/pYp
         YmmjW8ufnoQM8pu4Nxn/GWeCRCNEPxzzfpKhXvAkq3CaCYmLi3RDQd0QjT0GxN/FJHIY
         IpinxZv1anxEDygeSUQ2RAWwCUCNCygu5RYSMewdyHq1UhMtaHcxNkIgmtRpZwajW5z0
         /QPE+qbAyTRxQgSLJxZZnICN4oapyp707G8RTpuM2XTYI3ikwyhD8Ujczi+LmGgqvWFo
         Qb4g==
X-Gm-Message-State: ABy/qLbH5AVfARLR+/IH28SxbV+cu2jqn2+j+KjW5sWXe6A2mPo0EFqN
	/0dnj7dTIF0kHlRw8dIWqiKzXA==
X-Google-Smtp-Source: APBJJlErVoF0iApuPq86HVOvO0iLKPOR8uT2faeOcndYld3NEwBM2GZKbdz/+srhnFDYERI4fgA7tQ==
X-Received: by 2002:a5d:6349:0:b0:313:e48a:d173 with SMTP id b9-20020a5d6349000000b00313e48ad173mr6657516wrw.68.1688369068512;
        Mon, 03 Jul 2023 00:24:28 -0700 (PDT)
Received: from [192.168.7.21] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id u11-20020adfdd4b000000b003143765e207sm1899030wrm.49.2023.07.03.00.24.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jul 2023 00:24:27 -0700 (PDT)
Message-ID: <65d78d07-be4f-8ea0-b322-353b5c23fcb0@linaro.org>
Date: Mon, 3 Jul 2023 09:24:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v6 5/9] drm/meson: gate px_clk when setting rate
Content-Language: en-US
To: George Stark <gnstark@sberdevices.ru>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jagan Teki <jagan@amarulasolutions.com>, Nicolas Belin <nbelin@baylibre.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-0-fd2ac9845472@linaro.org>
 <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-5-fd2ac9845472@linaro.org>
 <c487ed03-0ab2-74fb-91bc-4a773bfdfc5b@sberdevices.ru>
Organization: Linaro Developer Services
In-Reply-To: <c487ed03-0ab2-74fb-91bc-4a773bfdfc5b@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_002430_756313_F9AB2AE7 
X-CRM114-Status: GOOD (  12.76  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMzAvMDYvMjAyMyAyMDoxMCwgR2VvcmdlIFN0YXJrIHdyb3RlOgo+IEhlbGxvIE5laWwKPiAK
PiBPbiA2LzMwLzIzIDE5OjI5LCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPj4gRGlzYWJsZSB0aGUg
cHhfY2xrIHdoZW4gc2V0dGluZyB0aGUgcmF0ZSB0byByZWNvdmVyIGEgZnVsbHkKPj4gY29uZmln
dXJlZCBhbmQgY29ycmVjdGx5IHJlc2V0IFZDTEsgY2xvY2sgdHJlZSBhZnRlciB0aGUgcmF0ZQo+
PiBpcyBzZXQuCj4+Cj4+IEZpeGVzOiA3N2Q5ZTFlNmI4NDYgKCJkcm0vbWVzb246IGFkZCBzdXBw
b3J0IGZvciBNSVBJLURTSSB0cmFuc2NlaXZlciIpCj4+IFNpZ25lZC1vZmYtYnk6IE5laWwgQXJt
c3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPgo+PiAtLS0KPj4gwqAgZHJpdmVycy9n
cHUvZHJtL21lc29uL21lc29uX2R3X21pcGlfZHNpLmMgfCA3ICsrKysrKysKPj4gwqAgMSBmaWxl
IGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL21lc29uL21lc29uX2R3X21pcGlfZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVz
b25fZHdfbWlwaV9kc2kuYwo+PiBpbmRleCA1NzQ0N2FiZjFhMjkuLmRjNjNkMmQ4MTNhOSAxMDA2
NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2R3X21pcGlfZHNpLmMKPj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2R3X21pcGlfZHNpLmMKPj4gQEAgLTk0
LDYgKzk0LDcgQEAgc3RhdGljIGludCBkd19taXBpX2RzaV9waHlfaW5pdCh2b2lkICpwcml2X2Rh
dGEpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+PiDCoMKgwqDCoMKgIH0KPj4g
K8KgwqDCoCBjbGtfZGlzYWJsZV91bnByZXBhcmUobWlwaV9kc2ktPnB4X2Nsayk7Cj4+IMKgwqDC
oMKgwqAgcmV0ID0gY2xrX3NldF9yYXRlKG1pcGlfZHNpLT5weF9jbGssIG1pcGlfZHNpLT5tb2Rl
LT5jbG9jayAqIDEwMDApOwo+PiDCoMKgwqDCoMKgIGlmIChyZXQpIHsKPj4gQEAgLTEwMiw2ICsx
MDMsMTIgQEAgc3RhdGljIGludCBkd19taXBpX2RzaV9waHlfaW5pdCh2b2lkICpwcml2X2RhdGEp
Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+PiDCoMKgwqDCoMKgIH0KPj4gK8Kg
wqDCoCBjbGtfcHJlcGFyZV9lbmFibGUobWlwaV9kc2ktPnB4X2Nsayk7Cj4gcHJvYmFibHkgc2hv
dWxkIGJlOgo+IHJldCA9IGNsa19wcmVwYXJlX2VuYWJsZShtaXBpX2RzaS0+cHhfY2xrKTsKCklu
ZGVlZCwgdGh4IGZvciBub3RpY2luZyA6LSkKCj4+ICvCoMKgwqAgaWYgKHJldCkgewo+PiArwqDC
oMKgwqDCoMKgwqAgZGV2X2VycihtaXBpX2RzaS0+ZGV2LCAiRmFpbGVkIHRvIGVuYWJsZSBEU0kg
UGl4ZWwgY2xvY2sgKHJldCAlZClcbiIsIHJldCk7Cj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4g
cmV0Owo+PiArwqDCoMKgIH0KPj4gKwo+PiDCoMKgwqDCoMKgIHN3aXRjaCAobWlwaV9kc2ktPmRz
aV9kZXZpY2UtPmZvcm1hdCkgewo+PiDCoMKgwqDCoMKgIGNhc2UgTUlQSV9EU0lfRk1UX1JHQjg4
ODoKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGRwaV9kYXRhX2Zvcm1hdCA9IERQSV9DT0xPUl8yNEJJ
VDsKPj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxv
Z2ljCg==
