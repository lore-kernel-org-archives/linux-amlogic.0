Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BD6606A881
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Nov 2026 21:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hlo02GDu;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=mzt/r6uZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=u9FhHnzt4TfSHs0A6WVFducD3C/wMTGGd786XuiaMGE=; b=hlo02GDuG1kPhRIhEL/dbRHw8b
	KKOkCNdKmihbXxWsVcPHBXhJ7sir9BcK5NOV3rVBGVXe1ENN4s+kpj1SbfjmYtutmf9dv3RQAAx3P
	9TWmZSgHr+LlTgUBuYdUgDJa3AWXqoMggNkdeLOV+XZ8Tq5I8dC4rwHXD6eVSHAzA+d9XVJWw3jxS
	lmCnj6z8Fg3djkAgAqYTo8nWpk5nqtjDAqaO5yRDdw5GPjImxtR+HWVPVyaUTQ73pnGg1WzPftPlR
	AK/0WmFY6/QSj6nKw+0Tlo3YEf3mmnMOJlvsipLqmER/Ke9wFRIO7jH5dkM3HAythHRRsZ8LJEaK+
	G/giqY1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xShO7-00000000TNg-02AE;
	Sun, 15 Nov 2026 21:03:47 +0000
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xShO4-00000000TMw-0sZz
	for linux-amlogic@lists.infradead.org;
	Sun, 15 Nov 2026 21:03:46 +0000
Received: by mail-yx1-xb12b.google.com with SMTP id 956f58d0204a3-67db763cec7so267820d50.1
        for <linux-amlogic@lists.infradead.org>; Sun, 15 Nov 2026 13:03:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794776623; cv=none;
        d=google.com; s=arc-20260327;
        b=ludKI1DabQRCzqKFgxO6DnsSIo7hzblkzksKToyweLw6ovwT/qG90YtzLYx/maAbLF
         NIHnEPr2nhwRRFNg9AHTE0MRPkP/cUetWSnwcosuIz1sUe5OD4j7fxqQQWuXcSq5nyOC
         ON86PFgPbaaEfiB4Mny57gWgCaV/BVaqiU/wMc/Ahp+X8qtfovVPL3IMQPVbHmJ98pL8
         4ibVN1y6WDySW4HECvbPCBjuTrxtX9nykTcvdsezqZGKeTuqefpKL3P0EqztU6uREYq5
         NNC8oS3VJidXTzpsb9ptThLrOEReY0sb6IfQ04/+pXpqsRhGtmC9rdEVBsuNc5xEY+5W
         txCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JeZW25rG3PtAzFodSzRAtiRusay7Hp/q+l2Vzy5PdOM=;
        fh=oIOXVzWjR9TOUnchTLeps/QSv79kxHO3oD0jCckBWzs=;
        b=BmclV50tua1KGLN3ouiCcfdM7tpVNAyayCWbMzninzYy3QyDJFEh4AMX4/iOfva7p2
         KWCbj5WZgjuaggxfzMdJlA1P3KpTnZBwbRbSbT38HJHJoPwNvoyFsOxs6BQs+uB59k/F
         F1+Porn3W4nXFtvOFrXg1c72VwwzexbkNE3EH4JZf8HrXUyjScMHq+ynQ/ZkLvuO1H7r
         mSY6mxm/JLG7WfQftriOsYIEz/pluGDmVRudsJ0gchtZJRHQVKIB/IAO25gmUdx096X9
         YXqYEcqyYQbyQ8B1RC7EIwc9puzEP8panN/8ZnLBV8PGCdXcJKNrCKtTRjMDNDGwevlX
         cBow==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794776623; x=1795381423; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JeZW25rG3PtAzFodSzRAtiRusay7Hp/q+l2Vzy5PdOM=;
        b=mzt/r6uZDuyE0z4dyoDIAWvytOk3fuGhp4Q4iFZwEaUC3OMhW+Xq47xicroR/Vui5B
         HvvAR84SvndXRurvLRnayzAFXpTUbEVg07LyflmlO0lLFMX8c3YUAK+RomQVnO4U8y+O
         1X9bmO3xgEV6yulQuh7saNc40i9b6NXbJQIBTrUeLzN1x6fQRy3StCH8aQUeXkBiiLp8
         xO34lYLMSh7Ud2wgCVeYaSdE+VJGsrHWbhm17NATSzdq4CaJy9v/6Q72f3TkDrNagpRz
         EJTAubJkSAXGyU+Oh5GovHCcD4Jx/RGFBzab/iVzOrQpnEV7jLp2bcpX9BbPe6Rjp/32
         XzYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776623; x=1795381423;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JeZW25rG3PtAzFodSzRAtiRusay7Hp/q+l2Vzy5PdOM=;
        b=ycBeaOEkXQQihGCaYqjuHPMbEPEGlbnUp/7Zl8UtjOubRFViULOJCM2kfInVEl4Fgl
         TfPMnaigT8IV05xmJceGXUumy39osJ0uxESv6ROvYESNIfD5W4VM3UFppyWhLqbkWdg+
         q3fitmfmts/wJWOI8PYBkaKUmZItjFIfqUBdgdyL4kBB59rU4mKMJCDPMbfmn66xRID4
         fKqtajObhD0kb1fAjj3wZgPVIcJhPfzQUHfJmpH2hNKQ9qpoWDM8UhXD/sGTjlD/S2V7
         8dLorzQG+ayaltuBUd5M86jfg2WlOGhmt7mm8VmIdkUVV1bV7Rsjk/w9l9d/p007I2dp
         y9Fg==
