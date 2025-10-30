Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9EE4CCF9F8
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Oct 2025 08:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vS7l8mXH8IO9uI7lDXt44hAPMrBZxhci4SiVii1zTHw=; b=gB7mNAwP7pxtmu
	jand0PtdXcbkTaidfydP4KPIoOM7JpfnXddmOPwKpQE0FWEwMprODVqPOrVtwAlgQCD4jH8+FNvQ2
	n6xsDzLdNagIfUJsiTQ5zM3cQhJw1qarobT9Tdp/7FS6QX6lF9hPDwlidHn8RuRTA9lTa/1NEunlP
	B+7HPpT4RivMzWfPhtlHLLTtU7iAGKN7uageQrSq/87uyNhSTctFL+rsADmDknUn1MzfTpiKAoI4n
	velouf/Vs7nwB6iId4QNES61BK72VeZhy1O/T4H4bza5yBbUBGD1YzYmPAd50F+YLCmpSg4jrQQ5B
	v0CgSesupFKQm+/1DOzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOI0-00000003mQo-42ho;
	Thu, 30 Oct 2025 08:45:48 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOHx-00000003mPl-0jnz
	for linux-amlogic@lists.infradead.org;
	Thu, 30 Oct 2025 08:45:47 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-475dc6029b6so8233545e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 30 Oct 2025 01:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761813943; x=1762418743; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ZpYo4qCdvkOxQDRmJbeXBNTq2tyicbeHh7QBXTUQpc=;
        b=hIeug/o/lkJSpw3cHS4TojYtNYmqiAWQGnhlZU2XwUz/GUJt3go9U8pg/0aA0pguAJ
         mqFcuruUAmzspuoctgksI8hGZnFkg9Dviz3IqayfJFV8VYV21FQfd3VG9K6xa+HBwJ5B
         JDU8V98VLDxZTD6JJp7odvhN74d3narQApDAmg8iCvheD0V9xwwyzV9KrBMwfOTMRP5o
         qZYzGcXBZh/1n+9v8zftQFpYRi7MSeyHC//6zQMnXzjebUUyEm2nhJ1coT/ObrWE8bfY
         SoUPKiHRuQaHG1iV5j+WRfQo6qdTmsPsx7s5aOrSmzKVJCVB0NMjvDL6GhAz3lO1//cn
         4RZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761813943; x=1762418743;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/ZpYo4qCdvkOxQDRmJbeXBNTq2tyicbeHh7QBXTUQpc=;
        b=TzRrrai2DxD9ejXyKexHRoVBU4XdWv1s1IifxLc2VO0rGwW1lCnB/NAgcY5IivGjfO
         0VCvAHUvO9HQjeJJt5uIG+rWrKMKrPjJlGyuCW1nR7WyzXfx3s8AN6baoFUmRNSaAweg
         nE6Ygl+c2dL1i7HXuslAJkBOTJWFyGT3HXfCjAD4ZTW7uHBfG/PwqUkMEEYW8HEa8kYI
         wisyjr8L/EO3BX7HwPBcyULR7b3AO24Mpwzq0jEGuKEvhZ2F5r+da8WSVq+pFi7F7DTN
         vbClx0WAoMk/A42vV0Mg/PEkqIem2fypGsE7l/Jjfdmdvm42C6oNdW9gKbI6Cq1tX7sc
         4tMg==
X-Forwarded-Encrypted: i=1; AJvYcCWIp4+mNNupCNMe9qLaNNK8u/wnLvI6YVq5GtBq1LeKx0W53oaEEgLfyBqC6FLo6Lofd8FyUjHGAao05cLs@lists.infradead.org
X-Gm-Message-State: AOJu0YwyqcQ0I+X77/600neECMQXDv2YJb66oJeYwZO7fZ7ruO4/W1Gl
	Gz6Nl1ToEMeJFb1t3zahGEYG47jihAWZjVXgoxYlU0TC2xafdKT+AfcM6geNpB/SUUI=
