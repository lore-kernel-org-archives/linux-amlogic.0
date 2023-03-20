Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34BEDC6FD1F
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Mar 2023 00:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QG5tWtIEhYxqHXycmgaCSPdwrAsw9Dr7GpmyR0wTQnE=; b=0v1sV0QzIn6FfI
	aTqmZKsefd1FFO4TlYf3fbdu7evDoNK6q5T9he2wmW5lOpV+cY4chyzw5BTmsy16mxHnLwqC0/Z3P
	3K9wBrztTO7RPy83bcD17bIm5tv1eDiE4TpjD5PByVpqDJU62Pd2Tnabfc1Rvc1fzGtMt61C7i0D+
	258aL5/ZV1evY7iQbq9eXK5v+2GDtHmOW+ig9S6MsCSv7/Kk8IisidaN5ppGflBb5sbTAv8KhbLF7
	2FEi3MFGjRgbFYhSWK1SvtunOZhRYWP7WSNfGtsgghn8O8f5oa9gI1qvuJwGntz9QsOFePllrtj7H
	99NX0wRe0PeYfbbim/LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pe3ZN-007lxw-2i;
	Mon, 20 Mar 2023 00:40:13 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pe3ZG-007ltc-2S;
	Mon, 20 Mar 2023 00:40:12 +0000
Received: by mail-qk1-x72d.google.com with SMTP id n13so244185qkh.5;
        Sun, 19 Mar 2023 17:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679272802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JD624h8ZvMG/AbmcGoI6WMUerZBHh1sB+0dNUQOAtD4=;
        b=qP5z0iZtSQEK4B+UiSaVKMDXPRGllxKXtNR3B9JWGD0x4ppA6J1fiCuGFe+jk2L326
         ChpFIW/p5rHdlujxlsLgeMcaOxViAywAg0HcuPHzO9V0GVce5JWCVISMUQ4QBE8BtLOD
         e2UXrqrPqzNcCcPnStsInFxt7hlyq2l6zMh7GIqsqPg5LfzqHvnFYm31l8Md/gc9NjwV
         peu/2W7I/PdG70ua34ZL6uREKxE4gZoqCs0IQqcANgMMcMo+8vu6ezfKAIaOvti3Ncy0
         zjKDPmiCCn719O3RU772JVbnWYq2795ZNdNKH/21U/tvkGXgwMpF90k/lW2H09p2FVJA
         nKfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679272802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JD624h8ZvMG/AbmcGoI6WMUerZBHh1sB+0dNUQOAtD4=;
        b=RxPTcJtzLQrUdi4FT3HODKbErVmT4K7mI9XPDxY1KJxP+iAA1ke1HBu4aLYVfKWsuN
         UEqP6f4PUyzQaERQKsfX64W2itLa5MYvDYTA83V9NhU8ZUVKQabJrbSkW0KdFH8HcEAR
         zct5U/oslo6RjtQ9Bt+w3nmosAf8NKK09E1aAJFyPXTmvmDcNsX7sPCwUsCX6mD6vqYQ
         uETY6WC61NtDNGE0fofKYlD7KDDhvKmRcBOOqBM+GZ4q00wvL1smDJsmy82aDE8lw8eX
         fBhSk8K5ccjMX/hgXBStCmVkEWfz/hCcnzdc+6uobYM4+ZBcgS0YI5pHmGn6WFUCLyje
         D/Zw==
X-Gm-Message-State: AO0yUKVte2rk4QkuuGf7m/GT6DBCDS0n9TSExbnXlPyr3/Qhs2OQsFKU
	eiUdx/VXhUnkhEB6HO9ZeFc4RhjxDsZ+8WPGb8o=
X-Google-Smtp-Source: AK7set9HdGZHlCYg5DqAEhkcTJLSVV6qeMYN02Sq/DkjqxX8ojqrLZGddEqXdtoPNqHbHkTJtl8+VvObChQjweHUx9w=
X-Received: by 2002:a05:620a:260a:b0:72b:25b4:565f with SMTP id
 z10-20020a05620a260a00b0072b25b4565fmr2909951qko.5.1679272802530; Sun, 19 Mar
 2023 17:40:02 -0700 (PDT)
