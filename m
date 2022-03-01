Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 764B8C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Mar 2022 08:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hnUQqVdaBhTC6VGFJNlxgEwlqAIrxbwMWKd1C+s/UZw=; b=DE6QhfNE6VdxVG
	qkKG2kS/wCNt96i9DN92er8eCZyJm3zb3MehWltnuAqPD/S/hRVjx0oL5t6VGFgzDolk66LkAWqbl
	5ErgKha/v9YdQayXkk9ELI1CKHrEAtBV27M9+OEX8LqmnUvWM/iBRQdSAlXJUj7KGs/qEgJn9Mltm
	d1EfNHQyg2pD5/F2g9QOzn8xdPlW6bqNyeor5WTTh1nwukZcE4v5qaMs/3tJN1r8h9LD+LD0HFj9j
	R/QdRKNUz9mPajy4lEeW/HoexLAGPqVYXNuzd9X18nlUlvy4z12AqeazVs2WqgZ1xxAYH5KNSeP00
	4gS6CZ9Um4fPNeAdzt5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOxyh-00FcGL-Jw; Tue, 01 Mar 2022 08:35:27 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOxyN-00Fc4U-5R
 for linux-amlogic@lists.infradead.org; Tue, 01 Mar 2022 08:35:08 +0000
Received: by mail-ed1-x52f.google.com with SMTP id bq11so20983275edb.2
 for <linux-amlogic@lists.infradead.org>; Tue, 01 Mar 2022 00:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=581d5D6KA6uGeEFhWJuvM1NIBuXYywCqvyH8LTd14IA=;
 b=btbiwNi69t//ZAp+SKv0Q4ykiUFt5Vcee8OG/aZUV/3/mEL6qCooFVbyDvhieBabec
 CkXz6UGXrke98ZVvQ72UuAMxZwsIfwh+3g3tK2X0k1zbFdUDs/+/OK1fCTFFQOT7UHWN
 z0SGermy1OptrYhdNwG2SjAF8Iy2D/bC8aVmKXNdBID/wURfxVbVE+QyMV5xd5+hVU2P
 7UAkphywTA2sXS8jB/ps9Kcir4h64rEe4PhvIq8Fufb+E0teJ0kR087Xzr14Qd4KJ0DF
 Qzm9enrRJsGu4gGmyGHjbsCTvR55t8XjpjYC+HsSfTFdAdWWiDXozOXw2e3X48KoaVr6
 04YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=581d5D6KA6uGeEFhWJuvM1NIBuXYywCqvyH8LTd14IA=;
 b=EU/d208vRSnv3JX9VXU9Vs/4QIyrxVpS8aUautof5JbcnflykDxSKejnhLX6enTXbZ
 WVescWh0sxrBGcFy+rklz6mnc3LUFl/ziv8U0+sSH/H75H3qDEkiv2AqPRX/TRRJIu3B
 KxKQTzwAQTmFF0kvTlazxsecAOsdoEKQP17V5RLRVIbzk852mH2d7CI/ojwh4xsHdeBQ
 mlI4pSV+FHJnjrAaW8yUAIgsBMI3vbjj64AVNxS/3qWr/dp8z0vfHyUNWkrv9r8k9fAz
 etxUin8vH+8eiwYA+PLAh59qB+voKWiuBYt2sQmGKTPjEV1WgARxEAq9muXlriNOFLos
 +VJQ==
X-Gm-Message-State: AOAM532eauh3EqxQtGz5dLp5GnIlIOWOG81d7M7X+iw+vuEveWOsgnPN
 I9yDfT4CderzbXuH43nlQSLcQQ==
X-Google-Smtp-Source: ABdhPJwubftsKZHHyeS1ZbNkCnU+nk1j6sKjNZ5wyeunS3woMMkfozT4OFVs7GF4Plw+VBgaQ0e1+g==
X-Received: by 2002:aa7:cb96:0:b0:413:8d05:ebc with SMTP id
 r22-20020aa7cb96000000b004138d050ebcmr14581306edt.81.1646123704506; 
 Tue, 01 Mar 2022 00:35:04 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id
 h20-20020a1709060f5400b006d6d54b9203sm1065010ejj.38.2022.03.01.00.35.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 00:35:04 -0800 (PST)
References: <20220228135530.6918-1-yu.tu@amlogic.com>
 <29b34655-f820-39c9-4363-878481cd3f63@baylibre.com>
 <Yh087tJhakKHs88e@kroah.com>
 <8747c5c6-a129-3a26-8ebb-9e21a18236ec@baylibre.com>
 <96dc5932-7a4c-4f92-b33b-bfd7fc4477e8@amlogic.com>
User-agent: mu4e 1.6.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yu Tu <yu.tu@amlogic.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, Jiri
 Slaby <jirislaby@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, kernel test robot
 <lkp@intel.com>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH V3] tty: serial: meson: Fix the compile link error
 reported by kernel test robot
Date: Tue, 01 Mar 2022 09:33:15 +0100
In-reply-to: <96dc5932-7a4c-4f92-b33b-bfd7fc4477e8@amlogic.com>
Message-ID: <1jmtiavznx.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_003507_262673_55ED4FCC 
X-CRM114-Status: GOOD (  13.96  )
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

