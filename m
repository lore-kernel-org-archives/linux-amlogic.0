Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B34C6FD1D
	for <linux-amlogic@archiver.kernel.org>; Sat,  1 Apr 2023 06:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4TWHuDxK76lgnMpkVKAk+L9M76IhST831juzYdn8yfo=; b=aABui9nJZD2fJc
	yNFGDSHFAjOSAmAEY1pRhUCExwR6UwjZSupFmLv1blLLIA8BziNdLiwPgd2qwNgp3DsDhkRziiVhL
	DipWEIjWhRPHM5qlBladtlhuEvPf0U8+5bKqY84uN1WoDSfHY1RgtS8TXGZRwPRpDPIpmGTQxBBCN
	sDOML7ZlzK4lrmoHSu4fDDYb4Q1cCSOi5cm4R/JDBICYg2vJ0fGiLXDrG1T1lvQy7ABl8wdW8xD1w
	U86QmxT9R5xsv5VsBUQ4iyq7HxnQ0Z4EpSrLX4BRItCdbHoQdXIeBrXjRaQOcNHAwZxHMImyp3OOQ
	7JanL7zJl6/x58E3IaNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piUtG-009rzK-0z;
	Sat, 01 Apr 2023 06:39:06 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piUtD-009ryo-0U;
	Sat, 01 Apr 2023 06:39:04 +0000
Received: by mail-wr1-x429.google.com with SMTP id l27so24486574wrb.2;
        Fri, 31 Mar 2023 23:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680331139; x=1682923139;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5IP3YZrItzmO15YSK/r35tLw8WrQL+MKYAPSOOfcq8I=;
        b=oIf8x3j0opBUye5IrWpFYTGqnbSAzJoF2MOL29kSQqNp0MaZGNU9r8oI/wOS9P9ZmF
         ogb7wNVjsnpdJyy0kpBBBPT/ybFjTR03zcawh/kHFmjutHTyFaLKThGFllozE95ECb29
         dz1JDaNH+CLhuq6FUUXNoLSuv206FJJ44fjJmaNhTdzGrxNfgw8PLlqi2NdXn0M7nkzg
         qgGsEBebF2u4SsNW7LpvetZws1shoill7JnOVi8E5F+rMc3g8kQZc7a0o0EH6/N7PpbB
         3u5Vq8EvHZcPTiQjdWdrbg6Gq07NGuIGDFjoKyV4E2+0gvH1fglOZ2w4khLya0b7HL9C
         MbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680331139; x=1682923139;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5IP3YZrItzmO15YSK/r35tLw8WrQL+MKYAPSOOfcq8I=;
        b=s9xOwp43UJcb0IT7D7GIFvQSg7g35TS2JWyW/esnfEN1UU3oiEZwv+JKjWDq8/HoUH
         aTK6MdIQt6ICcmZxs5wkR/1mGLUuLpQe58VoTc9X3rxvxIrBQkBxqlYxpdTS/y+I+J7c
         vVCJpoy/edySefbuJrM3MBV3TkqoF/uaPu91J8PXYAE8uRVTqUxDzZdHDHnd7A5OC4wu
         A7lie3P1Q+GTlW3OXIipcorCJjTw8UIe/qvIDtq1iyt27TfKdOcoGNepelkUQWJHL1ks
         GdyMp10RV5baTkXIRbgJwrEG2Uos132Ytht40UC6IH9ao7napsWszMjFKg8vr5mMmv9r
         JzDg==
X-Gm-Message-State: AAQBX9dXODQrxs/YklzQ4jXbZffFp7+O+hxTjLclcc10sRZ1WUT+jIiG
	4OMgFCzrEdDNntfvt2cdR5g=
X-Google-Smtp-Source: AKy350bIMAlwzPoXE4zO1lQXdaXdXNtPM0DmXuw8VPTqJVBpTH3cca8zm64MOog5BajlDwS55hxvPA==
X-Received: by 2002:a5d:4d03:0:b0:2da:f0b5:2595 with SMTP id z3-20020a5d4d03000000b002daf0b52595mr22627795wrt.0.1680331137643;
        Fri, 31 Mar 2023 23:38:57 -0700 (PDT)
Received: from smtpclient.apple ([167.99.200.149])
        by smtp.gmail.com with ESMTPSA id m18-20020a7bca52000000b003ee44b2effasm4984994wml.12.2023.03.31.23.38.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 Mar 2023 23:38:57 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.2\))
Subject: Re: [PATCH RFC 02/13] mmc: meson-gx: fix deferred probing
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20211223171202.8224-3-s.shtylyov@omp.ru>
Date: Sat, 1 Apr 2023 10:38:53 +0400
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 MMC <linux-mmc@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 AML <linux-amlogic@lists.infradead.org>,
 linux-arm-kernel@lists.infradead.org
Message-Id: <2E930ABF-DA2A-4BB0-A2A2-56495305118D@gmail.com>
References: <20211223171202.8224-1-s.shtylyov@omp.ru>
 <20211223171202.8224-3-s.shtylyov@omp.ru>
