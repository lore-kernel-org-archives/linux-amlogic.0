Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C8AECAAD4
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Aug 2022 09:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:To:From:References:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RGN3tpHXeP1LLRP6DdIhhzOVFRi8vDV1pJr0DPvcR88=; b=A0TPnXaH2er/II
	9lM6lnpLCKzxRa1jFPW1eDdEdAd8UI1Jpr855WVsmD0ZIOwRukVAtWa1e3s0RhtHId3iyfpWYkeYk
	Jm3V0HPVx7jfMwqEfv3EvhIi8LRGECKVvh9fdbfSbklBs9MxXl2/HZXkmKUGCFyXYDms+TGLy0XjB
	lNNsOJP0t4yzt/0TPUZ2a0j8Nk83wLMlUhjLm0HLlBaYVT2mDVyul9nD/DSws9KlPo+Lmrf336fM8
	XTQwk57xVuZsuehKSiNggz0L46lse4slphHPixrYDCklwGCytMZRTk0VUMETkY2X7lKgvVb2ZZCvX
	AdCR9rRrRcZ6uJlgemfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSbLd-006u8S-5Q; Mon, 29 Aug 2022 09:46:25 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSbKl-006tYT-5Q
	for linux-amlogic@lists.infradead.org; Mon, 29 Aug 2022 09:45:33 +0000
Received: by mail-wm1-x335.google.com with SMTP id j26so3985494wms.0
        for <linux-amlogic@lists.infradead.org>; Mon, 29 Aug 2022 02:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:to:from:user-agent:references:from:to:cc;
        bh=fEw88egTf3n0WTxLSAsw2MCw2Md2Dd4XGwp5wqMSg0E=;
        b=DwxDMo+IMLmKaXg/GER2cKmuOn7dWteIo52dvOH/RD7vw7Uh7Vz/yGz0pH5Je/yzKk
         1qal1Nxmkh+wMeSF9lKRyM14qNMjFMtmX1+ZD9lAgoSgetgNt15RTNPjjMH67WQExw5O
         FJjhHT15HricLe7QIdVxc0JRNsPMapAOoKsAnO3wlKxBlut82KQ7CdT7YxejErHAkII4
         eb3wMj5H7HYiC0XggRvhqjI0un9eq92+QXG861izN/l8tN8OaWwGiFiJGdXW+mZT+paJ
         jhD9cD4KTKtMHLrJ0ndcwJztmLJFnr57VZa6aXFXV1HQGGJ1DAsVp/Or9S4hgxeKEGcN
         quoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:to:from:user-agent:references:x-gm-message-state:from:to:cc;
        bh=fEw88egTf3n0WTxLSAsw2MCw2Md2Dd4XGwp5wqMSg0E=;
        b=YtF4qJxmI6/JwM7M3TadNK77v3Uo4z9FACR+rcruVwTUUcxl+n5MIjJTGtH7Wc1+/R
         vSyST2n30revbYCCN8RhTou2tSOJcwN4U4jYEpSvGpg/zrrrq6o56yyZ41tBfnzNBKD4
         KmMpgB3Eqbq0N3AD/TMDG14vuf6HLgeaSy5Zf+DviZC5kmFNoIf8P9/V8Eiclre8P5iY
         uvNhLvPjLQqCnsbR3RwL/hAj6XeW/l01bJCjb4uPgzX1qXRGrYRfZg2WoFBXgdEpSrk0
         /au22rn8QUGiNvoWAvZeCtDE5cUXV8yb8kW3y83IeY4FH0dC2lpTIblo/BjAx6qSgYfK
         /LNg==
X-Gm-Message-State: ACgBeo0JgfEhRVDR8dkg6L1C9oD5+hAZ6cxnHyBnUOwlsRbqbjbu4LlI
	FgjeiVyKGrHj7WYlyvZMu2PjoA==
X-Google-Smtp-Source: AA6agR7V29Ev8Tjiea8ZG9KuxzLha718wql0Sq8Ph0UsiqYwTHvcN78mFkUWvyy69pfvCkHGvNHM6w==
X-Received: by 2002:a05:600c:28c8:b0:3a8:40bb:be4c with SMTP id h8-20020a05600c28c800b003a840bbbe4cmr3795642wmd.28.1661766326649;
        Mon, 29 Aug 2022 02:45:26 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id q3-20020a1ce903000000b003a61306d79dsm8616834wmc.41.2022.08.29.02.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 02:45:26 -0700 (PDT)
References: <20220805085716.5635-1-yu.tu@amlogic.com>
 <20220805085716.5635-3-yu.tu@amlogic.com>
 <19654574-bdc0-9fa5-6465-fc88b20e20c5@linaro.org>
 <c223a85a-b76e-0e82-9a8c-6b60588dc03a@amlogic.com>
 <1jmtccz0f4.fsf@starbuckisacylon.baylibre.com>
 <edc9b0bd-6c69-0562-05ca-db0496897cf1@amlogic.com>
User-agent: mu4e 1.8.7; emacs 28.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yu Tu <yu.tu@amlogic.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring
 <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen  Boyd <sboyd@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH V3 2/6] arm64: dts: meson: add S4 Soc PLL clock
 controller in DT
Date: Mon, 29 Aug 2022 11:43:43 +0200
In-reply-to: <edc9b0bd-6c69-0562-05ca-db0496897cf1@amlogic.com>
Message-ID: <1j1qszv0wa.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_024531_823867_9B1DB7A4 
X-CRM114-Status: GOOD (  15.02  )
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

