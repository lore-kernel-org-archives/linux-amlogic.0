Return-Path: <SRS0=NsVS=4P=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A96C5C4BA3B
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Feb 2020 11:18:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7425A2468F
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Feb 2020 11:18:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d7XB+R2X";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j47SkQ6N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7425A2468F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J7Sispmjs/HGaQFwOW6XQSgE9ZPtRgFg+waMx+vY2tA=; b=d7XB+R2XdFbsc6
	jkO6r4/W+35Ko+fnvT7On39ghwCBfSlOJA9Ew4MHIFFkPgLY7DHcbCpvvvMIAkzUAXORdwE9r5jZ1
	jnWHaVMY0EhScvQAClBqzSUGAVHcfC2I5N6BPAlzOFGgI/CzLSKlvFncwc35KRAwPhyRikOJLr8MY
	2f2zp8uIfH21y+2vFeHtQfvja9yudxSpg85+K7i1MIwsj4TZbNs3RU3wG1Qre4gSt0QvWitLrGbpm
	X10k5LGg7679CoVtyOwWIolHcxVRu0He53dUO9T7av/Lfk8jgGot2qYTBWklnN1Urys8sL3bRHxfQ
	GOInGhkdHBpToH4vKtXQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7HBF-0008I0-Dt; Thu, 27 Feb 2020 11:18:13 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7HBD-0008HD-55
 for linux-amlogic@lists.infradead.org; Thu, 27 Feb 2020 11:18:12 +0000
Received: by mail-wr1-x443.google.com with SMTP id y17so2817653wrn.6
 for <linux-amlogic@lists.infradead.org>; Thu, 27 Feb 2020 03:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=spFJEGVBRek2zEbWteiB5VkJQFGmO84tf9kfsQenrxE=;
 b=j47SkQ6NMvCPiCl45Aj3qJBv6uLRE+t7oBLsNEE4lOzWeSbLK/Hiami/px62ZCX7V7
 GYwmCSWSwWUN/10IpFx88m+NvNfFvn+BsTZ7vvf9p/kclQdnMBUScFDIGVJyl4oQJDtr
 QITka6pihzmJHC/S4OaKSMWt5BQxsGVZcNUo3W92Rj3jPOSzO2Yrt14W0JY2u46+jrBI
 wU6+aolsAjKf7iOaUaL8Gwsh9a0XMrtPnp+Tw/ndmnPB/kpbWTDCa4wDjJSSTfrv8Yxy
 epEVtwykkEDtmnxSngaRUtC/kRS/fVbdhS+Ypo1eFOKDcnTpIqBCQUBW25WD3bYKpqSZ
 4MKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=spFJEGVBRek2zEbWteiB5VkJQFGmO84tf9kfsQenrxE=;
 b=dDvsVjA1ByW1teJM61xc/gwfgQ+3JLi0XQl9KfcaTo/zVAy492ofbz/iwxZA2whwAl
 +W8GlXoicd8S6GTIn/j9JwCywyLuXS6zNjzWyVLvYP4q+c0SvdsJHYhJhnuSgq88NOse
 tc4/ZD0IiprYSjY9ib6o1F0U31aJgGhFoV4cKoeNJjj8EV/8xa+kiYDlj3NWTGEhFJqd
 QnfU0q3ae00qC5UV5Ow7A0yiAKq6XZwVOx9fp/lOBvxwrpVqYFdFdwkMy20jwVss93kX
 Kcj/zYFUvVpBqiL0L8L4mx7Z/L02yOkpBSToJAZX/F8KtKZh3XfDGekVN6VXxMmENIAB
 O20A==
X-Gm-Message-State: APjAAAW8AxdMLzRkD+G6EwKjIkpjmWnjiUxH3n7Jry2oSJEM7IeVsXhE
 5jNjKkxormT169uoVyDCB3mB9A==
X-Google-Smtp-Source: APXvYqwH5B5nFC4/9z9Z9KzsfrK6fNdNrQRBpmNKSSFuQlasfqkN87GK4AvEXa5oAQkFrhEeSuOisg==
X-Received: by 2002:a5d:550f:: with SMTP id b15mr4347679wrv.19.1582802289640; 
 Thu, 27 Feb 2020 03:18:09 -0800 (PST)
Received: from ?IPv6:2a01:e34:ed2f:f020:d916:1723:c1c1:22d?
 ([2a01:e34:ed2f:f020:d916:1723:c1c1:22d])
 by smtp.googlemail.com with ESMTPSA id d15sm2842545wrp.37.2020.02.27.03.18.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2020 03:18:08 -0800 (PST)
Subject: Re: [PATCH v3 16/18] clocksource: Replace setup_irq() by request_irq()
To: afzal mohammed <afzal.mohd.ma@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-amlogic@lists.infradead.org
References: <202002251058.U8V8FHji%lkp@intel.com>
 <91961c77c1cf93d41523f5e1ac52043f32f97077.1582799709.git.afzal.mohd.ma@gmail.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Autocrypt: addr=daniel.lezcano@linaro.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <e47ba222-bf4e-d13c-fbd3-6e7952097188@linaro.org>
Date: Thu, 27 Feb 2020 12:18:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <91961c77c1cf93d41523f5e1ac52043f32f97077.1582799709.git.afzal.mohd.ma@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200227_031811_209244_CC3B3520 
X-CRM114-Status: GOOD (  19.11  )
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Kukjin Kim <kgene@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 NXP Linux Team <linux-imx@nxp.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>,
 Barry Song <baohua@kernel.org>, Scott Branden <sbranden@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Tony Prisk <linux@prisktech.co.nz>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Enrico Weigelt <info@metux.net>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMjcvMDIvMjAyMCAxMTo1OSwgYWZ6YWwgbW9oYW1tZWQgd3JvdGU6Cj4gcmVxdWVzdF9pcnEo
