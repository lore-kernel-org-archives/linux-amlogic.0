Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F442C6FD18
	for <linux-amlogic@archiver.kernel.org>; Sun, 23 Apr 2023 17:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AKGU54gQ9WCc6+ePkV2qdOX9R44AXW7mgYURZi/UXVI=; b=VCIDq7h8tRA+YR
	BA09xM+Xp2hCFXGxLqON4swVmFT+jLuipsNRIH2srje/Z0PlwkMNsjbDFdkBxOUCt6HqsQHsexab2
	fzFI6j3sg8Xib1hri++UgQcySzTsEOKTo6eaqWqI+QhoKVdwilxUq0hkA656LsoZmyx/9ECK1wHVd
	ysR0NCZkcRceXOwylilhsn70VPUwowG0npflqZHloZ8b+iSUgDXNiwiZavuQYtps2+cIi4OjvpQsw
	W/GrIYPHdrLp0yyF6VoxZxwmtzLO9yoKbfDXSnLeEqtTqiOItW3oZcrBw0XuwtoS7q77hdz3/Tx+x
	nWbAwjS1hw43OXmbqywQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqdjX-00EaTs-08;
	Sun, 23 Apr 2023 17:42:43 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqdjS-00EaSx-2M;
	Sun, 23 Apr 2023 17:42:40 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-94f3df30043so530885066b.2;
        Sun, 23 Apr 2023 10:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1682271757; x=1684863757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iA+bFNXU5lnOq/dCAFC+X0Kqr+6jDOeqz+/GHp8kMoU=;
        b=K+runzIHR2GUuCZS0hxnRvuqLe8cxdW9DAJtsL8nSZ+fz5eVKaACjVavRLa9BMC3n2
         ExcQjW0oMjxhnol1oqfaaWQ+Z4hipBQVfTFFz0tVWsIASlVM3iWS96KXyF+uje6KBadb
         9606h/DVUIAj57AWet15IzumE0EP6CFKSYLFaA2ltMifY6yioqjJC3kpO4M14UxLGuEt
         Tyqq/0PQZlFNkXFHlQv64iYiVxyLH76HmQ/YZXbkNTWjOalELGWczEPZu45z6xyLcDYu
         u3j+kB7ziImEVj7GUkNAH/CZmaV7+otGMhXLV48+0wj0x5WYwvIPJyYKBzOYs2B/32U7
         dsfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682271757; x=1684863757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iA+bFNXU5lnOq/dCAFC+X0Kqr+6jDOeqz+/GHp8kMoU=;
        b=JM0mC6T5XLrBzH5zivA3i7vszIXXNLwQ1aViD9/htZTJm89zCHwCxkyczQE7qNldUb
         7Vf0PXh9+XsHkXR67I6Cz8QCiDW8KJHrq7cc7xN5VPDEEsDH7j08KEk1fpks/wu5Vkhi
         7e8BFuQ8V8UJbBh1nrFxvXD29bXNi7XWU1qDq03oinNqWRjD2erW8nASI9nbfVvaW64m
         oMvNu8C/zJ61y2vMlWb7rZ7ryddAKhdzTaKfJEDwC4HqItyyVG7Gn7bBuhh25s032DV/
         +K6qCR6iCWpv92H9L2AhoiAXa+jWOZR+17U00X9yLSuQwtQf2kFkVUuqWlH9+/KkqFKv
         lZIA==
X-Gm-Message-State: AAQBX9cdrQ5FegFdcdEf0aVu00xMCTVC8LfM9AispXqDoFrfX403dEQ1
	iNVuxhRxOtxEyvUsxiZd/emFIihFpMvrGY6Zzko=
X-Google-Smtp-Source: AKy350bOdYkKefr9OG/iFTwW9Y8zJi7WP0q8ncdz0K81CjLsSSyV47R6xfpW3r2gOJHzwOS5zcVVfmeI2K2pEIvtR4k=
X-Received: by 2002:a17:906:a10a:b0:94f:695e:b0c9 with SMTP id
 t10-20020a170906a10a00b0094f695eb0c9mr8386847ejy.5.1682271756815; Sun, 23 Apr
 2023 10:42:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230418111612.19479-1-ddrokosov@sberdevices.ru> <20230418111612.19479-2-ddrokosov@sberdevices.ru>
In-Reply-To: <20230418111612.19479-2-ddrokosov@sberdevices.ru>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 23 Apr 2023 19:42:25 +0200
Message-ID: <CAFBinCDyhBQ5Nob38EmXor1PtcO09dRdReDTW+tc5CN4i20HhA@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] phy: amlogic: enable/disable clkin during Amlogic
 USB PHY init/exit
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: gregkh@linuxfoundation.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org, 
	khilman@baylibre.com, jbrunet@baylibre.com, mturquette@baylibre.com, 
	vkoul@kernel.org, kishon@kernel.org, hminas@synopsys.com, 
	Thinh.Nguyen@synopsys.com, yue.wang@amlogic.com, hanjie.lin@amlogic.com, 
	kernel@sberdevices.ru, rockosov@gmail.com, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-phy@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230423_104238_766919_6CD06F6D 
