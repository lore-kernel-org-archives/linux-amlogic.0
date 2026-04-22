Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A5EF9B608
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Apr 2026 10:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:References:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vb92rHX/tNSWO54qfA2cFx12n1TnF3HYkaDMFYKBUMA=; b=HHQZy6R7cOMyzNsczVfrW9ccHl
	F4gV+JVkoViC1DREESxtlacmiZxkrtcO6+F1AvI+jxjPoB6IMTw8ytfdwPOGq0YIO1RvXrAysbMxd
	blaOx3v5VI5OlUGe1loizKJHvfI7kWre00A63D4TYdYM6vCo8PU+Lkqg0n2I/vtETq7AKsOYMQY9G
	uz7WJVa/XMu/cd2b+Hl8QcO7IGgWEpjBJbs84t8EXn2OsiMnSkYvKTmffx/HZ2/wJsP/6AupzRMDG
	UwgtLXP03gk97H3ICclRvqBJ5Ip5i51Q4GI7gio7f7svvsMgCxIRzpORuA3ZCSIo1qj5gsNdKsfZY
	VpqU7DjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFUVY-00000009vNV-1xbX;
	Wed, 22 Apr 2026 10:08:36 +0000
Received: from out-172.mta0.migadu.com ([2001:41d0:1004:224b::ac])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFUVV-00000009vM1-2xVF
	for linux-amlogic@lists.infradead.org;
	Wed, 22 Apr 2026 10:08:34 +0000
Date: Wed, 22 Apr 2026 10:02:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1776852501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dWShHqAw4U1uydaiXNZxk2uNajr8xD5Ld6tysqlIMiI=;
	b=fvCqhW9J1GeX5Xa9UNtlR8L0Uhx9BDqLHq8lNurRvJ6qjFJz+uWUwvNm+vFXpD5lfI3PRm
	gwGQJMq7UdP1c9kt6OgnIzoaO1Fenx5MnUUZmNo2mkzOHofdFmhnC7ob7+aHH2qeOMYBv7
	RVncjzTRe2PFiiTGdDlrh1AuFijBOi8phSYH2unXhOugPcKQ1ljrEZhOS7jydHY5STkDCf
	xFL7jduRVdserRUDj1IXe+lp22zi7qScot+HppBgleSN1Q5Gz13NFODx5N05RmohDZWHQK
	fV8Ze2qcRDsWxhmp7pd5hrFhJyV4HvL2QEyDRuBCWk3uKMUjE6JyxKAmhlqUeg==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ferass El Hafidi <funderscore@postmarketos.org>
