Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 206D5C4332F
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Nov 2023 10:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2GnTVpbKmd7Nxkr2JTWnJ1eePCWtkeasSpMSeMnH13c=; b=GJ2PLxGxjaZyY/
	UsuA4Dmq7XAIM4UcfP3WoC6/iQuxjz4IwHfJV3LVGSdCBhQR5Mq+5Xp4kZoNUUYo6Yk6ftywO9iAc
	hh+78IMIqy6KwNm4J0ZEOAvY2ED3VvMRkhH/LNK+Bs0G1LxabmiabXYQvnGt2/j6axFZ4mJ8xUPa1
	jfJBRa5NSSvpftk6w63i5QH3L5gZw/FOoCY6Pgotoey7ix+z8het2Ui2AVj9MXn5Zyk3uCcnlzYlD
	qOHKZvTy/+1yq1XlWCLOouIVpo81ojeRvDlnl5X1T6o9xiZHmAEUtYCefQ+L1PhbUJxeRTpcVCpbv
	EC2pqodAi2ZNDUs2/AvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyUX9-0095AY-0w;
	Thu, 02 Nov 2023 10:02:39 +0000
Received: from mx.msync.work ([62.182.159.68])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyUX2-00959J-2h;
	Thu, 02 Nov 2023 10:02:37 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F20E6148596;
	Thu,  2 Nov 2023 10:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
	t=1698919347; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=z6Sp9k5FpABEdEH0tymcIJg8P6OxIk0iXL3CGctZlIw=;
	b=CEXw035fbs/5DMhLN3nIFpiPxVTjbNQtVkGUy8Y/aXUj04T/5wmeX9ma5bpdJF5EUTMGOq
	g5qxK7fqR7cmbpZP+W6ogprq9wzAih76oEsnYFfJwkYGsqay9pi4kiGOumDMQGICJ5RMfd
	fWAyDR/JFC5VXXU6t2puAEbaLUX5yWYvDxpCYAJx93ennjVFpfjhJK8u81U5ikInso1g7L
	i1ZG//LWt+phddEutUTE97/hrTWoV+qtvzVcxHnRj+4qQzoEhZXJ27YgMGBt2C2Ijftq+i
	76DTrU9awMbYLL224tOr4DssfVk+z36yqFmfw8grmKmLDqcrjn3kMiSzKa1uyg==
Message-ID: <d3734c188c165f186905101802ef7d5bfc8cda14.camel@lexina.in>
Subject: Re: [PATCH 4/4] firmware: meson_sm: use meson_gx_socinfo for
 compatibility
From: Viacheslav <adeep@lexina.in>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,  devicetree@vger.kernel.org
Date: Thu, 02 Nov 2023 13:02:25 +0300
In-Reply-To: <e1fe390e-e0d4-475a-a83b-31c2d179e009@linaro.org>
References: <20231102074916.3280809-1-adeep@lexina.in>
	 <20231102074916.3280809-5-adeep@lexina.in>
	 <e1fe390e-e0d4-475a-a83b-31c2d179e009@linaro.org>
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_030233_393894_976DC197 
X-CRM114-Status: GOOD (  16.35  )
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

0JIg0KfRgiwgMDIvMTEvMjAyMyDQsiAxMDoyNiArMDEwMCwgS3J6eXN6dG9mIEtvemxvd3NraSDQ
v9C40YjQtdGCOgo+IE9uIDAyLzExLzIwMjMgMDg6NDksIFZpYWNoZXNsYXYgQm9jaGFyb3Ygd3Jv
dGU6Cj4gPiBVc2UgbWVzb25fZ3hfc29jaW5mbyB2YXJpYWJsZSBmb3IgY2hpcGlkIGNvbXBhdGli
bGUgY2FsbAo+ID4gZnJvbSBtZXNvbi1neC1zb2NpbmZvIGRyaXZlciBpZiBhdmFpbGFibGUuCj4g
PiAKPiAKPiBTbyB3ZSBhcmUgYmFjayB0byBzb21ldGhpbmcgbGlrZSBBUk12NyBwbGF0Zm9ybS9t
YWNoLWNvZGUgd2l0aAo+IGRyaXZlcnMKPiB0aWdodGx5IGNvdXBsZWQgYmV0d2VlbiBzdWJzeXN0
ZW1zLiBCdXQgaXQgaXMgbm90IDIwMDcgYW55bW9yZSBhbmQgd2UKPiBoYXZlIERldmljZXRyZWUg
Zm9yIHRoaXMuIFVzZSBpdCBpbnN0ZWFkLgo+IAo+IFdoYXQncyBtb3JlLCB5b3VyIGNvbW1pdCBt
c2cgZG9lcyBub3QgZXhwbGFpbiBhdCBhbGwgd2h5IGRvIHlvdSBuZWVkCj4gdG8KPiBkbyBpdC4g
VGhpcyBpcyBzb21lICJzaG93IiBjYWxsYmFjaywgd2hpY2ggZG9lcyBub3QgZXhpc3QgaW4gY3Vy
cmVudAo+IGNvZGUuIEFkZGluZyBjb2RlIGluIG9uZSBwYXRjaCBhbmQgdGhlbiBjaGFuZ2luZyBp
dCwgbG9va3MgbGlrZSB5b3UKPiBhZGQKPiBpbmNvbXBsZXRlIG9yIGJ1Z2d5IGZlYXR1cmUuCj4g
Cj4gQmVzdCByZWdhcmRzLAo+IEtyenlzenRvZgo+IAoKCkZhaXIgZW5vdWdoLgpUaGlzIHBhdGNo
IGlzIHJlbGF0ZWQgdG8gYW4gYWRqYWNlbnQgb25lIHdoZXJlIHRoZSBzb2NpbmZvIGRhdGEKc3Vw
cGxlbWVudHMgdGhlIHJlc3VsdCBvZiBleGVjdXRpbmcgdGhlIGNoaXBpZCB2ZXJzaW9uIDEgZnVu
Y3Rpb24uCgpJbmRlZWQsIHdpdGggdGhlIGludHJvZHVjdGlvbiBvZiBjaGlwaWQgdi4yLCB3ZSBu
b3cgaGF2ZSBhIHNlY29uZApvcHRpb24gZm9yIG9idGFpbmluZyBzb2MgaW5mbyAodGhlIGZpcnN0
IGJlaW5nIGltcGxlbWVudGVkIHZpYSByZWdpc3RlcgpyZWFkaW5nKS4gQW5kIEknbSBzb21ld2hh
dCBjb250ZW1wbGF0aXZlOiB3aGV0aGVyIHRvIG1vdmUgdGhlIG1lc29uLWd4LQpzb2NpbmZvIGVu
dGlyZWx5IHRvIHRoZSBzZWN1cmUgbW9uaXRvciBvciB0byBkdXBsaWNhdGUgdGhlIGNvZGUgZnJv
bQp0aGVyZS4KCkFzIGEgZHJpdmVyLCBtZXNvbi1neC1zb2NpbmZvIGRvZXMgbm90IGNhcnJ5IHBy
YWN0aWNhbCBpbmZvcm1hdGlvbgphcGFydCBmcm9tIG91dHB1dHRpbmcgc3RhdHVzIGluIHRoZSBi
b290IGxvZywgYW5kIGl0IGNhbm5vdCBiZSByZXVzZWQKd2l0aG91dCBtb2RpZmljYXRpb25zIHRv
IHRoZSBkcml2ZXIuCgotLQpWaWFjaGVzbGF2IEJvY2hhcm92CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAps
aW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