X-CRM114-Status: GOOD (  24.14  )
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

SGkgRG1pdHJ5LAoKT24gVHVlLCBBcHIgMTgsIDIwMjMgYXQgMToxNuKAr1BNIERtaXRyeSBSb2tv
c292IDxkZHJva29zb3ZAc2JlcmRldmljZXMucnU+IHdyb3RlOgo+Cj4gUHJldmlvdXNseSwgYWxs
IEFtbG9naWMgYm9hcmRzIHVzZWQgdGhlIFhUQUwgY2xvY2sgYXMgdGhlIGRlZmF1bHQgYm9hcmQK
PiBjbG9jayBmb3IgdGhlIFVTQiBQSFkgaW5wdXQsIHNvIHRoZXJlIHdhcyBubyBuZWVkIHRvIGVu
YWJsZSBpdC4KPiBIb3dldmVyLCB3aXRoIHRoZSBpbnRyb2R1Y3Rpb24gb2YgbmV3IEFtbG9naWMg
U29DcyBsaWtlIHRoZSBBMSBmYW1pbHksCj4gdGhlIFVTQiBQSFkgbm93IHVzZXMgYSBnYXRlZCBj
bG9jay4gSGVuY2UsIGl0IGlzIG5lY2Vzc2FyeSB0byBlbmFibGUKPiB0aGlzIGdhdGVkIGNsb2Nr
IGR1cmluZyB0aGUgUEhZIGluaXRpYWxpemF0aW9uIHNlcXVlbmNlLCBvciBkaXNhYmxlIGl0Cj4g
ZHVyaW5nIHRoZSBQSFkgZXhpdCwgYXMgYXBwcm9wcmlhdGUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBE
bWl0cnkgUm9rb3NvdiA8ZGRyb2tvc292QHNiZXJkZXZpY2VzLnJ1Pgo+IC0tLQo+ICBkcml2ZXJz
L3BoeS9hbWxvZ2ljL3BoeS1tZXNvbi1nMTJhLXVzYjIuYyB8IDEzICsrKysrKysrKysrLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9waHkvYW1sb2dpYy9waHktbWVzb24tZzEyYS11c2IyLmMgYi9kcml2
ZXJzL3BoeS9hbWxvZ2ljL3BoeS1tZXNvbi1nMTJhLXVzYjIuYwo+IGluZGV4IDlkMWVmYTBkOTM5
NC4uODA5Mzg3NTFkYTRmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvcGh5L2FtbG9naWMvcGh5LW1l
c29uLWcxMmEtdXNiMi5jCj4gKysrIGIvZHJpdmVycy9waHkvYW1sb2dpYy9waHktbWVzb24tZzEy
YS11c2IyLmMKPiBAQCAtMTcyLDEwICsxNzIsMTYgQEAgc3RhdGljIGludCBwaHlfbWVzb25fZzEy
YV91c2IyX2luaXQoc3RydWN0IHBoeSAqcGh5KQo+ICAgICAgICAgaW50IHJldDsKPiAgICAgICAg
IHVuc2lnbmVkIGludCB2YWx1ZTsKPgo+IC0gICAgICAgcmV0ID0gcmVzZXRfY29udHJvbF9yZXNl
dChwcml2LT5yZXNldCk7Cj4gKyAgICAgICByZXQgPSBjbGtfcHJlcGFyZV9lbmFibGUocHJpdi0+
Y2xrKTsKPiAgICAgICAgIGlmIChyZXQpCj4gICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4K
PiArICAgICAgIHJldCA9IHJlc2V0X2NvbnRyb2xfcmVzZXQocHJpdi0+cmVzZXQpOwo+ICsgICAg
ICAgaWYgKHJldCkgewo+ICsgICAgICAgICAgICAgICBjbGtfZGlzYWJsZV91bnByZXBhcmUocHJp
di0+Y2xrKTsKPiArICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiArICAgICAgIH0KPiArClRo
aXMgcGFydCBsb29rcyBnb29kLiBZb3UgYXNrZWQgd2h5IEkgc3VnZ2VzdGVkIHRoaXMgYXBwcm9h
Y2ggaW5zdGVhZApvZiBlbmFibGluZyB0aGUgY2xvY2sgYXQgcHJvYmUgdGltZSBhbmQgb25seSBu
b3cgSSBoYXZlIHRpbWUgdG8gcmVwbHkKdG8gaXQuCkNvbnNpZGVyIHRoZSBmb2xsb3dpbmcgc2Nl
bmFyaW86Ci0gbW9kcHJvYmUgcGh5LW1lc29uLWcxMmEtdXNiMgotIG1vZHByb2JlIGR3YzMtbWVz
b24tZzEyYSAodGhpcyB3aWxsIGNhbGwgcGh5X2luaXQpCi0gcm1tb2QgZHdjMy1tZXNvbi1nMTJh
ICh0aGlzIHdpbGwgY2FsbCBwaHlfZXhpdCkKCklmIHRoZSBjbG9jayB3YXMgZW5hYmxlZCBhdCBw
cm9iZSB0aW1lIHRoZW4gaXQgd291bGQgb25seSBiZSBkaXNhYmxlZAp3aGVuIHVzaW5nIHJtbW9k
IHBoeS1tZXNvbi1nMTJhLXVzYjIuCkJ5IG1hbnVhbGx5IGNhbGxpbmcgY2xrX3ByZXBhcmVfZW5h
YmxlL2Nsa19kaXNhYmxlX3VucHJlcGFyZSB3ZSBlbnN1cmUKdGhhdCB0aGUgY2xvY2sgZ2V0cyBk
aXNhYmxlZCB3aGVuIHdlIGRvbid0IG5lZWQgdGhlIFBIWSBhbnltb3JlLgpXaGV0aGVyIHRoaXMg
bWFrZXMgYW55IGRpZmZlcmVuY2UgaW4gdGVybXMgb2YgcG93ZXIgZHJhdzogSSBjYW4ndCBzYXku
Cgo+ICAgICAgICAgdWRlbGF5KFJFU0VUX0NPTVBMRVRFX1RJTUUpOwo+Cj4gICAgICAgICAvKiB1
c2IyX290Z19hY2FfZW4gPT0gMCAqLwo+IEBAIC0yNzcsOCArMjgzLDExIEBAIHN0YXRpYyBpbnQg
cGh5X21lc29uX2cxMmFfdXNiMl9pbml0KHN0cnVjdCBwaHkgKnBoeSkKPiAgc3RhdGljIGludCBw
aHlfbWVzb25fZzEyYV91c2IyX2V4aXQoc3RydWN0IHBoeSAqcGh5KQo+ICB7Cj4gICAgICAgICBz
dHJ1Y3QgcGh5X21lc29uX2cxMmFfdXNiMl9wcml2ICpwcml2ID0gcGh5X2dldF9kcnZkYXRhKHBo
eSk7Cj4gKyAgICAgICBpbnQgcmV0ID0gcmVzZXRfY29udHJvbF9yZXNldChwcml2LT5yZXNldCk7
Cj4gKwo+ICsgICAgICAgY2xrX2Rpc2FibGVfdW5wcmVwYXJlKHByaXYtPmNsayk7Cj4KPiAtICAg
ICAgIHJldHVybiByZXNldF9jb250cm9sX3Jlc2V0KHByaXYtPnJlc2V0KTsKPiArICAgICAgIHJl
dHVybiByZXQ7CkkgdGhpbmsgdGhpcyBjYW4gY2F1c2UgaXNzdWVzIGluIGNhc2Ugd2hlbiByZXNl
dF9jb250cm9sX3Jlc2V0IHJldHVybnMKYW4gZXJyb3I6IElmIEkgdW5kZXJzdGFuZCB0aGUgY29k
ZSBpbiBwaHktY29yZS5jIGNvcnJlY3RseSBpdCB3aWxsCm9ubHkgZGVjcmVhc2UgdGhlIGluaXQg
cmVmLWNvdW50IGlmIGV4aXQgcmV0dXJucyAwLgpXaGVuZXZlciBwaHlfZXhpdCBpcyBjYWxsZWQg
Zm9yIHRoZSBzZWNvbmQgdGltZQpjbGtfZGlzYWJsZV91bnByZXBhcmUoKSB3aWxsIGJlIGNhbGxl
ZCB3aXRoIGEgY2xvY2sgcmVmLWNvdW50IG9mIDAsIHNvCml0J2xsIGxpa2VseSBwcmludCBzb21l
IHdhcm5pbmcuCgpNeSBzdWdnZXN0aW9uIGlzIHRvIHJldHVybiBlYXJseSBpZiByZXNldF9jb250
cm9sX3Jlc2V0KCkgZmFpbHMgYW5kCm5vdCBjYWxsIGNsa19kaXNhYmxlX3VucHJlcGFyZSgpIGlu
IHRoYXQgY2FzZS4KV2hhdCBkbyB5b3UgdGhpbms/CgoKQmVzdCByZWdhcmRzLApNYXJ0aW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9n
aWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
