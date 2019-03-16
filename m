Return-Path: <SRS0=+19+=RT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93192C43381
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 Mar 2019 14:37:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 620EE21904
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 Mar 2019 14:37:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s8+zdcVF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="QXZxU8pZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 620EE21904
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:To:
	MIME-Version:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zQo41LJMcKn5j+umIT/aATP9LbxgkUyLsGRX79m5za8=; b=s8+zdcVFIXY0Jc
	S6zl7Qiz3gMqMUOUO+m70C25NnXHlE3mFGxg7Pq5kk0JQlyj6oS9kl3g/7yEebp1dF+rlpEb6Nzsj
	7KvBNszCtWnwXBOMLDyRF6i62lramjzfSBQ1AmZXU28pXbykjuZ3ky2B+WEko1zaOkcznKZ2h5crv
	jI/em+8tRZgX0wONmv0bupAJ6EEYsI8MYDyB3VGd9ly0iQ5M0bHXhXHAub6DAMkQM30b+/qs32mBO
	G45BW0lZFxUn4IxavJzSK0a74q/hDgwubRXOUe0EfTS9GbOakccytFIB+g2tFReu7mAcQIMWBftcd
	HveYW4jsNWK9+9OTTnwQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5AQs-0008TO-Is; Sat, 16 Mar 2019 14:37:06 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5AQp-0008Sd-Pq
 for linux-amlogic@lists.infradead.org; Sat, 16 Mar 2019 14:37:05 +0000
Received: by mail-wm1-x344.google.com with SMTP id u10so6078197wmj.5
 for <linux-amlogic@lists.infradead.org>; Sat, 16 Mar 2019 07:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:from:user-agent:mime-version:to:cc:subject
 :references:in-reply-to:content-transfer-encoding;
 bh=EuF9ruvnrcAnzkL0pWYAzpDOU230eEZTjJbK/BXtXUk=;
 b=QXZxU8pZYTR4NWsf7RG2jW/n4SgIY84wlGcMM1NvqMkq3rPEAXXfKg1+xgK+M0CeLy
 k044m1yxWHLgbVV+0Lh/ZlJ5xmxde3MoZf7oyu/rPvza2FHIlv8uGTSpnddWgCvb69St
 0PHXiumshSJV9kOLS1zp6+oAwUbwLXK2vjCbmduclzSrukwc4r9rkHr1TDBsgl65Lxnf
 0CY9jcl0Nq7/CaXugdngDaUR5Wx2WnWLl1Uj/0wtnIrhYssUlpiFNSbVBM0m/tpEoPqY
 P4z0YASKIY6pt+m9rPWr5ra+JqAfk0U39wX7AsvpEg6nVDYQ80vw6FMEfIYVHTKu6BLV
 hkVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
 :cc:subject:references:in-reply-to:content-transfer-encoding;
 bh=EuF9ruvnrcAnzkL0pWYAzpDOU230eEZTjJbK/BXtXUk=;
 b=uYm98Fm6q7rSBgJDXbf/X7dNe8qNQ7iYoACQfLjuDtN5DnKduY9iarulKHZNGeIx1X
 nkwjdD9HAhODuk2Tl9uKxLLuWldXoaHl0gihxVqs9D/42W1i1jd0x3PpyapflNRyQrU+
 8iwS3STgzO0J6avcEWMb7xpGT34sLuA43d+E61hBuvozd7WMT6D1vpHKRrI2KpFYrJEM
 O2YtejU1YsHhTIuoo0Qr7utrHSceYnuzmTOllsCx01zbF71FGkY8CveA9QLsmTR/yylH
 6Uc9VUgBIkfiSfRi/Li98ZVWWzHDuDIL5HA5FCKw6DPaq8TzR78//cckfKHvZYNKy7lu
 pO8w==
X-Gm-Message-State: APjAAAU7Egei9Fwq1k1JvUgC9gCZxtCtDAjEvRf4vQmqSbezlDcHwy+x
 lTd/c+TFScvwPMdvURDBg2BllIBS3nPhow==
X-Google-Smtp-Source: APXvYqx4QkRPRKkZURePfIsE9R9jSRgX7yl45mRAhYOgYdfA2LDG1rjh6NZxbXDKxKHprMbWDyZcAg==
X-Received: by 2002:a1c:38b:: with SMTP id 133mr5529884wmd.26.1552747022144;
 Sat, 16 Mar 2019 07:37:02 -0700 (PDT)
Received: from [192.168.1.77] (176-150-251-154.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id
 o1sm7974757wrj.20.2019.03.16.07.37.01
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 16 Mar 2019 07:37:01 -0700 (PDT)
Message-ID: <5C8D0A0C.4040807@baylibre.com>
Date: Sat, 16 Mar 2019 15:37:00 +0100
From: Neil Armstrong <narmstrong@baylibre.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13;
 rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 8/9] arm64: dts: meson: g12a: Add G12A USB nodes