To: Sergey Shtylyov <s.shtylyov@omp.ru>
X-Mailer: Apple Mail (2.3696.120.41.1.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_233903_208389_6FCE88AD 
X-CRM114-Status: GOOD (  20.45  )
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

PiBPbiAyMyBEZWMgMjAyMSwgYXQgOToxMSBwbSwgU2VyZ2V5IFNodHlseW92IDxzLnNodHlseW92
QG9tcC5ydT4gd3JvdGU6Cj4gCj4gVGhlIGRyaXZlciBvdmVycmlkZXMgdGhlIGVycm9yIGNvZGVz
IGFuZCBJUlEwIHJldHVybmVkIGJ5IHBsYXRmb3JtX2dldF9pcnEoKQo+IHRvIC1FSU5WQUwsIHNv
IGlmIGl0IHJldHVybnMgLUVQUk9CRV9ERUZFUiwgdGhlIGRyaXZlciB3aWxsIGZhaWwgdGhlIHBy
b2JlCj4gcGVybWFuZW50bHkgaW5zdGVhZCBvZiB0aGUgZGVmZXJyZWQgcHJvYmluZy4gU3dpdGNo
IHRvIHByb3BhZ2F0aW5nIHRoZSBlcnJvcgo+IGNvZGVzIHVwc3RyZWFtLiBJUlEwIGlzIG5vIGxv
bmdlciByZXR1cm5lZCBieSBwbGF0Zm9ybV9nZXRfaXJxKCksIHNvIHdlIG5vdwo+IGNhbiBzYWZl
bHkgaWdub3JlIGl0Li4uCj4gCj4gRml4ZXM6IGNiY2FhYzZkN2RkMiAoIm1tYzogbWVzb24tZ3gt
bW1jOiBGaXggcGxhdGZvcm1fZ2V0X2lycSdzIGVycm9yIGNoZWNraW5nCj4gIikKPiBTaWduZWQt
b2ZmLWJ5OiBTZXJnZXkgU2h0eWx5b3YgPHMuc2h0eWx5b3ZAb21wLnJ1Pgo+IFJldmlld2VkLWJ5
OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29t
Pgo+IC0tLQo+IGRyaXZlcnMvbW1jL2hvc3QvbWVzb24tZ3gtbW1jLmMgfCA0ICsrLS0KPiAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL21tYy9ob3N0L21lc29uLWd4LW1tYy5jIGIvZHJpdmVycy9tbWMvaG9zdC9t
ZXNvbi1neC1tbWMuYwo+IGluZGV4IDhmMzY1MzZjYjFiNi4uYzc2NTY1M2VlNGQwIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvbW1jL2hvc3QvbWVzb24tZ3gtbW1jLmMKPiArKysgYi9kcml2ZXJzL21t
Yy9ob3N0L21lc29uLWd4LW1tYy5jCj4gQEAgLTExODIsOCArMTE4Miw4IEBAIHN0YXRpYyBpbnQg
bWVzb25fbW1jX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gCX0KPiAKPiAJ
aG9zdC0+aXJxID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCAwKTsKPiAtCWlmIChob3N0LT5pcnEg
PD0gMCkgewo+IC0JCXJldCA9IC1FSU5WQUw7Cj4gKwlpZiAoaG9zdC0+aXJxIDwgMCkgewo+ICsJ
CXJldCA9IGhvc3QtPmlycTsKPiAJCWdvdG8gZnJlZV9ob3N0Owo+IAl9Cj4gCgpDYW4gSSBhc2sg
aWYgdGhpcyBwYXRjaC9zZXJpZXMgWzBdIGhhcyBiZWVuIHN1cGVyc2VkZWQgb3IgZm9yZ290dGVu
IG9yID8/CgpUaGUgc2VyaWVzIGl0IGRlcGVuZGVkIHVwb24gWzFdIGFwcGVhcnMgdG8gaGF2ZSBi
ZWVuIG1lcmdlZCBhIHllYXIgYWdvIGFzIEkKY2FuIHNlZSBjZTc1M2FkMTU0OWMgKCJwbGF0Zm9y
bTogZmluYWxseSBkaXNhbGxvdyBJUlEwIGluIHBsYXRmb3JtX2dldF9pcnEoKQphbmQgaXRzIGls
a+KAnSkgaW4gdXBzdHJlYW0gY29kZS4gSeKAmXZlIGhhZCB0aGlzIHBhdGNoIGluIG15IHRlc3Rp
bmcga2VybmVsIGZvcgoxMisgbW9udGhzIG5vdyB3aXRoIG5vIG9ic2VydmFibGUgbmVnYXRpdmUg
aW1wYWN0cyBzbyBhbSB3b25kZXJpbmcgaWYgaXQgY2FuCmJlIHJlc2VudCBhbmQgbWVyZ2VkIG9y
IEkgc2hvdWxkIGRyb3AgdGhlIHBhdGNoIGZyb20gbXkgdHJlZT8KClRoeC4gQ2hyaXN0aWFuCgpb
MF0gaHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMvbGludXgtbW1jL21zZzY4MTAyLmh0bWwK
WzFdIGh0dHBzOi8vbWFyYy5pbmZvLz9sPWxpbnV4LWtlcm5lbCZtPTE2MzYyMzA0MTkwMjI4NQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
