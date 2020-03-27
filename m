Return-Path: <SRS0=gyfY=5M=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 060B9C43331
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Mar 2020 08:32:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBCE320716
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Mar 2020 08:32:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="luPyrSWO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LHWAWHzm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBCE320716
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FCIx3rxdFNBOnwChGMMXXpSVYCdgq56BNj6f1FB4Ah0=; b=luPyrSWOowIvxQ
	DLSJkBKQTjCQUSWHcf8Sf6qOJlwS8Kv7/bOhPq4QUTQyufXBfEZO/jgq8sv/muLd/n9Hzs6x5VsA4
	5HIp4daGQ2C0NyKgdWwzt550NRnuc3omQI7MIEo8L4I4JARdPz9oMv+D904XxIaZytlWUVgd3Swf3
	VQ6VDXTSW2ZrAv+kxCbiKelEKwHPrp34cIwN+VlPZilPUBuDl1Zh53EnuEYRyBMBZfVkzcfXwcBUN
	G+RjbSJtb+TSzwj9S2V/G4AcnesMPgyz51aAyNV4v2IYQksdKqYqRdr2LAEWI+3xXCQAI8ohQsnTJ
	LfTgTgBhTNnDfodAfcpA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHkPP-0007HG-JB; Fri, 27 Mar 2020 08:32:07 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHkPG-000795-M4
 for linux-amlogic@lists.infradead.org; Fri, 27 Mar 2020 08:31:59 +0000
Received: by mail-wm1-x342.google.com with SMTP id a81so11351025wmf.5
 for <linux-amlogic@lists.infradead.org>; Fri, 27 Mar 2020 01:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=/8e1khbt3xy4ZUf34DU6Fxze93y8M47+3udr0iQSRsI=;
 b=LHWAWHzmrgJi6sjgnjoGfbv7/nunVx19vgyHo/Iys+J47ldqjn8fGNWukWARkju+5I
 vxbxj1NSvZ3VbfxweyHPqh6Dl1Ho/ppvvxSzYAun432P1qgCZD6dOCKJFmKI6uwd6wc0
 o5bjDLooHalwWV9R8YtQ62qyeotsUIkiZl85Z4bpwT5LcRPhRZZXVI8vDevR0jT6RL/A
 dNFry0CzpNV4ae7f5kjFirmvM+Lw7yrn81OFB0G15fzV2kHfMmi9DVpiOd4BQsfTBM74
 jIUN9CTbrlLpgMk3oecrzVR0NLzrIAKFVi7HJ2Yuxpy5IyW5hHCabCi2m9dSFDAUUPsP
 N1nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=/8e1khbt3xy4ZUf34DU6Fxze93y8M47+3udr0iQSRsI=;
 b=ZHPuTUOyWfTKMJAbh9aGWgGgvsV9/KRU2tItghdWtwsmPq9PPN3ncEmICiMF/fKbWh
 OR6aU9MsOPgYw3+YR2Y95wlPn2tPx/uLjN2h/k9E0yiN8ga1fODIhOjPUZ6kNhhO32gk
 ljwtwQyh83eUGJsfHwSb0s+V8ePHnOa3ECRGnCRfLKH5hTN5Rpzijcs90RSPshIPb9xd
 rlMd3WZ4smP8o1cWINnBLJwzch6d21KlOFcdxJvTsmBfEIhFTK9P4w+Cx+jd6nA5abYD
 gXCLxuIbF6GJaBu3ZO+fCGTbDyUde/h4jdyl19dOgyy1N8bvuA1OtRwkmSN1dPX5c2zm
 hBTg==
X-Gm-Message-State: ANhLgQ23XFPcItEg+hBIn+44Y4zmilRRAVbUJ3xhGRSRo9jhL8aOx2Ha
 JPZF8olOd/407bhEQC0xGFXvIQ==
X-Google-Smtp-Source: ADFU+vshlFLkzjFGLqZWToyKEwofbRxD/jsH8lC+uHzFVX7qI4umf//ndsbal5w8KkGL0SIvWV2zCg==
X-Received: by 2002:a7b:cc81:: with SMTP id p1mr4129403wma.158.1585297917089; 
 Fri, 27 Mar 2020 01:31:57 -0700 (PDT)
Received: from dell ([95.149.164.95])
 by smtp.gmail.com with ESMTPSA id w67sm7008731wmb.41.2020.03.27.01.31.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2020 01:31:56 -0700 (PDT)
Date: Fri, 27 Mar 2020 08:32:46 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/4] dt-bindings: Clean-up schema errors due to missing
 'addtionalProperties: false'
Message-ID: <20200327083246.GJ603801@dell>
References: <20200325220542.19189-1-robh@kernel.org>
 <20200325220542.19189-4-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200325220542.19189-4-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200327_013158_718329_CD8A6DC7 