KSBpcyBwcmVmZXJyZWQgb3ZlciBzZXR1cF9pcnEoKS4gVGhlIGVhcmx5IGJvb3Qgc2V0dXBfaXJx
KCkKPiBpbnZvY2F0aW9ucyBoYXBwZW4gZWl0aGVyIHZpYSAnaW5pdF9JUlEoKScgb3IgJ3RpbWVf
aW5pdCgpJywgd2hpbGUKPiBtZW1vcnkgYWxsb2NhdG9ycyBhcmUgcmVhZHkgYnkgJ21tX2luaXQo
KScuCj4gCj4gUGVyIHRnbHhbMV0sIHNldHVwX2lycSgpIGV4aXN0ZWQgaW4gb2xkZW4gZGF5cyB3
aGVuIGFsbG9jYXRvcnMgd2VyZSBub3QKPiByZWFkeSBieSB0aGUgdGltZSBlYXJseSBpbnRlcnJ1
cHRzIHdlcmUgaW5pdGlhbGl6ZWQuCj4gCj4gSGVuY2UgcmVwbGFjZSBzZXR1cF9pcnEoKSBieSBy
ZXF1ZXN0X2lycSgpLgo+IAo+IFNlbGRvbSByZW1vdmVfaXJxKCkgdXNhZ2UgaGFzIGJlZW4gb2Jz
ZXJ2ZWQgY291cGxlZCB3aXRoIHNldHVwX2lycSgpLAo+IHdoZXJldmVyIHRoYXQgaGFzIGJlZW4g
Zm91bmQsIGl0IHRvbyBoYXMgYmVlbiByZXBsYWNlZCBieSBmcmVlX2lycSgpLgo+IAo+IEEgYnVp
bGQgZXJyb3IgdGhhdCB3YXMgcmVwb3J0ZWQgYnkga2J1aWxkIHRlc3Qgcm9ib3QgPGxrcEBpbnRl
bC5jb20+Cj4gaW4gdGhlIHByZXZpb3VzIHZlcnNpb24gb2YgdGhlIHBhdGNoIGFsc28gaGFzIGJl
ZW4gZml4ZWQuCj4gCj4gWzFdIGh0dHBzOi8vbGttbC5rZXJuZWwub3JnL3IvYWxwaW5lLkRFQi4y
LjIwLjE3MTAxOTE2MDk0ODAuMTk3MUBuYW5vcwo+IAo+IFNpZ25lZC1vZmYtYnk6IGFmemFsIG1v
aGFtbWVkIDxhZnphbC5tb2hkLm1hQGdtYWlsLmNvbT4KPiAtLS0KPiAKPiBIaSwKPiAKPiBUaGVy
ZSB3YXMgYSBidWlsZCBlcnJvciBpbiB2Miwgd2hpY2ggd2FzIHJlcG9ydGVkIGJ5IGtidWlsZCB0
ZXN0Cj4gcm9ib3QgYW5kIGl0IHdhcyBzdWdnZXN0ZWQgdG8gYWRkIFJlcG9ydGVkLWJ5IHRvIHRo
ZSBwYXRjaC4gQnV0IHNpbmNlCj4gdGhlIGNoYW5nZSBpcyBiZWluZyBmaXhlZCB1cCB3LyBvcmln
aW5hbCBwYXRjaCwgaWYgaSBhZGQgUmVwb3J0ZWQtYnksCj4gaXQgd2lsbCBnaXZlIGEgZmVlbGlu
ZyBhcyB0aG91Z2ggcm9ib3QgaGFzIHJlcG9ydGVkIHRoZSBuZWNlc3NpdHkgb2YKPiB0aGlzIHBh
dGNoIGFzIHdob2xlLCBzbyBpIGhhdmUgY3JlZGl0ZWQgdGVzdCByb2JvdCBpbiBhIGRpZmZlcmVu
dCB3YXkKPiBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuIElmIHRoZSBwcm9wZXIgd2F5IGlzIHRvIGFk
ZCBSZXBvcnRlZC1ieSB0YWcKPiBpdHNlbGYgb3Igc29tZSBvdGhlciB3YXksIGxldCBtZSBrbm93
LCBpIHdpbGwgY2hhbmdlIGFjY29yZGluZ2x5Lgo+IAo+IEhpIERhbmllbCwgTGludXMsCj4gCj4g
aSBoYXZlIHJlbW92ZWQgeW91ciBBY2tlZC1ieSdzIGFzIG5vdyBwYXRjaCBoYXMgYmVlbiBtb2Rp
ZmllZCAodGhvdWdoCj4gb25seSBzbGlnaHRseSB0aGUgZmlsZSB0aW1lci1wcmltYTIuYykgdG8g
Zml4IHRoZSBidWlsZCBlcnJvci4KSSdtIGZpbmUgd2l0aCB0aGUgY2hhbmdlcywgSSdsbCBhcHBs
eSB0aGlzIHBhdGNoIGZvciB0aW1lcnMvZHJpdmVycy9uZXh0CgotLSAKIDxodHRwOi8vd3d3Lmxp
bmFyby5vcmcvPiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNv
Q3MKCkZvbGxvdyBMaW5hcm86ICA8aHR0cDovL3d3dy5mYWNlYm9vay5jb20vcGFnZXMvTGluYXJv
PiBGYWNlYm9vayB8CjxodHRwOi8vdHdpdHRlci5jb20vIyEvbGluYXJvb3JnPiBUd2l0dGVyIHwK
PGh0dHA6Ly93d3cubGluYXJvLm9yZy9saW5hcm8tYmxvZy8+IEJsb2cKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcg
bGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