X-Gm-Gg: ASbGnctPoMvppj6eB1g8v8vBt28CM50se7nvcMUJZAWMw5XvOGpOfJGyB2oC1VVpEVa
	KBp1FGal69ZtVKCNJoYm/M4srzBnjEk0R6THqK5IwideqRX8YIgeg0jwy+ZMkf0YJTq1W8UOkIP
	+gDFT0+uvpR+OMO38wZuz6NRw64DuxYoXwgTLDXYk0EKzQf4ELsLy28n2MPLPtrKbScEByvaNR4
	BT1xwfu0/O3uqP2TFGw4meklROxmyoFJnBGcUmLyOEro0sVARPkNFG/41OHZnGcvmFmnh5flyNz
	L5osmvDqIGj7sojC7BlfnRp95lnV9rWJvcTFqtyBY8SWD0gkxgKbw/HWNMWmMZkvHf9jg+udVCJ
	3x7n14TyrB9U/HWOGEeCRarlEEsK4PA5SZo0J3M3GNegGgn01Wbvb42ZGNn6UO4liqP9/n4toQw
	==
X-Google-Smtp-Source: AGHT+IFRqKns2v7+EvpR5bRe/kFdtX/HOMybFPiYMJcDt+PidpgK4dhZ2EOX0xqyN5JCUyI4UtPn5g==
X-Received: by 2002:a05:600c:608b:b0:475:de12:d3b2 with SMTP id 5b1f17b1804b1-4771e1f1dc2mr56796015e9.36.1761813943196;
        Thu, 30 Oct 2025 01:45:43 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:64bd:9043:d05:7012])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4771902fa8dsm61122685e9.8.2025.10.30.01.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 01:45:42 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>,  Neil
 Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: amlogic: Optimize PLL enable timing
In-Reply-To: <61c2738d-7291-4a45-aa73-f18528c81ba8@amlogic.com> (Chuan Liu's
	message of "Wed, 22 Oct 2025 22:07:43 +0800")
References: <20251022-optimize_pll_driver-v1-0-a275722fb6f4@amlogic.com>
	<20251022-optimize_pll_driver-v1-2-a275722fb6f4@amlogic.com>
	<1j347b403i.fsf@starbuckisacylon.baylibre.com>
	<61c2738d-7291-4a45-aa73-f18528c81ba8@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 30 Oct 2025 09:45:41 +0100
Message-ID: <1jsef0ydze.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_014545_277408_F9E558A7 
X-CRM114-Status: GOOD (  31.41  )
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