MIME-Version: 1.0
References: <683422c6-c1e1-90b9-59ed-75d0f264f354@gmail.com> <192db694-5bda-513c-31c5-96ec3b2425d9@gmail.com>
In-Reply-To: <192db694-5bda-513c-31c5-96ec3b2425d9@gmail.com>
From: Chris Healy <cphealy@gmail.com>
Date: Sun, 19 Mar 2023 17:39:51 -0700
Message-ID: <CAFXsbZo-pdP+b3iWyQwPe4FA4Pdxr-HO5-4rHB-ZLJApZyJ3DQ@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] net: phy: smsc: export functions for use by
 meson-gxl PHY driver
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, David Miller <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230319_174006_845265_36F6FD7A 
X-CRM114-Status: GOOD (  22.60  )
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

T24gYSBkZXYgYm9hcmQgd2l0aCBTTVNDIExBTjg3MjAsIHRoaXMgY2hhbmdlIHdhcyB0ZXN0ZWQg
YW5kIGNvbmZpcm1lZAp0byBzdGlsbCBvcGVyYXRlIG5vcm1hbGx5LgoKU2lnbmVkLW9mZi1ieTog
Q2hyaXMgSGVhbHkgPGhlYWx5Y2hAYW1hem9uLmNvbT4KCk9uIFNhdCwgTWFyIDE4LCAyMDIzIGF0
IDE6MzbigK9QTSBIZWluZXIgS2FsbHdlaXQgPGhrYWxsd2VpdDFAZ21haWwuY29tPiB3cm90ZToK
Pgo+IFRoZSBBbWxvZ2ljIE1lc29uIGludGVybmFsIFBIWSdzIGhhdmUgdGhlIHNhbWUgcmVnaXN0
ZXIgbGF5b3V0IGFzCj4gY2VydGFpbiBTTVNDIFBIWSdzIChhbHNvIGZvciBub24tYzIyLXN0YW5k
YXJkIHJlZ2lzdGVycykuIFRoaXMgc2VlbXMKPiB0byBiZSBtb3JlIHRoYW4ganVzdCBjb2luY2lk
ZW5jZS4gQXBwYXJlbnRseSB0aGV5IGFsc28gbmVlZCB0aGUgc2FtZQo+IHdvcmthcm91bmQgZm9y
IEVEUEQgbW9kZSAoZW5lcmd5IGRldGVjdCBwb3dlciBkb3duKS4gVGhlcmVmb3JlIGxldCdzCj4g
ZXhwb3J0IFNNU0MgUEhZIGRyaXZlciBmdW5jdGlvbmFsaXR5IGZvciB1c2UgYnkgdGhlIG1lc29u
LWd4bCBQSFkKPiBkcml2ZXIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBIZWluZXIgS2FsbHdlaXQgPGhr
YWxsd2VpdDFAZ21haWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL25ldC9waHkvc21zYy5jICB8IDIw
ICsrKysrKysrKysrKystLS0tLS0tCj4gIGluY2x1ZGUvbGludXgvc21zY3BoeS5oIHwgIDYgKysr
KysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkK
Pgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9waHkvc21zYy5jIGIvZHJpdmVycy9uZXQvcGh5
L3Ntc2MuYwo+IGluZGV4IDcyMTg3MTE4NC4uNzMwOTY0Yjg1IDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvbmV0L3BoeS9zbXNjLmMKPiArKysgYi9kcml2ZXJzL25ldC9waHkvc21zYy5jCj4gQEAgLTU0
LDcgKzU0LDcgQEAgc3RhdGljIGludCBzbXNjX3BoeV9hY2tfaW50ZXJydXB0KHN0cnVjdCBwaHlf
ZGV2aWNlICpwaHlkZXYpCj4gICAgICAgICByZXR1cm4gcmMgPCAwID8gcmMgOiAwOwo+ICB9Cj4K
PiAtc3RhdGljIGludCBzbXNjX3BoeV9jb25maWdfaW50cihzdHJ1Y3QgcGh5X2RldmljZSAqcGh5
ZGV2KQo+ICtpbnQgc21zY19waHlfY29uZmlnX2ludHIoc3RydWN0IHBoeV9kZXZpY2UgKnBoeWRl
dikKPiAgewo+ICAgICAgICAgaW50IHJjOwo+Cj4gQEAgLTc1LDggKzc1LDkgQEAgc3RhdGljIGlu
dCBzbXNjX3BoeV9jb25maWdfaW50cihzdHJ1Y3QgcGh5X2RldmljZSAqcGh5ZGV2KQo+Cj4gICAg
ICAgICByZXR1cm4gcmMgPCAwID8gcmMgOiAwOwo+ICB9Cj4gK0VYUE9SVF9TWU1CT0xfR1BMKHNt
c2NfcGh5X2NvbmZpZ19pbnRyKTsKPgo+IC1zdGF0aWMgaXJxcmV0dXJuX3Qgc21zY19waHlfaGFu
ZGxlX2ludGVycnVwdChzdHJ1Y3QgcGh5X2RldmljZSAqcGh5ZGV2KQo+ICtpcnFyZXR1cm5fdCBz
bXNjX3BoeV9oYW5kbGVfaW50ZXJydXB0KHN0cnVjdCBwaHlfZGV2aWNlICpwaHlkZXYpCj4gIHsK
PiAgICAgICAgIGludCBpcnFfc3RhdHVzOwo+Cj4gQEAgLTk1LDE4ICs5NiwyMCBAQCBzdGF0aWMg
aXJxcmV0dXJuX3Qgc21zY19waHlfaGFuZGxlX2ludGVycnVwdChzdHJ1Y3QgcGh5X2RldmljZSAq
cGh5ZGV2KQo+Cj4gICAgICAgICByZXR1cm4gSVJRX0hBTkRMRUQ7Cj4gIH0KPiArRVhQT1JUX1NZ
TUJPTF9HUEwoc21zY19waHlfaGFuZGxlX2ludGVycnVwdCk7Cj4KPiAtc3RhdGljIGludCBzbXNj
X3BoeV9jb25maWdfaW5pdChzdHJ1Y3QgcGh5X2RldmljZSAqcGh5ZGV2KQo+ICtpbnQgc21zY19w
aHlfY29uZmlnX2luaXQoc3RydWN0IHBoeV9kZXZpY2UgKnBoeWRldikKPiAgewo+ICAgICAgICAg
c3RydWN0IHNtc2NfcGh5X3ByaXYgKnByaXYgPSBwaHlkZXYtPnByaXY7Cj4KPiAtICAgICAgIGlm
ICghcHJpdi0+ZW5lcmd5X2VuYWJsZSB8fCBwaHlkZXYtPmlycSAhPSBQSFlfUE9MTCkKPiArICAg
ICAgIGlmICghcHJpdiB8fCAhcHJpdi0+ZW5lcmd5X2VuYWJsZSB8fCBwaHlkZXYtPmlycSAhPSBQ
SFlfUE9MTCkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4KPiAgICAgICAgIC8qIEVuYWJs
ZSBlbmVyZ3kgZGV0ZWN0IHBvd2VyIGRvd24gbW9kZSAqLwo+ICAgICAgICAgcmV0dXJuIHBoeV9z
ZXRfYml0cyhwaHlkZXYsIE1JSV9MQU44M0MxODVfQ1RSTF9TVEFUVVMsCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIE1JSV9MQU44M0MxODVfRURQV1JET1dOKTsKPiAgfQo+ICtFWFBPUlRf
U1lNQk9MX0dQTChzbXNjX3BoeV9jb25maWdfaW5pdCk7Cj4KPiAgc3RhdGljIGludCBzbXNjX3Bo
eV9yZXNldChzdHJ1Y3QgcGh5X2RldmljZSAqcGh5ZGV2KQo+ICB7Cj4gQEAgLTE4Niw3ICsxODks
NyBAQCBzdGF0aWMgaW50IGxhbjk1eHhfY29uZmlnX2FuZWdfZXh0KHN0cnVjdCBwaHlfZGV2aWNl
ICpwaHlkZXYpCj4gICAqIFRoZSB3b3JrYXJvdW5kIGlzIG9ubHkgYXBwbGljYWJsZSB0byBwb2xs
IG1vZGUuIEVuZXJneSBEZXRlY3QgUG93ZXItRG93biBtYXkKPiAgICogbm90IGJlIHVzZWQgaW4g
aW50ZXJydXB0IG1vZGUgbGVzdCBsaW5rIGNoYW5nZSBkZXRlY3Rpb24gYmVjb21lcyB1bnJlbGlh
YmxlLgo+ICAgKi8KPiAtc3RhdGljIGludCBsYW44N3h4X3JlYWRfc3RhdHVzKHN0cnVjdCBwaHlf
ZGV2aWNlICpwaHlkZXYpCj4gK2ludCBsYW44N3h4X3JlYWRfc3RhdHVzKHN0cnVjdCBwaHlfZGV2
aWNlICpwaHlkZXYpCj4gIHsKPiAgICAgICAgIHN0cnVjdCBzbXNjX3BoeV9wcml2ICpwcml2ID0g
cGh5ZGV2LT5wcml2Owo+ICAgICAgICAgaW50IGVycjsKPiBAQCAtMTk1LDcgKzE5OCw4IEBAIHN0
YXRpYyBpbnQgbGFuODd4eF9yZWFkX3N0YXR1cyhzdHJ1Y3QgcGh5X2RldmljZSAqcGh5ZGV2KQo+
ICAgICAgICAgaWYgKGVycikKPiAgICAgICAgICAgICAgICAgcmV0dXJuIGVycjsKPgo+IC0gICAg
ICAgaWYgKCFwaHlkZXYtPmxpbmsgJiYgcHJpdi0+ZW5lcmd5X2VuYWJsZSAmJiBwaHlkZXYtPmly
cSA9PSBQSFlfUE9MTCkgewo+ICsgICAgICAgaWYgKCFwaHlkZXYtPmxpbmsgJiYgcHJpdiAmJiBw
cml2LT5lbmVyZ3lfZW5hYmxlICYmCj4gKyAgICAgICAgICAgcGh5ZGV2LT5pcnEgPT0gUEhZX1BP
TEwpIHsKPiAgICAgICAgICAgICAgICAgLyogRGlzYWJsZSBFRFBEIHRvIHdha2UgdXAgUEhZICov
Cj4gICAgICAgICAgICAgICAgIGludCByYyA9IHBoeV9yZWFkKHBoeWRldiwgTUlJX0xBTjgzQzE4
NV9DVFJMX1NUQVRVUyk7Cj4gICAgICAgICAgICAgICAgIGlmIChyYyA8IDApCj4gQEAgLTIyOSw2
ICsyMzMsNyBAQCBzdGF0aWMgaW50IGxhbjg3eHhfcmVhZF9zdGF0dXMoc3RydWN0IHBoeV9kZXZp
Y2UgKnBoeWRldikKPgo+ICAgICAgICAgcmV0dXJuIGVycjsKPiAgfQo+ICtFWFBPUlRfU1lNQk9M
X0dQTChsYW44N3h4X3JlYWRfc3RhdHVzKTsKPgo+ICBzdGF0aWMgaW50IHNtc2NfZ2V0X3NzZXRf
Y291bnQoc3RydWN0IHBoeV9kZXZpY2UgKnBoeWRldikKPiAgewo+IEBAIC0yNjksNyArMjc0LDcg
QEAgc3RhdGljIHZvaWQgc21zY19nZXRfc3RhdHMoc3RydWN0IHBoeV9kZXZpY2UgKnBoeWRldiwK
PiAgICAgICAgICAgICAgICAgZGF0YVtpXSA9IHNtc2NfZ2V0X3N0YXQocGh5ZGV2LCBpKTsKPiAg
fQo+Cj4gLXN0YXRpYyBpbnQgc21zY19waHlfcHJvYmUoc3RydWN0IHBoeV9kZXZpY2UgKnBoeWRl
dikKPiAraW50IHNtc2NfcGh5X3Byb2JlKHN0cnVjdCBwaHlfZGV2aWNlICpwaHlkZXYpCj4gIHsK
PiAgICAgICAgIHN0cnVjdCBkZXZpY2UgKmRldiA9ICZwaHlkZXYtPm1kaW8uZGV2Owo+ICAgICAg
ICAgc3RydWN0IHNtc2NfcGh5X3ByaXYgKnByaXY7Cj4gQEAgLTI5NCw2ICsyOTksNyBAQCBzdGF0
aWMgaW50IHNtc2NfcGh5X3Byb2JlKHN0cnVjdCBwaHlfZGV2aWNlICpwaHlkZXYpCj4KPiAgICAg
ICAgIHJldHVybiBjbGtfc2V0X3JhdGUocmVmY2xrLCA1MCAqIDEwMDAgKiAxMDAwKTsKPiAgfQo+
ICtFWFBPUlRfU1lNQk9MX0dQTChzbXNjX3BoeV9wcm9iZSk7Cj4KPiAgc3RhdGljIHN0cnVjdCBw
aHlfZHJpdmVyIHNtc2NfcGh5X2RyaXZlcltdID0gewo+ICB7Cj4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvbGludXgvc21zY3BoeS5oIGIvaW5jbHVkZS9saW51eC9zbXNjcGh5LmgKPiBpbmRleCAxYTEz
NjI3MWIuLjgwZjM3YzFkYiAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L3Ntc2NwaHkuaAo+
ICsrKyBiL2luY2x1ZGUvbGludXgvc21zY3BoeS5oCj4gQEAgLTI4LDQgKzI4LDEwIEBACj4gICNk
ZWZpbmUgTUlJX0xBTjgzQzE4NV9NT0RFX1BPV0VSRE9XTiAweEMwIC8qIFBvd2VyIERvd24gbW9k
ZSAqLwo+ICAjZGVmaW5lIE1JSV9MQU44M0MxODVfTU9ERV9BTEwgICAgICAgMHhFMCAvKiBBbGwg
Y2FwYWJsZSBtb2RlICovCj4KPiAraW50IHNtc2NfcGh5X2NvbmZpZ19pbnRyKHN0cnVjdCBwaHlf
ZGV2aWNlICpwaHlkZXYpOwo+ICtpcnFyZXR1cm5fdCBzbXNjX3BoeV9oYW5kbGVfaW50ZXJydXB0
KHN0cnVjdCBwaHlfZGV2aWNlICpwaHlkZXYpOwo+ICtpbnQgc21zY19waHlfY29uZmlnX2luaXQo
c3RydWN0IHBoeV9kZXZpY2UgKnBoeWRldik7Cj4gK2ludCBsYW44N3h4X3JlYWRfc3RhdHVzKHN0
cnVjdCBwaHlfZGV2aWNlICpwaHlkZXYpOwo+ICtpbnQgc21zY19waHlfcHJvYmUoc3RydWN0IHBo
eV9kZXZpY2UgKnBoeWRldik7Cj4gKwo+ICAjZW5kaWYgLyogX19MSU5VWF9TTVNDUEhZX0hfXyAq
Lwo+IC0tCj4gMi4zOS4yCj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYW1sb2dpYwo=