References: <20190307151342.7381-1-narmstrong@baylibre.com>
 <20190307151342.7381-9-narmstrong@baylibre.com>
 <CAFBinCBC8OcGRSdNTcqPzH6jbWiO1J_9+BcmZmpSJ+uVTjrHUw@mail.gmail.com>
In-Reply-To: <CAFBinCBC8OcGRSdNTcqPzH6jbWiO1J_9+BcmZmpSJ+uVTjrHUw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190316_073703_928508_DB066D62 
X-CRM114-Status: GOOD (  14.78  )
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
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

CgpMZSAxNS8wMy8yMDE5IDIyOjQwLCBNYXJ0aW4gQmx1bWVuc3RpbmdsIGEgw6ljcml0IDoKPiBP
biBUaHUsIE1hciA3LCAyMDE5IGF0IDQ6MTUgUE0gTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdA
YmF5bGlicmUuY29tPiB3cm90ZToKPj4KPj4gVGhpcyBwYXRjaCBhZGRzIHRoZSBub2RlcyBmb3Ig
dGhlIFVTQiBDb21wbGV4IGZvdW5kIGluIHRoZSBBbWxvZ2ljCj4+IEcxMkEgU29DLgo+Pgo+PiBJ
dCBpbmNsdWRlcyB0aGUgOgo+PiAtIDIgVVNCMiBQSFlzCj4+IC0gMSBVU0IzICsgUENJRSBDb21i
byBQSFkKPj4gLSB0aGUgVVNCIEdsdWUgd2l0aCBpdCdzIERXQzIgYW5kIERXQzMgc3ViLW5vZGVz
Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJl
LmNvbT4KPiBSZXZpZXdlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0
aW5nbEBnb29nbGVtYWlsLmNvbT4KPiAKPiBbLi4uXQo+PiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGctdHgtZmlmby1zaXplID0gPDEyOCAxMjggMTYgMTYgMTY+Owo+IEknbSBub3Qg
c3VyZSBhYm91dCB0aGVzZSB2YWx1ZXMgYnV0IGl0IHNlZW1zIHlvdSBoYXZlIGFscmVhZHkgc3Vj
Y2Vzc2Z1bGx5IHRoZW0uCj4gYnVpbGRyb290X29wZW5saW51eF9rZXJuZWxfNC45X2ZiZGV2XzIw
MTgwNzA2IHVzZXMgdGhlIGZvbGxvd2luZwo+IHZhbHVlcyAod2hpY2ggYXJlIGlkZW50aWNhbCB0
byB0aGUgb25lcyBvbiBHWEwvR1hNLCBidXQgdXNpbmcgdGhlCj4gdmFsdWVzIGJlbG93IEkgY291
bGRuJ3QgZ2V0IGR3YzIgdG8gd29yayBvbiBHWEwgd2hlbiBJIHRyaWVkIGl0IGxhc3QpOgo+ICAg
ZGV2X3R4X2ZpZm9fc2l6ZVswXSA9IDEyODsKPiAgIGRldl90eF9maWZvX3NpemVbMV0gPSAxMjg7
Cj4gICBkZXZfdHhfZmlmb19zaXplWzJdID0gMTI4Owo+ICAgZGV2X3R4X2ZpZm9fc2l6ZVszXSA9
IDE2Owo+ICAgZGV2X3R4X2ZpZm9fc2l6ZVs0XSA9IDE2OwoKClNhbWUgZm9yIG1lLCBvbmx5IDwx
MjggMTI4IDE2IDE2IDE2PiB3b3JrZWQgZm9yIG1lLgoKPiAKPiBUaHVzIEknbSBzdGlsbCBnaXZp
bmcgbXkgUmV2aWV3ZWQtYnkgYmFzZWQgb24gdGhlIGFzc3VtcHRpb24gdGhhdCB0aGUKPiBnLXR4
LWZpZm8tc2l6ZSB2YWx1ZXMgeW91IGhhdmUgYXJlIHdvcmtpbmcgKGF0IGxlYXN0IGZvciB5b3Up
CgpJbmRlZWQsIEkgdHJpZWQgdGhlIGFtbG9naWMgdmFsdWVzIHdpdGhvdXQgc3VjY2VzcywgSSBz
dXNwZWN0IHRoZSBkcml2ZXIgdGhleSB1c2UKKHRoZSBTeXNub3BzeXMgb3V0LW9mLXRyZWUgZHJp
dmVyKSB1c2VzIHRoZXNlIHZhbHVlcyBkaWZmZXJlbnRseS4KClRoYW5rcywKTmVpbAoKPiAKPiAK
PiBSZWdhcmRzCj4gTWFydGluCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
