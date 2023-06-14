Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96634EB64DA
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Jun 2023 10:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xxjz/EhSNQhEAh6UBZa2G1VAaDajDvb1pnYK0ZPX6mY=; b=cE+xL36E6JN4t+
	I4iFzMxmbHd11VHn8DnChnPxDeinjqFnMVnOQsUX1KJKdijWMOf69mSmdk6J7EdbDyztS5lMygXXd
	cY3HDtykTFtRx29iq3xscB/VVBzWT1BLCkCFQFfDOXH9MxRPIL5A1P2fCt0uDOxSI+YYjHkIJxkWU
	7HLWT9URJAZGNvOAIli2gwcYKwVjocFUDQohud/qZ79w7BUtWVEqmLpmoDq1A6AiDTDUz8aixopKJ
	9KZqIdVKITdgskm+Hmtt8PY3AF48Jo0FaLCtcYNXbMqnEaG22EQ09sroKESweoQv8+rFTDmm4tlfx
	oCmWM7fQ6PdGqL1uMsoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9NnR-00BEti-1q;
	Wed, 14 Jun 2023 10:32:13 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9NnM-00BEr4-0T
	for linux-amlogic@lists.infradead.org;
	Wed, 14 Jun 2023 10:32:10 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-bd20beffda6so497159276.1
        for <linux-amlogic@lists.infradead.org>; Wed, 14 Jun 2023 03:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686738726; x=1689330726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o4vm7ceTzo1hNNcW7BySp+CwxkjlqbbfFxfrM36R0A8=;
        b=jltIjhB3RuexEW8rWeAnwei/hwCvgdf+XWXZd/46qYmQLCyMEVebejzVgylMQzIb/G
         nk1fVkrER++UpRTiVjzjGOkV5THpd2tQQPOiaAIik4ffA2HwEwUqQ6D9PcqYIWeMT4iQ
         syhc6V+JqZGF3iCGYVExGSWr5pKNU1zlU5AMWVg9gRtOwvBP4OwngzFdPw+9WPxvAb/S
         6IczwejzpYaXz/C1vXDMgG8XpUWFeCKId4bOzLyOHGK+7gRzSgBVC+cxTbKm5EXjyLGS
         Guix/mRthYtEtE1S6GvYqUxD3dw+RsJzjgfcl9UC8EKVphMi1gJCMsV9jP9zxuHjSUn5
         5F2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686738726; x=1689330726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o4vm7ceTzo1hNNcW7BySp+CwxkjlqbbfFxfrM36R0A8=;
        b=F71aBtWzFzA9qdJqMLFJLJeNliS/zczBxn9bD2dC0Jzu2l8VoOfpdHYzB+0au1xPRh
         EEBL/hJ9xnKv0nLs30SzvYe2vW0lFBWdnMSwV2jQOrUFYqfpq8LzVD3oBHv2neIjJgX7
         HouUdRqc5pLDo8PE9yU+FCajsw37/zXPNbK8j8GgH8K1DMxn/zhuuY6b4uyV8GGIBEZ7
         kRbKnk56fM4y4QzmxMCi2h2iCjN6M4bJDgOokKI0pJ8uQewCZ65nLIZvU4g69zDVlXkv
         UJvYxL1iJtGQdfZv7XJTYbVbjfGWQjBPup0jD5PrBlMITnmRSuawI8yMTYNHZH/Xa0bY
         vBYA==
X-Gm-Message-State: AC+VfDxkbksJEMID7XGxcE3elNHPvjG17HuW8yoHt+FGU5KtfL22AsVg
	za1QoicnJM+pQkgfl7s5d0AvK2TSizNvgNoFxx2F2w==
X-Google-Smtp-Source: ACHHUZ5bPiBMBDH1k9u8J09EszdLHhDZWgBv8iL+J3SKVW6gSRNx27FS7lk5Zw848NEiyq3DuSZ2qgfOrRKptxZ0VuY=
X-Received: by 2002:a0d:e8c6:0:b0:56d:2792:ef49 with SMTP id
 r189-20020a0de8c6000000b0056d2792ef49mr1542577ywe.23.1686738726401; Wed, 14
 Jun 2023 03:32:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230607082713.517157-1-martin@geanix.com>
In-Reply-To: <20230607082713.517157-1-martin@geanix.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 14 Jun 2023 12:31:30 +0200
Message-ID: <CAPDyKFrNVwxxDyzS3mV3FN8RX8wnA42_1Gj7zu56v9XoCPwwrQ@mail.gmail.com>
Subject: Re: [PATCHv2] mmc: meson: remove redundant mmc_request_done() call
 from irq context