To: linux-amlogic@lists.infradead.org, christian.koever-draxl@student.uibk.ac.at, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com
Cc: jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Christian Stefan K=?UTF-8?B?w7Y=?=v=?UTF-8?B?w6k=?=r-Draxl <christian.koever-draxl@student.uibk.ac.at>
Subject: Re: [PATCH v4 2/2] arm64: dts: amlogic: add support for Amediatech X98Q
References: <20260422095840.26139-1-christian.koever-draxl@student.uibk.ac.at> <20260422095840.26139-3-christian.koever-draxl@student.uibk.ac.at>
In-Reply-To: <20260422095840.26139-3-christian.koever-draxl@student.uibk.ac.at>
Message-ID: <tdw45o.mk8sa216w5vw@postmarketos.org>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_030833_880391_B8955CC6 
X-CRM114-Status: UNSURE (   7.93  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAyMiBBcHIgMjAyNiAwOTo1OCwgY2hyaXN0aWFuLmtvZXZlci1kcmF4bEBzdHVkZW50
LnVpYmsuYWMuYXQgd3JvdGU6Cj5Gcm9tOiBDaHJpc3RpYW4gU3RlZmFuIEvDtnbDqXItRHJheGwg
PGNocmlzdGlhbi5rb2V2ZXItZHJheGxAc3R1ZGVudC51aWJrLmFjLmF0Pgo+Cj5BZGQgZHRzIGVu
YWJsaW5nIGNvcmUgaGFyZHdhcmUgZm9yIHRoZSBBbWVkaWF0ZWNoIFg5OFEgVFYgYm94Lgo+Cj5U
aGUgYm9hcmQgZmVhdHVyZXM6Cj4tIEFtbG9naWMgUzkwNVcyIChNZXNvbiBTNCkgU29DCj4tIDEg
R2lCIFJBTSAoMiBHaUIgdmFyaWFudHMgZXhpc3QpCj4tIGVNTUMgYW5kIG1pY3JvU0QgY2FyZCBz
bG90Cj4tIFNESU8tYmFzZWQgV2lGaSBtb2R1bGUgKHVuc3VwcG9ydGVkKQo+LSBSTUlJIEV0aGVy
bmV0IHdpdGggaW50ZXJuYWwgUEhZCj4tIElSIHJlY2VpdmVyIGFuZCBVQVJUIGNvbnNvbGUKPi0g
U3RhdHVzIExFRAo+Cj5FbmFibGVkIHBlcmlwaGVyYWxzOgo+LSBlTU1DIChIUzIwMCkKPi0gU0Qg
Y2FyZCBpbnRlcmZhY2UKPi0gU0RJTyBidXMgKFdpRmksIG5vIGRyaXZlciB5ZXQpCj4tIEV0aGVy
bmV0IChSTUlJKQo+LSBVQVJUX0IKPi0gSVIgcmVjZWl2ZXIKPi0gUFdNLWNvbnRyb2xsZWQgQ1BV
IHJlZ3VsYXRvcgo+LSBQV00gYW5kIEZpeGVkIHJlZ3VsYXRvcnMgZm9yIGNvcmUgYW5kIElPIHJh
aWxzCj4KPktub3duIGxpbWl0YXRpb25zOgo+LSBObyBzdXBwb3J0IGZvciB0aGUgb25ib2FyZCBX
aUZpIG1vZHVsZQo+LSBNaXNzaW5nIG11bHRpbWVkaWEgKEhETUkvYXVkaW8pCj4KPlNpZ25lZC1v
ZmYtYnk6IENocmlzdGlhbiBTdGVmYW4gS8O2dsOpci1EcmF4bCA8Y2hyaXN0aWFuLmtvZXZlci1k
cmF4bEBzdHVkZW50LnVpYmsuYWMuYXQ+Cj4tLS0KPiBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9n
aWMvTWFrZWZpbGUgICAgICAgICAgfCAgIDEgKwo+IC4uLi9ib290L2R0cy9hbWxvZ2ljL21lc29u
LXM0LXM5MDV3Mi14OThxLmR0cyB8IDI0OSArKysrKysrKysrKysrKysrKysKPiAyIGZpbGVzIGNo
YW5nZWQsIDI1MCBpbnNlcnRpb25zKCspCj4gY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQv
Ym9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zNC1zOTA1dzIteDk4cS5kdHMKPjwuLi4+Cj4rJnNkIHsK
PisJc3RhdHVzID0gIm9rYXkiOwo+KwlwaW5jdHJsLTAgPSA8JnNkY2FyZF9waW5zPjsKPisJcGlu
Y3RybC0xID0gPCZzZGNhcmRfY2xrX2dhdGVfcGlucz47Cj4rCXBpbmN0cmwtbmFtZXMgPSAiZGVm
YXVsdCIsICJjbGstZ2F0ZSI7Cj4rCWJ1cy13aWR0aCA9IDw0PjsKPisJY2FwLXNkLWhpZ2hzcGVl
ZDsKPisJbWF4LWZyZXF1ZW5jeSA9IDw1MDAwMDAwMD47Cj4rCWRpc2FibGUtd3A7Cj4rCj4rCWNk
LWdwaW9zID0gPCZncGlvIEdQSU9DXzYgR1BJT19BQ1RJVkVfTE9XPjsKPisKPisJdm1tYy1zdXBw
bHkgPSA8JnZkZGFvXzN2Mz47Cj4rCXZxbW1jLXN1cHBseSA9IDwmdmRkYW9fM3YzPjsKPit9Owo+
Kwo+KyAgICAgLyoKPisgICAgICAqIFdpcmVsZXNzIFNESU8gTW9kdWxlIChBbWxvZ2ljIFcxNTBT
MSkKPisgICAgICAqIE5vdGU6IFRoZXJlIGlzIG5vIGRyaXZlciBmb3IgdGhpcyBhdCB0aGUgbW9t
ZW50Lgo+KyAgICAgICovCj4rCgpJIGRpZG4ndCBtZWFuIHRvIGluZGVudCwganVzdCB0byBhbGln
biB0aGUgJyonLgpTb3JyeSBpdCB3YXNuJ3QgY2xlYXIuCgo+KyZzZGlvIHsKPisJc3RhdHVzID0g
Im9rYXkiOwo+KwlwaW5jdHJsLTAgPSA8JnNkaW9fcGlucz47Cj4rCXBpbmN0cmwtMSA9IDwmc2Rp
b19jbGtfZ2F0ZV9waW5zPjsKPisJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IiwgImNsay1nYXRl
IjsKPisJI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4rCSNzaXplLWNlbGxzID0gPDA+Owo+KwlidXMt
d2lkdGggPSA8ND47Cj4rCWNhcC1zZC1oaWdoc3BlZWQ7Cj4rCXNkLXVocy1zZHI1MDsKPisJc2Qt
dWhzLXNkcjEwNDsKPisJbWF4LWZyZXF1ZW5jeSA9IDwyMDAwMDAwMDA+Owo+Kwlub24tcmVtb3Zh
YmxlOwo+KwlkaXNhYmxlLXdwOwo+Kwo+Kwluby1zZDsKPisJbm8tbW1jOwo+KwltbWMtcHdyc2Vx
ID0gPCZzZGlvX3B3cnNlcT47Cj4rCXZtbWMtc3VwcGx5ID0gPCZ2ZGRhb18zdjM+Owo+Kwl2cW1t
Yy1zdXBwbHkgPSA8JnZkZGlvX2FvMXY4PjsKPit9Owo+Kwo+KyZ1YXJ0X2Igewo+KwlzdGF0dXMg
PSAib2theSI7Cj4rfTsKPi0tIAo+Mi41My4wCgotLQpCZXN0IHJlZ2FyZHMsCkZlcmFzcwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
