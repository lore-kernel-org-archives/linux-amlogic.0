Return-Path: <SRS0=Y5gA=R4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1DABC43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 12:12:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 759EA2085A
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 12:12:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cscPec9X";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="YmujF8z8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 759EA2085A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fykOzdlEGpxPMTHfBofYbQ3xTfZBwGF6zzyc0ubGzBg=; b=cscPec9XOhEYMF
	9FHmsUaD6ZCTm1sbr2WXzI9faHCnv9g86j2o9VjBD6XBFmVdETx+AajLaYWIf4hrxA12YoK+CcYcJ
	BnrwGUoYycWOvKMm7ORnQT+eGOrfWN7taFqvA+TrXPGUGFIPSodLDyMbiC6U0I8cEX+fw/lz+hxhW
	WOUt+wdat0Zs0yiazXL0zXYyxcjjI0MVAyqR+FT979vmvZ9nVr8FjCPUhOCADMbc7LSGXjuWP6alT
	ADLt97np6HF8BJD49y8yRYRMnqNYt9xDDTf1UDkpC5PbqjqpVYd0SMjxb/ZdOEqjC+2RaQbWC/ufy
	H4mdYyFc25cb1X+bntWQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8OSm-00054b-DM; Mon, 25 Mar 2019 12:12:24 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8OSj-00052h-HP
 for linux-amlogic@lists.infradead.org; Mon, 25 Mar 2019 12:12:23 +0000
Received: by mail-wm1-x343.google.com with SMTP id t124so8762784wma.4
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Mar 2019 05:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=7oJ2BJ9gAnWC5l0oDNzudy1JGSpF+W2Z+dx7/swBhBI=;
 b=YmujF8z8ja/YFjxXEZ1e6e9Omt/NGXZoF7jS7jDGafTxmxT+36HQoAvyfaVzxTDCYB
 vIvFr3R+OJUYt5hzha5bBi5VbkdTZl2yE62wtQYYLT9TKKIA0qa7CN6Rp8jrrjnNQ30r
 C+dTYxrPc0iIw5P/PeLqnG5m1Ix4LDYxyz1TrIY55sKKO8o0lv8WlpzVHsGk/z1ajrHH
 7VIxFJd6HcAnRABw6Rb7chlz5TJ5gFIT0Th/D/YtqgC1Z36D4pDhT0ToLWLZ16FF1tqQ
 7KKJnPFN0eS9wusgMdw84Wunl3qLgVXAvyDS7z4uXx6w6j0iYSb/khGE3sPIZ3dpdiS/
 7TAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=7oJ2BJ9gAnWC5l0oDNzudy1JGSpF+W2Z+dx7/swBhBI=;
 b=gYkw7biMGRfQVFLW1GRC9f/vDCR2/HE9ZLClEXxicfrWN78Qlf4muYyBzgZECOaajV
 1+a8r0scFg9ej2KAg9W925i4julIeH3QMoqua4Ot7MyyTFQHJt6GZAfYz90efOaEXNOf
 ClDoCVI2gZJyjw7ZWVF8Z/Xkox3dM647S2Dk9ezL2WVwBlMh4cOqqghHgPAt9W+CWG2C
 rXdWqViAwkvps98YW1TvlEu4wDPPpg9TcJ4lOa6rLTczVApCHwFkQ1iM3Vaql6sM28Pn
 /GOcUHBsnpJ7ux/7PzxK2+iWXwxAZn9PqxA6yUMStoTtnVP1o/1IRYm5t56Cr3DMuRqd
 sXIQ==
X-Gm-Message-State: APjAAAXzGeJtmRWCVtOVU6+liqHS5EhUap8tdHdrTmS+Ww//M7pHr5n6
 HCfuxRIktl6ip4EIYuHESnTi1w==
X-Google-Smtp-Source: APXvYqwo/fHMLTpR0sXlXH0CmI/n6LPrQXevbEEOA3dyBdVWNSrVlW5Bd2PFNVV4KQ8EXUl4tr1jrw==
X-Received: by 2002:a05:600c:22cd:: with SMTP id
 13mr4808840wmg.109.1553515930149; 
 Mon, 25 Mar 2019 05:12:10 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id h7sm18734126wmb.41.2019.03.25.05.12.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Mar 2019 05:12:09 -0700 (PDT)
Subject: Re: [PATCH] drm/bridge: dw-hdmi: disable SCDC configuration for
 invalid setups
To: Andrzej Hajda <a.hajda@samsung.com>, Laurent.pinchart@ideasonboard.com,
 heiko@sntech.de, robh@kernel.org