To: =?UTF-8?Q?Martin_Hundeb=C3=B8ll?= <martin@geanix.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, stable@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_033208_186562_EA44DF44 
X-CRM114-Status: GOOD (  20.36  )
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

T24gV2VkLCA3IEp1biAyMDIzIGF0IDEwOjI3LCBNYXJ0aW4gSHVuZGViw7hsbCA8bWFydGluQGdl
YW5peC5jb20+IHdyb3RlOgo+Cj4gVGhlIGNhbGwgdG8gbW1jX3JlcXVlc3RfZG9uZSgpIGNhbiBz
Y2hlZHVsZSwgc28gaXQgbXVzdCBub3QgYmUgY2FsbGVkCj4gZnJvbSBpcnEgY29udGV4dC4gV2Fr
ZSB0aGUgaXJxIHRocmVhZCBpZiBpdCBuZWVkcyB0byBiZSBjYWxsZWQsIGFuZCBsZXQKPiBpdHMg
ZXhpc3RpbmcgbG9naWMgZG8gaXRzIHdvcmsuCj4KPiBGaXhlcyB0aGUgZm9sbG93aW5nIGtlcm5l
bCBidWcsIHdoaWNoIGFwcGVhcnMgd2hlbiBydW5uaW5nIGFuIFJUIHBhdGNoZWQKPiBrZXJuZWwg
b24gdGhlIEFtTG9naWMgTWVzb24gQVhHIEExMTNYIFNvQzoKPiBbICAgMTEuMTExNDA3XSBCVUc6
IHNjaGVkdWxpbmcgd2hpbGUgYXRvbWljOiBrd29ya2VyLzA6MUgvNzUvMHgwMDAxMDAwMQo+IFsg
ICAxMS4xMTE0MzhdIE1vZHVsZXMgbGlua2VkIGluOgo+IFsgICAxMS4xMTE0NTFdIENQVTogMCBQ
SUQ6IDc1IENvbW06IGt3b3JrZXIvMDoxSCBOb3QgdGFpbnRlZCA2LjQuMC1yYzMtcnQyLXJ0eC0w
MDA4MS1nZmQwN2Y0MWVkNmI0LWRpcnR5ICMxCj4gWyAgIDExLjExMTQ2MV0gSGFyZHdhcmUgbmFt
ZTogUlRYIEFYRyBBMTEzWCBMaW51eCBQbGF0Zm9ybSBCb2FyZCAoRFQpCj4gWyAgIDExLjExMTQ2
OV0gV29ya3F1ZXVlOiBrYmxvY2tkIGJsa19tcV9ydW5fd29ya19mbgo+IFsgICAxMS4xMTE0OTJd
IENhbGwgdHJhY2U6Cj4gWyAgIDExLjExMTQ5N10gIGR1bXBfYmFja3RyYWNlKzB4YWMvMHhlOAo+
IFsgICAxMS4xMTE1MTBdICBzaG93X3N0YWNrKzB4MTgvMHgyOAo+IFsgICAxMS4xMTE1MThdICBk
dW1wX3N0YWNrX2x2bCsweDQ4LzB4NjAKPiBbICAgMTEuMTExNTMwXSAgZHVtcF9zdGFjaysweDE4
LzB4MjQKPiBbICAgMTEuMTExNTM3XSAgX19zY2hlZHVsZV9idWcrMHg0Yy8weDY4Cj4gWyAgIDEx
LjExMTU0OF0gIF9fc2NoZWR1bGUrMHg4MC8weDU3NAo+IFsgICAxMS4xMTE1NThdICBzY2hlZHVs
ZV9sb29wKzB4MmMvMHg1MAo+IFsgICAxMS4xMTE1NjddICBzY2hlZHVsZV9ydGxvY2srMHgxNC8w
eDIwCj4gWyAgIDExLjExMTU3Nl0gIHJ0bG9ja19zbG93bG9ja19sb2NrZWQrMHg0NjgvMHg3MzAK
PiBbICAgMTEuMTExNTg3XSAgcnRfc3Bpbl9sb2NrKzB4NDAvMHg2NAo+IFsgICAxMS4xMTE1OTZd
ICBfX3dha2VfdXBfY29tbW9uX2xvY2srMHg1Yy8weGM0Cj4gWyAgIDExLjExMTYxMF0gIF9fd2Fr
ZV91cCsweDE4LzB4MjQKPiBbICAgMTEuMTExNjIwXSAgbW1jX2Jsa19tcV9yZXFfZG9uZSsweDY4
LzB4MTM4Cj4gWyAgIDExLjExMTYzM10gIG1tY19yZXF1ZXN0X2RvbmUrMHgxMDQvMHgxMTgKPiBb
ICAgMTEuMTExNjQ0XSAgbWVzb25fbW1jX3JlcXVlc3RfZG9uZSsweDM4LzB4NDgKPiBbICAgMTEu
MTExNjU0XSAgbWVzb25fbW1jX2lycSsweDEyOC8weDFmMAo+IFsgICAxMS4xMTE2NjNdICBfX2hh
bmRsZV9pcnFfZXZlbnRfcGVyY3B1KzB4NzAvMHgxMTQKPiBbICAgMTEuMTExNjc0XSAgaGFuZGxl
X2lycV9ldmVudF9wZXJjcHUrMHgxOC8weDRjCj4gWyAgIDExLjExMTY4M10gIGhhbmRsZV9pcnFf
ZXZlbnQrMHg4MC8weGI4Cj4gWyAgIDExLjExMTY5MV0gIGhhbmRsZV9mYXN0ZW9pX2lycSsweGE0
LzB4MTIwCj4gWyAgIDExLjExMTcwNF0gIGhhbmRsZV9pcnFfZGVzYysweDIwLzB4MzgKPiBbICAg
MTEuMTExNzEyXSAgZ2VuZXJpY19oYW5kbGVfZG9tYWluX2lycSsweDFjLzB4MjgKPiBbICAgMTEu
MTExNzIxXSAgZ2ljX2hhbmRsZV9pcnErMHg4Yy8weGE4Cj4gWyAgIDExLjExMTczNV0gIGNhbGxf
b25faXJxX3N0YWNrKzB4MjQvMHg0Ywo+IFsgICAxMS4xMTE3NDZdICBkb19pbnRlcnJ1cHRfaGFu
ZGxlcisweDg4LzB4OTQKPiBbICAgMTEuMTExNzU3XSAgZWwxX2ludGVycnVwdCsweDM0LzB4NjQK
PiBbICAgMTEuMTExNzY5XSAgZWwxaF82NF9pcnFfaGFuZGxlcisweDE4LzB4MjQKPiBbICAgMTEu
MTExNzc5XSAgZWwxaF82NF9pcnErMHg2NC8weDY4Cj4gWyAgIDExLjExMTc4Nl0gIF9fYWRkX3dh
aXRfcXVldWUrMHgwLzB4NGMKPiBbICAgMTEuMTExNzk1XSAgbW1jX2Jsa19yd193YWl0KzB4ODQv
MHgxMTgKPiBbICAgMTEuMTExODA0XSAgbW1jX2Jsa19tcV9pc3N1ZV9ycSsweDVjNC8weDY1NAo+
IFsgICAxMS4xMTE4MTRdICBtbWNfbXFfcXVldWVfcnErMHgxOTQvMHgyMTQKPiBbICAgMTEuMTEx
ODIyXSAgYmxrX21xX2Rpc3BhdGNoX3JxX2xpc3QrMHgzYWMvMHg1MjgKPiBbICAgMTEuMTExODM0
XSAgX19ibGtfbXFfc2NoZWRfZGlzcGF0Y2hfcmVxdWVzdHMrMHgzNDAvMHg0ZDAKPiBbICAgMTEu
MTExODQ3XSAgYmxrX21xX3NjaGVkX2Rpc3BhdGNoX3JlcXVlc3RzKzB4MzgvMHg3MAo+IFsgICAx
MS4xMTE4NThdICBibGtfbXFfcnVuX3dvcmtfZm4rMHgzYy8weDcwCj4gWyAgIDExLjExMTg2NV0g
IHByb2Nlc3Nfb25lX3dvcmsrMHgxN2MvMHgxZjAKPiBbICAgMTEuMTExODc2XSAgd29ya2VyX3Ro
cmVhZCsweDFkNC8weDI2Ywo+IFsgICAxMS4xMTE4ODVdICBrdGhyZWFkKzB4ZTQvMHhmNAo+IFsg
ICAxMS4xMTE4OTRdICByZXRfZnJvbV9mb3JrKzB4MTAvMHgyMAo+Cj4gRml4ZXM6IDUxYzVkODQ0
N2JkNyAoIk1NQzogbWVzb246IGluaXRpYWwgc3VwcG9ydCBmb3IgR1ggcGxhdGZvcm1zIikKPiBD
Yzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IFNpZ25lZC1vZmYtYnk6IE1hcnRpbiBIdW5kZWLD
uGxsIDxtYXJ0aW5AZ2Vhbml4LmNvbT4KCkFwcGxpZWQgZm9yIGZpeGVzLCB0aGFua3MhCgpLaW5k
IHJlZ2FyZHMKVWZmZQoKCj4gLS0tCj4gVmVyc2lvbiAxIG9mIHRoaXMgcGF0Y2g6Cj4gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYW1sb2dpYy8yMDIzMDYwNjA2NTkxOC40NjA4NjYtMS1t
YXJ0aW5AZ2Vhbml4LmNvbS8KPgo+IENoYW5nZXMgc2luY2UgdjE6Cj4gICogcmVtb3ZlIHJlZHVu
ZGFudCBjaGFuZ2UgdG8gbWVzb25fbW1jX2lycV90aHJlYWQoKSwgYXMgcGVyIE1hcnRpbidzCj4g
ICAgcmV2aWV3Cj4gICogcmV0dXJuIGVhcmx5IGluc3RlYWQgb2YgYXNzaWduaW5nIHRvICJyZXQi
IHZhcmlhYmxlCj4gICogY2hhbmdlIGNvbW1pdCBzaG9ydC1sb2cgdG8gcmVmbGVjdCBjb2RlIHJl
bW92YWwgaW5zdGVhZCBvZiBpdCBiZWluZwo+ICAgIG1vdmVkLiAoV2FzOiAibW1jOiBtZXNvbjog
bW92ZSBtbWNfcmVxdWVzdF9kb25lKCkgY2FsbCB0byBpcnEgdGhyZWFkIikKPgo+ICBkcml2ZXJz
L21tYy9ob3N0L21lc29uLWd4LW1tYy5jIHwgMTAgKystLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbW1jL2hvc3QvbWVzb24tZ3gtbW1jLmMgYi9kcml2ZXJzL21tYy9ob3N0L21lc29uLWd4LW1t
Yy5jCj4gaW5kZXggYjg1MTRkOWQ1ZTczNi4uZjkwYjBmZDhkOGIwMCAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL21tYy9ob3N0L21lc29uLWd4LW1tYy5jCj4gKysrIGIvZHJpdmVycy9tbWMvaG9zdC9t
ZXNvbi1neC1tbWMuYwo+IEBAIC05OTEsMTEgKzk5MSw4IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBt
ZXNvbl9tbWNfaXJxKGludCBpcnEsIHZvaWQgKmRldl9pZCkKPgo+ICAgICAgICAgICAgICAgICBp
ZiAoZGF0YSAmJiAhY21kLT5lcnJvcikKPiAgICAgICAgICAgICAgICAgICAgICAgICBkYXRhLT5i
eXRlc194ZmVyZWQgPSBkYXRhLT5ibGtzeiAqIGRhdGEtPmJsb2NrczsKPiAtICAgICAgICAgICAg
ICAgaWYgKG1lc29uX21tY19ib3VuY2VfYnVmX3JlYWQoZGF0YSkgfHwKPiAtICAgICAgICAgICAg
ICAgICAgIG1lc29uX21tY19nZXRfbmV4dF9jb21tYW5kKGNtZCkpCj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgcmV0ID0gSVJRX1dBS0VfVEhSRUFEOwo+IC0gICAgICAgICAgICAgICBlbHNlCj4g
LSAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gSVJRX0hBTkRMRUQ7Cj4gKwo+ICsgICAgICAg
ICAgICAgICByZXR1cm4gSVJRX1dBS0VfVEhSRUFEOwo+ICAgICAgICAgfQo+Cj4gIG91dDoKPiBA
QCAtMTAwNyw5ICsxMDA0LDYgQEAgc3RhdGljIGlycXJldHVybl90IG1lc29uX21tY19pcnEoaW50
IGlycSwgdm9pZCAqZGV2X2lkKQo+ICAgICAgICAgICAgICAgICB3cml0ZWwoc3RhcnQsIGhvc3Qt
PnJlZ3MgKyBTRF9FTU1DX1NUQVJUKTsKPiAgICAgICAgIH0KPgo+IC0gICAgICAgaWYgKHJldCA9
PSBJUlFfSEFORExFRCkKPiAtICAgICAgICAgICAgICAgbWVzb25fbW1jX3JlcXVlc3RfZG9uZSho
b3N0LT5tbWMsIGNtZC0+bXJxKTsKPiAtCj4gICAgICAgICByZXR1cm4gcmV0Owo+ICB9Cj4KPiAt
LQo+IDIuNDAuMQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCg==
