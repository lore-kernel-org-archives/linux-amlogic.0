Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7105FC433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Dec 2021 14:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=zx4brA67Ua4bC1QWm5Ol2e9FGCeXx7kTXPijG/2zZdY=; b=yMo3yRwzvIphaQMUddc5kwDQRh
	Lr4xfwFASkqNloxDkWdSoJY8uBvejnkwnSS6IQuBiMLUU5R5fqHDKQz+eOJnDvT8FJatHZJ873lsL
	qTj3rddoiQyo+WUV0zPesbOVURS1vyhXuO9pE3EiNBIfY+bC6+Zc4xHP1Xfy13oEPLFeKE6EK3rnM
	LxORuTQXP+yBFtN+thxGP6sVKFY3AozyU58bE9bYPEPyrV0rWZWfznAHR0dbhauty/heXx5yZdUjo
	R4zm3/I+Odl5He8V1KJ75KnZ6YBTvDzTyX7aJIDGX39DFZMCY3kO3DtSY5bXWY+UkJn1KyZNdnav3
	nJQ/UIpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzJPT-002jBq-0Y; Mon, 20 Dec 2021 14:13:03 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzJPM-002j9W-TS
 for linux-amlogic@lists.infradead.org; Mon, 20 Dec 2021 14:12:59 +0000
Received: by mail-wm1-x331.google.com with SMTP id
 a83-20020a1c9856000000b00344731e044bso6740598wme.1
 for <linux-amlogic@lists.infradead.org>; Mon, 20 Dec 2021 06:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QlYzhPhMQ4hQtemG1ynrhEbJfjA9AMn3v4ciZQNNcKE=;
 b=kAC76a2WO+3wLo07gq12RFtP7xkaC+5P2Fd4fWplQ+6Xj/IJ88tCnxxrSLQ1mY8rV2
 JyZwOIyCXbLg16RKQshbey/1EpTE/OY3iwM/M8bqHgqg3msXV0Gu63hG7A+JpJfkA82o
 1aX08urLkN+BNwrwsopadFyel33UhEsC7k4OMJiuufC9W/IyB/203p9Y+VR4S2J6zhDW
 mpoODx7Oa6WvfmNzPSPsLVbZIEVM0yRq6IJQlkr3kxODmqtlg4w4AdiVMDc9hK1OIpK5
 j7oN1O/0S6GRPj9KevKdpHkcrIZAvoLaPpCAGo51BASOtWNa38lS0yIjACvGcpq8B7N1
 tfTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QlYzhPhMQ4hQtemG1ynrhEbJfjA9AMn3v4ciZQNNcKE=;
 b=n/A+ytNlhxX/XQnSkklS9HZAOqw7fmG1gN5VxW9l4X0p7zN0QpZQMPzcQLBi/rCTBZ
 mlt/yHx1spvcTZ0bvfigHDuqlDLlBAtwlpRxlr0kZg+LrKLF01BHfpv0vsinxLDpaLRV
 DxwHIeXIHT76lF76e8ob0Yrf7j099wRoXxQIElkoA8eZJZnrILJxzMYQMLKKDgXmje41
 tOMl/simVJnoMK7k37dtwZPb2/wSG27cyLymh9AHh2UqmjkHcQ9txON4pSQYgZwc+svu
 VRN3Ysaf7tkAl6DbPfoz+av9V86abf/0iAkv3qJqu20d2uSFVafZoIDQp8pGEkx5ICjN
 D4QQ==
X-Gm-Message-State: AOAM530EJVgK1StaFzR26aLIaWGeJjleR2B2zpZ4ZwHzrSS/UNFiLF6k
 lKqZZXW+rGQdq8fPWh39vitNjw==
X-Google-Smtp-Source: ABdhPJx0luPTqovvVoD6OCplkS0+/mwJcyESDQ/zfujdOEz4FbHPDtvrbG3OkQCc9m1YPb1Zbt+3lA==
X-Received: by 2002:a1c:2606:: with SMTP id m6mr8292704wmm.52.1640009573279;
 Mon, 20 Dec 2021 06:12:53 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:c44d:78da:eab0:6442?
 ([2001:861:44c0:66c0:c44d:78da:eab0:6442])
 by smtp.gmail.com with ESMTPSA id r8sm12246736wru.107.2021.12.20.06.12.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 06:12:52 -0800 (PST)
Subject: Re: [PATCH v2 1/1] dt-bindings: display: meson-vpu: Add missing
 amlogic,canvas property
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Alexander Stein <alexander.stein@mailbox.org>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20211219094155.177206-1-alexander.stein@mailbox.org>
 <CAFBinCBNqbu-jftGbt9Ss8KPkv+p48295MX5QBsJbc=yneqa8w@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <322022d4-4461-75c3-3f66-c68b20e32519@baylibre.com>
Date: Mon, 20 Dec 2021 15:12:51 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCBNqbu-jftGbt9Ss8KPkv+p48295MX5QBsJbc=yneqa8w@mail.gmail.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_061256_998686_F5C500D7 
X-CRM114-Status: GOOD (  11.70  )
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

SGksCgorIGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKClRoYW5rcyBmb3IgZml4aW5n
IHRoaXMuCgpMZSAxOS8xMi8yMDIxIMOgIDE2OjMwLCBNYXJ0aW4gQmx1bWVuc3RpbmdsIGEgw6lj
cml0wqA6Cj4gT24gU3VuLCBEZWMgMTksIDIwMjEgYXQgMTA6NDIgQU0gQWxleGFuZGVyIFN0ZWlu
Cj4gPGFsZXhhbmRlci5zdGVpbkBtYWlsYm94Lm9yZz4gd3JvdGU6Cj4+Cj4+IFRoaXMgcHJvcGVy
dHkgd2FzIGFscmVhZHkgbWVudGlvbmVkIGluIHRoZSBvbGQgdGV4dHVhbCBiaW5kaW5ncwo+PiBh
bWxvZ2ljLG1lc29uLXZwdS50eHQsIGJ1dCBnb3QgZHJvcHBlZCBkdXJpbmcgY29udmVyc2lvbi4K
Pj4gQWRkaW5nIGl0IGJhY2sgc2ltaWxhciB0byBhbWxvZ2ljLGd4LXZkZWMueWFtbC4KPj4KPj4g
Rml4ZXM6IDZiOWViZjFlMGU2NyAoImR0LWJpbmRpbmdzOiBkaXNwbGF5OiBhbWxvZ2ljLCBtZXNv
bi12cHU6IGNvbnZlcnQgdG8geWFtbCIpCj4+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBTdGVp
biA8YWxleGFuZGVyLnN0ZWluQG1haWxib3gub3JnPgo+IFJldmlld2VkLWJ5OiBNYXJ0aW4gQmx1
bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgo+IAo+IFRoYW5r
IHlvdSB2ZXJ5IG11Y2ggZm9yIHRoaXMgY29udHJpYnV0aW9uIQo+IAoKUmV2aWV3ZWQtYnk6IE5l
aWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4KCkknbGwgYXBwbHkgaXQgdG8g
ZHJtLW1pc2MtbmV4dCBuZXh0IHllYXIgb3IgaWYgYW5vdGhlciBkcm0tbWlzYyBtYWludGFpbmVy
IGNhbiBpbiB0aGUgbWVhbnRpbWUsIEknbSBvayB3aXRoIGl0LgoKTmVpbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