X-Forwarded-Encrypted: i=1; AL+hErGRofZxuwPyycnjTXgELtHvQYyP/rFJ4WpFARTwtmfZN6OQr8NkqBn6tCBr7fzaMrKdtJyjQYdLHlQdkzhF@lists.infradead.org
X-Gm-Message-State: APuU4Z8tTKhlCekygSaaEqxfhRJM9+hpVfWVqdn25YhQYqBTtdEoayLq
	Zq4+Ca5Ilrh81EdvGwlzRvEUmUsFfqg4Ks/V85IzDhDGjohax6wF2f+6r8mhcAQdspViv/In+sE
	eILMoNBwYZNFQC/muklJ5XbcoV/rNe+M=
X-Gm-Gg: AYBFou014wthjyj1sK9bGKtw6E32pRCeV0wKXrERx7DH9snP4BA/vpcGu2G8jKrdK5U
	2RPZxHgLD/8FxYfGcveGyr0GNcxCGEGWK/pFRdORrtcHJdCa4Wr78MYvuClwKDCNY83r9JcoWEn
	HiqCCh+TRS3S3Ye14CjDM+MqB7AvAhLZUBbfr4S/Sl00LmhpCwmvQibIdOvItMw0Tmoq6rafL6l
	gKOXgXDUNPfdFbemJWDWt/ImU5yY9PgdggS5JrF7UyaKUROr4m2x7U85Ytx6ROtJRdUOXxpVKSD
	BCFzO5A9pWrFPswiuGnZSA5Rf8CNvW6n7XXVV/lyiiCH3IvX7cd1gccVtejpdyHdiUAn0cTgtpf
	z/DU22WaFkHvfg0FVMrzyRfleiodc8LSJUaOhwO8ihS8xq8Qkd17gSNIYHJFO3+rPelbS7MU=
X-Received: by 2002:a05:690e:134b:b0:67d:a747:37cb with SMTP id
 956f58d0204a3-67da7473984mr1788570d50.80.1794776622877; Sun, 15 Nov 2026
 13:03:42 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com> <20261018-audin-v5-1-4b8cc13a1b22@baylibre.com>