Ck9uIE1vbiAxNSBBdWcgMjAyMiBhdCAxNDoxNywgWXUgVHUgPHl1LnR1QGFtbG9naWMuY29tPiB3
cm90ZToKCj4gSGkgSmVyb21l77yMCj4KPiBPbiAyMDIyLzgvMTAgMjE6MzIsIEplcm9tZSBCcnVu
ZXQgd3JvdGU6Cj4+IFsgRVhURVJOQUwgRU1BSUwgXQo+PiBPbiBGcmkgMDUgQXVnIDIwMjIgYXQg
MTc6MzksIFl1IFR1IDx5dS50dUBhbWxvZ2ljLmNvbT4gd3JvdGU6Cj4+IAo+Pj4gSGkgS3J6eXN6
dG9mLAo+Pj4gICAgICBUaGFuayB5b3UgZm9yIHlvdXIgcmVwbHkuCj4+Pgo+Pj4gT24gMjAyMi84
LzUgMTc6MTYsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4+Pj4gWyBFWFRFUk5BTCBFTUFJ
TCBdCj4+Pj4gT24gMDUvMDgvMjAyMiAxMDo1NywgWXUgVHUgd3JvdGU6Cj4+Pj4+IEFkZGVkIGlu
Zm9ybWF0aW9uIGFib3V0IHRoZSBTNCBTT0MgUExMIENsb2NrIGNvbnRyb2xsZXIgaW4gRFQuCj4+
Pj4+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFl1IFR1IDx5dS50dUBhbWxvZ2ljLmNvbT4KPj4+Pj4g
LS0tCj4+Pj4+ICAgIGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zNC5kdHNpIHwg
OCArKysrKysrKwo+Pj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCj4+Pj4+
Cj4+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tczQu
ZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zNC5kdHNpCj4+Pj4+IGlu
ZGV4IGZmMjEzNjE4YTU5OC4uYTgxNmIxZjc2OTRiIDEwMDY0NAo+Pj4+PiAtLS0gYS9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tczQuZHRzaQo+Pj4+PiArKysgYi9hcmNoL2FybTY0
L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tczQuZHRzaQo+Pj4+PiBAQCAtOTIsNiArOTIsMTQgQEAg
YXBiNDogYXBiNEBmZTAwMDAwMCB7Cj4+Pj4+ICAgIAkJCSNzaXplLWNlbGxzID0gPDI+Owo+Pj4+
PiAgICAJCQlyYW5nZXMgPSA8MHgwIDB4MCAweDAgMHhmZTAwMDAwMCAweDAgMHg0ODAwMDA+Owo+
Pj4+PiAgICArCQkJY2xrY19wbGw6IHBsbC1jbG9jay1jb250cm9sbGVyQDgwMDAgewo+Pj4+IE5v
ZGUgbmFtZXMgc2hvdWxkIGJlIGdlbmVyaWMgLSBjbG9jay1jb250cm9sbGVyLgo+Pj4+IGh0dHBz
Oi8vZGV2aWNldHJlZS1zcGVjaWZpY2F0aW9uLnJlYWR0aGVkb2NzLmlvL2VuL2xhdGVzdC9jaGFw
dGVyMi1kZXZpY2V0cmVlLWJhc2ljcy5odG1sI2dlbmVyaWMtbmFtZXMtcmVjb21tZW5kYXRpb24K
Pj4+Pgo+Pj4gSSB3aWxsIGNoYW5nZSB0byBjbGtjX3BsbDogY2xvY2stY29udHJvbGxlckA4MDAw
LCBpbiBuZXh0IHZlcnNpb24uCj4+IFNhbWUgY29tbWVudCBhcHBsaWVzIHRvIHRoZSBiaW5kaW5n
IGRvYy4KPiBPS2F5Lgo+PiBBbHNvIGl0IHdvdWxkIGJlIG5pY2UgdG8gc3BsaXQgdGhpcyBpbiB0
d28gc2VyaWVzLgo+PiBCaW5kaW5ncyBhbmQgZHJpdmVycyBpbiBvbmUsIGFybTY0IGR0IGluIHRo
ZSBvdGhlci4gVGhlc2UgY2hhbmdlcyBnb2VzCj4+IGluIHRocm91Z2ggZGlmZmVyZW50IHRyZWVz
Lgo+IEF0IHByZXNlbnQsIEJpbmRpbmdzLCBEVFMgYW5kIGRyaXZlcnMgYXJlIHRocmVlIHNlcmll
cy4gRG8geW91IG1lYW4gdG8gcHV0Cj4gQmluZGluZ3MgYW5kIGRyaXZlcnMgdG9nZXRoZXI/IElm
IHNvLCBjaGVja3BhdGNoLnBsIHdpbGwgcmVwb3J0IGEgd2FybmluZy4KClllcyBiZWNhdXNlIHBh
dGNoZXMgYXJlIG5vdCBpbiB5ZXQgc28gdGhlcmUgaXMgYSBnb29kIHJlYXNvbiB0byBpZ25vcmUK
dGhlIHdhcm5pbmcuIFdhcm5pbmcgd2lsbCBuZXZlciBzaG93IHVwIG9uIHRoZSBhY3R1YWwgdHJl
ZSBpZiB0aGUKcGF0Y2hlcyBhcmUgY29ycmVjdGx5IG9yZGVyZWQuCgo+Cj4+IAo+Pj4+IEJlc3Qg
cmVnYXJkcywKPj4+PiBLcnp5c3p0b2YKPj4+PiAuCj4+IC4KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAps
aW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