X-CRM114-Status: UNSURE (   8.96  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Guillaume La Roque <glaroque@baylibre.com>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-clk@vger.kernel.org,
 Lars-Peter Clausen <lars@metafoo.de>, Kevin Hilman <khilman@baylibre.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Zhang Rui <rui.zhang@intel.com>, Brian Masney <masneyb@onstation.org>,
 devicetree@vger.kernel.org, Michael Hennerich <michael.hennerich@analog.com>,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Hartmut Knaack <knaack.h@gmx.de>, linux-media@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAyNSBNYXIgMjAyMCwgUm9iIEhlcnJpbmcgd3JvdGU6Cgo+IE51bWVyb3VzIHNjaGVt
YXMgYXJlIG1pc3NpbmcgJ2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZScgc3RhdGVtZW50cyB3
aGljaAo+IGVuc3VyZXMgYSBiaW5kaW5nIGRvZXNuJ3QgaGF2ZSBhbnkgZXh0cmEgdW5kb2N1bWVu
dGVkIHByb3BlcnRpZXMgb3IgY2hpbGQKPiBub2Rlcy4gRml4aW5nIHRoaXMgcmV2ZWFscyB2YXJp
b3VzIG1pc3NpbmcgcHJvcGVydGllcywgc28gbGV0J3MgZml4IGFsbAo+IHRob3NlIG9jY3VycmVu
Y2VzLgo+IAo+IENjOiBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+Cj4gQ2M6IExpbnVz
IFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KPiBDYzogQmFydG9zeiBHb2xhc3pl
d3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KPiBDYzogTWFzYWhpcm8gWWFtYWRhIDx5
YW1hZGEubWFzYWhpcm9Ac29jaW9uZXh0LmNvbT4KPiBDYzogSm9uYXRoYW4gQ2FtZXJvbiA8amlj
MjNAa2VybmVsLm9yZz4KPiBDYzogSGFydG11dCBLbmFhY2sgPGtuYWFjay5oQGdteC5kZT4KPiBD
YzogTGFycy1QZXRlciBDbGF1c2VuIDxsYXJzQG1ldGFmb28uZGU+Cj4gQ2M6IFBldGVyIE1lZXJ3
YWxkLVN0YWRsZXIgPHBtZWVyd0BwbWVlcncubmV0Pgo+IENjOiBOZWlsIEFybXN0cm9uZyA8bmFy
bXN0cm9uZ0BiYXlsaWJyZS5jb20+Cj4gQ2M6IE1hdXJvIENhcnZhbGhvIENoZWhhYiA8bWNoZWhh
YkBrZXJuZWwub3JnPgo+IENjOiBLZXZpbiBIaWxtYW4gPGtoaWxtYW5AYmF5bGlicmUuY29tPgo+
IENjOiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgo+IENjOiAiRGF2aWQgUy4gTWls
bGVyIiA8ZGF2ZW1AZGF2ZW1sb2Z0Lm5ldD4KPiBDYzogTGlhbSBHaXJkd29vZCA8bGdpcmR3b29k
QGdtYWlsLmNvbT4KPiBDYzogTWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3JnPgo+IENjOiBH
dWlsbGF1bWUgTGEgUm9xdWUgPGdsYXJvcXVlQGJheWxpYnJlLmNvbT4KPiBDYzogWmhhbmcgUnVp
IDxydWkuemhhbmdAaW50ZWwuY29tPgo+IENjOiBEYW5pZWwgTGV6Y2FubyA8ZGFuaWVsLmxlemNh
bm9AbGluYXJvLm9yZz4KPiBDYzogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+
Cj4gQ2M6IGxpbnV4LWNsa0B2Z2VyLmtlcm5lbC5vcmcKPiBDYzogbGludXgtZ3Bpb0B2Z2VyLmtl
cm5lbC5vcmcKPiBDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gQ2M6
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogbGludXgtaWlvQHZnZXIua2Vy
bmVsLm9yZwo+IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKPiBDYzogbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gQ2M6IG5ldGRldkB2Z2VyLmtlcm5lbC5vcmcKPiBD
YzogbGludXgtcG1Admdlci5rZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1ieTogUm9iIEhlcnJpbmcg
PHJvYmhAa2VybmVsLm9yZz4KPiAtLS0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2sv
ZnNsLHBsbGRpZy55YW1sIHwgIDMgKysrCj4gIC4uLi9ncGlvL3NvY2lvbmV4dCx1bmlwaGllci1n
cGlvLnlhbWwgICAgICAgICB8ICAyICsrCj4gIC4uLi9iaW5kaW5ncy9ncHUvYXJtLG1hbGktYmlm
cm9zdC55YW1sICAgICAgICB8ICA2ICsrLS0tCj4gIC4uLi9iaW5kaW5ncy9ncHUvYXJtLG1hbGkt
bWlkZ2FyZC55YW1sICAgICAgICB8ICAzICsrKwo+ICAuLi4vYmluZGluZ3MvaWlvL2FkYy9hZGks
YWQ3MTkyLnlhbWwgICAgICAgICAgfCAgMSAtCj4gIC4uLi9iaW5kaW5ncy9paW8vcHJlc3N1cmUv
Ym1wMDg1LnlhbWwgICAgICAgICB8ICAzICsrKwo+ICAuLi4vbWVkaWEvYW1sb2dpYyxtZXNvbi1n
eC1hby1jZWMueWFtbCAgICAgICAgfCAgOSArKysrKy0tLQoKPiAgLi4uL2JpbmRpbmdzL21mZC9y
b2htLGJkNzE4MjgtcG1pYy55YW1sICAgICAgIHwgIDMgKysrCgpBY2tlZC1ieTogTGVlIEpvbmVz
IDxsZWUuam9uZXNAbGluYXJvLm9yZz4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KTGluYXJv
IFNlcnZpY2VzIFRlY2huaWNhbCBMZWFkCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3
YXJlIGZvciBBUk0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9n
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
