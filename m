Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C073DC6FD1C
	for <linux-amlogic@archiver.kernel.org>; Sat, 25 Mar 2023 20:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N5hmo4XCdHWJkcQcKS/j5bi/ZaoBISy0m7ALaIlDonU=; b=ih2wPKg9jQVfAx
	ernXcxeWSj1S7HIU9lAmtdghCaTghx91nUxaYRuKr4mRIxoNRb/XgA6Zw1kaAoETRygHbsfY2NI5q
	16RDvWqLzQAV2p+Gc2JWGE5Ie9nBd0gNPdhZie81MtwO9A3MM6IZOKNiHTs3ZxP0NdcV+s6QPY3iN
	OOwEty+PAMpMBNm6CZHSvRbPNp5ry4n4PAufhu6k58fCBFXHaX/Zk/t7bd6TFGIR8L7oPGJmnrzjX
	S20TctEzj3SyreQLmtNlxZDZdoXSd7KJPVv3xFJBD7yGj3OStRVIufXf0pjL3OeOhFy0JTzEzB0pT
	/VxznM6fIPrlJ8gTqz9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgAbd-007LIE-0X;
	Sat, 25 Mar 2023 20:35:17 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgAba-007LGW-0C;
	Sat, 25 Mar 2023 20:35:15 +0000
Received: by mail-ed1-x533.google.com with SMTP id er18so9771557edb.9;
        Sat, 25 Mar 2023 13:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1679776506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J1ARdn1PQDKxucq06/tFLuIDSeh/ZkFUkEYqpy9v+YI=;
        b=pH8AJSa2OZdjUECVUw7QIahO0jCHHDPB/6B7XWY9Rk7I5ODhbjpOsLdNsC10g8TRn/
         7zhSm0eaTrLBmu4u/sTCXWMMqCFDGafwWrtKFXc93T0BGc0FPVEi7HpHpGUQ1IGq1TG2
         pZVMFpZFgjYT/COoHwcNvSx8H9Z2HPZf81qDyS24jF2zqiBphLpJ7wGkfgHzZOKb4o2F
         jQlEbalNZKJped9i4Oh9BwKW7yHt1u42odViX5zeZOWNPBc6zWKSqTVq1aZavSFGSxtJ
         Ho2gIYf/Ba+qoPD1TqZI+tBRiduHR5ya3CB/ZCsewNd6r4+O20+OhufgOfAxjnhZvAkX
         0fIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679776506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J1ARdn1PQDKxucq06/tFLuIDSeh/ZkFUkEYqpy9v+YI=;
        b=wBDOzmxYOlm6u7StCddRCDEhlKPGzoH5Ki3NL0omSP4phfdp/R/wy/9G50o0QfPE9q
         0xjhxnrtIEh9iez/3parUtJRyN7E9XCbGhmawx8g7zmsej0Vohmp8mg6eZNu25qRiC4a
         fFRNomAyUDxvT7NPbli+g/SzL8h6pX4XJC2pYXCaZINL6M/aty8kjp9SvJpqNChZfQ4H
         k3QnJj3LjEoJcTWvHzs+UFSGtKv42BUov/dd3ZdJXergVAzajVNUWBOamph5yBY7DAvP
         NWWKPSZn17LOXRXp5qn/gVLkVwcLP+5HXdhauHX2i9NhaehEEoCyPjmEudRQAjCjkYs+
         RgfA==
X-Gm-Message-State: AAQBX9efuv3gIYbWOB9lZCvQ5JZ5ugfAE4acdo8pwF2LfsqB/2Key4uG
	CCJhawcs/SzcQuo+uXVA6eZCQg6B9KO0531sU8Y=
X-Google-Smtp-Source: AKy350bYbpD7c2ADb4vQaKPIrSV+zp0QcmQXRPw8bGyWYE7vqIOhP36g4ZLROnxjRchNnfxAz3HVFeGxziYjGJkNjRE=
X-Received: by 2002:a17:907:a46:b0:920:3bf5:7347 with SMTP id
 be6-20020a1709070a4600b009203bf57347mr4301292ejc.0.1679776505699; Sat, 25 Mar
 2023 13:35:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230324145557.27797-1-ddrokosov@sberdevices.ru>
In-Reply-To: <20230324145557.27797-1-ddrokosov@sberdevices.ru>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 25 Mar 2023 21:34:54 +0100
Message-ID: <CAFBinCDgMazKVC0psk9DLL2=XTV-GgYEocp9VuKiTnN2hxer2A@mail.gmail.com>
Subject: Re: [PATCH v3] firmware: meson_sm: populate platform devices from sm
 device tree data
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: krzysztof.kozlowski@linaro.org, robh@kernel.org, neil.armstrong@linaro.org, 
	khilman@baylibre.com, jbrunet@baylibre.com, jianxin.pan@amlogic.com, 
	kernel@sberdevices.ru, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	devicetree@vger.kernel.org, rockosov@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230325_133514_102408_1D817B61 
X-CRM114-Status: UNSURE (   8.99  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBNYXIgMjQsIDIwMjMgYXQgMzo1NuKAr1BNIERtaXRyeSBSb2tvc292IDxkZHJva29z
b3ZAc2JlcmRldmljZXMucnU+IHdyb3RlOgo+Cj4gSW4gc29tZSBtZXNvbiBib2FyZHMsIHNlY3Vy
ZSBtb25pdG9yIGRldmljZSBoYXMgY2hpbGRyZW4sIGZvciBleGFtcGxlLAo+IHBvd2VyIHNlY3Vy
ZSBjb250cm9sbGVyLiBCeSBkZWZhdWx0LCBzZWN1cmUgbW9uaXRvciBpc24ndCB0aGUgYnVzIGlu
IHRlcm1zCj4gb2YgZGV2aWNlIHRyZWUgc3Vic3lzdGVtLCBzbyB0aGUgb2ZfcGxhdGZvcm0gaW5p
dGlhbGl6YXRpb24gY29kZSBkb2Vzbid0Cj4gcG9wdWxhdGUgaXRzIGRldmljZSB0cmVlIGRhdGEu
IEFzIGEgcmVzdWx0LCBzZWN1cmUgbW9uaXRvcidzIGNoaWxkcmVuCj4gYXJlbid0IHByb2JlZCBh
dCBhbGwuCj4KPiBSdW4gdGhlICdvZl9wbGF0Zm9ybV9wb3B1bGF0ZSgpJyByb3V0aW5lIG1hbnVh
bGx5IHRvIHJlc29sdmUgc3VjaCBpc3N1ZXMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBEbWl0cnkgUm9r
b3NvdiA8ZGRyb2tvc292QHNiZXJkZXZpY2VzLnJ1PgpBY2tlZC1ieTogTWFydGluIEJsdW1lbnN0
aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBs
aXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