In-Reply-To: <20261018-audin-v5-1-4b8cc13a1b22@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 22:03:32 +0100
X-Gm-Features: AclHuK8RZRddO7WOnvwxzgFddHhyLeT9NtqQThzXqpKNCFZiOf6pqJWI8MgY6vE
Message-ID: <CAFBinCC+-N8LvoXZwMhoxjOzXgoYUfDKCcvmD7Uuph5=hTSg7g@mail.gmail.com>
Subject: Re: [PATCH v5 1/7] ASoC: dt-bindings: add amlogic,gxbb-audin
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_130344_282294_32A4A83F 
X-CRM114-Status: GOOD (  22.42  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgVmFsZXJpbywKCk9uIFN1biwgT2N0IDE4LCAyMDI2IGF0IDEyOjE44oCvUE0gVmFsZXJpbyBT
ZXR0aSA8dnNldHRpQGJheWxpYnJlLmNvbT4gd3JvdGU6Cj4KPiBBVURJTiBwcm92aWRlcyBJMlMg
YXVkaW8gaW5wdXQgc3VwcG9ydCB0byB0aGUgTWVzb24gR1hCQiBhbmQgR1hMIFNvQ3MuCj4KPiBU
aGUgQVVESU4gYmxvY2sgb24gR1hMIGlzIGlkZW50aWNhbCB0byB0aGUgR1hCQiBvbmUsIHNvICJh
bWxvZ2ljLGd4bC1hdWRpbiIKPiB1c2VzICJhbWxvZ2ljLGd4YmItYXVkaW4iIGFzIGZhbGxiYWNr
OyB0aGUgU29DLXNwZWNpZmljIGNvbXBhdGlibGUgaXMKPiBhZGRlZCBzbyB0aGF0IGRpZmZlcmVu
Y2VzIGNhbiBiZSBoYW5kbGVkIGxhdGVyIGlmIGFueSBhcmUgZm91bmQuCj4KPiBSZXZpZXdlZC1i
eTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBvc3MucXVhbGNvbW0u
Y29tPgo+IFNpZ25lZC1vZmYtYnk6IFZhbGVyaW8gU2V0dGkgPHZzZXR0aUBiYXlsaWJyZS5jb20+
Cj4gLS0tCj4gIC4uLi9iaW5kaW5ncy9zb3VuZC9hbWxvZ2ljLGd4YmItYXVkaW4ueWFtbCAgICAg
ICAgIHwgNjkgKysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNjkgaW5z
ZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9zb3VuZC9hbWxvZ2ljLGd4YmItYXVkaW4ueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9zb3VuZC9hbWxvZ2ljLGd4YmItYXVkaW4ueWFtbAo+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi40ZGY0Nzk2NjIzZWQKPiAtLS0gL2Rldi9u
dWxsCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL2FtbG9n
aWMsZ3hiYi1hdWRpbi55YW1sCj4gQEAgLTAsMCArMSw2OSBAQAo+ICsjIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKPiArJVlBTUwgMS4yCj4g
Ky0tLQo+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3NvdW5kL2FtbG9naWMs
Z3hiYi1hdWRpbi55YW1sIwo+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1z
Y2hlbWFzL2NvcmUueWFtbCMKPiArCj4gK3RpdGxlOiBBbWxvZ2ljIEdYQkIgQVVESU4gYXVkaW8g
aW5wdXQgY29udHJvbGxlcgo+ICsKPiArbWFpbnRhaW5lcnM6Cj4gKyAgLSBWYWxlcmlvIFNldHRp
IDx2c2V0dGlAYmF5bGlicmUuY29tPgo+ICsKPiArZGVzY3JpcHRpb246Cj4gKyAgQVVESU4gaXMg
dGhlIGF1ZGlvIGlucHV0IGJsb2NrIG9mIHRoZSBBbWxvZ2ljIEdYQkIvR1hMIFNvQ3MuIEl0IHN1
cHBvcnRzCj4gKyAgdmFyaW91cyBpbnB1dCBmb3JtYXR0ZXJzIChJMlMsIFNQRElGLCBQQ00sIEhE
TUkpIGZlZWRpbmcgdGhyZWUgRklGT3MgdGhhdAo+ICsgIHRyYW5zZmVyIGNhcHR1cmVkIHNhbXBs
ZXMgdG8gbWVtb3J5LiBUaGUgc291bmQtZGFpIGNlbGwgc2VsZWN0cyB0aGUgRklGTy4KPiArCj4g
K2FsbE9mOgo+ICsgIC0gJHJlZjogZGFpLWNvbW1vbi55YW1sIwo+ICsKPiArcHJvcGVydGllczoK
PiArICBjb21wYXRpYmxlOgo+ICsgICAgb25lT2Y6Cj4gKyAgICAgIC0gY29uc3Q6IGFtbG9naWMs
Z3hiYi1hdWRpbgo+ICsgICAgICAtIGl0ZW1zOgo+ICsgICAgICAgICAgLSBjb25zdDogYW1sb2dp
YyxneGwtYXVkaW4KPiArICAgICAgICAgIC0gY29uc3Q6IGFtbG9naWMsZ3hiYi1hdWRpbgpGcm9t
IHdoYXQgSSBjYW4gdGVsbCBpdCdzIGV2ZW4gYW1sb2dpYyxtZXNvbjgtYXVkaW4gY29tcGF0aWJs
ZS4KQWx0aG91Z2ggSSBkaWRuJ3QgaGF2ZSB0aGUgdGltZSB0byB0ZXN0IGluIG9uIGhhcmR3YXJl
IHlldC4KClsuLi5dCj4gKyAgICBhdWRpby1jb250cm9sbGVyQGEwMDAgewo+ICsgICAgICBjb21w
YXRpYmxlID0gImFtbG9naWMsZ3hiYi1hdWRpbiI7Cj4gKyAgICAgIHJlZyA9IDwweGEwMDAgMHgx
NDg+OwpJIGJlbGlldmUgdGhlIGF1ZGluIHJlZ2lzdGVycyBhcmUgMHgzMDAgd2lkZS4KQm90aCwg
R1hMIGRhdGFzaGVldCBbMF0gcGFnZSA0MyBhbmQgR1hNIGRhdGFzaGVldCBbMV0gcGFnZSA0OCBj
bGFpbQp0aGF0IHRoZSByZWdpc3RlciBhcmVhIGlzIDB4MTAwIHdpZGUuClRoZSBsYXN0IGRvY3Vt
ZW50ZWQgcmVnaXN0ZXIgd2l0aCBBVURJTl8gcHJlZml4IGlzIEFVRElOX0ZJRk8yX1BJT19SREgK
PSAweGI4LiBUaGUgZGF0YXNoZWV0IFswXSAocGFnZSAzOTUpIGxpc3RzIHJlZ2lzdGVyIG51bWJl
cnMgZGl2aWRlZCBieQo0LCBzbyB0byBnZXQgdGhlIGFjdHVhbCBhZGRyZXNzIGluIHRoZSBtZW1v
cnkgbWFwIHdlIG5lZWQgdG8gbXVsdGlwbHkKaXQgYnkgNCwgd2hpY2ggZ2l2ZXMgMHgyZTAuClRo
ZSAzMi1iaXQgU29DIHZlbmRvciBrZXJuZWwgWzJdIGhhcyBhIGhlYWRlciB0aGF0IHN0YXRlczog
I2RlZmluZQpBVURJTl9BRERSX0VORCAweDI4YmYgKHNhbWUgYXMgaW4gZGF0YXNoZWV0LCB3ZSBu
ZWVkIHRvIG11bHRpcGx5IHRoaXMKYnkgNCkuCgpJJ20gYnJpbmdpbmcgdGhpcyB1cCBiZWNhdXNl
IGR0LWJpbmRpbmdzIGFyZSBzdXBwb3NlZCB0byBiZSBjb21wbGV0ZS4KU28gZXZlbiBpZiB0aGUg
ZHJpdmVyIGRvZXNuJ3QgdXNlIGEgcmVzb3VyY2UgeWV0IHdlJ3JlIHN1cHBvc2VkIHRvCnN0aWxs
IGRlc2NyaWJlIGl0LgpJIGRvbid0IHNlZSBhbnkgYWRkaXRpb25hbCByZXNvdXJjZXMgdGhhdCB3
ZSdkIG5lZWQgdG8gZGVzY3JpYmUgYW5kCiNzb3VuZC1kYWktY2VsbHMgYWxsb3dzIGFkZGluZyB0
aGUgYWRkaXRpb25hbCBTUERJRiBpbnB1dCBsYXRlci4KRnJvbSB3aGF0IEkgc2F3IGluIHRoZSBy
ZWdpc3RlcnMgdGhlcmUncyBhbHNvIHRoZSBwb3NzaWJpbGl0eSB0byBzZW5kCnRoZSBpbnB1dCBz
aWduYWwgdG8gQVVESU4gYnV0IEkgY291bGRuJ3QgZmluZCBhbnkgYWRkaXRpb25hbCByZXNvdXJj
ZXMKd2UnZCBuZWVkIHRvIGRlc2NyaWJlIGluIHRoZSBkdC1iaW5kaW5ncyBmb3IgdGhpcy4KCgoK
WzBdIGh0dHBzOi8vZGwua2hhZGFzLmNvbS9wcm9kdWN0cy92aW0xL2RhdGFzaGVldC9zOTA1eC1k
YXRhc2hlZXQtdjAuMy5wZGYKWzFdIGh0dHBzOi8vZGwua2hhZGFzLmNvbS9wcm9kdWN0cy92aW0y
L2RhdGFzaGVldC9zOTEyLWRhdGFzaGVldC5wZGYKWzJdIGh0dHBzOi8vZ2l0aHViLmNvbS9lbmRs
ZXNzbS9saW51eC1tZXNvbi9ibG9iL2Q2ZTEzYzIyMDkzMTExMGZlNjc2ZWRlNmRhNjlmYzYxYTdj
YjA0YjYvYXJjaC9hcm0vbWFjaC1tZXNvbjgvaW5jbHVkZS9tYWNoL3JlZ2lzdGVyLmgjTDIyNzQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