T24gV2VkIDIyIE9jdCAyMDI1IGF0IDIyOjA3LCBDaHVhbiBMaXUgPGNodWFuLmxpdUBhbWxvZ2lj
LmNvbT4gd3JvdGU6Cgo+IEhpIEplcm9tZSwKPgo+Cj4gT24gMTAvMjIvMjAyNSA4OjAxIFBNLCBK
ZXJvbWUgQnJ1bmV0IHdyb3RlOgo+PiBbIEVYVEVSTkFMIEVNQUlMIF0KPj4gT24gV2VkIDIyIE9j
dCAyMDI1IGF0IDE0OjU4LCBDaHVhbiBMaXUgdmlhIEI0IFJlbGF5Cj4+IDxkZXZudWxsK2NodWFu
LmxpdS5hbWxvZ2ljLmNvbUBrZXJuZWwub3JnPiB3cm90ZToKPj4gCj4+PiBGcm9tOiBDaHVhbiBM
aXUgPGNodWFuLmxpdUBhbWxvZ2ljLmNvbT4KPj4+Cj4+PiBBbWxvZ2ljIFBMTCBsb2NraW5nIHBy
b2NlZHVyZSBzaGFsbCBmb2xsb3cgdGhpcyB0aW1pbmcgc2VxdWVuY2U6Cj4+PiAxIEFzc2VydCBy
ZXNldCBzaWduYWw6IEVuc3VyZXMgUExMIGNpcmN1aXRzIGVudGVyIGtub3duIGluaXRpYWwgc3Rh
dGUuCj4+PiAyIERlYXNzZXJ0IGxvY2stZGV0ZWN0IHNpZ25hbDogQXZvaWQgbG9jayBzaWduYWwg
ZmFsc2UgdHJpZ2dlcmluZy4KPj4+IDMgQXNzZXJ0IGVuYWJsZSBzaWduYWw6IFBvd2VycyB1cCBQ
TEwgc3VwcGx5Lgo+Pj4gNCB1ZGVsYXkoMjApOiBXYWl0IGZvciBCYW5kZ2FwIGFuZCBMRE8gdG8g
cG93ZXIgdXAgYW5kIHN0YWJpbGl6ZS4KPj4+IDUgRW5hYmxlIHNlbGYtYWRhcHRhdGlvbiBjdXJy
ZW50IG1vZHVsZSAoT3B0aW9uYWwpLgo+Pj4gNiBEZWFzc2VydCByZXNldCBzaWduYWw6IFJlbGVh
c2VzIFBMTCB0byBiZWdpbiBub3JtYWwgb3BlcmF0aW9uLgo+Pj4gNyB1ZGVsYXkoMjApOiBXYWl0
IGZvciBQTEwgbG9vcCBzdGFiaWxpemF0aW9uLgo+Pj4gOCBBc3NlcnQgbG9jay1kZXRlY3Qgc2ln
bmFsOiBsb2NrIGRldGVjdGlvbiBjaXJjdWl0IHN0YXJ0cyB0byB3b3JrLgo+Pj4gOSBNb25pdG9y
IGxvY2sgc3RhdHVzIHNpZ25hbDogV2FpdCBmb3IgUExMIGxvY2sgY29tcGxldGlvbi4KPj4+IDEw
IElmIHRoZSBQTEwgZmFpbHMgdG8gbG9jaywgaXQgc2hvdWxkIGJlIGRpc2FibGVkLCBUaGlzIG1h
a2VzIHRoZQo+Pj4gbG9naWMgbW9yZSBjb21wbGV0ZSwgYW5kIGFsc28gaGVscHMgc2F2ZSB1bm5l
Y2Vzc2FyeSBwb3dlciBjb25zdW1wdGlvbgo+Pj4gd2hlbiB0aGUgUExMIGlzIG1hbGZ1bmN0aW9u
aW5nLgo+PiBJcyB0aGlzIGFwcGxpY2FibGUgdG8gYWxsIHN1cHBvcnRlZCBTb0MgPyBmcm9tIG1l
c29uOCB0byBzNCA/Cj4KPiBZZXMuCj4KPj4gV2hhdCBkaWQgeW91IHRlc3QgPwo+Cj4gV2UgaGF2
ZSB0ZXN0ZWQgdGhpcyBvbiB0aGUgRzEyQSBhbmQgbGF0ZXIgU29DcyB3aXRob3V0IGFueSBpc3N1
ZXMuCj4gSW50ZXJuYWxseSwgd2UgaGF2ZSBhZG9wdGVkIHRoaXMgY29uZmlndXJhdGlvbiBzZXF1
ZW5jZSBpbiBvdXIgYnJhbmNoCj4gYW5kIHZlcmlmaWVkIGl0IG9uIGEgbGFyZ2UgbnVtYmVyIG9m
IFNvQ3MuCj4KPiBXZSBoYXZlbid0IG1haW50YWluZWQgdGhlIG1lc29uIHNlcmllcyBmb3IgYSB3
aGlsZSwgc28gaXQgaGFzbid0IGJlZW4KPiBpbmNsdWRlZCBpbiBvdXIgcmVjZW50IHZhbGlkYXRp
b24uIEkgYWxzbyBkb24ndCBoYXZlIGFueSBtZXNvbiBib2FyZHMKPiBvbiBoYW5kLiBJZiB5b3Ug
aGF2ZSBvbmUgYXZhaWxhYmxlLCBpdCB3b3VsZCBiZSBhcHByZWNpYXRlZCBpZiB5b3UKPiBjb3Vs
ZCBoZWxwIHZlcmlmeSB0aGlzLCBUaGFua3MuCgpJdCdzIHZlcnkgaW50ZXJyZXN0aW5nIHRoYXQg
eW91IGFzayB0aGUgY29tbXVuaXR5IHRvIHRlc3QgYW5kIHZhbGlkYXRlCmNoaXBzIHNvbGQgYnkg
eW91ciBjb21wYWdueSwgY2hpcCB0aGF0IGFyZSBzdGlsbCBzb2xkICp0b2RheSogYW5kIHJlYWRp
bGl0eQphdmFpbGFibGUgb24gbW9zdCBtYXJrZXQgcGxhY2VzLgoKSSdkIGJlIGhhcHB5IHRvIGZv
cndhcmQgeW91IGEgZmV3IGxpbmtzIGlmIHRoYXQgaGVscHMuCgo+Cj4gVGhpcyBQTEwgc2VxdWVu
Y2UgYWRqdXN0bWVudCBmb3IgbWVzb24gU29DcyBhZGRzIGEgMjB1cyBkZWxheSBhZnRlcgo+IGVu
YWJsaW5nIHRoZSBQTEwgYW5kIGFmdGVyIHJlbGVhc2luZyBpdHMgcmVzZXQuIFRoZSBkZWxheSBh
ZGRyZXNzZXMKPiByYXJlIFBMTCBsb2NrIGZhaWx1cmVzIG9ic2VydmVkIHVuZGVyIGxvdyB0ZW1w
ZXJhdHVyZXMuIEFzIGEgcmVzdWx0LAo+IGl0IHNsaWdodGx5IGluY3JlYXNlcyBlbmFibGUgdGlt
ZSBidXQgaW1wcm92ZXMgc3RhYmlsaXR5Lgo+Cj4+IAo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IENo
dWFuIExpdSA8Y2h1YW4ubGl1QGFtbG9naWMuY29tPgo+Pj4gLS0tCj4+PiAgIGRyaXZlcnMvY2xr
L21lc29uL2Nsay1wbGwuYyB8IDY4ICsrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0t
LS0tLS0tLS0tLQo+Pj4gICAxIGZpbGUgY2hhbmdlZCwgNDAgaW5zZXJ0aW9ucygrKSwgMjggZGVs
ZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL21lc29uL2Nsay1wbGwu
YyBiL2RyaXZlcnMvY2xrL21lc29uL2Nsay1wbGwuYwo+Pj4gaW5kZXggYjA3ZTFlYjE5ZDEyLi4y
NmM4M2RiNDg3ZTggMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2Nsay9tZXNvbi9jbGstcGxsLmMK
Pj4+ICsrKyBiL2RyaXZlcnMvY2xrL21lc29uL2Nsay1wbGwuYwo+Pj4gQEAgLTM1Myw2ICszNTMs
MjMgQEAgc3RhdGljIGludCBtZXNvbl9jbGtfcGNpZV9wbGxfZW5hYmxlKHN0cnVjdCBjbGtfaHcg
Kmh3KQo+Pj4gICAgICAgIHJldHVybiAtRUlPOwo+Pj4gICB9Cj4+Pgo+Pj4gK3N0YXRpYyB2b2lk
IG1lc29uX2Nsa19wbGxfZGlzYWJsZShzdHJ1Y3QgY2xrX2h3ICpodykKPj4+ICt7Cj4+PiArICAg
ICBzdHJ1Y3QgY2xrX3JlZ21hcCAqY2xrID0gdG9fY2xrX3JlZ21hcChodyk7Cj4+PiArICAgICBz
dHJ1Y3QgbWVzb25fY2xrX3BsbF9kYXRhICpwbGwgPSBtZXNvbl9jbGtfcGxsX2RhdGEoY2xrKTsK
Pj4+ICsKPj4+ICsgICAgIC8qIFB1dCB0aGUgcGxsIGlzIGluIHJlc2V0ICovCj4+PiArICAgICBp
ZiAoTUVTT05fUEFSTV9BUFBMSUNBQkxFKCZwbGwtPnJzdCkpCj4+PiArICAgICAgICAgICAgIG1l
c29uX3Bhcm1fd3JpdGUoY2xrLT5tYXAsICZwbGwtPnJzdCwgMSk7Cj4+PiArCj4+PiArICAgICAv
KiBEaXNhYmxlIHRoZSBwbGwgKi8KPj4+ICsgICAgIG1lc29uX3Bhcm1fd3JpdGUoY2xrLT5tYXAs
ICZwbGwtPmVuLCAwKTsKPj4+ICsKPj4+ICsgICAgIC8qIERpc2FibGUgUExMIGludGVybmFsIHNl
bGYtYWRhcHRpb24gY3VycmVudCBtb2R1bGUgKi8KPj4+ICsgICAgIGlmIChNRVNPTl9QQVJNX0FQ
UExJQ0FCTEUoJnBsbC0+Y3VycmVudF9lbikpCj4+PiArICAgICAgICAgICAgIG1lc29uX3Bhcm1f
d3JpdGUoY2xrLT5tYXAsICZwbGwtPmN1cnJlbnRfZW4sIDApOwo+Pj4gK30KPj4gSSBkb24ndCBn
ZXQgd2h5IHlvdSBtb3ZlZCB0aGF0IGNvZGUgYXJvdW5kIGFuZCBtYWtlIHRoZSBkaWZmIGV2ZW4g
aGFyZGVyCj4+IHRvIHJlYWQKPgo+IFNvcnJ5IGFib3V0IHRoZSBtaXNhbGlnbmVkIGZvcm1hdHRp
bmcuIEkgbW92ZWQgbWVzb25fY2xrX3BsbF9kaXNhYmxlKCkKPiBlYXJsaWVyIGluIHRoZSBjb2Rl
IGJlY2F1c2UgSSBhZGRlZCBoYW5kbGluZyBmb3IgUExMIGxvY2sgZmFpbHVyZXMsCj4gd2hpY2gg
dW5pbnRlbnRpb25hbGx5IGJyb2tlIHRoZSBhbGlnbm1lbnQuCj4KPiBJJ2xsIHNwbGl0IHRoZSBQ
TEwgbG9jayBmYWlsdXJlIGhhbmRsaW5nIGludG8gYSBzZXBhcmF0ZSBwYXRjaCBpbiB0aGUKPiBu
ZXh0IHZlcnNpb24gdG8gbWFrZSByZXZpZXcgZWFzaWVyLgo+Cj4+IAo+Pj4gKwo+Pj4gICBzdGF0
aWMgaW50IG1lc29uX2Nsa19wbGxfZW5hYmxlKHN0cnVjdCBjbGtfaHcgKmh3KQo+Pj4gICB7Cj4+
PiAgICAgICAgc3RydWN0IGNsa19yZWdtYXAgKmNsayA9IHRvX2Nsa19yZWdtYXAoaHcpOwo+Pj4g
QEAgLTM2Niw1MyArMzgzLDQ4IEBAIHN0YXRpYyBpbnQgbWVzb25fY2xrX3BsbF9lbmFibGUoc3Ry
dWN0IGNsa19odyAqaHcpCj4+PiAgICAgICAgaWYgKE1FU09OX1BBUk1fQVBQTElDQUJMRSgmcGxs
LT5yc3QpKQo+Pj4gICAgICAgICAgICAgICAgbWVzb25fcGFybV93cml0ZShjbGstPm1hcCwgJnBs
bC0+cnN0LCAxKTsKPj4+Cj4+PiArICAgICAvKiBEaXNhYmxlIHRoZSBQTEwgbG9jay1kZXRlY3Qg
bW9kdWxlICovCj4+PiArICAgICBpZiAoTUVTT05fUEFSTV9BUFBMSUNBQkxFKCZwbGwtPmxfZGV0
ZWN0KSkKPj4+ICsgICAgICAgICAgICAgbWVzb25fcGFybV93cml0ZShjbGstPm1hcCwgJnBsbC0+
bF9kZXRlY3QsIDEpOwo+Pj4gKwo+Pj4gICAgICAgIC8qIEVuYWJsZSB0aGUgcGxsICovCj4+PiAg
ICAgICAgbWVzb25fcGFybV93cml0ZShjbGstPm1hcCwgJnBsbC0+ZW4sIDEpOwo+Pj4gLQo+Pj4g
LSAgICAgLyogVGFrZSB0aGUgcGxsIG91dCByZXNldCAqLwo+Pj4gLSAgICAgaWYgKE1FU09OX1BB
Uk1fQVBQTElDQUJMRSgmcGxsLT5yc3QpKQo+Pj4gLSAgICAgICAgICAgICBtZXNvbl9wYXJtX3dy
aXRlKGNsay0+bWFwLCAmcGxsLT5yc3QsIDApOwo+Pj4gKyAgICAgLyogV2FpdCBmb3IgQmFuZGdh
cCBhbmQgTERPIHRvIHBvd2VyIHVwIGFuZCBzdGFiaWxpemUgKi8KPj4+ICsgICAgIHVkZWxheSgy
MCk7Cj4+Pgo+Pj4gICAgICAgIC8qCj4+PiAgICAgICAgICogQ29tcGFyZWQgd2l0aCB0aGUgcHJl
dmlvdXMgU29Dcywgc2VsZi1hZGFwdGlvbiBjdXJyZW50IG1vZHVsZQo+Pj4gICAgICAgICAqIGlz
IG5ld2x5IGFkZGVkIGZvciBBMSwga2VlcCB0aGUgbmV3IHBvd2VyLW9uIHNlcXVlbmNlIHRvIGVu
YWJsZSB0aGUKPj4+ICAgICAgICAgKiBQTEwuIFRoZSBzZXF1ZW5jZSBpczoKPj4+IC0gICAgICAq
IDEuIGVuYWJsZSB0aGUgcGxsLCBkZWxheSBmb3IgMTB1cwo+Pj4gKyAgICAgICogMS4gZW5hYmxl
IHRoZSBwbGwsIGVuc3VyZSBhIG1pbmltdW0gZGVsYXkgb2YgMTDOvHMKPj4+ICAgICAgICAgKiAy
LiBlbmFibGUgdGhlIHBsbCBzZWxmLWFkYXB0aW9uIGN1cnJlbnQgbW9kdWxlLCBkZWxheSBmb3Ig
NDB1cwo+Pj4gICAgICAgICAqIDMuIGVuYWJsZSB0aGUgbG9jayBkZXRlY3QgbW9kdWxlCj4+PiAg
ICAgICAgICovCj4+PiAgICAgICAgaWYgKE1FU09OX1BBUk1fQVBQTElDQUJMRSgmcGxsLT5jdXJy
ZW50X2VuKSkgewo+Pj4gLSAgICAgICAgICAgICB1ZGVsYXkoMTApOwo+Pj4gICAgICAgICAgICAg
ICAgbWVzb25fcGFybV93cml0ZShjbGstPm1hcCwgJnBsbC0+Y3VycmVudF9lbiwgMSk7Cj4+PiAt
ICAgICAgICAgICAgIHVkZWxheSg0MCk7Cj4+PiAtICAgICB9Cj4+PiAtCj4+PiAtICAgICBpZiAo
TUVTT05fUEFSTV9BUFBMSUNBQkxFKCZwbGwtPmxfZGV0ZWN0KSkgewo+Pj4gLSAgICAgICAgICAg
ICBtZXNvbl9wYXJtX3dyaXRlKGNsay0+bWFwLCAmcGxsLT5sX2RldGVjdCwgMSk7Cj4+PiAtICAg
ICAgICAgICAgIG1lc29uX3Bhcm1fd3JpdGUoY2xrLT5tYXAsICZwbGwtPmxfZGV0ZWN0LCAwKTsK
Pj4+ICsgICAgICAgICAgICAgdWRlbGF5KDIwKTsKPj4+ICAgICAgICB9Cj4+Pgo+Pj4gLSAgICAg
aWYgKG1lc29uX2Nsa19wbGxfd2FpdF9sb2NrKGh3KSkKPj4+IC0gICAgICAgICAgICAgcmV0dXJu
IC1FSU87Cj4+PiArICAgICAvKiBUYWtlIHRoZSBwbGwgb3V0IHJlc2V0ICovCj4+PiArICAgICBp
ZiAoTUVTT05fUEFSTV9BUFBMSUNBQkxFKCZwbGwtPnJzdCkpCj4+PiArICAgICAgICAgICAgIG1l
c29uX3Bhcm1fd3JpdGUoY2xrLT5tYXAsICZwbGwtPnJzdCwgMCk7Cj4+Pgo+Pj4gLSAgICAgcmV0
dXJuIDA7Cj4+PiAtfQo+Pj4gKyAgICAgLyogV2FpdCBmb3IgUExMIGxvb3Agc3RhYmlsaXphdGlv
biAqLwo+Pj4gKyAgICAgdWRlbGF5KDIwKTsKPj4+Cj4+PiAtc3RhdGljIHZvaWQgbWVzb25fY2xr
X3BsbF9kaXNhYmxlKHN0cnVjdCBjbGtfaHcgKmh3KQo+Pj4gLXsKPj4+IC0gICAgIHN0cnVjdCBj
bGtfcmVnbWFwICpjbGsgPSB0b19jbGtfcmVnbWFwKGh3KTsKPj4+IC0gICAgIHN0cnVjdCBtZXNv
bl9jbGtfcGxsX2RhdGEgKnBsbCA9IG1lc29uX2Nsa19wbGxfZGF0YShjbGspOwo+Pj4gKyAgICAg
LyogRW5hYmxlIHRoZSBsb2NrLWRldGVjdCBtb2R1bGUgKi8KPj4+ICsgICAgIGlmIChNRVNPTl9Q
QVJNX0FQUExJQ0FCTEUoJnBsbC0+bF9kZXRlY3QpKQo+Pj4gKyAgICAgICAgICAgICBtZXNvbl9w
YXJtX3dyaXRlKGNsay0+bWFwLCAmcGxsLT5sX2RldGVjdCwgMCk7Cj4+Pgo+Pj4gLSAgICAgLyog
UHV0IHRoZSBwbGwgaXMgaW4gcmVzZXQgKi8KPj4+IC0gICAgIGlmIChNRVNPTl9QQVJNX0FQUExJ
Q0FCTEUoJnBsbC0+cnN0KSkKPj4+IC0gICAgICAgICAgICAgbWVzb25fcGFybV93cml0ZShjbGst
Pm1hcCwgJnBsbC0+cnN0LCAxKTsKPj4+ICsgICAgIGlmIChtZXNvbl9jbGtfcGxsX3dhaXRfbG9j
ayhodykpIHsKPj4+ICsgICAgICAgICAgICAgLyogZGlzYWJsZSBQTEwgd2hlbiBQTEwgbG9jayBm
YWlsZWQuICovCj4+PiArICAgICAgICAgICAgIG1lc29uX2Nsa19wbGxfZGlzYWJsZShodyk7Cj4+
PiArICAgICAgICAgICAgIHByX3dhcm4oIiVzOiBQTEwgbG9jayBmYWlsZWQhISFcbiIsIGNsa19o
d19nZXRfbmFtZShodykpOwo+Pj4KPj4+IC0gICAgIC8qIERpc2FibGUgdGhlIHBsbCAqLwo+Pj4g
LSAgICAgbWVzb25fcGFybV93cml0ZShjbGstPm1hcCwgJnBsbC0+ZW4sIDApOwo+Pj4gKyAgICAg
ICAgICAgICByZXR1cm4gLUVJTzsKPj4+ICsgICAgIH0KPj4+Cj4+PiAtICAgICAvKiBEaXNhYmxl
IFBMTCBpbnRlcm5hbCBzZWxmLWFkYXB0aW9uIGN1cnJlbnQgbW9kdWxlICovCj4+PiAtICAgICBp
ZiAoTUVTT05fUEFSTV9BUFBMSUNBQkxFKCZwbGwtPmN1cnJlbnRfZW4pKQo+Pj4gLSAgICAgICAg
ICAgICBtZXNvbl9wYXJtX3dyaXRlKGNsay0+bWFwLCAmcGxsLT5jdXJyZW50X2VuLCAwKTsKPj4+
ICsgICAgIHJldHVybiAwOwo+Pj4gICB9Cj4+Pgo+Pj4gICBzdGF0aWMgaW50IG1lc29uX2Nsa19w
bGxfc2V0X3JhdGUoc3RydWN0IGNsa19odyAqaHcsIHVuc2lnbmVkIGxvbmcgcmF0ZSwKPj4gLS0K
Pj4gSmVyb21lCgotLSAKSmVyb21lCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
