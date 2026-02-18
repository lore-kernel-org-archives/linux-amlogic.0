Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0129E9A04B
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Feb 2026 18:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aBx+qzab7Uq4gv/MtBKIFXynxWPZMFO5ZlG4QHS1QGQ=; b=XTSsLpt5ro3dz9
	1Q7O+lK0FzHDiZoLHlt7tpGxU0mDHg4gTUClxJYepiU/v/ActCB+I88BIRM4pxV2Cb9lkGuhDdwZS
	yypZp3c9qt2W4BXHpXmX9NsrSmZ7kUQMUHMnsKwxT+C2tDrEwAWAWnGXneZE/yNyiHqWE62nK/LCc
	H+EBy7G0k4pX2+GAymLjmVMweShlG43bkYf7X3hYkpGNjAKd7qy7NplgPZhZixPyxQq1lXY2l/Roj
	+oDSs9RizoCC40dgZuOAgBIT0FfPScG9oNkpYOV3MXqb0zx6Eq/yIo32Fsager4T6CA9cEvrvbHNc
	FLcUesrzJWNlij7OXhOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsmNp-0000000AFr7-08wI;
	Wed, 18 Feb 2026 18:34:45 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsmNm-0000000AFpj-0yM7
	for linux-amlogic@lists.infradead.org;
	Wed, 18 Feb 2026 18:34:43 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4837f27cf2dso1373875e9.2
        for <linux-amlogic@lists.infradead.org>; Wed, 18 Feb 2026 10:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771439680; x=1772044480; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FrGaQVxaxcSeBe1e1Iik830FnwfS8wNvcS7rghuYjlk=;
        b=G+W0gpU4D86pJoslCxqe4Q/hcv4RMUIWLtfbKbsOyp5p1mlV4OCU483vswXg/Sd7Eh
         Af0X5/apa2yPNboJeNNAxciiv1QukQqYagyRQ+VInjCpqLMNupu5EYeIhLzPCx++cbaB
         4TNOIPh3GYa8kZGwzrbe6Gjo5vZCO5OWta9pG1JbrV5j7AbeYPeN/iW5JcclzFR1fv6W
         NnE3A/cV1JM/LyNDvgJSsnDamxln7Ux2EIaZzcDvztzZYhNdIOymO+DzrzhYASrAJ9cT
         R9jcNlf1xDFT1Ubvxrz+scQ5q25FmFv5uy1RSXzfugLQKV4LRzemUGWsQ2is1iqwsytz
         nTbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771439680; x=1772044480;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FrGaQVxaxcSeBe1e1Iik830FnwfS8wNvcS7rghuYjlk=;
        b=X47NxNI3UBfuau60SIAB2We8pCK/5amm5i2auw8iIdCxawAmiF1B9bFBizSNOx22YM
         gQLezVBnDGDS6VtQuhdYyr8l0KLQ346HN8EDhe/Obuun+eF8mjkp5x3j9aVEQuElGPJo
         XNruy6QTzST6pQPawEqOU2dztj/e2g/WR8uyrfWxipUbl0cXzBHVSJwvNd8b0DmFH2x3
         PTN9fzuZDEhE8cTnH5xAbZs3ENsvCxG1A+4vALSLaKc/pwOzsnH0VSwUFXaJRf84EwxD
         uKop+ynEe8rH8Qa8zG+BewOPW7fKOtWbytfgafBuU2ZXky7l8xuyXOM3FcSOhH+rqzv8
         ecpQ==
X-Gm-Message-State: AOJu0YzoJSG2lVChZ6Y1QLF39KN9c0W+TFi7U6xjgXdpksmgqLf7aDH4
	T/13DM9GkPWe6i2AmE9783qtEF5aiSMTkif8az0zMY1m0fZfJbtf6GZAxD8oDFyDKns=
X-Gm-Gg: AZuq6aKxWV1/4i1XRqWxcrf4htlvBXc/kCC9C8Gv1EZNb4Fq9bO2AX2yYVq4B5Zpxyw
	Fh0NyQdQC1nYq0uSVO3C2I9tbU1O0BZ5QVJQce6n+5grzeJH6CksmEuPVQlXRTsK098O6UJK1cM
	vLrA41jKJNZIQfHUNrgt5Gu0r/HigqnIeORb66TZgZu0pjG4RbfRPG+CIioW/rqpsBbBsg232Sp
	CPFcOAbP7V+hrqfWD+QGC7R54XNn0zGf1HPqXqsA7rIKcna2oEDNNRGcqzBlk7CEVpa1qnpDxi7
	w4jXSAX8dbYgP6ZXx37aINxsUsBHC8ifZxndlkKJakrbGtLC0y3t++QdFQ0THV1/+ueABXcTbN+
	p88oe+RPbug8tMDsfXaLMv5sgj0UHYhaSc0R7UPS0AP7Co5SUoO7YZfcJkDdWEXqfC03dukeP16
	pLgYjpSZamA/ZKiVSCQUKoAw==