References: <CGME20190315095421epcas4p3321555f6918dc4e420acdbf23121338f@epcas4p3.samsung.com>
 <20190315095414.28520-1-narmstrong@baylibre.com>
 <6faa365e-2a4d-3666-b00f-79f36258106c@samsung.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <c771a0a0-e62e-db7e-b3f7-6ff3f4a915d8@baylibre.com>
Date: Mon, 25 Mar 2019 13:12:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <6faa365e-2a4d-3666-b00f-79f36258106c@samsung.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_051221_579764_A0E3D2AB 
X-CRM114-Status: GOOD (  23.22  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, jernej.skrabec@siol.net,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMjUvMDMvMjAxOSAxMjozNywgQW5kcnplaiBIYWpkYSB3cm90ZToKPiBPbiAxNS4wMy4yMDE5
IDEwOjU0LCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPj4gVGhpcyBwYXRjaCBpcyBhbiBhdHRlbXB0
IHRvIGxpbWl0IEhETUkgMi4wIFNDREMgc2V0dXAgd2hlbiA6Cj4+IC0gdGhlIFNvQyBlbWJlZHMg
YW4gSERNSSAxLjQgb25seSBjb250cm9sbGVyCj4+IC0gdGhlIEVESUQgc3VwcG9ydHMgU0NEQyBi
dXQgbm90IHNjcmFtYmxpbmcKPj4gLSB0aGUgRURJRCBzdXBwb3J0cyBTQ0RDIHNjcmFtYmxpbmcg
YnV0IG5vdCBmb3IgbG93IFRNRFMgYml0IHJhdGVzLAo+PiAgIHdoaWxlIG9ubHkgc3VwcG9ydGlu
ZyBsb3cgVE1EUyBiaXQgcmF0ZXMKPj4KPj4gVGhpcyB0byBhdm9pZCBjb21tdW5pY2F0aW5nIHdp
dGggdGhlIFNDREMgRERDIHNsYXZlIHVuY2Vzc2FyeSwgYW5kCj4+IHNldHRpbmcgdGhlIERXLUhE
TUkgVE1EUyBTY3JhbWJsZXIgc2V0dXAgd2hlbiBub3Qgc3VwcG9ydGVkIGJ5IHRoZQo+PiB1bmRl
cmx5aW5nIGhhcmR3YXJlLgo+Pgo+PiBSZXBvcnRlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2Vy
bmVsLm9yZz4KPj4gRml4ZXM6IDI2NGZjZTZjYzJjMSAoImRybS9icmlkZ2U6IGR3LWhkbWk6IEFk
ZCBTQ0RDIGFuZCBUTURTIFNjcmFtYmxpbmcgc3VwcG9ydCIpCj4+IFNpZ25lZC1vZmYtYnk6IE5l
aWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4KPj4gLS0tCj4+Cj4+IFJvYiwK
Pj4KPj4gdGhpcyBwYXRjaCBzaG91bGQgYWxzbyBzb2x2ZSB5b3VyIGlzc3VlIHdpdGggeW91ciAx
MScgZGlzcGxheSwgY291bGQgeW91Cj4+IHRlc3QgaXQgPwo+PiBJZiB0aGlzIHdvcmtzLCBJIHdp
bGwgZm9jdXMgb24gdGhlIHVuZGVybHlpbmcgaXNzdWUgd2hlcmUgdGhlIFJLMzM5OSBTb0MKPj4g
ZnJlZXplcyBpbiB5b3VyIHNldHVwLgo+Pgo+PiBUaGFua3MsCj4+IE5laWwKPj4KPj4gIGRyaXZl
cnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIHwgMzQgKysrKysrKysrKysrKysr
KysrKystLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9k
dy1oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwo+PiBp
bmRleCBhNjNlNWYwZGFlNTYuLmRiNzYxMzI5YTFlMyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKPj4gQEAgLTEwMzcsNiArMTAzNywzMSBAQCB2b2lk
IGR3X2hkbWlfcGh5X2kyY193cml0ZShzdHJ1Y3QgZHdfaGRtaSAqaGRtaSwgdW5zaWduZWQgc2hv
cnQgZGF0YSwKPj4gIH0KPj4gIEVYUE9SVF9TWU1CT0xfR1BMKGR3X2hkbWlfcGh5X2kyY193cml0
ZSk7Cj4+ICAKPj4gKy8qIEZpbHRlciBvdXQgaW52YWxpZCBzZXR1cHMgdG8gYXZvaWQgY29uZmln
dXJpbmcgU0NEQyBhbmQgc2NyYW1ibGluZyAqLwo+PiArc3RhdGljIGJvb2wgZHdfaGRtaV9zdXBw
b3J0X3NjZGMoc3RydWN0IGR3X2hkbWkgKmhkbWkpCj4+ICt7Cj4+ICsJc3RydWN0IGRybV9kaXNw
bGF5X2luZm8gKmRpc3BsYXkgPSAmaGRtaS0+Y29ubmVjdG9yLmRpc3BsYXlfaW5mbzsKPj4gKwo+
PiArCS8qIENvbXBsZXRlbHkgZGlzYWJsZSBTQ0RDIHN1cHBvcnQgZm9yIG9sZGVyIGNvbnRyb2xs
ZXJzICovCj4+ICsJaWYgKGhkbWktPnZlcnNpb24gPCAweDIwMGEpCj4+ICsJCXJldHVybiBmYWxz
ZTsKPj4gKwo+PiArCS8qIERpc2FibGUgaWYgU0NEQyBpcyBub3Qgc3VwcG9ydGVkLCBvciBpZiBh
biBIRi1WU0RCIGJsb2NrIGlzIGFic2VudCAqLwo+PiArCWlmICghZGlzcGxheS0+aGRtaS5zY2Rj
LnN1cHBvcnRlZCB8fAo+PiArCSAgICAhZGlzcGxheS0+aGRtaS5zY2RjLnNjcmFtYmxpbmcuc3Vw
cG9ydGVkKQo+PiArCQlyZXR1cm4gZmFsc2U7Cj4+ICsKPj4gKwkvKgo+PiArCSAqIERpc2FibGUg
aWYgZGlzcGxheSBvbmx5IHN1cHBvcnQgbG93IFRNRFMgcmF0ZXMgYW5kIHNjcmFtYmxpbmcKPj4g
KwkgKiBmb3IgbG93IHJhdGVzIGlzIG5vdCBzdXBwb3J0ZWQgZWl0aGVyCj4+ICsJICovCj4+ICsJ
aWYgKCFkaXNwbGF5LT5oZG1pLnNjZGMuc2NyYW1ibGluZy5sb3dfcmF0ZXMgJiYKPj4gKwkgICAg
ZGlzcGxheS0+bWF4X3RtZHNfY2xvY2sgPD0gMzQwMDAwKQo+PiArCQlyZXR1cm4gZmFsc2U7Cj4+
ICsKPj4gKwlyZXR1cm4gdHJ1ZTsKPj4gK30KPj4gKwo+PiAgLyoKPj4gICAqIEhETUkyLjAgU3Bl
Y2lmaWVzIHRoZSBmb2xsb3dpbmcgcHJvY2VkdXJlIGZvciBIaWdoIFRNRFMgQml0IFJhdGVzOgo+
PiAgICogLSBUaGUgU291cmNlIHNoYWxsIHN1c3BlbmQgdHJhbnNtaXNzaW9uIG9mIHRoZSBUTURT
IGNsb2NrIGFuZCBkYXRhCj4+IEBAIC0xMDU1LDcgKzEwODAsNyBAQCB2b2lkIGR3X2hkbWlfc2V0
X2hpZ2hfdG1kc19jbG9ja19yYXRpbyhzdHJ1Y3QgZHdfaGRtaSAqaGRtaSkKPj4gIAl1bnNpZ25l
ZCBsb25nIG10bWRzY2xvY2sgPSBoZG1pLT5oZG1pX2RhdGEudmlkZW9fbW9kZS5tdG1kc2Nsb2Nr
Owo+PiAgCj4+ICAJLyogQ29udHJvbCBmb3IgVE1EUyBCaXQgUGVyaW9kL1RNRFMgQ2xvY2stUGVy
aW9kIFJhdGlvICovCj4+IC0JaWYgKGhkbWktPmNvbm5lY3Rvci5kaXNwbGF5X2luZm8uaGRtaS5z
Y2RjLnN1cHBvcnRlZCkgewo+PiArCWlmIChkd19oZG1pX3N1cHBvcnRfc2NkYyhoZG1pKSkgewo+
PiAgCQlpZiAobXRtZHNjbG9jayA+IEhETUkxNF9NQVhfVE1EU0NMSykKPj4gIAkJCWRybV9zY2Rj
X3NldF9oaWdoX3RtZHNfY2xvY2tfcmF0aW8oaGRtaS0+ZGRjLCAxKTsKPj4gIAkJZWxzZQo+PiBA
QCAtMTU3OSw4ICsxNjA0LDkgQEAgc3RhdGljIHZvaWQgaGRtaV9hdl9jb21wb3NlcihzdHJ1Y3Qg
ZHdfaGRtaSAqaGRtaSwKPj4gIAo+PiAgCS8qIFNldCB1cCBIRE1JX0ZDX0lOVklEQ09ORiAqLwo+
PiAgCWludl92YWwgPSAoaGRtaS0+aGRtaV9kYXRhLmhkY3BfZW5hYmxlIHx8Cj4+IC0JCSAgIHZt
b2RlLT5tdG1kc2Nsb2NrID4gSERNSTE0X01BWF9UTURTQ0xLIHx8Cj4+IC0JCSAgIGhkbWlfaW5m
by0+c2NkYy5zY3JhbWJsaW5nLmxvd19yYXRlcyA/Cj4+ICsJCSAgIChkd19oZG1pX3N1cHBvcnRf
c2NkYyhoZG1pKSAmJgo+PiArCQkgICAgKHZtb2RlLT5tdG1kc2Nsb2NrID4gSERNSTE0X01BWF9U
TURTQ0xLIHx8Cj4+ICsJCSAgICAgaGRtaV9pbmZvLT5zY2RjLnNjcmFtYmxpbmcubG93X3JhdGVz
KSkgPwo+PiAgCQlIRE1JX0ZDX0lOVklEQ09ORl9IRENQX0tFRVBPVVRfQUNUSVZFIDoKPj4gIAkJ
SERNSV9GQ19JTlZJRENPTkZfSERDUF9LRUVQT1VUX0lOQUNUSVZFKTsKPiAKPiAKPiBUaGUgY29u
ZGl0aW9uIGlzIGhhcmQgdG8gcmVhZCwgYnV0IEkgaGF2ZSBubyBpZGVhIGF0bSBob3cgbWFrZSBp
dAo+IGNvbXBhY3QgYW5kIHByZXR0eSA6KQoKSSBtYWRlIG15IGJlc3QgdG8gbWFrZSBpdCBiYXJl
bHkgcmVhZGFibGUuLi4KCldlIG1heSBuZWVkIHRvIHJld29yZCB0aGlzIGNvbmRpdGlvbiBzaW5j
ZSBvbiB0aGUgRFctSE1JIGluIHRoZSBBbGx3aW5uZXIKSDYsIHRoaXMgaXMgbm8gbW9yZSBuZWVk
ZWQgZm9yIHNjcmFtYmxpbmcgIQoKPiAKPiBBbnl3YXk6Cj4gCj4gUmV2aWV3ZWQtYnk6IEFuZHJ6
ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+Cj4gCj4gCj4gQXMgSSByZW1lbWJlciB5b3Ug
Y2FuIHF1ZXVlIGl0IHRvIGRybS1taXNjLCBpZiBub3QgSSBjYW4gZG8gaXQsIGp1c3QgbGV0Cj4g
bWUga25vdy4KCkkgY2FuIGFuZCBJJ20gcXVldWluZyBpdCByaWdodCBub3csIHRoYW5rcyBmb3Ig
dGhlIHJldmlldyAhCgpOZWlsCgo+IAo+IAo+IMKgLS0KPiBSZWdhcmRzCj4gQW5kcnplago+IAo+
IAo+IAo+PiAgCj4+IEBAIC0xNjQ2LDcgKzE2NzIsNyBAQCBzdGF0aWMgdm9pZCBoZG1pX2F2X2Nv
bXBvc2VyKHN0cnVjdCBkd19oZG1pICpoZG1pLAo+PiAgCX0KPj4gIAo+PiAgCS8qIFNjcmFtYmxp
bmcgQ29udHJvbCAqLwo+PiAtCWlmIChoZG1pX2luZm8tPnNjZGMuc3VwcG9ydGVkKSB7Cj4+ICsJ
aWYgKGR3X2hkbWlfc3VwcG9ydF9zY2RjKGhkbWkpKSB7Cj4+ICAJCWlmICh2bW9kZS0+bXRtZHNj
bG9jayA+IEhETUkxNF9NQVhfVE1EU0NMSyB8fAo+PiAgCQkgICAgaGRtaV9pbmZvLT5zY2RjLnNj
cmFtYmxpbmcubG93X3JhdGVzKSB7Cj4+ICAJCQkvKgo+IAo+IAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0
CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