Ck9uIFR1ZSAwMSBNYXIgMjAyMiBhdCAxNTo0NywgWXUgVHUgPHl1LnR1QGFtbG9naWMuY29tPiB3
cm90ZToKCj4gSGkgTmVpbCwKPgo+IE9uIDIwMjIvMy8xIDE1OjIzLCBOZWlsIEFybXN0cm9uZyB3
cm90ZToKPj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4+IEhpIEdyZWcsCj4+IExlIDI4LzAyLzIwMjIg
w6AgMjI6MjEsIEdyZWcgS3JvYWgtSGFydG1hbiBhIMOpY3JpdMKgOgo+Pj4gT24gTW9uLCBGZWIg
MjgsIDIwMjIgYXQgMDM6MTM6NDhQTSArMDEwMCwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4+Pj4g
SGksCj4+Pj4KPj4+PiBPbiAyOC8wMi8yMDIyIDE0OjU1LCBZdSBUdSB3cm90ZToKPj4+Pj4gRGVz
Y3JpYmVzIHRoZSBjYWxjdWxhdGlvbiBvZiB0aGUgVUFSVCBiYXVkIHJhdGUgY2xvY2sgdXNpbmcg
YSBjbG9jawo+Pj4+PiBmcmFtZS4gRm9yZ290IHRvIGFkZCBpbiBLY29uZmlnIGtlcm5lbCB0ZXN0
IFJvYm90IGNvbXBpbGF0aW9uIGVycm9yCj4+Pj4+IGR1ZSB0byBDT01NT05fQ0xLIGRlcGVuZGVu
Y3kuCj4+Pj4+Cj4+Pj4+IEZpeGVzOiAoInR0eTogc2VyaWFsOm1lc29uOiBEZXNjcmliZXMgdGhl
IGNhbGN1bGF0aW9uIG9mIHRoZSBVQVJUIGJhdWQKPj4+Pj4gcmF0ZSBjbG9jayB1c2luZyBhIGNs
b2NrIGZyYW1l4oCcKQo+Pj4+Cj4+Pj4gQXMgSSBhbHJlYWR5IHJlcGxpZWQgb24gVjIgb2YgdGhp
cyBwYXRjaCwgeW91J3JlIGludml0ZWQgdG8gYXBwbHkgdGhlc2UKPj4+PiBmaXhlcyBkaXJlY3Rs
eQo+Pj4+IG9uIHRoZSBuZXh0IHZlcnNpb24gb2YgeW91ciAiVXNlIENDRiB0byBkZXNjcmliZSB0
aGUgVUFSVCBiYXVkIHJhdGUKPj4+PiBjbG9jayIgcGF0Y2hzZXQKPj4+PiBhbmQgbm90IGFzIGEg
c2VwYXJhdGUgcGF0Y2guCj4+Pgo+Pj4gTm8sIHRoaXMgaXMgYnJva2VuIGluIGxpbnV4LW5leHQg
bm93IGFzIHRoZSBwYXRoIGxpc3RlZCBoZXJlIGlzIGluIG15Cj4+PiB0cmVlIHJpZ2h0IG5vdy4K
Pj4gT2gsIEkgd2Fzbid0IGF3YXJlIHlvdSB0b29rIHRoaXMgcGF0Y2hzZXQuCj4+IAo+Pj4KPj4+
IEkgbmVlZCBhIGZpeCBmb3IgaXQsIG9yIEkgY2FuIHJldmVydCB0aGUgb3JpZ2luYWwuCj4+IFBs
ZWFzZSByZXZlcnQgdGhlIHdob2xlIHBhdGNoc2V0LCBpdCdzIG5vdCByZWFkeSB5ZXQsIG5laXRo
ZXIgZnVsbHkgCj4+IHJldmlld2VkIGFuZHMgYnVnZ3kKPj4gb24gb2xkIFNvQ3MuCj4gSSBoYXZl
IHRlc3RlZCB0aGF0IHRoZXJlIGlzIG5vIHByb2JsZW0gd2l0aCBHMTJBIGFuZCBTNCBib2FyZHMu
IENhbiBJIG1lcmdlCj4gdGhlbSBmaXJzdCBhbmQgZml4IHRoZW0gbGF0ZXIgaWYgdGhlcmUgaXMg
YW55IHByb2JsZW0/CgpUaGF0J3MgY2FsbGVkIGEgcmVncmVzc2lvbi4gVGhhdCBpcyBub3QgaG93
IHdlIGRvIHRoaW5ncyBpbiBtYWlubGluZQpUaGVyZSBpcyBzdGlsbCBhIGxvdCBvZiBwZW9wbGUg
dXNpbmcgR1hMIGJvYXJkcy4gVGhvc2UgYXJlIHN0aWxsIHNvbGQgZXZlbi4KCj4+IFRoYW5rcywK
Pj4gTmVpbAo+PiAKPj4+Cj4+PiB0aGFua3MsCj4+Pgo+Pj4gZ3JlZyBrLWgKPj4gCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBt
YWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