X-Received: by 2002:a05:600c:1da1:b0:47e:e8de:7420 with SMTP id 5b1f17b1804b1-48371085905mr314322705e9.22.1771439679304;
        Wed, 18 Feb 2026 10:34:39 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:cf71:8cf8:56bb:5790])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4834d7e50casm577892565e9.8.2026.02.18.10.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 10:34:38 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: linux-amlogic@lists.infradead.org,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  linux-arm-kernel@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] arm64: dts: amlogic: Add clock and EMMC for T7
In-Reply-To: <20260218112036.36905-1-linux-kernel-dev@aliel.fr> (Ronald
	Claveau's message of "Wed, 18 Feb 2026 12:20:33 +0100")
References: <20260218101709.35450-1-linux-kernel-dev@aliel.fr>
	<20260218112036.36905-1-linux-kernel-dev@aliel.fr>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 18 Feb 2026 19:34:37 +0100
Message-ID: <1jecmh6gua.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_103442_292414_CD401CD2 
X-CRM114-Status: GOOD (  11.97  )
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

T24gbWVyLiAxOCBmw6l2ci4gMjAyNiBhdCAxMjoyMCwgUm9uYWxkIENsYXZlYXUgPGxpbnV4LWtl
cm5lbC1kZXZAYWxpZWwuZnI+IHdyb3RlOgoKPiBBZGQgZml4ZWQgY2xvY2sgYW5kIEVNTUMgc3Vw
cG9ydCBmb3IgQW1sb2dpYyBUNyBTb0MgZmFtaWx5IGR0c2kuCgpPbmUgdG9waWMgcGVyIHBhdGNo
IHBsZWFzZQoKPgo+IFNpZ25lZC1vZmYtYnk6IFJvbmFsZCBDbGF2ZWF1IDxsaW51eC1rZXJuZWwt
ZGV2QGFsaWVsLmZyPgo+IC0tLQo+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dp
Yy10Ny5kdHNpIHwgMTI5ICsrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
MjkgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1s
b2dpYy9hbWxvZ2ljLXQ3LmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dp
Yy10Ny5kdHNpCj4gaW5kZXggNjUxMDA2OGJjZmY5Li5iODQyODFlNWNkZDggMTAwNjQ0Cj4gLS0t
IGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtdDcuZHRzaQo+ICsrKyBiL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxvZ2ljLXQ3LmR0c2kKPiBAQCAtMyw2ICszLDgg
QEAKPiAgICogQ29weXJpZ2h0IChjKSAyMDE5IEFtbG9naWMsIEluYy4gQWxsIHJpZ2h0cyByZXNl
cnZlZC4KPiAgICovCj4gIAo+ICsjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svYW1sb2dpYyx0
Ny1wZXJpcGhlcmFscy1jbGtjLmg+Cj4gKyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9jbG9jay9hbWxv
Z2ljLHQ3LXBsbC1jbGtjLmg+Cj4gICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29u
dHJvbGxlci9hcm0tZ2ljLmg+Cj4gICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9wb3dlci9hbWxvZ2lj
LHQ3LXB3cmMuaD4KPiAgI2luY2x1ZGUgImFtbG9naWMtdDctcmVzZXQuaCIKPiBAQCAtMjI0LDYg
KzIyNiwyNCBAQCBhcGI0OiBidXNAZmUwMDAwMDAgewo+ICAJCQkjc2l6ZS1jZWxscyA9IDwyPjsK
PiAgCQkJcmFuZ2VzID0gPDB4MCAweDAgMHgwIDB4ZmUwMDAwMDAgMHgwIDB4NDgwMDAwPjsKPiAg
Cj4gKwkJCWNsa2M6IGNsb2NrLWNvbnRyb2xsZXJAMCB7Cj4gKwkJCQljb21wYXRpYmxlID0gImFt
bG9naWMsdDctcGVyaXBoZXJhbHMtY2xrYyI7Cj4gKwkJCQlyZWcgPSA8MHgwIDB4MCAweDAgMHg0
OWM+Owo+ICsJCQkJI2Nsb2NrLWNlbGxzID0gPDE+Owo+ICsJCQkJY2xvY2tzID0gPCZ4dGFsPiwK
PiArCQkJCQkJIDwmZnBsbCBDTEtJRF9GRElWMj4sCj4gKwkJCQkJCSA8JmZwbGwgQ0xLSURfRkRJ
VjJQNT4sCj4gKwkJCQkJCSA8JmZwbGwgQ0xLSURfRkRJVjM+LAo+ICsJCQkJCQkgPCZmcGxsIENM
S0lEX0ZESVY0PiwKPiArCQkJCQkJIDwmZnBsbCBDTEtJRF9GRElWNT4sCj4gKwkJCQkJCSA8Jmhp
ZmlfcGxsIENMS0lEX0hJRklfUExMPiwKPiArCQkJCQkJIDwmbXBsbCBDTEtJRF9NUExMMj4sCj4g
KwkJCQkJCSA8Jm1wbGwgQ0xLSURfTVBMTDM+LAo+ICsJCQkJCQkgPCZncDBfcGxsIENMS0lEX0dQ
MF9QTEw+Owo+ICsJCQkJY2xvY2stbmFtZXMgPSAieHRhbCIsICJmZGl2MiIsICJmZGl2MnA1Iiwg
ImZkaXYzIiwgImZkaXY0IiwKPiArCQkJCQkJCSAgImZkaXY1IiwgImhpZmkiLCAibXBsbDIiLCAi
bXBsbDMiLCAiZ3AwIjsKPiArCQkJfTsKPiArCj4gIAkJCXJlc2V0OiByZXNldC1jb250cm9sbGVy
QDIwMDAgewo+ICAJCQkJY29tcGF0aWJsZSA9ICJhbWxvZ2ljLHQ3LXJlc2V0IjsKPiAgCQkJCXJl
ZyA9IDwweDAgMHgyMDAwIDB4MCAweDk4PjsKPiBAQCAtMjUwLDYgKzI3MCw2OCBAQCBncGlvOiBi
YW5rQDQwMDAgewo+ICAJCQkJCSNncGlvLWNlbGxzID0gPDI+Owo+ICAJCQkJCWdwaW8tcmFuZ2Vz
ID0gPCZwZXJpcGhzX3BpbmN0cmwgMCAwIDE1Nz47Cj4gIAkJCQl9Owo+ICsKPiArCQkJCWVtbWNf
Y3RybF9waW5zOiBlbW1jLWN0cmwgewo+ICsJCQkJCW11eC0wIHsKPiArCQkJCQkJZ3JvdXBzID0g
ImVtbWNfY21kIjsKPiArCQkJCQkJZnVuY3Rpb24gPSAiZW1tYyI7Cj4gKwkJCQkJCWJpYXMtcHVs
bC11cDsKPiArCQkJCQkJZHJpdmUtc3RyZW5ndGgtbWljcm9hbXAgPSA8NDAwMD47Cj4gKwkJCQkJ
fTsKPiArCj4gKwkJCQkJbXV4LTEgewo+ICsJCQkJCQlncm91cHMgPSAiZW1tY19jbGsiOwo+ICsJ
CQkJCQlmdW5jdGlvbiA9ICJlbW1jIjsKPiArCQkJCQkJYmlhcy1kaXNhYmxlOwo+ICsJCQkJCQlk
cml2ZS1zdHJlbmd0aC1taWNyb2FtcCA9IDw0MDAwPjsKPiArCQkJCQl9Owo+ICsJCQkJfTsKPiAr
Cj4gKwkJCQllbW1jX2RhdGFfNGJfcGluczogZW1tYy1kYXRhLTRiIHsKPiArCQkJCQltdXgtMCB7
Cj4gKwkJCQkJCWdyb3VwcyA9ICJlbW1jX25hbmRfZDAiLAo+ICsJCQkJCQkJCSAiZW1tY19uYW5k
X2QxIiwKPiArCQkJCQkJCQkgImVtbWNfbmFuZF9kMiIsCj4gKwkJCQkJCQkJICJlbW1jX25hbmRf
ZDMiOwo+ICsJCQkJCQlmdW5jdGlvbiA9ICJlbW1jIjsKPiArCQkJCQkJYmlhcy1wdWxsLXVwOwo+
ICsJCQkJCQlkcml2ZS1zdHJlbmd0aC1taWNyb2FtcCA9IDw0MDAwPjsKPiArCQkJCQl9Owo+ICsJ
CQkJfTsKPiArCj4gKwkJCQllbW1jX2RhdGFfOGJfcGluczogZW1tYy1kYXRhLThiIHsKPiArCQkJ
CQltdXgtMCB7Cj4gKwkJCQkJCWdyb3VwcyA9ICJlbW1jX25hbmRfZDAiLAo+ICsJCQkJCQkJCSAi
ZW1tY19uYW5kX2QxIiwKPiArCQkJCQkJCQkgImVtbWNfbmFuZF9kMiIsCj4gKwkJCQkJCQkJICJl
bW1jX25hbmRfZDMiLAo+ICsJCQkJCQkJCSAiZW1tY19uYW5kX2Q0IiwKPiArCQkJCQkJCQkgImVt
bWNfbmFuZF9kNSIsCj4gKwkJCQkJCQkJICJlbW1jX25hbmRfZDYiLAo+ICsJCQkJCQkJCSAiZW1t
Y19uYW5kX2Q3IjsKPiArCQkJCQkJZnVuY3Rpb24gPSAiZW1tYyI7Cj4gKwkJCQkJCWJpYXMtcHVs
bC11cDsKPiArCQkJCQkJZHJpdmUtc3RyZW5ndGgtbWljcm9hbXAgPSA8NDAwMD47Cj4gKwkJCQkJ
fTsKPiArCQkJCX07Cj4gKwo+ICsJCQkJZW1tY19kc19waW5zOiBlbW1jLWRzIHsKPiArCQkJCQlt
dXggewo+ICsJCQkJCQlncm91cHMgPSAiZW1tY19uYW5kX2RzIjsKPiArCQkJCQkJZnVuY3Rpb24g
PSAiZW1tYyI7Cj4gKwkJCQkJCWJpYXMtcHVsbC1kb3duOwo+ICsJCQkJCQlkcml2ZS1zdHJlbmd0
aC1taWNyb2FtcCA9IDw0MDAwPjsKPiArCQkJCQl9Owo+ICsJCQkJfTsKPiArCj4gKwkJCQllbW1j
X2Nsa19nYXRlX3BpbnM6IGVtbWNfY2xrX2dhdGUgewo+ICsJCQkJCW11eCB7Cj4gKwkJCQkJCWdy
b3VwcyA9ICJHUElPQl84IjsKPiArCQkJCQkJZnVuY3Rpb24gPSAiZ3Bpb19wZXJpcGhzIjsKPiAr
CQkJCQkJYmlhcy1wdWxsLWRvd247Cj4gKwkJCQkJCWRyaXZlLXN0cmVuZ3RoLW1pY3JvYW1wID0g
PDQwMDA+Owo+ICsJCQkJCX07Cj4gKwkJCQl9Owo+ICAJCQl9Owo+ICAKPiAgCQkJZ3Bpb19pbnRj
OiBpbnRlcnJ1cHQtY29udHJvbGxlckA0MDgwIHsKPiBAQCAtMjYyLDYgKzM0NCwzOCBAQCBncGlv
X2ludGM6IGludGVycnVwdC1jb250cm9sbGVyQDQwODAgewo+ICAJCQkJCTwxMCAxMSAxMiAxMyAx
NCAxNSAxNiAxNyAxOCAxOSAyMCAyMT47Cj4gIAkJCX07Cj4gIAo+ICsJCQlmcGxsOiBjbG9jay1j
b250cm9sbGVyQDgwNDAgewo+ICsJCQkJY29tcGF0aWJsZSA9ICJhbWxvZ2ljLHQ3LWZwbGwiOwo+
ICsJCQkJcmVnID0gPDB4MCAweDgwNDAgMHgwIDB4MjA+Owo+ICsJCQkJI2Nsb2NrLWNlbGxzID0g
PDE+Owo+ICsJCQkJY2xvY2tzID0gPCZ4dGFsPjsKPiArCQkJCWNsb2NrLW5hbWVzID0gInh0YWwi
Owo+ICsJCQl9Owo+ICsKPiArCQkJZ3AwX3BsbDogY2xvY2stY29udHJvbGxlckA4MDgwIHsKPiAr
CQkJCWNvbXBhdGlibGUgPSAiYW1sb2dpYyx0Ny1ncDAtcGxsIjsKPiArCQkJCXJlZyA9IDwweDAg
MHg4MDgwIDB4MCAweDIwPjsKPiArCQkJCSNjbG9jay1jZWxscyA9IDwxPjsKPiArCQkJCWNsb2Nr
cyA9IDwmeHRhbD47Cj4gKwkJCQljbG9jay1uYW1lcyA9ICJpbjAiOwo+ICsJCQl9Owo+ICsKPiAr
CQkJaGlmaV9wbGw6IGNsb2NrLWNvbnRyb2xsZXJAODEwMCB7Cj4gKwkJCQljb21wYXRpYmxlID0g
ImFtbG9naWMsdDctaGlmaS1wbGwiOwo+ICsJCQkJcmVnID0gPDB4MCAweDgxMDAgMHgwIDB4MjA+
Owo+ICsJCQkJI2Nsb2NrLWNlbGxzID0gPDE+Owo+ICsJCQkJY2xvY2tzID0gPCZ4dGFsPjsKPiAr
CQkJCWNsb2NrLW5hbWVzID0gImluMCI7Cj4gKwkJCX07Cj4gKwo+ICsJCQltcGxsOiBjbG9jay1j
b250cm9sbGVyQDgxODAgewo+ICsJCQkJY29tcGF0aWJsZSA9ICJhbWxvZ2ljLHQ3LW1wbGwiOwo+
ICsJCQkJcmVnID0gPDB4MCAweDgxODAgMHgwIDB4MjA+Owo+ICsJCQkJI2Nsb2NrLWNlbGxzID0g
PDE+Owo+ICsJCQkJY2xvY2tzID0gPCZmcGxsIENMS0lEX0ZQTExfRENPPjsKPiArCQkJCWNsb2Nr
LW5hbWVzID0gImluMCI7Cj4gKwkJCX07Cj4gKwo+ICAJCQl1YXJ0X2E6IHNlcmlhbEA3ODAwMCB7
Cj4gIAkJCQljb21wYXRpYmxlID0gImFtbG9naWMsdDctdWFydCIsICJhbWxvZ2ljLG1lc29uLXM0
LXVhcnQiOwo+ICAJCQkJcmVnID0gPDB4MCAweDc4MDAwIDB4MCAweDE4PjsKPiBAQCAtMjc2LDYg
KzM5MCwyMSBAQCBzZWNfYW86IGFvLXNlY3VyZUAxMDIyMCB7Cj4gIAkJCQlyZWcgPSA8MHgwIDB4
MTAyMjAgMHgwIDB4MTQwPjsKPiAgCQkJCWFtbG9naWMsaGFzLWNoaXAtaWQ7Cj4gIAkJCX07Cj4g
Kwo+ICsJCQlzZF9lbW1jX2M6IG1tY0A4YzAwMHsKPiArCQkJCWNvbXBhdGlibGUgPSAiYW1sb2dp
YyxtZXNvbi1heGctbW1jIjsKPiArCQkJCXJlZyA9IDwweDAgMHg4YzAwMCAweDAgMHg4MDA+Owo+
ICsJCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDE3OCBJUlFfVFlQRV9FREdFX1JJU0lORz47Cj4g
KwkJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwo+ICsJCQkJY2xvY2tzID0gPCZjbGtjIENMS0lEX1NZ
U19TRF9FTU1DX0M+LAo+ICsJCQkJCQkgPCZjbGtjIENMS0lEX1NEX0VNTUNfQz4sCj4gKwkJCQkJ
CSA8JmdwMF9wbGwgQ0xLSURfR1AwX1BMTD47Cj4gKwkJCQljbG9jay1uYW1lcyA9ICJjb3JlIiwg
ImNsa2luMCIsICJjbGtpbjEiOwo+ICsJCQkJYXNzaWduZWQtY2xvY2tzID0gPCZjbGtjIENMS0lE
X1NEX0VNTUNfQ19TRUw+Owo+ICsJCQkJYXNzaWduZWQtY2xvY2stcGFyZW50cyA9IDwmeHRhbD47
Cj4gKwkJCQluby1zZGlvOwo+ICsJCQkJbm8tc2Q7Cj4gKwkJCX07Cj4gIAkJfTsKPiAgCj4gIAl9
OwoKLS0gCkplcm9tZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwo=
